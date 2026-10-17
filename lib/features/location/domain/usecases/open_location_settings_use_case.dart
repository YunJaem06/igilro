import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/location_access.dart';
import '../repositories/location_repository.dart';

/// Only failures recoverable through system settings open a settings screen.
final class OpenLocationSettingsUseCase {
  const OpenLocationSettingsUseCase(this._repository);

  final LocationRepository _repository;

  Future<Result<bool>> call(Failure failure) => switch (failure.type) {
    FailureType.permissionDeniedForever => _repository.openSettings(
      LocationSettingsTarget.application,
    ),
    FailureType.serviceDisabled => _repository.openSettings(
      LocationSettingsTarget.locationService,
    ),
    _ => Future.value(const Result.success(false)),
  };
}
