import '../../../core/geo/geo_coordinate.dart';
import '../../../core/error/result.dart';

final class Place {
  const Place({
    required this.id,
    required this.name,
    required this.address,
    required this.coordinate,
    required this.attributions,
  });
  final String id;
  final String name;
  final String address;
  final GeoCoordinate coordinate;
  final List<String> attributions;
}

abstract interface class PlaceRepository {
  Future<Result<List<Place>>> search(String query);
  void cancel();
}
