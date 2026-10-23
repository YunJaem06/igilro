import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_candidate.freezed.dart';

@freezed
abstract class RouteCandidate with _$RouteCandidate {
  const factory RouteCandidate({
    required String id,
    required List<GeoCoordinate> path,
    required double distanceMeters,
    required Duration duration,
    required Duration additionalDuration,
    required RouteMetrics metrics,
    RouteShadeEvaluation? shadeEvaluation,
  }) = _RouteCandidate;
}

enum ShadeEvaluationStatus {
  available,
  dataUnavailable,
  incompleteCoverage,
  night,
  lowSun,
  unsupportedTime,
  unknown,
}

@freezed
abstract class RouteShadeEvaluation with _$RouteShadeEvaluation {
  const factory RouteShadeEvaluation({
    required ShadeEvaluationStatus status,
    required String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  }) = _RouteShadeEvaluation;
}

@freezed
abstract class RouteMetrics with _$RouteMetrics {
  const factory RouteMetrics({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    int? trafficSignalCount,
  }) = _RouteMetrics;
}
