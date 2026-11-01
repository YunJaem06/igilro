import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/navigation/domain/navigation_progress.dart';
import 'package:igilro/features/navigation/domain/navigation_timing.dart';
import 'package:igilro/features/navigation/presentation/navigation_clock.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';

import '../../helpers/fake_location_repository.dart';

const points = [
  GeoCoordinate(latitude: 37.54, longitude: 127.03),
  GeoCoordinate(latitude: 37.54, longitude: 127.031),
  GeoCoordinate(latitude: 37.54, longitude: 127.032),
];
final guide = RouteGuidance(
  status: RouteGuidanceStatus.available,
  metadataStatus: GuidanceMetadataStatus.osmTags,
  modelVersion: 'synthetic-time-test',
  language: 'ko',
  steps: [
    for (var i = 0; i < 3; i++)
      RouteGuidanceStep(
        index: i,
        type: [
          ManeuverType.depart,
          ManeuverType.turnLeft,
          ManeuverType.arrive,
        ][i],
        coordinate: points[i],
        geometryIndex: i,
        distanceFromStartMeters: i * 100,
        distanceToNextStepMeters: i == 2 ? 0 : 100,
        durationToNextStep: Duration(seconds: [60, 540, 0][i]),
        instruction: '안내 $i',
      ),
  ],
);
NavigationRoute route({
  RouteGuidance? guidance,
  Duration duration = const Duration(minutes: 10),
}) => NavigationRoute(
  path: points,
  distanceMeters: 200,
  duration: duration,
  guidance: guidance,
);
NavigationProgress progress(
  double fraction, {
  double? geometryPosition,
  double distanceToRoute = 0,
}) => NavigationProgress(
  remainingMeters: 200 * (1 - fraction),
  distanceToRoute: distanceToRoute,
  fraction: fraction,
  bearing: 90,
  arrived: false,
  geometryPosition: geometryPosition ?? fraction * 2,
);

void main() {
  testWidgets(
    'a GPS stream error pauses time and cannot silently restart until resume',
    (tester) async {
      var now = DateTime.utc(2026, 11, 1, 12);
      LocationFix fix() => LocationFix(
        coordinate: points.first,
        accuracyMeters: 5,
        capturedAt: now,
      );
      final updates = StreamController<Result<LocationFix>>.broadcast();
      final repository = FakeLocationRepository()
        ..location = Result.success(fix())
        ..updates = updates.stream;
      final container = ProviderContainer(
        overrides: [
          locationRepositoryProvider.overrideWithValue(repository),
          navigationNowProvider.overrideWithValue(() => now),
        ],
      );
      addTearDown(updates.close);
      addTearDown(container.dispose);
      container.listen(navigationProvider, (_, _) {});
      final notifier = container.read(navigationProvider.notifier);
      notifier.start(route());
      await tester.pump();
      expect(container.read(navigationProvider).timeEstimate, isNotNull);
      await tester.pump(const Duration(seconds: 21));
      expect(container.read(navigationProvider).timeEstimate, isNull);
      updates.add(Result.success(fix()));
      await tester.pump();
      expect(container.read(navigationProvider).timeEstimate, isNotNull);
      now = now.add(const Duration(seconds: 10));
      updates.addError(StateError('synthetic location stream failure'));
      await tester.pump();
      final failed = container.read(navigationProvider);
      expect(failed.status, GuidanceStatus.failed);
      now = now.add(const Duration(minutes: 5));
      updates.add(Result.success(fix()));
      await tester.pump();
      expect(container.read(navigationProvider), same(failed));
      expect(failed.session!.elapsedAt(now), const Duration(seconds: 10));
      repository.location = Result.success(fix());
      notifier.resume();
      await tester.pump();
      expect(container.read(navigationProvider).timeEstimate, isNotNull);
      notifier.stop();
      await tester.pump();
    },
  );

  test('remaining time weights each server leg instead of using distance ratio alone', () {
    final line = route(guidance: guide);
    expect(
      estimateRemainingDuration(line, progress(0)),
      const Duration(minutes: 10),
    );
    expect(
      estimateRemainingDuration(line, progress(.25)),
      const Duration(seconds: 570),
    );
    expect(
      estimateRemainingDuration(line, progress(.5)),
      const Duration(minutes: 9),
    );
    expect(
      estimateRemainingDuration(line, progress(.75)),
      const Duration(seconds: 270),
    );
    expect(estimateRemainingDuration(line, progress(1)), Duration.zero);
    final rounded = guide.copyWith(
      steps: [
        guide.steps[0].copyWith(
          durationToNextStep: const Duration(milliseconds: 59300),
        ),
        ...guide.steps.skip(1),
      ],
    );
    expect(
      estimateRemainingDuration(route(guidance: rounded), progress(0)),
      const Duration(minutes: 10),
    );
  });

  test(
    'older guidance uses whole-route time and invalid time remains unavailable',
    () {
      for (final status in [
        RouteGuidanceStatus.unavailable,
        RouteGuidanceStatus.unknown,
      ]) {
        expect(
          estimateRemainingDuration(
            route(guidance: guide.copyWith(status: status)),
            progress(.25),
          ),
          const Duration(seconds: 450),
        );
      }
      expect(
        estimateRemainingDuration(route(), progress(.25)),
        const Duration(seconds: 450),
      );
      expect(
        estimateRemainingDuration(route(), progress(-.1)),
        const Duration(minutes: 10),
      );
      expect(estimateRemainingDuration(route(), progress(1.1)), Duration.zero);
      expect(estimateRemainingDuration(route(), progress(double.nan)), isNull);
      expect(
        estimateRemainingDuration(
          route(),
          progress(.5, geometryPosition: double.infinity),
        ),
        isNull,
      );
      expect(
        estimateRemainingDuration(route(duration: Duration.zero), progress(.5)),
        isNull,
      );
    },
  );

  test('zero-length server legs are counted until their original geometry has been passed', () {
    final duplicate = guide.copyWith(
      steps: [
        guide.steps[0].copyWith(
          distanceToNextStepMeters: 0,
          durationToNextStep: const Duration(seconds: 30),
        ),
        guide.steps[1].copyWith(
          coordinate: points.first,
          distanceFromStartMeters: 0,
          distanceToNextStepMeters: 200,
          durationToNextStep: const Duration(seconds: 570),
        ),
        guide.steps.last,
      ],
    );
    expect(
      estimateRemainingDuration(route(guidance: duplicate), progress(0)),
      const Duration(minutes: 10),
    );
    expect(
      estimateRemainingDuration(
        route(guidance: duplicate),
        progress(.5, geometryPosition: 1.5),
      ),
      const Duration(seconds: 285),
    );
  });

  test('ETA is available only for reliable following and never for a suspect first fix', () {
    final now = DateTime.utc(2026, 11, 1, 23, 59, 30);
    for (final status in GuidanceStatus.values) {
      final state = GuidanceState(
        status: status,
        route: route(guidance: guide),
        progress: progress(.5),
        updatedAt: now,
      );
      expect(state.timeEstimate != null, status == GuidanceStatus.following);
      if (state.timeEstimate case final estimate?) {
        expect(estimate.arrivalAt, now.add(const Duration(minutes: 9)));
      }
    }
    final state = GuidanceState(
      status: GuidanceStatus.following,
      route: route(),
      progress: progress(.5, distanceToRoute: 100),
      updatedAt: now,
      fix: LocationFix(
        coordinate: points.first,
        accuracyMeters: 5,
        capturedAt: now,
      ),
    );
    expect(state.timeEstimate, isNull);
    final extreme = GuidanceState(
      status: GuidanceStatus.following,
      route: route(duration: const Duration(days: 100000001)),
      progress: progress(0),
      updatedAt: now,
    );
    expect(extreme.timeEstimate, isNull);
  });

  test('session freezes on pause and completion; clock rollback does not create negative time', () {
    final start = DateTime.utc(2026, 11, 1, 12);
    var session = NavigationSession.start(start);
    expect(
      session.elapsedAt(start.subtract(const Duration(seconds: 1))),
      Duration.zero,
    );
    session = session.pause(start.add(const Duration(seconds: 45)));
    expect(
      session.elapsedAt(start.add(const Duration(hours: 1))),
      const Duration(seconds: 45),
    );
    session = session.resume(start.add(const Duration(hours: 1)));
    session = session.complete(
      start.add(const Duration(hours: 1, seconds: 15)),
    );
    expect(
      session.elapsedAt(start.add(const Duration(days: 1))),
      const Duration(minutes: 1),
    );
    expect(session.resume(start.add(const Duration(days: 1))), same(session));
    expect(session.complete(start.add(const Duration(days: 1))), same(session));
  });

  testWidgets(
    'real guidance preserves its session across pause and failure, freezes at arrival and clears on stop',
    (tester) async {
      var now = DateTime.utc(2026, 11, 1, 12);
      LocationFix fix(GeoCoordinate point) =>
          LocationFix(coordinate: point, accuracyMeters: 5, capturedAt: now);
      final updates = StreamController<Result<LocationFix>>.broadcast();
      final repository = FakeLocationRepository()
        ..location = Result.success(fix(points.first))
        ..updates = updates.stream;
      final container = ProviderContainer(
        overrides: [
          locationRepositoryProvider.overrideWithValue(repository),
          navigationNowProvider.overrideWithValue(() => now),
        ],
      );
      addTearDown(updates.close);
      addTearDown(container.dispose);
      container.listen(navigationProvider, (_, _) {});
      final notifier = container.read(navigationProvider.notifier);
      notifier.start(route(guidance: guide));
      await tester.pump();
      final startedAt = container.read(navigationProvider).session!.startedAt;
      expect(
        container.read(navigationProvider).timeEstimate!.remaining,
        const Duration(minutes: 10),
      );
      now = now.add(const Duration(seconds: 30));
      notifier.pause();
      now = now.add(const Duration(minutes: 10));
      repository.location = Result.success(fix(points[1]));
      notifier.resume();
      await tester.pump();
      expect(container.read(navigationProvider).session!.startedAt, startedAt);
      expect(
        container.read(navigationProvider).session!.elapsedAt(now),
        const Duration(seconds: 30),
      );
      expect(
        container.read(navigationProvider).timeEstimate!.remaining,
        const Duration(minutes: 9),
      );
      now = now.add(const Duration(seconds: 10));
      updates.add(
        const Result.failure(Failure(type: FailureType.serviceDisabled)),
      );
      await tester.pump();
      expect(container.read(navigationProvider).status, GuidanceStatus.failed);
      expect(container.read(navigationProvider).timeEstimate, isNull);
      now = now.add(const Duration(minutes: 2));
      repository.location = Result.success(fix(points[1]));
      notifier.resume();
      await tester.pump();
      now = now.add(const Duration(seconds: 20));
      updates.add(Result.success(fix(points.last)));
      await tester.pump();
      final arrived = container.read(navigationProvider);
      expect(arrived.status, GuidanceStatus.arrived);
      expect(arrived.session!.elapsedAt(now), const Duration(minutes: 1));
      expect(arrived.session!.completedAt, now);
      now = now.add(const Duration(hours: 1));
      updates.add(Result.success(fix(points.first)));
      await tester.pump(const Duration(seconds: 21));
      expect(container.read(navigationProvider), same(arrived));
      notifier.resume();
      expect(container.read(navigationProvider), same(arrived));
      notifier.stop();
      expect(container.read(navigationProvider).session, isNull);
      expect(container.read(navigationProvider).timeEstimate, isNull);
      repository.location = Result.success(fix(points.first));
      notifier.start(route());
      await tester.pump();
      expect(container.read(navigationProvider).session!.startedAt, now);
      notifier.stop();
      await tester.pump();
    },
  );

  testWidgets(
    'preview resumes at the same path position and never records real walking',
    (tester) async {
      var now = DateTime.utc(2026, 11, 1, 12);
      final repository = FakeLocationRepository();
      final container = ProviderContainer(
        overrides: [
          locationRepositoryProvider.overrideWithValue(repository),
          navigationNowProvider.overrideWithValue(() => now),
        ],
      );
      addTearDown(container.dispose);
      container.listen(navigationProvider, (_, _) {});
      final notifier = container.read(navigationProvider.notifier);
      notifier.preview(route(guidance: guide));
      now = now.add(const Duration(seconds: 5));
      await tester.pump(const Duration(seconds: 5));
      final position = container
          .read(navigationProvider)
          .progress!
          .geometryPosition;
      notifier.pause();
      now = now.add(const Duration(minutes: 5));
      notifier.resume();
      expect(
        container.read(navigationProvider).progress!.geometryPosition,
        closeTo(position, 1e-6),
      );
      now = now.add(const Duration(seconds: 10));
      await tester.pump(const Duration(seconds: 11));
      final completed = container.read(navigationProvider);
      expect(completed.status, GuidanceStatus.arrived);
      expect(completed.isPreview, true);
      expect(repository.calls, isEmpty);
      expect(completed.session!.elapsedAt(now), const Duration(seconds: 15));
      expect(completed.timeEstimate, isNull);
      notifier.stop();
      await tester.pump();
    },
  );
}
