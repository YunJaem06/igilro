import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/navigation/domain/navigation_progress.dart';
import '../../features/route_search/presentation/providers/route_comparison_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_providers.dart';
import '../../features/route_search/presentation/providers/route_search_kind_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_notifier.dart';

part 'active_route_provider.g.dart';

/// App composition owns the selected route across the search/navigation features.
final class ActiveRoute {
  const ActiveRoute({required this.key, required this.navigation});
  final Object key;
  final NavigationRoute navigation;
}

@riverpod
ActiveRoute? activeRoute(Ref ref) {
  final kind = ref.watch(routeSearchKindProvider);
  if (kind == RouteSearchKind.prediction) {
    final mode = ref.watch(routePredictionOptionsProvider).mode;
    final pair = ref.watch(routeComparisonProvider).asData?.value;
    final single = ref.watch(routePredictionProvider).asData?.value;
    final model = pair?.forMode(mode) ?? single;
    if (model == null || model.routes.isEmpty) return null;
    final route = model.routes.first;
    return ActiveRoute(
      key: (kind, model.query, model.evaluatedAt, route.id),
      navigation: NavigationRoute(
        path: route.path,
        distanceMeters: route.distanceMeters,
        duration: route.duration,
        guidance: route.guidance,
      ),
    );
  }
  final result = ref.watch(routeSearchProvider).asData?.value;
  if (result == null || result.routes.isEmpty) return null;
  final route = result.routes.first;
  return ActiveRoute(
    key: (kind, result.query, result.evaluatedAt, route.id),
    navigation: NavigationRoute(
      path: route.path,
      distanceMeters: route.distanceMeters,
      duration: route.duration,
      guidance: route.guidance,
    ),
  );
}
