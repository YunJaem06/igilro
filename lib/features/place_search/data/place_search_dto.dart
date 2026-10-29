final class PlaceDto {
  const PlaceDto(
    this.id,
    this.name,
    this.address,
    this.longitude,
    this.latitude,
  );
  final String id, name, address;
  final double longitude, latitude;
  factory PlaceDto.fromJson(Map<String, dynamic> json) {
    final coordinate = json['coordinate'] as Map<String, dynamic>;
    return PlaceDto(
      json['id'] as String,
      json['name'] as String,
      json['address'] as String,
      (coordinate['longitude'] as num).toDouble(),
      (coordinate['latitude'] as num).toDouble(),
    );
  }
}

final class PlaceAttributionDto {
  const PlaceAttributionDto(this.text, this.url);
  final String text;
  final String? url;
  factory PlaceAttributionDto.fromJson(Map<String, dynamic> json) =>
      PlaceAttributionDto(json['text'] as String, json['url'] as String?);
}

final class PlaceSearchResponseDto {
  const PlaceSearchResponseDto(this.places, this.attributions);
  final List<PlaceDto> places;
  final List<PlaceAttributionDto> attributions;
  factory PlaceSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      PlaceSearchResponseDto(
        (json['places'] as List)
            .map((e) => PlaceDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        (json['attributions'] as List? ?? const [])
            .map((e) => PlaceAttributionDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
