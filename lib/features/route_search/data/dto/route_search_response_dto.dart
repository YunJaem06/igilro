import 'package:freezed_annotation/freezed_annotation.dart';

import 'route_search_request_dto.dart';

part 'route_search_response_dto.freezed.dart';
part 'route_search_response_dto.g.dart';

/// New response fields are accepted; outgoing requests remain explicit.
@freezed
abstract class RouteSearchResponseDto with _$RouteSearchResponseDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteSearchResponseDto({
    required List<RouteCandidateDto> routes,
    required String evaluatedAt,
    required String dataVersion,
    required String timeModelVersion,
    required String routingModelVersion,
    @JsonKey(fromJson: _readWholeNumber) required int baselineDurationSeconds,
    required RouteSnappingDto snapping,
    required String attribution,
  }) = _RouteSearchResponseDto;

  factory RouteSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSearchResponseDtoFromJson(json);
}

@freezed
abstract class RouteCandidateDto with _$RouteCandidateDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteCandidateDto({
    required String id,
    required String mode,
    required RouteGeometryDto geometry,
    required double distanceMeters,
    @JsonKey(fromJson: _readWholeNumber) required int durationSeconds,
    @JsonKey(fromJson: _readWholeNumber) required int additionalDurationSeconds,
    required RouteMetricsDto metrics,
    RouteShadeEvaluationDto? shadeEvaluation,
  }) = _RouteCandidateDto;

  factory RouteCandidateDto.fromJson(Map<String, dynamic> json) =>
      _$RouteCandidateDtoFromJson(json);
}

@freezed
abstract class RouteShadeEvaluationDto with _$RouteShadeEvaluationDto {
  const factory RouteShadeEvaluationDto({
    required String status,
    required String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  }) = _RouteShadeEvaluationDto;

  factory RouteShadeEvaluationDto.fromJson(Map<String, dynamic> json) =>
      _$RouteShadeEvaluationDtoFromJson(json);
}

@freezed
abstract class RouteGeometryDto with _$RouteGeometryDto {
  const factory RouteGeometryDto({
    required String type,
    required List<List<double>> coordinates,
  }) = _RouteGeometryDto;

  factory RouteGeometryDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGeometryDtoFromJson(json);
}

@freezed
abstract class RouteMetricsDto with _$RouteMetricsDto {
  const factory RouteMetricsDto({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
  }) = _RouteMetricsDto;

  factory RouteMetricsDto.fromJson(Map<String, dynamic> json) =>
      _$RouteMetricsDtoFromJson(json);
}

@freezed
abstract class RouteSnappingDto with _$RouteSnappingDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteSnappingDto({
    required RouteSnapDto origin,
    required RouteSnapDto destination,
  }) = _RouteSnappingDto;

  factory RouteSnappingDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSnappingDtoFromJson(json);
}

@freezed
abstract class RouteSnapDto with _$RouteSnapDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RouteSnapDto({
    required RouteCoordinateDto coordinate,
    required double distanceMeters,
  }) = _RouteSnapDto;

  factory RouteSnapDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSnapDtoFromJson(json);
}

int _readWholeNumber(Object? value) {
  if (value is! num ||
      !value.isFinite ||
      value < 0 ||
      value > 0x7fffffffffffffff ||
      value % 1 != 0) {
    throw const FormatException('Expected a non-negative whole number.');
  }
  return value.toInt();
}

int? _readOptionalWholeNumber(Object? value) =>
    value == null ? null : _readWholeNumber(value);
