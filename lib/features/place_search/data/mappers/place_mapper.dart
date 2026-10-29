import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/place.dart';
import '../dto/place_search_response_dto.dart';

final class PlaceMapper {
  const PlaceMapper();

  List<Place> toPlaces(PlaceSearchResponseDto dto) {
    final sources = <String>[];
    for (final item in dto.attributions) {
      final uri = item.url == null ? null : Uri.tryParse(item.url!);
      if (item.text.trim().isEmpty ||
          (item.url != null &&
              (uri == null ||
                  !{'http', 'https'}.contains(uri.scheme) ||
                  uri.host.isEmpty ||
                  uri.userInfo.isNotEmpty))) {
        throw const FormatException('Invalid attribution.');
      }
      sources.add(item.url == null ? item.text : '${item.text}\n${item.url}');
    }
    return List.unmodifiable(
      dto.places.map((item) {
        final longitude = item.coordinate.longitude;
        final latitude = item.coordinate.latitude;
        if (item.id.trim().isEmpty ||
            item.name.trim().isEmpty ||
            !longitude.isFinite ||
            !latitude.isFinite ||
            longitude.abs() > 180 ||
            latitude.abs() > 90) {
          throw const FormatException('Invalid place fields.');
        }
        return Place(
          id: item.id,
          name: item.name.trim(),
          address: item.address.trim(),
          coordinate: GeoCoordinate(latitude: latitude, longitude: longitude),
          attributions: sources,
        );
      }),
    );
  }
}
