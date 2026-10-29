import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../location/domain/entities/location_fix.dart';
import '../../location/domain/usecases/watch_location_use_case.dart';
import '../../location/presentation/providers/location_providers.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../domain/navigation_progress.dart';
import '../../../core/geo/geo_coordinate.dart';

part 'navigation_notifier.g.dart';

enum GuidanceStatus {
  idle,
  locating,
  following,
  approaching,
  offRoute,
  weakGps,
  paused,
  arrived,
  failed,
}

final class GuidanceState {
  const GuidanceState({
    this.status = GuidanceStatus.idle,
    this.route,
    this.fix,
    this.progress,
    this.failure,
    this.isPreview = false,
  });
  final GuidanceStatus status;
  final NavigationRoute? route;
  final LocationFix? fix;
  final NavigationProgress? progress;
  final Failure? failure;
  final bool isPreview;
  bool get active => route != null;
}

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  StreamSubscription<Result<LocationFix>>? _subscription;
  int _generation = 0;
  bool _joined = false;
  int _outsideFixes = 0;
  Timer? _previewTimer;

  @override
  GuidanceState build() {
    ref.onDispose(() {
      _generation++;
      _previewTimer?.cancel();
      unawaited(_subscription?.cancel());
    });
    return const GuidanceState();
  }

  void start(NavigationRoute route) {
    if (route.path.length < 2) return;
    _previewTimer?.cancel();
    unawaited(_subscription?.cancel());
    final generation = ++_generation;
    _joined = false;
    _outsideFixes = 0;
    state = GuidanceState(status: GuidanceStatus.locating, route: route);
    _subscription = WatchLocationUseCase(ref.read(locationRepositoryProvider))()
        .listen(
          (result) {
            if (!ref.mounted || generation != _generation) return;
            switch (result) {
              case Failed<LocationFix>(:final failure):
                state = GuidanceState(
                  status: GuidanceStatus.failed,
                  route: route,
                  failure: failure,
                );
                unawaited(_subscription?.cancel());
              case Success<LocationFix>(:final value):
                final age = DateTime.now().toUtc().difference(
                  value.capturedAt.toUtc(),
                );
                if (age > const Duration(seconds: 20) ||
                    age < const Duration(seconds: -5) ||
                    value.accuracyMeters > 50) {
                  state = GuidanceState(
                    status: GuidanceStatus.weakGps,
                    route: route,
                    fix: value,
                    progress: state.progress,
                  );
                  return;
                }
                final progress = measureProgress(route, value);
                final threshold = (value.accuracyMeters * 1.5).clamp(
                  30.0,
                  75.0,
                );
                final outside = progress.distanceToRoute > threshold;
                _outsideFixes = outside ? _outsideFixes + 1 : 0;
                if (!outside) _joined = true;
                final status = progress.arrived
                    ? GuidanceStatus.arrived
                    : !_joined && outside
                    ? GuidanceStatus.approaching
                    : _outsideFixes >= 2
                    ? GuidanceStatus.offRoute
                    : GuidanceStatus.following;
                state = GuidanceState(
                  status: status,
                  route: route,
                  fix: value,
                  progress: progress,
                );
                if (status == GuidanceStatus.arrived) {
                  unawaited(_subscription?.cancel());
                }
            }
          },
          onError: (Object error) {
            if (ref.mounted && generation == _generation) {
              state = GuidanceState(
                status: GuidanceStatus.failed,
                route: route,
                failure: const Failure(type: FailureType.unexpected),
              );
            }
          },
        );
  }

  /// Explicit simulation, using the returned geometry and no device GPS.
  void preview(NavigationRoute route) {
    if (route.path.length < 2) return;
    _generation++;
    _previewTimer?.cancel();
    unawaited(_subscription?.cancel());
    _subscription = null;
    var step = 0;
    void tick() {
      final position = (step++ / 30).clamp(0.0, 1.0) * (route.path.length - 1);
      final index = position.floor().clamp(0, route.path.length - 2);
      final t = (position - index).clamp(0.0, 1.0);
      final a = route.path[index], b = route.path[index + 1];
      final fix = LocationFix(
        coordinate: GeoCoordinate(
          latitude: a.latitude + (b.latitude - a.latitude) * t,
          longitude: a.longitude + (b.longitude - a.longitude) * t,
        ),
        accuracyMeters: 0,
        capturedAt: DateTime.now().toUtc(),
      );
      state = GuidanceState(
        route: route,
        fix: fix,
        progress: measureProgress(route, fix),
        isPreview: true,
        status: position >= route.path.length - 1
            ? GuidanceStatus.arrived
            : GuidanceStatus.following,
      );
      if (state.status == GuidanceStatus.arrived) _previewTimer?.cancel();
    }

    tick();
    _previewTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => tick(),
    );
  }

  void pause() {
    if (!state.active || state.status == GuidanceStatus.arrived) return;
    _generation++;
    _previewTimer?.cancel();
    unawaited(_subscription?.cancel());
    state = GuidanceState(
      status: GuidanceStatus.paused,
      route: state.route,
      fix: state.fix,
      progress: state.progress,
      isPreview: state.isPreview,
    );
  }

  void resume() {
    final route = state.route;
    if (route != null) {
      if (state.isPreview) {
        preview(route);
      } else {
        start(route);
      }
    }
  }

  void stop() {
    _generation++;
    _previewTimer?.cancel();
    unawaited(_subscription?.cancel());
    _subscription = null;
    state = const GuidanceState();
  }
}
