import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_notifier.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';

import '../../../helpers/fake_location_repository.dart';

void main() {
  late FakeLocationRepository repository;
  late ProviderContainer container;
  setUp(() {
    repository = FakeLocationRepository();
    container = ProviderContainer(
      overrides: [locationRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(locationProvider, (_, _) {});
    addTearDown(container.dispose);
  });

  test('initial state does not request access until the user acts', () {
    expect(
      container.read(locationProvider),
      const AsyncData<LocationFix?>(null),
    );
    expect(repository.calls, isEmpty);
  });

  test(
    'rapid taps share one acquisition and transition loading to success',
    () async {
      final completion = Completer<Result<LocationFix>>();
      repository.pendingLocation = completion.future;
      final notifier = container.read(locationProvider.notifier);
      final request = notifier.locate();
      expect(container.read(locationProvider).isLoading, true);
      await notifier.locate();
      await Future<void>.delayed(Duration.zero);
      expect(repository.calls.where((call) => call == 'position').length, 1);
      completion.complete(Result.success(sampleLocation));
      await request;
      expect(container.read(locationProvider).value, sampleLocation);
    },
  );

  test('failure can be retried and replaced by a fresh location', () async {
    repository.location = const Result.failure(
      Failure(type: FailureType.timeout),
    );
    final notifier = container.read(locationProvider.notifier);
    await notifier.locate();
    expect(
      container.read(locationProvider).error,
      const Failure(type: FailureType.timeout),
    );
    repository.location = Result.success(sampleLocation);
    await notifier.locate();
    expect(container.read(locationProvider).value, sampleLocation);
  });

  test('disposing during acquisition ignores the late response', () async {
    final completion = Completer<Result<LocationFix>>();
    repository.pendingLocation = completion.future;
    final pending = container.read(locationProvider.notifier).locate();
    await Future<void>.delayed(Duration.zero);
    container.invalidate(locationProvider);
    completion.complete(Result.success(sampleLocation));
    await pending;
    expect(container.read(locationProvider).value, isNull);
  });
}
