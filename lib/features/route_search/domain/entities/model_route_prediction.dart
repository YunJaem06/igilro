import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'model_route_prediction.freezed.dart';

enum RoutePredictionMode { fastest, shade }

enum PredictedShadeState { shade, sunlight }

@freezed
abstract class RoutePredictionQuery with _$RoutePredictionQuery {
  const factory RoutePredictionQuery({
    required GeoCoordinate origin,
    required GeoCoordinate destination,
    required RoutePredictionMode mode,
    DateTime? departureAt,
  }) = _RoutePredictionQuery;
}

/// Public 3D model predictions remain separate from measured/height-based shade.
@freezed
abstract class ModelRoutePrediction with _$ModelRoutePrediction {
  const factory ModelRoutePrediction({
    required RoutePredictionQuery query,
    required List<PredictedRoute> routes,
    required DateTime evaluatedAt,
    required String dataVersion,
    required String predictionDataVersion,
    required String modelVersion,
    required String routingModelVersion,
    required String timeModelVersion,
    required Duration baselineDuration,
    required PredictionSnapping snapping,
    required String quality,
    required String attribution,
    required List<String> limitations,
    required int buildingModelCount,
    required int terrainTileCount,
    required int omittedBuildingModelCount,
    required double sampleStepMeters,
    required double projectionMaxErrorMeters,
    required double sceneBufferMetersApprox,
  }) = _ModelRoutePrediction;
}

@freezed
abstract class PredictedRoute with _$PredictedRoute {
  const factory PredictedRoute({
    required String id,
    required RoutePredictionMode mode,
    required List<GeoCoordinate> path,
    required double distanceMeters,
    required Duration duration,
    required Duration additionalDuration,
    required ModeledShadePrediction prediction,
    @Default([]) List<PredictedShadeSegment> shadeSegments,
  }) = _PredictedRoute;
}

@freezed
abstract class PredictedShadeSegment with _$PredictedShadeSegment {
  const factory PredictedShadeSegment({
    required PredictedShadeState state,
    required List<GeoCoordinate> path,
    required double fromDistanceMeters,
    required double toDistanceMeters,
    required double distanceMeters,
  }) = _PredictedShadeSegment;
}

@freezed
abstract class ModeledShadePrediction with _$ModeledShadePrediction {
  const factory ModeledShadePrediction({
    required String status,
    required double modeledShadeRatio,
    required double baselineModeledShadeRatio,
    double? physicalShadeCoverage,
  }) = _ModeledShadePrediction;
}

@freezed
abstract class PredictionSnapping with _$PredictionSnapping {
  const factory PredictionSnapping({
    required PredictionSnap origin,
    required PredictionSnap destination,
  }) = _PredictionSnapping;
}

@freezed
abstract class PredictionSnap with _$PredictionSnap {
  const factory PredictionSnap({
    required GeoCoordinate coordinate,
    required double distanceMeters,
  }) = _PredictionSnap;
}
