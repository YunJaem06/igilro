import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import 'place.dart';

final class SearchPlacesUseCase {
  const SearchPlacesUseCase(this._repository);
  final PlaceRepository _repository;
  Future<Result<List<Place>>> call(String input) {
    final query = input.trim();
    if (query.isEmpty ||
        query.runes.length > 100 ||
        RegExp(r'[\x00-\x1F\x7F]').hasMatch(query)) {
      return Future.value(
        const Result.failure(Failure(type: FailureType.validation)),
      );
    }
    return _repository.search(query);
  }
}
