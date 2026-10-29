import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'map_state.freezed.dart';

enum MapLoadStatus { loading, ready, failed }

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(GeoCoordinate(latitude: 37.5476, longitude: 127.0385))
    GeoCoordinate center,
    @Default(16) double zoom,
    @Default(true) bool is3D,
    @Default(false) bool followLocation,
    @Default(0) double bearing,
    DateTime? lightingAt,
    GeoCoordinate? currentLocation,
    @Default([]) List<GeoCoordinate> framedCoordinates,
    @Default(MapLoadStatus.loading) MapLoadStatus status,
    @Default(0) int cameraRevision,
    @Default(0) int session,
  }) = _MapState;
}
