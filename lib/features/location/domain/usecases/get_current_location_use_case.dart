import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/location_access.dart';
import '../entities/location_fix.dart';
import '../repositories/location_repository.dart';

/// Location access is requested only after an explicit user action.
final class GetCurrentLocationUseCase {
  const GetCurrentLocationUseCase(this._repository);

  final LocationRepository _repository;

  Future<Result<LocationFix>> call() async {
    final service = await _repository.isServiceEnabled();
    if (service case Failed<bool>(:final failure)) {
      return Result.failure(failure);
    }
    if (!(service as Success<bool>).value) {
      return const Result.failure(Failure(type: FailureType.serviceDisabled));
    }

    var access = await _repository.checkPermission();
    if (access case Success<LocationAccess>(value: LocationAccess.denied)) {
      access = await _repository.requestPermission();
    }
    return switch (access) {
      Failed<LocationAccess>(:final failure) => Result.failure(failure),
      Success<LocationAccess>(value: LocationAccess.denied) =>
        const Result.failure(Failure(type: FailureType.permissionDenied)),
      Success<LocationAccess>(value: LocationAccess.deniedForever) =>
        const Result.failure(
          Failure(type: FailureType.permissionDeniedForever),
        ),
      Success<LocationAccess>(value: LocationAccess.granted) =>
        _repository.getCurrentLocation(),
    };
  }
}
