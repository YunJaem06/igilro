import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'prediction_coverage.freezed.dart';

@freezed
abstract class PredictionCoverage with _$PredictionCoverage {
  const factory PredictionCoverage({
    required String areaId,
    required String name,
    required PredictionBounds bounds,
    required GeoCoordinate center,
    required List<List<GeoCoordinate>> walkingNetwork,
    required List<PredictionAccessPoint> accessPoints,
    required double maximumSnappingDistanceMeters,
    required String dataVersion,
    required String predictionDataVersion,
    required String quality,
    required String attribution,
    required PredictionConnectivity connectivity,
  }) = _PredictionCoverage;
}

@freezed
abstract class PredictionBounds with _$PredictionBounds {
  const PredictionBounds._();
  const factory PredictionBounds({
    required double west,
    required double south,
    required double east,
    required double north,
  }) = _PredictionBounds;

  List<GeoCoordinate> get corners => [
    GeoCoordinate(longitude: west, latitude: south),
    GeoCoordinate(longitude: east, latitude: south),
    GeoCoordinate(longitude: east, latitude: north),
    GeoCoordinate(longitude: west, latitude: north),
  ];

  bool contains(GeoCoordinate point) =>
      point.longitude >= west &&
      point.longitude <= east &&
      point.latitude >= south &&
      point.latitude <= north;
}

@freezed
abstract class PredictionAccessPoint with _$PredictionAccessPoint {
  const factory PredictionAccessPoint({
    required String id,
    required String name,
    required GeoCoordinate coordinate,
  }) = _PredictionAccessPoint;
}

@freezed
abstract class PredictionConnectivity with _$PredictionConnectivity {
  const factory PredictionConnectivity({
    required int nodeCount,
    required int edgeCount,
    required int weakComponentCount,
    required int largestComponentNodeCount,
    required String componentPolicy,
    required int sourceWeakComponentCount,
    required int excludedDisconnectedNodeCount,
  }) = _PredictionConnectivity;
}
