import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_guidance.freezed.dart';

enum RouteGuidanceStatus { available, unavailable, unknown }

enum GuidanceMetadataStatus { osmTags, topologyOnly, unknown }

enum ManeuverType {
  depart,
  continueStraight,
  keepLeft,
  keepRight,
  turnLeft,
  turnRight,
  uTurn,
  crossing,
  stairs,
  arrive,
  unknown,
}

@freezed
abstract class RouteGuidance with _$RouteGuidance {
  const factory RouteGuidance({
    required RouteGuidanceStatus status,
    required GuidanceMetadataStatus metadataStatus,
    required String modelVersion,
    required String language,
    required List<RouteGuidanceStep> steps,
  }) = _RouteGuidance;
}

@freezed
abstract class RouteGuidanceStep with _$RouteGuidanceStep {
  const factory RouteGuidanceStep({
    required int index,
    required ManeuverType type,
    required GeoCoordinate coordinate,
    required int geometryIndex,
    required double distanceFromStartMeters,
    required double distanceToNextStepMeters,
    required Duration durationToNextStep,
    required String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    RouteCrossing? crossing,
  }) = _RouteGuidanceStep;
}

@freezed
abstract class RouteCrossing with _$RouteCrossing {
  const factory RouteCrossing({bool? trafficSignals}) = _RouteCrossing;
}
