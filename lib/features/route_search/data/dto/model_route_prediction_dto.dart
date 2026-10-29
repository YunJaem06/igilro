import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_route_prediction_dto.freezed.dart';
part 'model_route_prediction_dto.g.dart';

@freezed
abstract class ModelRoutePredictionRequestDto
    with _$ModelRoutePredictionRequestDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ModelRoutePredictionRequestDto({
    required PredictionCoordinateDto origin,
    required PredictionCoordinateDto destination,
    @Default('walking') String travelMode,
    @Default('fastest') String mode,
    @JsonKey(includeIfNull: false) String? departureAt,
  }) = _ModelRoutePredictionRequestDto;

  factory ModelRoutePredictionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ModelRoutePredictionRequestDtoFromJson(json);
}

@freezed
abstract class ModelRoutePredictionResponseDto
    with _$ModelRoutePredictionResponseDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ModelRoutePredictionResponseDto({
    required List<PredictedRouteDto> routes,
    required String evaluatedAt,
    required String dataVersion,
    required String predictionDataVersion,
    required String modelVersion,
    required String routingModelVersion,
    required String timeModelVersion,
    @JsonKey(fromJson: _wholeNumber) required int baselineDurationSeconds,
    required PredictionSnappingDto snapping,
    required String quality,
    required String attribution,
    required List<String> limitations,
    @JsonKey(fromJson: _wholeNumber) required int buildingModelCount,
    @JsonKey(fromJson: _wholeNumber) required int terrainTileCount,
    @JsonKey(fromJson: _wholeNumber) required int omittedBuildingModelCount,
    required double sampleStepMeters,
    required double projectionMaxErrorMeters,
    required double sceneBufferMetersApprox,
  }) = _ModelRoutePredictionResponseDto;

  factory ModelRoutePredictionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ModelRoutePredictionResponseDtoFromJson(json);
}

@freezed
abstract class PredictedRouteDto with _$PredictedRouteDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictedRouteDto({
    required String id,
    required String mode,
    required PredictionGeometryDto geometry,
    required double distanceMeters,
    @JsonKey(fromJson: _wholeNumber) required int durationSeconds,
    @JsonKey(fromJson: _wholeNumber) required int additionalDurationSeconds,
    required ModeledShadePredictionDto prediction,
    @Default([]) List<PredictionShadeSegmentDto> shadeSegments,
  }) = _PredictedRouteDto;

  factory PredictedRouteDto.fromJson(Map<String, dynamic> json) =>
      _$PredictedRouteDtoFromJson(json);
}

@freezed
abstract class PredictionShadeSegmentDto with _$PredictionShadeSegmentDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictionShadeSegmentDto({
    required String state,
    required PredictionGeometryDto geometry,
    required double fromDistanceMeters,
    required double toDistanceMeters,
    required double distanceMeters,
  }) = _PredictionShadeSegmentDto;

  factory PredictionShadeSegmentDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionShadeSegmentDtoFromJson(json);
}

@freezed
abstract class ModeledShadePredictionDto with _$ModeledShadePredictionDto {
  const factory ModeledShadePredictionDto({
    required String status,
    required double modeledShadeRatio,
    required double baselineModeledShadeRatio,
    double? physicalShadeCoverage,
  }) = _ModeledShadePredictionDto;

  factory ModeledShadePredictionDto.fromJson(Map<String, dynamic> json) =>
      _$ModeledShadePredictionDtoFromJson(json);
}

@freezed
abstract class PredictionGeometryDto with _$PredictionGeometryDto {
  const factory PredictionGeometryDto({
    required String type,
    required List<List<double>> coordinates,
  }) = _PredictionGeometryDto;

  factory PredictionGeometryDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionGeometryDtoFromJson(json);
}

@freezed
abstract class PredictionCoordinateDto with _$PredictionCoordinateDto {
  const factory PredictionCoordinateDto({
    required double longitude,
    required double latitude,
  }) = _PredictionCoordinateDto;

  factory PredictionCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionCoordinateDtoFromJson(json);
}

@freezed
abstract class PredictionSnappingDto with _$PredictionSnappingDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictionSnappingDto({
    required PredictionSnapDto origin,
    required PredictionSnapDto destination,
  }) = _PredictionSnappingDto;

  factory PredictionSnappingDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionSnappingDtoFromJson(json);
}

@freezed
abstract class PredictionSnapDto with _$PredictionSnapDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictionSnapDto({
    required PredictionCoordinateDto coordinate,
    required double distanceMeters,
  }) = _PredictionSnapDto;

  factory PredictionSnapDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionSnapDtoFromJson(json);
}

int _wholeNumber(Object? value) {
  if (value is! num ||
      !value.isFinite ||
      value < 0 ||
      value > 0x7fffffffffffffff ||
      value % 1 != 0) {
    throw const FormatException('Expected a non-negative integer.');
  }
  return value.toInt();
}
