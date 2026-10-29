import 'package:freezed_annotation/freezed_annotation.dart';

import 'model_route_prediction_dto.dart';

part 'prediction_coverage_dto.freezed.dart';
part 'prediction_coverage_dto.g.dart';

@freezed
abstract class PredictionCoverageDto with _$PredictionCoverageDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictionCoverageDto({
    required String areaId,
    required String name,
    required List<double> bounds,
    required PredictionCoordinateDto center,
    required PredictionNetworkDto walkingNetwork,
    required List<PredictionAccessPointDto> accessPoints,
    required double maximumSnappingDistanceMeters,
    required String dataVersion,
    required String predictionDataVersion,
    required String quality,
    required String attribution,
    required PredictionConnectivityDto connectivity,
  }) = _PredictionCoverageDto;

  factory PredictionCoverageDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionCoverageDtoFromJson(json);
}

@freezed
abstract class PredictionNetworkDto with _$PredictionNetworkDto {
  const factory PredictionNetworkDto({
    required String type,
    required List<List<List<double>>> coordinates,
  }) = _PredictionNetworkDto;

  factory PredictionNetworkDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionNetworkDtoFromJson(json);
}

@freezed
abstract class PredictionAccessPointDto with _$PredictionAccessPointDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory PredictionAccessPointDto({
    required String id,
    required String name,
    required PredictionCoordinateDto coordinate,
  }) = _PredictionAccessPointDto;

  factory PredictionAccessPointDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionAccessPointDtoFromJson(json);
}

@freezed
abstract class PredictionConnectivityDto with _$PredictionConnectivityDto {
  const factory PredictionConnectivityDto({
    @JsonKey(fromJson: _count) required int nodeCount,
    @JsonKey(fromJson: _count) required int edgeCount,
    @JsonKey(fromJson: _count) required int weakComponentCount,
    @JsonKey(fromJson: _count) required int largestComponentNodeCount,
    required String componentPolicy,
    @JsonKey(fromJson: _count) required int sourceWeakComponentCount,
    @JsonKey(fromJson: _count) required int excludedDisconnectedNodeCount,
  }) = _PredictionConnectivityDto;

  factory PredictionConnectivityDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionConnectivityDtoFromJson(json);
}

int _count(Object? value) {
  if (value is! num || !value.isFinite || value < 0 || value % 1 != 0) {
    throw const FormatException('Expected a non-negative count.');
  }
  return value.toInt();
}
