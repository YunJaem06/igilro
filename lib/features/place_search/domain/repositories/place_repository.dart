import '../../../../core/error/result.dart';
import '../entities/place.dart';

abstract interface class PlaceRepository {
  Future<Result<List<Place>>> search(String query);

  void cancelSearch();
}
