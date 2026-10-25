import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/place_search/domain/entities/place.dart';
import 'package:igilro/features/place_search/domain/repositories/place_repository.dart';

const forestPlace = Place(
  id: 'test:forest',
  name: '서울숲',
  address: '서울특별시 성동구 뚝섬로 273',
  coordinate: GeoCoordinate(latitude: 37.5445, longitude: 127.0374),
);
const stationPlace = Place(
  id: 'test:station',
  name: '성수역',
  address: '서울특별시 성동구 아차산로 100',
  coordinate: GeoCoordinate(latitude: 37.5447, longitude: 127.0557),
);

class FakePlaceRepository implements PlaceRepository {
  final queries = <String>[];
  int cancellations = 0;
  Result<List<Place>> response = const Result.success([
    forestPlace,
    stationPlace,
  ]);
  Future<Result<List<Place>>> Function(String query)? handle;

  @override
  Future<Result<List<Place>>> search(String query) {
    queries.add(query);
    return handle?.call(query) ?? Future.value(response);
  }

  @override
  void cancelSearch() => cancellations++;
}
