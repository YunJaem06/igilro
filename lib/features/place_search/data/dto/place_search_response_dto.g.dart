// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceSearchResponseDto _$PlaceSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => _PlaceSearchResponseDto(
  places: (json['places'] as List<dynamic>)
      .map((e) => PlaceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlaceSearchResponseDtoToJson(
  _PlaceSearchResponseDto instance,
) => <String, dynamic>{'places': instance.places};

_PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) => _PlaceDto(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  coordinate: PlaceCoordinateDto.fromJson(
    json['coordinate'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PlaceDtoToJson(_PlaceDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'coordinate': instance.coordinate,
};

_PlaceCoordinateDto _$PlaceCoordinateDtoFromJson(Map<String, dynamic> json) =>
    _PlaceCoordinateDto(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PlaceCoordinateDtoToJson(_PlaceCoordinateDto instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
