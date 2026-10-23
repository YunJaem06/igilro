// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_search_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteSearchRequestDto _$RouteSearchRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RouteSearchRequestDto(
  origin: RouteCoordinateDto.fromJson(json['origin'] as Map<String, dynamic>),
  destination: RouteCoordinateDto.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  departureAt: json['departureAt'] as String,
  travelMode: json['travelMode'] as String? ?? 'walking',
  mode: json['mode'] as String? ?? 'fastest',
);

Map<String, dynamic> _$RouteSearchRequestDtoToJson(
  _RouteSearchRequestDto instance,
) => <String, dynamic>{
  'origin': instance.origin.toJson(),
  'destination': instance.destination.toJson(),
  'departureAt': instance.departureAt,
  'travelMode': instance.travelMode,
  'mode': instance.mode,
};

_RouteCoordinateDto _$RouteCoordinateDtoFromJson(Map<String, dynamic> json) =>
    _RouteCoordinateDto(
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$RouteCoordinateDtoToJson(_RouteCoordinateDto instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
