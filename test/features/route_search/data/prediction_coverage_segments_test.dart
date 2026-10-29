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
import 'package:igilro/features/route_search/data/dto/prediction_coverage_dto.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/prediction_coverage.dart';

import '../../../helpers/fake_http_client_adapter.dart';
import '../../../helpers/fake_prediction_repository.dart';

void main() {
  const mapper = ModelRoutePredictionMapper();
  ModelRoutePrediction decode(Map<String, dynamic> body) => mapper.toResult(
    ModelRoutePredictionResponseDto.fromJson(body),
    predictionQuery().copyWith(
      origin: forestOrigin,
      destination: forestDestination,
    ),
  );

  test('coverage uses server bounds, all network vertices, access points, and diagnostics', () {
    final value = sampleCoverage();
    expect(value.bounds.west, 127.0305);
    expect(value.bounds.north, 37.5515);
    expect(value.walkingNetwork.first.length, 3);
    expect(value.accessPoints.first.name, '테스트 출입구 1');
    expect(value.maximumSnappingDistanceMeters, 50.0);
    expect(value.connectivity.excludedDisconnectedNodeCount, 1);
    expect(() => value.walkingNetwork.first.clear(), throwsUnsupportedError);
    expect(() => value.accessPoints.clear(), throwsUnsupportedError);
    expect(value.bounds.contains(value.center), true);
    final changed = coverageJson()..['bounds'] = [126.9, 37.4, 127.2, 37.7];
    expect(
      mapper.toCoverage(PredictionCoverageDto.fromJson(changed)).bounds.west,
      126.9,
    );
  });

  for (final change in <String, void Function(Map<String, dynamic>)>{
    'invalid bound order': (b) => b['bounds'] = [128, 38, 127, 37],
    'wrong network type': (b) => b['walkingNetwork']['type'] = 'LineString',
    'invalid vertex': (b) =>
        b['walkingNetwork']['coordinates'][0][0] = [181, 37],
    'fractional connectivity': (b) => b['connectivity']['nodeCount'] = 3.5,
    'duplicate access point': (b) =>
        b['accessPoints'].add(b['accessPoints'][0]),
  }.entries) {
    test('coverage rejects ${change.key}', () {
      final body = coverageJson();
      change.value(body);
      expect(
        () => mapper.toCoverage(PredictionCoverageDto.fromJson(body)),
        throwsA(anyOf(isA<FormatException>(), isA<TypeError>())),
      );
    });
  }

  test('coverage GET uses origin once, preserves failure identifiers, and has independent cancellation', () async {
    final dio = createDio(
      AppConfig.fromValues(
        environment: 'development',
        apiBaseUrl: 'http://localhost:8080',
      ),
    );
    final adapter = FakeHttpClientAdapter(
      (_) => jsonResponse(jsonEncode(coverageJson())),
    );
    dio.httpClientAdapter = adapter;
    final repository = createRoutePredictionRepository(DioClient(dio));
    addTearDown(() => dio.close(force: true));
    final value = await repository.coverage() as Success<PredictionCoverage>;
    expect(value.value.accessPoints.length, 2);
    expect(adapter.requests.single.method, 'GET');
    expect(
      adapter.requests.single.uri.toString(),
      'http://localhost:8080/api/v1/routes/predictions/coverage',
    );
    expect(adapter.requests.single.headers['Accept'], 'application/json');
    final completion = Completer<ResponseBody>();
    final started = Completer<RequestOptions>();
    dio.httpClientAdapter = FakeHttpClientAdapter((request) {
      started.complete(request);
      return completion.future;
    });
    final future = repository.coverage();
    final pendingRequest = await started.future;
    repository.cancelSearch();
    expect(pendingRequest.cancelToken!.isCancelled, false);
    repository.cancelCoverage();
    completion.complete(jsonResponse(jsonEncode(coverageJson())));
    expect(
      (await future as Failed<PredictionCoverage>).failure.type,
      FailureType.cancelled,
    );
    dio.httpClientAdapter = FakeHttpClientAdapter(
      (_) => jsonResponse(
        jsonEncode({
          'code': 'PREDICTION_DATA_UNAVAILABLE',
          'requestId': 'coverage-request',
          'message': 'diagnostic',
        }),
        status: 503,
      ),
    );
    final error = await repository.coverage() as Failed<PredictionCoverage>;
    expect(error.failure.code, 'PREDICTION_DATA_UNAVAILABLE');
    expect(error.failure.requestId, 'coverage-request');
  });

  test('captured Seoul Forest responses retain complete shade bends, cumulative distances, and snapping', () {
    for (final mode in RoutePredictionMode.values) {
      final query = predictionQuery(mode)
          .copyWith(origin: forestOrigin, destination: forestDestination);
      final value = predictionFor(query);
      final route = value.routes.single;
      expect(route.shadeSegments.length, 4);
      expect(route.path.first, value.snapping.origin.coordinate);
      expect(route.path.first, isNot(query.origin));
      expect(route.shadeSegments.first.fromDistanceMeters, 0);
      expect(
        route.shadeSegments.last.toDistanceMeters,
        closeTo(route.distanceMeters, .051),
      );
      expect(route.prediction.physicalShadeCoverage, isNull);
      final shaded = route.shadeSegments
          .where((s) => s.state == PredictedShadeState.shade)
          .toList();
      final shadeLength = shaded.fold(0.0, (sum, s) => sum + s.distanceMeters);
      final total = route.shadeSegments.fold(
        0.0,
        (sum, s) => sum + s.distanceMeters,
      );
      expect(
        shadeLength / total,
        closeTo(route.prediction.modeledShadeRatio, 1e-8),
      );
      expect(
        route.distanceMeters,
        mode == RoutePredictionMode.fastest ? 800.7 : 865.6,
      );
      expect(
        route.duration.inSeconds,
        mode == RoutePredictionMode.fastest ? 572 : 619,
      );
      expect(
        () => route.shadeSegments.first.path.clear(),
        throwsUnsupportedError,
      );
      if (mode == RoutePredictionMode.shade) {
        expect(shaded.first.path.length, 6);
        expect(shaded.first.path[2].longitude, 127.0395902);
      }
    }
  });

  for (final change in <String, void Function(Map<String, dynamic>)>{
    'unknown shade state': (b) =>
        b['routes'][0]['shadeSegments'][0]['state'] = 'OBSERVED',
    'wrong line type': (b) =>
        b['routes'][0]['shadeSegments'][0]['geometry']['type'] =
            'MultiLineString',
    'distance gap': (b) =>
        b['routes'][0]['shadeSegments'][1]['fromDistanceMeters'] += 10,
    'negative distance': (b) =>
        b['routes'][0]['shadeSegments'][0]['distanceMeters'] = -1,
    'nonfinite vertex': (b) =>
        b['routes'][0]['shadeSegments'][0]['geometry']['coordinates'][0][0] =
            double.nan,
    'disconnected endpoint': (b) =>
        b['routes'][0]['shadeSegments'][1]['geometry']['coordinates'][0] = [
          127,
          37,
        ],
  }.entries) {
    test('rejects ${change.key} instead of painting invented shade', () {
      final body = forestPredictionJson(RoutePredictionMode.shade);
      change.value(body);
      expect(() => decode(body), throwsFormatException);
    });
  }
}
