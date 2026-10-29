import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/place_search/domain/place.dart';

class FakePlaceRepository implements PlaceRepository {
  final queries = <String>[];
  Result<List<Place>> response = const Result.success([]);
  Future<Result<List<Place>>>? pending;
  int cancellations = 0;
  @override
  Future<Result<List<Place>>> search(String query) {
    queries.add(query);
    return pending ?? Future.value(response);
  }

  @override
  void cancel() {
    cancellations++;
  }
}
