import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'map_marker.freezed.dart';

enum MapMarkerRole { origin, destination, selection }

/// Rendering input; route entities and SDK annotation objects stay outside it.
@freezed
abstract class MapMarker with _$MapMarker {
  const factory MapMarker({
    required GeoCoordinate coordinate,
    required MapMarkerRole role,
  }) = _MapMarker;
}
