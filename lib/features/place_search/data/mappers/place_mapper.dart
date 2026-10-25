import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/place.dart';
import '../dto/place_search_response_dto.dart';

final class PlaceMapper {
  const PlaceMapper();

  List<Place> toPlaces(PlaceSearchResponseDto dto) =>
      List.unmodifiable(dto.places.map(_toPlace));

  Place _toPlace(PlaceDto dto) {
    final longitude = dto.coordinate.longitude;
    final latitude = dto.coordinate.latitude;
    if (dto.id.trim().isEmpty ||
        dto.name.trim().isEmpty ||
        !longitude.isFinite ||
        !latitude.isFinite ||
        longitude < -180 ||
        longitude > 180 ||
        latitude < -90 ||
        latitude > 90) {
      throw const FormatException('Invalid place fields.');
    }
    return Place(
      id: dto.id,
      name: dto.name.trim(),
      address: dto.address.trim(),
      coordinate: GeoCoordinate(latitude: latitude, longitude: longitude),
    );
  }
}
