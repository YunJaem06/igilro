import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/core/geo/solar_position.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/navigation/domain/navigation_progress.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';

import '../../helpers/fake_location_repository.dart';

const origin = GeoCoordinate(latitude: 37.54, longitude: 127.03);
const destination = GeoCoordinate(latitude: 37.54, longitude: 127.032);
final route = NavigationRoute(
  path: [origin, destination],
  distanceMeters: 180,
  duration: const Duration(seconds: 130),
);
LocationFix fix(
  double longitude, {
  double latitude = 37.54,
  double accuracy = 5,
  DateTime? time,
}) => LocationFix(
  coordinate: GeoCoordinate(latitude: latitude, longitude: longitude),
  accuracyMeters: accuracy,
  capturedAt: time ?? DateTime.now().toUtc(),
);

void main() {
  test(
    'projection measures halfway, route bearing, and off-route distance',
    () {
      final middle = measureProgress(route, fix(127.031));
      expect(middle.fraction, closeTo(0.5, 0.001));
      expect(middle.remainingMeters, closeTo(90, 0.1));
      expect(middle.bearing, closeTo(90, 0.1));
      expect(middle.arrived, false);
      expect(
        measureProgress(route, fix(127.031, latitude: 37.541)).distanceToRoute,
        greaterThan(100),
      );
      expect(measureProgress(route, fix(127.032)).arrived, true);
      expect(measureProgress(route, fix(127.032, accuracy: 80)).arrived, false);
    },
  );

  test('duplicate vertices do not corrupt route progress', () {
    final line = NavigationRoute(
      path: [origin, origin, destination],
      distanceMeters: 180,
      duration: route.duration,
    );
    expect(
      measureProgress(line, fix(127.031)).remainingMeters,
      closeTo(90, 0.1),
    );
  });

  test(
    'solar model matches the server convention and has no night shadows',
    () {
      final sun = SolarPosition.at(
        const GeoCoordinate(latitude: 37.54, longitude: 127.031),
        DateTime.parse('2026-10-10T05:00:00Z'),
      );
      expect(sun.altitude, closeTo(40.281859, 0.01));
      expect(sun.azimuth, inInclusiveRange(0, 360));
      expect(
        SolarPosition.at(origin, DateTime.utc(2026, 10, 10, 15)).altitude,
        lessThan(0),
      );
    },
  );

  test('guidance ignores stale/weak fixes, detects deviation, and stops its stream', () async {
    final updates = StreamController<Result<LocationFix>>();
    var cancelled = false;
    updates.onCancel = () {
      cancelled = true;
    };
    final repository = FakeLocationRepository()
      ..location = Result.success(fix(127.03))
      ..updates = updates.stream;
    final container = ProviderContainer(
      overrides: [locationRepositoryProvider.overrideWithValue(repository)],
    );
    final sub = container.listen(navigationProvider, (_, _) {});
    final notifier = container.read(navigationProvider.notifier);
    notifier.start(route);
    await Future<void>.delayed(Duration.zero);
    expect(container.read(navigationProvider).status, GuidanceStatus.following);
    updates.add(
      Result.success(
        fix(127.031, time: DateTime.now().subtract(const Duration(minutes: 2))),
      ),
    );
    await Future<void>.delayed(Duration.zero);
    expect(container.read(navigationProvider).status, GuidanceStatus.weakGps);
    for (var i = 0; i < 2; i++) {
      updates.add(Result.success(fix(127.031, latitude: 37.541)));
      await Future<void>.delayed(Duration.zero);
    }
    expect(container.read(navigationProvider).status, GuidanceStatus.offRoute);
    updates.add(Result.success(fix(127.031)));
    await Future<void>.delayed(Duration.zero);
    expect(container.read(navigationProvider).status, GuidanceStatus.following);
    notifier.pause();
    await Future<void>.delayed(Duration.zero);
    expect(cancelled, true);
    expect(container.read(navigationProvider).status, GuidanceStatus.paused);
    notifier.stop();
    expect(container.read(navigationProvider).active, false);
    sub.close();
    container.dispose();
    await updates.close();
  });

  test('a far away user gets approach status instead of fictitious access guidance', () async {
    final repository = FakeLocationRepository()
      ..location = Result.success(fix(126.97, latitude: 37.56));
    final container = ProviderContainer(
      overrides: [locationRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(navigationProvider, (_, _) {});
    container.read(navigationProvider.notifier).start(route);
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(navigationProvider).status,
      GuidanceStatus.approaching,
    );
    container.dispose();
  });

  testWidgets('preview is labeled simulation and never asks for location', (
    tester,
  ) async {
    final repository = FakeLocationRepository();
    final container = ProviderContainer(
      overrides: [locationRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(navigationProvider, (_, _) {});
    container.read(navigationProvider.notifier).preview(route);
    await tester.pump(const Duration(seconds: 2));
    expect(container.read(navigationProvider).isPreview, true);
    expect(repository.calls, isEmpty);
    container.read(navigationProvider.notifier).stop();
    container.dispose();
  });

  test('permission failures do not start continuous GPS', () async {
    final repository = FakeLocationRepository()
      ..service = const Result.failure(
        Failure(type: FailureType.serviceDisabled),
      );
    final container = ProviderContainer(
      overrides: [locationRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(navigationProvider, (_, _) {});
    container.read(navigationProvider.notifier).start(route);
    await Future<void>.delayed(Duration.zero);
    expect(container.read(navigationProvider).status, GuidanceStatus.failed);
    expect(
      container.read(navigationProvider).failure!.type,
      FailureType.serviceDisabled,
    );
    container.dispose();
  });
}
