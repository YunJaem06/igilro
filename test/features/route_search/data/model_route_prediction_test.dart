import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/di/route_prediction_dependencies.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/route_search/data/dto/model_route_prediction_dto.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/repositories/route_prediction_repository.dart';

import '../../../helpers/fake_http_client_adapter.dart';
import '../../../helpers/fake_prediction_repository.dart';
import '../../../helpers/route_response_fixture.dart';

void main() {
  const mapper = ModelRoutePredictionMapper();
  late Dio dio;
  late RoutePredictionRepository repository;
  late FakeHttpClientAdapter adapter;

  void respond(FutureOr<ResponseBody> Function(RequestOptions) handler) {
    adapter = FakeHttpClientAdapter(handler);
    dio.httpClientAdapter = adapter;
  }

  setUp(() {
    dio = createDio(
      AppConfig.fromValues(
        environment: 'development',
        apiBaseUrl: 'http://localhost:8080',
      ),
    );
    respond((_) => jsonResponse(jsonEncode(predictionJson())));
    repository = createRoutePredictionRepository(DioClient(dio));
  });
  tearDown(() {
    repository.cancelSearch();
    dio.close(force: true);
  });

  test('posts exactly the prediction contract with UTC time and unchanged timeouts', () async {
    final result = await repository.search(
      predictionQuery(),
    ) as Success<ModelRoutePrediction>;
    final request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(
      request.uri.toString(),
      'http://localhost:8080/api/v1/routes/predictions/search',
    );
    expect(request.headers['Accept'], 'application/json');
    expect(request.contentType, 'application/json');
    expect(request.connectTimeout, const Duration(seconds: 10));
    expect(request.sendTimeout, const Duration(seconds: 10));
    expect(request.receiveTimeout, const Duration(seconds: 30));
    expect(request.data, {
      'origin': {'longitude': 127.0389239, 'latitude': 37.5476013},
      'destination': {'longitude': 127.0381515, 'latitude': 37.5475288},
      'mode': 'shade',
      'travelMode': 'walking',
      'departureAt': '2026-10-28T02:00:00.000Z',
    });
    expect(result.value.routes.single.prediction.physicalShadeCoverage, isNull);
  });

  test(
    'omits unspecified departureAt and accepts the server evaluation time',
    () async {
      await repository.search(predictionQuery().copyWith(departureAt: null));
      expect(adapter.requests.single.data, isNot(contains('departureAt')));
    },
  );

  test(
    'captured fastest and shade preserve all vertices and independent metadata',
    () {
      final fastest = predictionFor(
        predictionQuery(RoutePredictionMode.fastest),
      );
      final shade = predictionFor(predictionQuery());
      expect(fastest.routes.single.path, hasLength(14));
      expect(shade.routes.single.path, hasLength(3));
      expect(shade.routes.single.path[1].longitude, 127.0383254);
      expect(shade.routes.single.path[1].latitude, 37.5478169);
      expect(fastest.routes.single.distanceMeters, 91.4);
      expect(fastest.routes.single.duration.inSeconds, 66);
      expect(fastest.routes.single.additionalDuration, Duration.zero);
      expect(
        fastest.routes.single.prediction.modeledShadeRatio,
        closeTo(0.6396398446, 1e-9),
      );
      expect(shade.routes.single.distanceMeters, 93.5);
      expect(shade.routes.single.duration.inSeconds, 67);
      expect(shade.routes.single.additionalDuration.inSeconds, 1);
      expect(
        shade.routes.single.prediction.modeledShadeRatio,
        closeTo(0.6861055937, 1e-9),
      );
      expect(shade.evaluatedAt, fastest.evaluatedAt);
      expect(shade.dataVersion, fastest.dataVersion);
      expect(shade.predictionDataVersion, fastest.predictionDataVersion);
      expect(shade.snapping, fastest.snapping);
      expect(shade.quality, 'EXPERIMENTAL_PARTIAL_MODEL');
      expect(shade.buildingModelCount, 174);
      expect(shade.terrainTileCount, 42);
      expect(shade.omittedBuildingModelCount, 2);
      expect(shade.limitations, contains('FIXED_DEPARTURE_SUN'));
      expect(shade.timeModelVersion, isNotEmpty);
      expect(shade.attribution, contains('VWorld'));
      expect(() => shade.routes.single.path.clear(), throwsUnsupportedError);
    },
  );

  test('integer notation for doubles, predicted zero and null validation are preserved', () {
    final body = predictionJson();
    body['sceneBufferMetersApprox'] = 150;
    body['projectionMaxErrorMeters'] = 0;
    final route = (body['routes'] as List).single;
    route['distanceMeters'] = 93;
    route['prediction']['modeledShadeRatio'] = 0;
    final value = mapper.toResult(
      ModelRoutePredictionResponseDto.fromJson(body),
      predictionQuery(),
    );
    expect(value.routes.single.distanceMeters, 93.0);
    expect(value.routes.single.prediction.modeledShadeRatio, 0.0);
    expect(value.routes.single.prediction.physicalShadeCoverage, isNull);
    expect(value.sceneBufferMetersApprox, 150.0);
    expect(value.projectionMaxErrorMeters, 0.0);
  });

  test('opaque versions and unknown additive response fields do not break decoding', () {
    final body = predictionJson()
      ..['futureMetadata'] = {'test': true}
      ..['predictionDataVersion'] = 'a-new-scene-version';
    final value = mapper.toResult(
      ModelRoutePredictionResponseDto.fromJson(body),
      predictionQuery(),
    );
    expect(value.predictionDataVersion, 'a-new-scene-version');
  });

  final malformed = <String, Object? Function()>{
    'legacy height response': routeResponseJson,
    'non-object': () => [],
    'empty routes': () => predictionJson()..['routes'] = [],
    'fractional count': () => predictionJson()..['buildingModelCount'] = 1.2,
    'negative count': () => predictionJson()..['terrainTileCount'] = -1,
    'wrong attribution type': () => predictionJson()..['attribution'] = {},
    'mismatched time': () =>
        predictionJson()..['evaluatedAt'] = '2026-10-28T03:00:00Z',
    'unqualified time': () =>
        predictionJson()..['evaluatedAt'] = '2026-10-28T02:00:00',
    'wrong mode': () {
      final body = predictionJson();
      body['routes'][0]['mode'] = 'fastest';
      return body;
    },
    'fractional seconds': () {
      final body = predictionJson();
      body['routes'][0]['durationSeconds'] = 1.5;
      return body;
    },
    'invalid ratio': () {
      final body = predictionJson();
      body['routes'][0]['prediction']['modeledShadeRatio'] = 1.1;
      return body;
    },
    'invalid coverage': () {
      final body = predictionJson();
      body['routes'][0]['prediction']['physicalShadeCoverage'] = -1;
      return body;
    },
    'invalid geometry': () {
      final body = predictionJson();
      body['routes'][0]['geometry']['coordinates'] = [
        [37, 127],
        [37, 127],
      ];
      return body;
    },
  };
  for (final entry in malformed.entries) {
    test('invalidData for ${entry.key}', () async {
      respond((_) => jsonResponse(jsonEncode(entry.value())));
      final result = await repository.search(
        predictionQuery(),
      ) as Failed<ModelRoutePrediction>;
      expect(result.failure.type, FailureType.invalidData);
    });
  }

  for (final (status, code, type) in [
    (400, 'INVALID_REQUEST', FailureType.validation),
    (400, 'INVALID_ROUTE_QUERY', FailureType.validation),
    (404, 'ROUTE_NOT_FOUND', FailureType.notFound),
    (422, 'OUTSIDE_SUPPORTED_AREA', FailureType.validation),
    (422, 'SHADE_TIME_UNSUPPORTED', FailureType.validation),
    (503, 'PREDICTION_DATA_UNAVAILABLE', FailureType.server),
    (503, 'ROUTE_SEARCH_LIMIT_EXCEEDED', FailureType.server),
    (500, 'INTERNAL_SERVER_ERROR', FailureType.server),
  ]) {
    test(
      'preserves $code and requestId without the diagnostic message',
      () async {
        respond(
          (_) => jsonResponse(
            jsonEncode({
              'code': code,
              'requestId': 'test-request',
              'message': 'private diagnostic',
            }),
            status: status,
          ),
        );
        final result = await repository.search(
          predictionQuery(),
        ) as Failed<ModelRoutePrediction>;
        expect(
          result.failure,
          Failure(type: type, code: code, requestId: 'test-request'),
        );
        expect(
          result.failure.toString(),
          isNot(contains('private diagnostic')),
        );
      },
    );
  }

  for (final type in [
    DioExceptionType.connectionTimeout,
    DioExceptionType.receiveTimeout,
    DioExceptionType.connectionError,
  ]) {
    test('handles $type', () async {
      respond(
        (request) => throw DioException(requestOptions: request, type: type),
      );
      final result = await repository.search(
        predictionQuery(),
      ) as Failed<ModelRoutePrediction>;
      expect(
        result.failure.type,
        type == DioExceptionType.connectionError
            ? FailureType.network
            : FailureType.timeout,
      );
    });
  }

  test(
    'cancellation ends a live request and leaves the next search usable',
    () async {
      final started = Completer<void>();
      final completion = Completer<ResponseBody>();
      respond((_) {
        started.complete();
        return completion.future;
      });
      final pending = repository.search(predictionQuery());
      await started.future;
      repository.cancelSearch();
      expect(
        (await pending as Failed<ModelRoutePrediction>).failure.type,
        FailureType.cancelled,
      );
      completion.complete(jsonResponse(jsonEncode(predictionJson())));
      respond((_) => jsonResponse(jsonEncode(predictionJson())));
      expect(
        await repository.search(predictionQuery()),
        isA<Success<ModelRoutePrediction>>(),
      );
    },
  );
}
