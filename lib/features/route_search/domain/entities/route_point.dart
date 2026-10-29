import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_point.freezed.dart';

enum RoutePointSource { currentLocation, map, place }

@freezed
abstract class RoutePoint with _$RoutePoint {
  const factory RoutePoint({
    required GeoCoordinate coordinate,
    required RoutePointSource source,
    String? name,
    String? address,
    @Default([]) List<String> attributions,
  }) = _RoutePoint;
}
