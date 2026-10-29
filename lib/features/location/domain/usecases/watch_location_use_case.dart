import '../../../../core/error/result.dart';
import '../entities/location_fix.dart';
import '../repositories/location_repository.dart';
import 'get_current_location_use_case.dart';

/// Foreground guidance explicitly requests access before subscribing.
final class WatchLocationUseCase {
  const WatchLocationUseCase(this._repository);
  final LocationRepository _repository;

  Stream<Result<LocationFix>> call() async* {
    final initial = await GetCurrentLocationUseCase(_repository)();
    yield initial;
    if (initial is Failed<LocationFix>) return;
    yield* _repository.watchLocation();
  }
}
