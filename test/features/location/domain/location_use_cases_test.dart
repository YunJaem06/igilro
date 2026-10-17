import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_access.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/domain/usecases/get_current_location_use_case.dart';
import 'package:igilro/features/location/domain/usecases/open_location_settings_use_case.dart';

import '../../../helpers/fake_location_repository.dart';

void main() {
  late FakeLocationRepository repository;
  late GetCurrentLocationUseCase locate;

  setUp(() {
    repository = FakeLocationRepository();
    locate = GetCurrentLocationUseCase(repository);
  });

  test(
    'service disabled does not request permissions or acquire a position',
    () async {
      repository.service = const Result.success(false);
      final result = await locate();
      expect(
        (result as Failed<LocationFix>).failure.type,
        FailureType.serviceDisabled,
      );
      expect(repository.calls, ['service']);
    },
  );

  test('existing permission is reused without a permission dialog', () async {
    expect((await locate() as Success<LocationFix>).value, sampleLocation);
    expect(repository.calls, ['service', 'check', 'position']);
  });

  test(
    'first access requests permission before acquiring the position',
    () async {
      repository.permission = const Result.success(LocationAccess.denied);
      expect(await locate(), isA<Success<LocationFix>>());
      expect(repository.calls, ['service', 'check', 'request', 'position']);
    },
  );

  for (final access in [LocationAccess.denied, LocationAccess.deniedForever]) {
    test(
      'permission request returning $access never acquires a position',
      () async {
        repository.permission = const Result.success(LocationAccess.denied);
        repository.requestedPermission = Result.success(access);
        final result = await locate() as Failed<LocationFix>;
        expect(
          result.failure.type,
          access == LocationAccess.denied
              ? FailureType.permissionDenied
              : FailureType.permissionDeniedForever,
        );
        expect(repository.calls, ['service', 'check', 'request']);
      },
    );
  }

  test('permanent denial does not request permission again', () async {
    repository.permission = const Result.success(LocationAccess.deniedForever);
    expect(
      (await locate() as Failed<LocationFix>).failure.type,
      FailureType.permissionDeniedForever,
    );
    expect(repository.calls, ['service', 'check']);
  });

  const failure = Failure(type: FailureType.unexpected, code: 'TEST');
  for (final step in ['service', 'check', 'request', 'position']) {
    test('preserves $step failures and stops subsequent work', () async {
      switch (step) {
        case 'service':
          repository.service = const Result.failure(failure);
        case 'check':
          repository.permission = const Result.failure(failure);
        case 'request':
          repository.permission = const Result.success(LocationAccess.denied);
          repository.requestedPermission = const Result.failure(failure);
        case 'position':
          repository.location = const Result.failure(failure);
      }
      expect((await locate() as Failed<LocationFix>).failure, failure);
      expect(repository.calls.last, step);
    });
  }

  test('settings recovery selects the appropriate system screen', () async {
    final recover = OpenLocationSettingsUseCase(repository);
    await recover(const Failure(type: FailureType.permissionDeniedForever));
    await recover(const Failure(type: FailureType.serviceDisabled));
    expect(repository.calls, [
      'settings:application',
      'settings:locationService',
    ]);
    expect(
      (await recover(
        const Failure(type: FailureType.timeout),
      ) as Success<bool>).value,
      false,
    );
    expect(repository.calls.length, 2);
  });
}
