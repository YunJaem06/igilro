import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/network/api_exception.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/route_search/data/datasources/route_prediction_remote_data_source.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/data/repositories/route_prediction_repository_impl.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/presentation/providers/route_comparison_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_cooldown_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../helpers/fake_prediction_repository.dart'
    show forestOrigin, forestDestination, predictionDeparture;

const _rateUrl = String.fromEnvironment('IGILRO_RATE_LIMIT_TEST_URL');
const _busyUrl = String.fromEnvironment('IGILRO_BUSY_TEST_URL');
const _searchPath = '/api/v1/routes/predictions/search';

Dio _localDio(String url) {
  final uri = Uri.parse(url);
  expect(uri.host, anyOf('127.0.0.1', 'localhost', '::1'));
  final dio = createDio(
    AppConfig.fromValues(environment: 'development', apiBaseUrl: url),
  );
  addTearDown(() => dio.close(force: true));
  return dio;
}

// Use separate local servers with the Seoul Forest scene and PostGIS graph.
// RATE_LIMIT_TEST: requests-per-second=1, burst-capacity=1.
// BUSY_TEST: requests-per-second=1000, burst-capacity=1000,
// max-concurrent-searches=1.
void main() {
  test('live 429 resumes only shade with the original request', () async {
    final dio = _localDio(_rateUrl);
    final client = DioClient(dio);
    final repository = RoutePredictionRepositoryImpl(
      RoutePredictionRemoteDataSource(client),
      const ModelRoutePredictionMapper(),
    );
    final warmup = await repository.search(
      RoutePredictionQuery(
        origin: forestOrigin,
        destination: forestDestination,
        departureAt: predictionDeparture,
        mode: RoutePredictionMode.fastest,
      ),
    );
    expect(warmup, isA<Success<ModelRoutePrediction>>());
    await Future<void>.delayed(const Duration(milliseconds: 1100));

    final requests = <Map<String, dynamic>>[];
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          requests.add(
            Map<String, dynamic>.of(options.data as Map<String, dynamic>),
          );
          handler.next(options);
        },
      ),
    );
    final container = ProviderContainer(
      overrides: [
        routePredictionRepositoryProvider.overrideWithValue(repository),
      ],
    );
    addTearDown(container.dispose);
    container.listen(routeComparisonProvider, (_, _) {});
    final selection = container.read(routeSelectionProvider.notifier);
    selection.useCurrentLocation(forestOrigin);
    selection.beginSelection(RouteEndpoint.destination);
    selection.preview(forestDestination);
    selection.confirmSelection();
    container
        .read(routePredictionOptionsProvider.notifier)
        .setDepartureAt(predictionDeparture);

    final comparison = container.read(routeComparisonProvider.notifier);
    await comparison.search();
    final failure = container.read(routeComparisonProvider).error as Failure;
    expect(failure.type, FailureType.rateLimited);
    expect(failure.code, 'TOO_MANY_REQUESTS');
    expect(failure.requestId, isNotEmpty);
    expect(failure.retryAfter, const Duration(seconds: 1));
    expect(comparison.hasFastestToCompare, isTrue);
    expect(container.read(routeSearchCooldownProvider), 1);
    await comparison.search();
    expect(requests.map((request) => request['mode']), ['fastest', 'shade']);

    await Future<void>.delayed(
      failure.retryAfter! + const Duration(milliseconds: 100),
    );
    expect(requests.length, 2);
    await comparison.search();
    expect(requests.map((request) => request['mode']), [
      'fastest',
      'shade',
      'shade',
    ]);
    expect(requests.last, requests[1]);
    final pair = container.read(routeComparisonProvider).requireValue!;
    expect(pair.fastest.evaluatedAt, predictionDeparture);
    expect(pair.shade.evaluatedAt, predictionDeparture);
    expect(
      pair.fastest.predictionDataVersion,
      pair.shade.predictionDataVersion,
    );
  }, skip: _rateUrl.isEmpty);

  test(
    'live 503 carries the busy code and recovers after Retry-After',
    () async {
      final client = DioClient(_localDio(_busyUrl));
      final request = const ModelRoutePredictionMapper()
          .toRequest(
            RoutePredictionQuery(
              origin: forestOrigin,
              destination: forestDestination,
              departureAt: predictionDeparture,
              mode: RoutePredictionMode.shade,
            ),
          )
          .toJson();
      Future<Failure?> search() async {
        try {
          await client.post<Object?>(_searchPath, data: request);
          return null;
        } on ApiException catch (error) {
          return error.failure;
        }
      }

      expect(await search(), isNull);
      final outcomes = await Future.wait(List.generate(16, (_) => search()));
      final failures = outcomes.whereType<Failure>().toList();
      expect(outcomes, contains(isNull));
      expect(failures, isNotEmpty);
      for (final failure in failures) {
        expect(failure.type, FailureType.serverBusy);
        expect(failure.code, 'ROUTE_SEARCH_BUSY');
        expect(failure.requestId, isNotEmpty);
        expect(failure.retryAfter, const Duration(seconds: 1));
      }
      await Future<void>.delayed(failures.first.retryAfter!);
      expect(await search(), isNull);
    },
    skip: _busyUrl.isEmpty,
  );
}
