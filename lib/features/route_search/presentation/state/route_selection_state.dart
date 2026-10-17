import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/route_endpoints.dart';
import '../../domain/entities/route_point.dart';

part 'route_selection_state.freezed.dart';

enum RouteEndpoint { origin, destination }

@freezed
abstract class RouteSelectionState with _$RouteSelectionState {
  const factory RouteSelectionState({
    @Default(RouteEndpoints()) RouteEndpoints endpoints,
    RouteEndpoint? selecting,
    RoutePoint? candidate,
  }) = _RouteSelectionState;
}
