import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';
import 'route_candidate.dart';
import 'route_query.dart';

part 'route_search_result.freezed.dart';

@freezed
abstract class RouteSearchResult with _$RouteSearchResult {
  const factory RouteSearchResult({
    required RouteQuery query,
    required List<RouteCandidate> routes,
    required DateTime evaluatedAt,
    required String dataVersion,
    required String timeModelVersion,
    required String routingModelVersion,
    required Duration baselineDuration,
    required RouteSnapping snapping,
    required String attribution,
  }) = _RouteSearchResult;
}

@freezed
abstract class RouteSnapping with _$RouteSnapping {
  const factory RouteSnapping({
    required RouteSnap origin,
    required RouteSnap destination,
  }) = _RouteSnapping;
}

@freezed
abstract class RouteSnap with _$RouteSnap {
  const factory RouteSnap({
    required GeoCoordinate coordinate,
    required double distanceMeters,
  }) = _RouteSnap;
}
