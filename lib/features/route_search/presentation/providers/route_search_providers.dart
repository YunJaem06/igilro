import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/route_repository.dart';
import '../../domain/usecases/search_route_use_case.dart';

part 'route_search_providers.g.dart';

@Riverpod(keepAlive: true)
RouteRepository routeRepository(Ref ref) {
  throw StateError('routeRepositoryProvider must be overridden by app DI.');
}

@riverpod
SearchRouteUseCase searchRouteUseCase(Ref ref) =>
    SearchRouteUseCase(ref.watch(routeRepositoryProvider));
