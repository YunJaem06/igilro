import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../location/domain/entities/location_fix.dart';
import '../../location/domain/usecases/watch_location_use_case.dart';
import '../../location/presentation/providers/location_providers.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../domain/navigation_progress.dart';
import '../domain/navigation_timing.dart';
import 'navigation_clock.dart';
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
    this.updatedAt,
    this.session,
  });
  final GuidanceStatus status;
  final NavigationRoute? route;
  final LocationFix? fix;
  final NavigationProgress? progress;
  final Failure? failure;
  final bool isPreview;
  final DateTime? updatedAt;
  final NavigationSession? session;
  bool get active => route != null;

  bool get hasReliableProgress =>
      status == GuidanceStatus.following &&
      route != null &&
      progress != null &&
      progress!.fraction.isFinite &&
      progress!.distanceToRoute.isFinite &&
      (fix == null ||
          progress!.distanceToRoute <=
              (fix!.accuracyMeters * 1.5).clamp(30.0, 75.0));

  NavigationTimeEstimate? get timeEstimate {
    if (!hasReliableProgress || updatedAt == null) return null;
    final remaining = estimateRemainingDuration(route!, progress!);
    if (remaining == null) return null;
    try {
      return NavigationTimeEstimate(
        remaining: remaining,
        updatedAt: updatedAt!,
        arrivalAt: updatedAt!.add(remaining),
      );
    } on ArgumentError {
      return null;
    }
  }

  NavigationStepProgress? get stepProgress {
    if (route == null || progress == null) return null;
    if (status == GuidanceStatus.arrived) {
      return measureGuidanceSteps(route!, progress!, arrived: true);
    }
    if (instruction == null) return null;
    return measureGuidanceSteps(route!, progress!);
  }

  NavigationInstruction? get instruction {
    if (!hasReliableProgress) return null;
    return nextInstruction(route!, progress!);
  }
}

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  StreamSubscription<Result<LocationFix>>? _subscription;
  int _generation = 0;
  bool _joined = false;
  int _outsideFixes = 0;
  Timer? _previewTimer;
  Timer? _fixExpiryTimer;

  DateTime _now() => ref.read(navigationNowProvider)().toUtc();

  @override
  GuidanceState build() {
    ref.onDispose(() {
      _generation++;
      _previewTimer?.cancel();
      _fixExpiryTimer?.cancel();
      unawaited(_subscription?.cancel());
    });
    return const GuidanceState();
  }

  void start(NavigationRoute route) => _start(route);

  void resumeOnRoute(NavigationRoute route) {
    _start(route, session: state.session?.resume(_now()));
  }

  void _start(NavigationRoute route, {NavigationSession? session}) {
    if (route.path.length < 2) return;
    _previewTimer?.cancel();
    _fixExpiryTimer?.cancel();
    unawaited(_subscription?.cancel());
    final generation = ++_generation;
    _joined = false;
    _outsideFixes = 0;
    final now = _now();
    state = GuidanceState(
      status: GuidanceStatus.locating,
      route: route,
      session: session ?? NavigationSession.start(now),
      updatedAt: now,
    );
    _subscription = WatchLocationUseCase(ref.read(locationRepositoryProvider))()
        .listen(
          (result) {
            if (!ref.mounted || generation != _generation) return;
            switch (result) {
              case Failed<LocationFix>(:final failure):
                _fail(route, failure);
              case Success<LocationFix>(:final value):
                _fixExpiryTimer?.cancel();
                final now = _now();
                final age = now.difference(value.capturedAt.toUtc());
                if (!isReliableNavigationFix(value, now)) {
                  _outsideFixes = 0;
                  state = GuidanceState(
                    status: GuidanceStatus.weakGps,
                    route: route,
                    fix: value,
                    progress: state.progress,
                    session: state.session,
                    updatedAt: now,
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
                  session: status == GuidanceStatus.arrived
                      ? state.session?.complete(now)
                      : state.session,
                  updatedAt: now,
                );
                if (status == GuidanceStatus.arrived) {
                  _generation++;
                  unawaited(_subscription?.cancel());
                } else {
                  _fixExpiryTimer = Timer(
                    const Duration(seconds: 20) - age,
                    () {
                      if (!ref.mounted || generation != _generation) return;
                      _outsideFixes = 0;
                      state = GuidanceState(
                        status: GuidanceStatus.weakGps,
                        route: route,
                        fix: state.fix,
                        progress: state.progress,
                        session: state.session,
                        updatedAt: _now(),
                      );
                    },
                  );
                }
            }
          },
          onError: (Object error) {
            if (ref.mounted && generation == _generation) {
              _fail(route, const Failure(type: FailureType.unexpected));
            }
          },
        );
  }

  void _fail(NavigationRoute route, Failure failure) {
    _generation++;
    _fixExpiryTimer?.cancel();
    final now = _now();
    state = GuidanceState(
      status: GuidanceStatus.failed,
      route: route,
      failure: failure,
      session: state.session?.pause(now),
      updatedAt: now,
    );
    unawaited(_subscription?.cancel());
  }

  /// Explicit simulation, using the returned geometry and no device GPS.
  void preview(NavigationRoute route) => _preview(route);

  void _preview(
    NavigationRoute route, {
    NavigationSession? session,
    double initialPosition = 0,
  }) {
    if (route.path.length < 2) return;
    final generation = ++_generation;
    _previewTimer?.cancel();
    _fixExpiryTimer?.cancel();
    unawaited(_subscription?.cancel());
    _subscription = null;
    final now = _now();
    final previewSession = session ?? NavigationSession.start(now);
    var step = 0;
    void tick() {
      if (!ref.mounted || generation != _generation) return;
      final now = _now();
      final position = (initialPosition + step++ / 30 * (route.path.length - 1))
          .clamp(0.0, (route.path.length - 1).toDouble());
      final index = position.floor().clamp(0, route.path.length - 2);
      final t = (position - index).clamp(0.0, 1.0);
      final a = route.path[index], b = route.path[index + 1];
      final fix = LocationFix(
        coordinate: GeoCoordinate(
          latitude: a.latitude + (b.latitude - a.latitude) * t,
          longitude: a.longitude + (b.longitude - a.longitude) * t,
        ),
        accuracyMeters: 0,
        capturedAt: now,
      );
      state = GuidanceState(
        route: route,
        fix: fix,
        progress: measureProgress(route, fix),
        isPreview: true,
        status: position >= route.path.length - 1
            ? GuidanceStatus.arrived
            : GuidanceStatus.following,
        updatedAt: now,
        session: position >= route.path.length - 1
            ? previewSession.complete(now)
            : previewSession,
      );
      if (state.status == GuidanceStatus.arrived) _previewTimer?.cancel();
    }

    tick();
    if (state.status != GuidanceStatus.arrived) {
      _previewTimer = Timer.periodic(
        const Duration(milliseconds: 500),
        (_) => tick(),
      );
    }
  }

  void pause() {
    if (!state.active || state.status == GuidanceStatus.arrived) return;
    _generation++;
    _previewTimer?.cancel();
    _fixExpiryTimer?.cancel();
    unawaited(_subscription?.cancel());
    final now = _now();
    state = GuidanceState(
      status: GuidanceStatus.paused,
      route: state.route,
      fix: state.fix,
      progress: state.progress,
      isPreview: state.isPreview,
      session: state.session?.pause(now),
      updatedAt: now,
    );
  }

  void resume() {
    final route = state.route;
    if (route != null &&
        {GuidanceStatus.paused, GuidanceStatus.failed}.contains(state.status)) {
      final session = state.session?.resume(_now());
      if (state.isPreview) {
        _preview(
          route,
          session: session,
          initialPosition: state.progress?.geometryPosition ?? 0,
        );
      } else {
        _start(route, session: session);
      }
    }
  }

  void stop() {
    _generation++;
    _previewTimer?.cancel();
    _fixExpiryTimer?.cancel();
    unawaited(_subscription?.cancel());
    _subscription = null;
    state = const GuidanceState();
  }
}
