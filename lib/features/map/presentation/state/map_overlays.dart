import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'map_overlays.freezed.dart';

enum MapShadeState { shade, sunlight }

@freezed
abstract class MapRouteSegment with _$MapRouteSegment {
  const factory MapRouteSegment({
    required MapShadeState state,
    required List<GeoCoordinate> path,
  }) = _MapRouteSegment;
}

/// This snapshot includes color state, so identical route coordinates alone
/// cannot hide a new departure time's shade boundaries.
@freezed
abstract class MapRoutePaint with _$MapRoutePaint {
  const factory MapRoutePaint({
    required List<GeoCoordinate> path,
    @Default([]) List<MapRouteSegment> segments,
  }) = _MapRoutePaint;
}

@freezed
abstract class MapCoverage with _$MapCoverage {
  const factory MapCoverage({
    required List<GeoCoordinate> boundary,
    required List<List<GeoCoordinate>> walkingNetwork,
    required List<MapAccessPoint> accessPoints,
  }) = _MapCoverage;
}

@freezed
abstract class MapAccessPoint with _$MapAccessPoint {
  const factory MapAccessPoint({
    required String id,
    required String name,
    required GeoCoordinate coordinate,
  }) = _MapAccessPoint;
}

abstract final class MapRouteColors {
  static const shade = 0xFF23785C;
  static const sunlight = 0xFFDA862D;
  static const neutral = 0xFF6F7C75;
}
