import '../../../core/geo/geo_coordinate.dart';
import '../domain/place.dart';
import 'place_search_dto.dart';

final class PlaceMapper {
  const PlaceMapper();
  List<Place> toPlaces(PlaceSearchResponseDto response) {
    final sources = <String>[];
    for (final item in response.attributions) {
      final uri = item.url == null ? null : Uri.tryParse(item.url!);
      if (item.text.trim().isEmpty ||
          (item.url != null &&
              (uri == null ||
                  !{'http', 'https'}.contains(uri.scheme) ||
                  uri.host.isEmpty ||
                  uri.userInfo.isNotEmpty))) {
        throw const FormatException('Invalid attribution');
      }
      sources.add(item.url == null ? item.text : '${item.text}\n${item.url}');
    }
    return List.unmodifiable(
      response.places.map((item) {
        if (item.id.trim().isEmpty ||
            item.name.trim().isEmpty ||
            !item.longitude.isFinite ||
            !item.latitude.isFinite ||
            item.longitude.abs() > 180 ||
            item.latitude.abs() > 90) {
          throw const FormatException('Invalid place');
        }
        return Place(
          id: item.id,
          name: item.name,
          address: item.address,
          coordinate: GeoCoordinate(
            latitude: item.latitude,
            longitude: item.longitude,
          ),
          attributions: List.unmodifiable(sources),
        );
      }),
    );
  }
}
