import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'route_query.freezed.dart';

/// A snapshot of the input used for one fastest walking route search.
@freezed
abstract class RouteQuery with _$RouteQuery {
  const factory RouteQuery({
    required GeoCoordinate origin,
    required GeoCoordinate destination,
    required DateTime departureAt,
  }) = _RouteQuery;
}
