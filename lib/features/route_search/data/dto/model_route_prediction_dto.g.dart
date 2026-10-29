// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_route_prediction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModelRoutePredictionRequestDto _$ModelRoutePredictionRequestDtoFromJson(
  Map<String, dynamic> json,
) => _ModelRoutePredictionRequestDto(
  origin: PredictionCoordinateDto.fromJson(
    json['origin'] as Map<String, dynamic>,
  ),
  destination: PredictionCoordinateDto.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  travelMode: json['travelMode'] as String? ?? 'walking',
  mode: json['mode'] as String? ?? 'fastest',
  departureAt: json['departureAt'] as String?,
);

Map<String, dynamic> _$ModelRoutePredictionRequestDtoToJson(
  _ModelRoutePredictionRequestDto instance,
) => <String, dynamic>{
  'origin': instance.origin.toJson(),
  'destination': instance.destination.toJson(),
  'travelMode': instance.travelMode,
  'mode': instance.mode,
  'departureAt': ?instance.departureAt,
};

_ModelRoutePredictionResponseDto _$ModelRoutePredictionResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ModelRoutePredictionResponseDto(
  routes: (json['routes'] as List<dynamic>)
      .map((e) => PredictedRouteDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  evaluatedAt: json['evaluatedAt'] as String,
  dataVersion: json['dataVersion'] as String,
  predictionDataVersion: json['predictionDataVersion'] as String,
  modelVersion: json['modelVersion'] as String,
  routingModelVersion: json['routingModelVersion'] as String,
  timeModelVersion: json['timeModelVersion'] as String,
  baselineDurationSeconds: _wholeNumber(json['baselineDurationSeconds']),
  snapping: PredictionSnappingDto.fromJson(
    json['snapping'] as Map<String, dynamic>,
  ),
  quality: json['quality'] as String,
  attribution: json['attribution'] as String,
  limitations: (json['limitations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  buildingModelCount: _wholeNumber(json['buildingModelCount']),
  terrainTileCount: _wholeNumber(json['terrainTileCount']),
  omittedBuildingModelCount: _wholeNumber(json['omittedBuildingModelCount']),
  sampleStepMeters: (json['sampleStepMeters'] as num).toDouble(),
  projectionMaxErrorMeters: (json['projectionMaxErrorMeters'] as num)
      .toDouble(),
  sceneBufferMetersApprox: (json['sceneBufferMetersApprox'] as num).toDouble(),
);

Map<String, dynamic> _$ModelRoutePredictionResponseDtoToJson(
  _ModelRoutePredictionResponseDto instance,
) => <String, dynamic>{
  'routes': instance.routes.map((e) => e.toJson()).toList(),
  'evaluatedAt': instance.evaluatedAt,
  'dataVersion': instance.dataVersion,
  'predictionDataVersion': instance.predictionDataVersion,
  'modelVersion': instance.modelVersion,
  'routingModelVersion': instance.routingModelVersion,
  'timeModelVersion': instance.timeModelVersion,
  'baselineDurationSeconds': instance.baselineDurationSeconds,
  'snapping': instance.snapping.toJson(),
  'quality': instance.quality,
  'attribution': instance.attribution,
  'limitations': instance.limitations,
  'buildingModelCount': instance.buildingModelCount,
  'terrainTileCount': instance.terrainTileCount,
  'omittedBuildingModelCount': instance.omittedBuildingModelCount,
  'sampleStepMeters': instance.sampleStepMeters,
  'projectionMaxErrorMeters': instance.projectionMaxErrorMeters,
  'sceneBufferMetersApprox': instance.sceneBufferMetersApprox,
};

_PredictedRouteDto _$PredictedRouteDtoFromJson(
  Map<String, dynamic> json,
) => _PredictedRouteDto(
  id: json['id'] as String,
  mode: json['mode'] as String,
  geometry: PredictionGeometryDto.fromJson(
    json['geometry'] as Map<String, dynamic>,
  ),
  distanceMeters: (json['distanceMeters'] as num).toDouble(),
  durationSeconds: _wholeNumber(json['durationSeconds']),
  additionalDurationSeconds: _wholeNumber(json['additionalDurationSeconds']),
  prediction: ModeledShadePredictionDto.fromJson(
    json['prediction'] as Map<String, dynamic>,
  ),
  shadeSegments:
      (json['shadeSegments'] as List<dynamic>?)
          ?.map(
            (e) =>
                PredictionShadeSegmentDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PredictedRouteDtoToJson(_PredictedRouteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
      'geometry': instance.geometry.toJson(),
      'distanceMeters': instance.distanceMeters,
      'durationSeconds': instance.durationSeconds,
      'additionalDurationSeconds': instance.additionalDurationSeconds,
      'prediction': instance.prediction.toJson(),
      'shadeSegments': instance.shadeSegments.map((e) => e.toJson()).toList(),
    };

_PredictionShadeSegmentDto _$PredictionShadeSegmentDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionShadeSegmentDto(
  state: json['state'] as String,
  geometry: PredictionGeometryDto.fromJson(
    json['geometry'] as Map<String, dynamic>,
  ),
  fromDistanceMeters: (json['fromDistanceMeters'] as num).toDouble(),
  toDistanceMeters: (json['toDistanceMeters'] as num).toDouble(),
  distanceMeters: (json['distanceMeters'] as num).toDouble(),
);

Map<String, dynamic> _$PredictionShadeSegmentDtoToJson(
  _PredictionShadeSegmentDto instance,
) => <String, dynamic>{
  'state': instance.state,
  'geometry': instance.geometry.toJson(),
  'fromDistanceMeters': instance.fromDistanceMeters,
  'toDistanceMeters': instance.toDistanceMeters,
  'distanceMeters': instance.distanceMeters,
};

_ModeledShadePredictionDto _$ModeledShadePredictionDtoFromJson(
  Map<String, dynamic> json,
) => _ModeledShadePredictionDto(
  status: json['status'] as String,
  modeledShadeRatio: (json['modeledShadeRatio'] as num).toDouble(),
  baselineModeledShadeRatio: (json['baselineModeledShadeRatio'] as num)
      .toDouble(),
  physicalShadeCoverage: (json['physicalShadeCoverage'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ModeledShadePredictionDtoToJson(
  _ModeledShadePredictionDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'modeledShadeRatio': instance.modeledShadeRatio,
  'baselineModeledShadeRatio': instance.baselineModeledShadeRatio,
  'physicalShadeCoverage': instance.physicalShadeCoverage,
};

_PredictionGeometryDto _$PredictionGeometryDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionGeometryDto(
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      )
      .toList(),
);

Map<String, dynamic> _$PredictionGeometryDtoToJson(
  _PredictionGeometryDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'coordinates': instance.coordinates,
};

_PredictionCoordinateDto _$PredictionCoordinateDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionCoordinateDto(
  longitude: (json['longitude'] as num).toDouble(),
  latitude: (json['latitude'] as num).toDouble(),
);

Map<String, dynamic> _$PredictionCoordinateDtoToJson(
  _PredictionCoordinateDto instance,
) => <String, dynamic>{
  'longitude': instance.longitude,
  'latitude': instance.latitude,
};

_PredictionSnappingDto _$PredictionSnappingDtoFromJson(
  Map<String, dynamic> json,
) => _PredictionSnappingDto(
  origin: PredictionSnapDto.fromJson(json['origin'] as Map<String, dynamic>),
  destination: PredictionSnapDto.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PredictionSnappingDtoToJson(
  _PredictionSnappingDto instance,
) => <String, dynamic>{
  'origin': instance.origin.toJson(),
  'destination': instance.destination.toJson(),
};

_PredictionSnapDto _$PredictionSnapDtoFromJson(Map<String, dynamic> json) =>
    _PredictionSnapDto(
      coordinate: PredictionCoordinateDto.fromJson(
        json['coordinate'] as Map<String, dynamic>,
      ),
      distanceMeters: (json['distanceMeters'] as num).toDouble(),
    );

Map<String, dynamic> _$PredictionSnapDtoToJson(_PredictionSnapDto instance) =>
    <String, dynamic>{
      'coordinate': instance.coordinate.toJson(),
      'distanceMeters': instance.distanceMeters,
    };
