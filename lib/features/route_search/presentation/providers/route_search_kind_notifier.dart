import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/route_query.dart';

part 'route_search_kind_notifier.g.dart';

enum RouteSearchKind {
  general,
  prediction,
  running;

  RouteMode get walkingMode =>
      this == running ? RouteMode.running : RouteMode.fastest;
}

@riverpod
class RouteSearchKindNotifier extends _$RouteSearchKindNotifier {
  @override
  RouteSearchKind build() => RouteSearchKind.prediction;

  void select(RouteSearchKind kind) => state = kind;
}

@riverpod
class RunningRouteSelection extends _$RunningRouteSelection {
  @override
  RouteMode build() {
    ref.watch(routeSearchKindProvider);
    return RouteMode.running;
  }

  void select(RouteMode mode) => state = mode;
}
