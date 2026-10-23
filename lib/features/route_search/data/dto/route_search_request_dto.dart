import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_search_request_dto.freezed.dart';
part 'route_search_request_dto.g.dart';

@freezed
abstract class RouteSearchRequestDto with _$RouteSearchRequestDto {
  // Freezed forwards this annotation to the generated implementation class.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteSearchRequestDto({
    required RouteCoordinateDto origin,
    required RouteCoordinateDto destination,
    required String departureAt,
    @Default('walking') String travelMode,
    @Default('fastest') String mode,
  }) = _RouteSearchRequestDto;

  factory RouteSearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSearchRequestDtoFromJson(json);
}

@freezed
abstract class RouteCoordinateDto with _$RouteCoordinateDto {
  const factory RouteCoordinateDto({
    required double longitude,
    required double latitude,
  }) = _RouteCoordinateDto;

  factory RouteCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$RouteCoordinateDtoFromJson(json);
}
