import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/error/failure.dart';
import '../../core/error/result.dart';
import '../../features/location/domain/entities/location_fix.dart';
import '../../features/location/presentation/providers/location_providers.dart';
import '../../features/map/presentation/providers/map_notifier.dart';
import '../../features/navigation/domain/navigation_progress.dart';
import '../../features/navigation/presentation/navigation_clock.dart';
import '../../features/navigation/presentation/navigation_notifier.dart';
import '../../features/route_search/domain/entities/route_endpoints.dart';
import '../../features/route_search/domain/entities/route_point.dart';
import '../../features/route_search/domain/usecases/compare_route_predictions_use_case.dart';
import '../../features/route_search/presentation/providers/route_comparison_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_providers.dart';
import '../../features/route_search/presentation/providers/route_search_kind_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_providers.dart';
import '../../features/route_search/presentation/providers/route_selection_notifier.dart';
import 'active_route_provider.dart';

part 'navigation_reroute_notifier.g.dart';

/// Keeps the old route available until a replacement search succeeds.
@riverpod
class NavigationRerouteNotifier extends _$NavigationRerouteNotifier {
  int _revision = 0;
  void Function()? _cancelPending;
  bool _applyingRoute = false;

  @override
  AsyncValue<void> build() {
    ref.listen(routeSelectionProvider.select((value) => value.endpoints), (
      _,
      _,
    ) {
      if (!_applyingRoute) _stopGuidance();
    });
    ref.listen(routeSearchKindProvider, (_, _) => _stopGuidance());
    ref.listen(routePredictionOptionsProvider, (_, _) => _stopGuidance());
    ref.listen(navigationProvider.select((value) => value.active), (_, active) {
      if (!active) cancel();
    });
    ref.onDispose(_cancelRequest);
    return const AsyncData(null);
  }

  void _stopGuidance() {
    cancel();
    ref.read(navigationProvider.notifier).stop();
  }

  void _cancelRequest() {
    _revision++;
    _cancelPending?.call();
    _cancelPending = null;
  }

  void cancel() {
    if (!state.isLoading && !state.hasError) return;
    _cancelRequest();
    state = const AsyncData(null);
  }

  bool _isCurrent(int revision) => ref.mounted && _revision == revision;

  Future<void> reroute() async {
    final guidance = ref.read(navigationProvider);
    final retry = state.hasError && guidance.status == GuidanceStatus.paused;
    if (state.isLoading ||
        !guidance.active ||
        guidance.isPreview ||
        !(retry ||
            guidance.status == GuidanceStatus.approaching ||
            guidance.status == GuidanceStatus.offRoute)) {
      return;
    }

    final revision = ++_revision;
    final now = ref.read(navigationNowProvider);
    final endpoints = ref.read(routeSelectionProvider).endpoints;
    final kind = ref.read(routeSearchKindProvider);
    final options = ref.read(routePredictionOptionsProvider);
    state = const AsyncLoading();
    ref.read(navigationProvider.notifier).pause();
    ref.read(mapProvider.notifier).stopFollowing();

    try {
      var fix = guidance.fix;
      if (retry || fix == null || !isReliableNavigationFix(fix, now())) {
        final location = await ref.read(getCurrentLocationUseCaseProvider)();
        if (!_isCurrent(revision)) return;
        switch (location) {
          case Success<LocationFix>(:final value):
            fix = value;
          case Failed<LocationFix>(:final failure):
            state = AsyncError(
              failure.copyWith(code: 'REROUTE_LOCATION_UNAVAILABLE'),
              StackTrace.current,
            );
            return;
        }
      }
      if (!isReliableNavigationFix(fix, now())) {
        state = AsyncError(
          const Failure(
            type: FailureType.invalidData,
            code: 'REROUTE_WEAK_GPS',
          ),
          StackTrace.current,
        );
        return;
      }
      final nextEndpoints = endpoints.copyWith(
        origin: RoutePoint(
          coordinate: fix.coordinate,
          source: RoutePointSource.currentLocation,
        ),
      );
      if (kind == RouteSearchKind.general) {
        final search = ref.read(searchRouteUseCaseProvider);
        _cancelPending = search.cancel;
        await _finish(
          search(nextEndpoints, departureAt: now()),
          revision,
          nextEndpoints,
          (result) =>
              ref.read(routeSearchProvider.notifier).applyRerouteResult(result),
        );
      } else {
        final compare = CompareRoutePredictionsUseCase(
          ref.read(searchRoutePredictionUseCaseProvider),
        );
        _cancelPending = compare.cancel;
        await _finish(
          compare(nextEndpoints, departureAt: options.departureAt ?? now()),
          revision,
          nextEndpoints,
          (result) => ref
              .read(routeComparisonProvider.notifier)
              .applyRerouteResult(result),
        );
      }
    } catch (error, stackTrace) {
      if (!_isCurrent(revision)) return;
      _cancelPending = null;
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> _finish<T>(
    Future<Result<T>> request,
    int revision,
    RouteEndpoints endpoints,
    void Function(T) publish,
  ) async {
    final result = await request;
    if (!_isCurrent(revision)) return;
    _cancelPending = null;
    switch (result) {
      case Failed<T>(:final failure):
        state = AsyncError(failure, StackTrace.current);
      case Success<T>(:final value):
        _applyingRoute = true;
        try {
          ref.read(routeSelectionProvider.notifier).setEndpoints(endpoints);
          publish(value);
        } finally {
          _applyingRoute = false;
        }
        final route = ref.read(activeRouteProvider)!.navigation;
        ref.read(mapProvider.notifier).beginFollowing();
        ref.read(navigationProvider.notifier).resumeOnRoute(route);
        state = const AsyncData(null);
    }
  }
}
