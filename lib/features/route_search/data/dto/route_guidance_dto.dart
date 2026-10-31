import 'package:freezed_annotation/freezed_annotation.dart';

import 'route_search_request_dto.dart';

part 'route_guidance_dto.freezed.dart';
part 'route_guidance_dto.g.dart';

@freezed
abstract class RouteGuidanceDto with _$RouteGuidanceDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteGuidanceDto({
    required String status,
    required String metadataStatus,
    required String modelVersion,
    required String language,
    required List<RouteGuidanceStepDto> steps,
  }) = _RouteGuidanceDto;

  factory RouteGuidanceDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGuidanceDtoFromJson(json);
}

@freezed
abstract class RouteGuidanceStepDto with _$RouteGuidanceStepDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteGuidanceStepDto({
    @JsonKey(fromJson: _wholeNumber) required int index,
    required String type,
    required RouteCoordinateDto coordinate,
    @JsonKey(fromJson: _wholeNumber) required int geometryIndex,
    required double distanceFromStartMeters,
    required double distanceToNextStepMeters,
    required double durationToNextStepSeconds,
    required String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    GuidanceCrossingDto? crossing,
  }) = _RouteGuidanceStepDto;

  factory RouteGuidanceStepDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGuidanceStepDtoFromJson(json);
}

@freezed
abstract class GuidanceCrossingDto with _$GuidanceCrossingDto {
  const factory GuidanceCrossingDto({bool? trafficSignals}) =
      _GuidanceCrossingDto;

  factory GuidanceCrossingDto.fromJson(Map<String, dynamic> json) =>
      _$GuidanceCrossingDtoFromJson(json);
}

int _wholeNumber(Object? value) {
  if (value is! num ||
      !value.isFinite ||
      value < 0 ||
      value > 0x7fffffffffffffff ||
      value % 1 != 0) {
    throw const FormatException('Expected a non-negative guidance index.');
  }
  return value.toInt();
}
