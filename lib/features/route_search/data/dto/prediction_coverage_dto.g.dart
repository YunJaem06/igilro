// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_coverage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PredictionCoverageDto _$PredictionCoverageDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionCoverageDto(
  areaId: json['areaId'] as String,
  name: json['name'] as String,
  bounds: (json['bounds'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  center: PredictionCoordinateDto.fromJson(
    json['center'] as Map<String, dynamic>,
  ),
  walkingNetwork: PredictionNetworkDto.fromJson(
    json['walkingNetwork'] as Map<String, dynamic>,
  ),
  accessPoints: (json['accessPoints'] as List<dynamic>)
      .map((e) => PredictionAccessPointDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  maximumSnappingDistanceMeters: (json['maximumSnappingDistanceMeters'] as num)
      .toDouble(),
  dataVersion: json['dataVersion'] as String,
  predictionDataVersion: json['predictionDataVersion'] as String,
  quality: json['quality'] as String,
  attribution: json['attribution'] as String,
  connectivity: PredictionConnectivityDto.fromJson(
    json['connectivity'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PredictionCoverageDtoToJson(
  _PredictionCoverageDto instance,
) => <String, dynamic>{
  'areaId': instance.areaId,
  'name': instance.name,
  'bounds': instance.bounds,
  'center': instance.center.toJson(),
  'walkingNetwork': instance.walkingNetwork.toJson(),
  'accessPoints': instance.accessPoints.map((e) => e.toJson()).toList(),
  'maximumSnappingDistanceMeters': instance.maximumSnappingDistanceMeters,
  'dataVersion': instance.dataVersion,
  'predictionDataVersion': instance.predictionDataVersion,
  'quality': instance.quality,
  'attribution': instance.attribution,
  'connectivity': instance.connectivity.toJson(),
};

_PredictionNetworkDto _$PredictionNetworkDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionNetworkDto(
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>)
            .map(
              (e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList(),
            )
            .toList(),
      )
      .toList(),
);

Map<String, dynamic> _$PredictionNetworkDtoToJson(
  _PredictionNetworkDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'coordinates': instance.coordinates,
};

_PredictionAccessPointDto _$PredictionAccessPointDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionAccessPointDto(
  id: json['id'] as String,
  name: json['name'] as String,
  coordinate: PredictionCoordinateDto.fromJson(
    json['coordinate'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PredictionAccessPointDtoToJson(
  _PredictionAccessPointDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coordinate': instance.coordinate.toJson(),
};

_PredictionConnectivityDto _$PredictionConnectivityDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionConnectivityDto(
  nodeCount: _count(json['nodeCount']),
  edgeCount: _count(json['edgeCount']),
  weakComponentCount: _count(json['weakComponentCount']),
  largestComponentNodeCount: _count(json['largestComponentNodeCount']),
  componentPolicy: json['componentPolicy'] as String,
  sourceWeakComponentCount: _count(json['sourceWeakComponentCount']),
  excludedDisconnectedNodeCount: _count(json['excludedDisconnectedNodeCount']),
);

Map<String, dynamic> _$PredictionConnectivityDtoToJson(
  _PredictionConnectivityDto instance,
) => <String, dynamic>{
  'nodeCount': instance.nodeCount,
  'edgeCount': instance.edgeCount,
  'weakComponentCount': instance.weakComponentCount,
  'largestComponentNodeCount': instance.largestComponentNodeCount,
  'componentPolicy': instance.componentPolicy,
  'sourceWeakComponentCount': instance.sourceWeakComponentCount,
  'excludedDisconnectedNodeCount': instance.excludedDisconnectedNodeCount,
};
