import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_point.freezed.dart';

enum RoutePointSource { currentLocation, map }

@freezed
abstract class RoutePoint with _$RoutePoint {
  const factory RoutePoint({
    required GeoCoordinate coordinate,
    required RoutePointSource source,
  }) = _RoutePoint;
}
