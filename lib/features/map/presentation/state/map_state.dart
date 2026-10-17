import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'map_state.freezed.dart';

enum MapLoadStatus { loading, ready, failed }

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(GeoCoordinate(latitude: 37.5665, longitude: 126.9780))
    GeoCoordinate center,
    @Default(14) double zoom,
    GeoCoordinate? currentLocation,
    @Default([]) List<GeoCoordinate> framedCoordinates,
    @Default(MapLoadStatus.loading) MapLoadStatus status,
    @Default(0) int cameraRevision,
    @Default(0) int session,
  }) = _MapState;
}
