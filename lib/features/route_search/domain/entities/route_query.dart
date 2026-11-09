import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_query.freezed.dart';

enum RouteMode { fastest, running }

/// A snapshot of the input used for a walking route search.
@freezed
abstract class RouteQuery with _$RouteQuery {
  const factory RouteQuery({
    required GeoCoordinate origin,
    required GeoCoordinate destination,
    required DateTime departureAt,
    @Default(RouteMode.fastest) RouteMode mode,
  }) = _RouteQuery;
}
