import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_search_response_dto.freezed.dart';
part 'place_search_response_dto.g.dart';

@freezed
abstract class PlaceSearchResponseDto with _$PlaceSearchResponseDto {
  const factory PlaceSearchResponseDto({
    required List<PlaceDto> places,
    @Default([]) List<PlaceAttributionDto> attributions,
  }) = _PlaceSearchResponseDto;

  factory PlaceSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceSearchResponseDtoFromJson(json);
}

@freezed
abstract class PlaceAttributionDto with _$PlaceAttributionDto {
  const factory PlaceAttributionDto({required String text, String? url}) =
      _PlaceAttributionDto;
  factory PlaceAttributionDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceAttributionDtoFromJson(json);
}

@freezed
abstract class PlaceDto with _$PlaceDto {
  const factory PlaceDto({
    required String id,
    required String name,
    required String address,
    required PlaceCoordinateDto coordinate,
  }) = _PlaceDto;

  factory PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDtoFromJson(json);
}

@freezed
abstract class PlaceCoordinateDto with _$PlaceCoordinateDto {
  const factory PlaceCoordinateDto({
    required double longitude,
    required double latitude,
  }) = _PlaceCoordinateDto;

  factory PlaceCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceCoordinateDtoFromJson(json);
}
