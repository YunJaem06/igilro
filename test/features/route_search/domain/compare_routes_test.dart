import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/entities/route_point.dart';
import 'package:igilro/features/route_search/domain/entities/route_comparison.dart';
import 'package:igilro/features/route_search/domain/usecases/search_route_prediction_use_case.dart';
import 'package:igilro/features/route_search/domain/usecases/compare_route_predictions_use_case.dart';

import '../../../helpers/fake_prediction_repository.dart';

const endpoints = RouteEndpoints(
  origin: RoutePoint(
    coordinate: predictionOrigin,
    source: RoutePointSource.map,
  ),
  destination: RoutePoint(
    coordinate: predictionDestination,
    source: RoutePointSource.map,
  ),
);
void main() {
  test(
    'both routes share one explicit instant and preserve their own geometry',
    () async {
      final repository = FakePredictionRepository();
      final useCase = CompareRoutePredictionsUseCase(
        SearchRoutePredictionUseCase(repository),
      );
      final result = await useCase(endpoints);
      expect(repository.queries.map((q) => q.mode), [
        RoutePredictionMode.fastest,
        RoutePredictionMode.shade,
      ]);
      expect(repository.queries.first.departureAt, isNotNull);
      expect(
        repository.queries.first.departureAt,
        repository.queries.last.departureAt,
      );
      final pair = (result as Success<RouteComparison>).value;
      // The routing algorithm version is mode-specific, unlike the graph and scene.
      expect(
        pair.fastest.routingModelVersion,
        isNot(pair.shade.routingModelVersion),
      );
      expect(pair.fastest.routes.first.path.length, 14);
      expect(pair.shade.routes.first.path.length, 3);
    },
  );
  test('a snapshot change rejects the comparison', () async {
    final repository = FakePredictionRepository()
      ..handler = (query) async => Result.success(
        predictionFor(query).copyWith(
          dataVersion: query.mode == RoutePredictionMode.shade
              ? 'changed'
              : 'old',
        ),
      );
    final result = await CompareRoutePredictionsUseCase(
      SearchRoutePredictionUseCase(repository),
    )(endpoints);
    expect(
      (result as Failed<RouteComparison>).failure.code,
      'COMPARISON_CHANGED',
    );
  });
  test(
    'a shade failure does not masquerade as successful shade guidance',
    () async {
      final repository = FakePredictionRepository()
        ..handler = (query) async => query.mode == RoutePredictionMode.shade
            ? const Result.failure(
                Failure(
                  type: FailureType.server,
                  code: 'OUTSIDE_SUPPORTED_AREA',
                ),
              )
            : Result.success(predictionFor(query));
      final result = await CompareRoutePredictionsUseCase(
        SearchRoutePredictionUseCase(repository),
      )(endpoints);
      expect(
        (result as Failed<RouteComparison>).failure.code,
        'OUTSIDE_SUPPORTED_AREA',
      );
    },
  );
  test('cancelling during fastest never starts a late shade request', () async {
    final completion = Completer<Result<ModelRoutePrediction>>();
    final repository = FakePredictionRepository()..pending = completion.future;
    final useCase = CompareRoutePredictionsUseCase(
      SearchRoutePredictionUseCase(repository),
    );
    final future = useCase(endpoints, departureAt: predictionDeparture);
    useCase.cancel();
    completion.complete(
      Result.success(
        predictionFor(predictionQuery(RoutePredictionMode.fastest)),
      ),
    );
    expect(
      (await future as Failed<RouteComparison>).failure.type,
      FailureType.cancelled,
    );
    expect(repository.queries.length, 1);
  });
}
