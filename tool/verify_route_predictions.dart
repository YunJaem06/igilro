import 'dart:convert';
import 'dart:io';

import 'package:igilro/app/di/route_prediction_dependencies.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/prediction_coverage.dart';

/// Explicit live smoke test; never runs as part of offline unit/widget tests.
Future<void> main(List<String> args) async {
  final originIndex = args.indexOf('--base-url');
  if (originIndex >= 0 && originIndex + 1 >= args.length) {
    stderr.writeln('--base-url requires a server origin.');
    exitCode = 64;
    return;
  }
  final config = AppConfig.fromValues(
    environment: 'development',
    apiBaseUrl: originIndex < 0
        ? 'http://localhost:8080'
        : args[originIndex + 1],
  );
  final dio = createDio(config);
  final repository = createRoutePredictionRepository(DioClient(dio));
  final results = <ModelRoutePrediction>[];
  try {
    final coverageResult = await repository.coverage();
    if (coverageResult case Failed<PredictionCoverage>(:final failure)) {
      throw StateError(
        'coverage: ${failure.code}, requestId=${failure.requestId}',
      );
    }
    final coverage = (coverageResult as Success<PredictionCoverage>).value;
    for (final mode in RoutePredictionMode.values) {
      final query = RoutePredictionQuery(
        origin: const GeoCoordinate(longitude: 127.0374, latitude: 37.5445),
        destination: const GeoCoordinate(
          longitude: 127.0430,
          latitude: 37.5480,
        ),
        departureAt: DateTime.parse('2026-10-28T11:00:00+09:00'),
        mode: mode,
      );
      final response = await repository.search(query);
      if (response case Failed<ModelRoutePrediction>(:final failure)) {
        throw StateError(
          '${mode.name}: ${failure.type.name}/${failure.code}, requestId=${failure.requestId}',
        );
      }
      results.add((response as Success<ModelRoutePrediction>).value);
    }
    final fastest = results[0];
    final shade = results[1];
    _check(fastest.evaluatedAt == shade.evaluatedAt, 'evaluation time');
    _check(fastest.dataVersion == shade.dataVersion, 'walking graph version');
    _check(
      fastest.predictionDataVersion == shade.predictionDataVersion,
      'prediction scene version',
    );
    _check(fastest.snapping == shade.snapping, 'snapping');
    _check(coverage.dataVersion == shade.dataVersion, 'coverage graph version');
    _check(
      coverage.predictionDataVersion == shade.predictionDataVersion,
      'coverage scene version',
    );
    for (final result in results) {
      final route = result.routes.single;
      _check(route.shadeSegments.isNotEmpty, 'server shade segments');
      _check(
        (route.shadeSegments.last.toDistanceMeters - route.distanceMeters)
                .abs() <=
            0.051,
        'segment coverage',
      );
    }
    _check(
      fastest.baselineDuration == shade.baselineDuration,
      'baseline duration',
    );
    if (args.contains('--check-snapshot')) {
      final a = fastest.routes.single;
      final b = shade.routes.single;
      _check(
        (a.distanceMeters - 800.7).abs() < 0.05 &&
            a.duration.inSeconds == 572 &&
            a.additionalDuration == Duration.zero,
        'fastest snapshot',
      );
      _check(
        (b.distanceMeters - 865.6).abs() < 0.05 &&
            b.duration.inSeconds == 619 &&
            b.additionalDuration.inSeconds == 47,
        'shade snapshot',
      );
      _check(
        (a.prediction.modeledShadeRatio - 0.3113779386445875).abs() < 1e-6,
        'fastest predicted shade',
      );
      _check(
        (b.prediction.modeledShadeRatio - 0.5460082072396614).abs() < 1e-6,
        'shade predicted shade',
      );
      _check(
        a.prediction.physicalShadeCoverage == null &&
            b.prediction.physicalShadeCoverage == null,
        'unverified physical coverage',
      );
    }
    stdout.writeln(
      const JsonEncoder.withIndent('  ').convert({
        'server': config.apiBaseUri.toString(),
        'evaluatedAt': shade.evaluatedAt.toIso8601String(),
        'dataVersion': shade.dataVersion,
        'predictionDataVersion': shade.predictionDataVersion,
        'matchingEvaluationGraphSceneAndSnapping': true,
        'snapshotChecked': args.contains('--check-snapshot'),
        'coverage': {
          'bounds': [
            coverage.bounds.west,
            coverage.bounds.south,
            coverage.bounds.east,
            coverage.bounds.north,
          ],
          'walkingLineCount': coverage.walkingNetwork.length,
          'accessPointCount': coverage.accessPoints.length,
          'maximumSnappingDistanceMeters':
              coverage.maximumSnappingDistanceMeters,
        },
        'routes': [
          for (final result in results)
            {
              'mode': result.query.mode.name,
              'distanceMeters': result.routes.single.distanceMeters,
              'durationSeconds': result.routes.single.duration.inSeconds,
              'additionalDurationSeconds':
                  result.routes.single.additionalDuration.inSeconds,
              'modeledShadePercent':
                  (result.routes.single.prediction.modeledShadeRatio * 100)
                      .toStringAsFixed(1),
              'physicalShadeCoverage':
                  result.routes.single.prediction.physicalShadeCoverage,
              'vertexCount': result.routes.single.path.length,
              'shadeSegmentCount': result.routes.single.shadeSegments.length,
            },
        ],
      }),
    );
  } catch (error) {
    stderr.writeln(error);
    exitCode = 1;
  } finally {
    repository.cancelSearch();
    repository.cancelCoverage();
    dio.close(force: true);
  }
}

void _check(bool condition, String field) {
  if (!condition) {
    throw StateError('Live prediction verification failed: $field');
  }
}
