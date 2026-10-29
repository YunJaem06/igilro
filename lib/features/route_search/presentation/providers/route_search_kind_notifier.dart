import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_search_kind_notifier.g.dart';

enum RouteSearchKind { general, prediction }

@riverpod
class RouteSearchKindNotifier extends _$RouteSearchKindNotifier {
  @override
  RouteSearchKind build() => RouteSearchKind.general;

  void select(RouteSearchKind kind) => state = kind;
}
