import 'package:freezed_annotation/freezed_annotation.dart';

import 'route_point.dart';

part 'route_endpoints.freezed.dart';

@freezed
abstract class RouteEndpoints with _$RouteEndpoints {
  const RouteEndpoints._();

  const factory RouteEndpoints({RoutePoint? origin, RoutePoint? destination}) =
      _RouteEndpoints;

  bool get isComplete => origin != null && destination != null;

  bool get isSamePoint =>
      isComplete && origin!.coordinate == destination!.coordinate;

  bool get canSearch => isComplete && !isSamePoint;
}
