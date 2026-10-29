import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/place.dart';
import '../repositories/place_repository.dart';

final class SearchPlacesUseCase {
  const SearchPlacesUseCase(this._repository);

  final PlaceRepository _repository;

  Future<Result<List<Place>>> call(String query) async {
    final normalized = query.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (normalized.isEmpty) {
      return const Result.failure(
        Failure(type: FailureType.validation, code: 'PLACE_QUERY_REQUIRED'),
      );
    }
    if (normalized.runes.length > 100 ||
        normalized.contains(RegExp(r'[\x00-\x1f\x7f]'))) {
      return const Result.failure(
        Failure(type: FailureType.validation, code: 'PLACE_QUERY_INVALID'),
      );
    }
    return _repository.search(normalized);
  }

  void cancel() => _repository.cancelSearch();
}
