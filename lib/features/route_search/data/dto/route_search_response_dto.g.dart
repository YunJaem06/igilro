// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteSearchResponseDto _$RouteSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RouteSearchResponseDto(
  routes: (json['routes'] as List<dynamic>)
      .map((e) => RouteCandidateDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  evaluatedAt: json['evaluatedAt'] as String,
  dataVersion: json['dataVersion'] as String,
  timeModelVersion: json['timeModelVersion'] as String,
  routingModelVersion: json['routingModelVersion'] as String,
  baselineDurationSeconds: _readWholeNumber(json['baselineDurationSeconds']),
  snapping: RouteSnappingDto.fromJson(json['snapping'] as Map<String, dynamic>),
  attribution: json['attribution'] as String,
);

Map<String, dynamic> _$RouteSearchResponseDtoToJson(
  _RouteSearchResponseDto instance,
) => <String, dynamic>{
  'routes': instance.routes.map((e) => e.toJson()).toList(),
  'evaluatedAt': instance.evaluatedAt,
  'dataVersion': instance.dataVersion,
  'timeModelVersion': instance.timeModelVersion,
  'routingModelVersion': instance.routingModelVersion,
  'baselineDurationSeconds': instance.baselineDurationSeconds,
  'snapping': instance.snapping.toJson(),
  'attribution': instance.attribution,
};

_RouteCandidateDto _$RouteCandidateDtoFromJson(
  Map<String, dynamic> json,
) => _RouteCandidateDto(
  id: json['id'] as String,
  mode: json['mode'] as String,
  geometry: RouteGeometryDto.fromJson(json['geometry'] as Map<String, dynamic>),
  distanceMeters: (json['distanceMeters'] as num).toDouble(),
  durationSeconds: _readWholeNumber(json['durationSeconds']),
  additionalDurationSeconds: _readWholeNumber(
    json['additionalDurationSeconds'],
  ),
  metrics: RouteMetricsDto.fromJson(json['metrics'] as Map<String, dynamic>),
  shadeEvaluation: json['shadeEvaluation'] == null
      ? null
      : RouteShadeEvaluationDto.fromJson(
          json['shadeEvaluation'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RouteCandidateDtoToJson(_RouteCandidateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
      'geometry': instance.geometry.toJson(),
      'distanceMeters': instance.distanceMeters,
      'durationSeconds': instance.durationSeconds,
      'additionalDurationSeconds': instance.additionalDurationSeconds,
      'metrics': instance.metrics.toJson(),
      'shadeEvaluation': instance.shadeEvaluation?.toJson(),
    };

_RouteShadeEvaluationDto _$RouteShadeEvaluationDtoFromJson(
  Map<String, dynamic> json,
) => _RouteShadeEvaluationDto(
  status: json['status'] as String,
  modelVersion: json['modelVersion'] as String,
  coverage: (json['coverage'] as num?)?.toDouble(),
  dataVersion: json['dataVersion'] as String?,
  attribution: json['attribution'] as String?,
  solarAltitudeDegrees: (json['solarAltitudeDegrees'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RouteShadeEvaluationDtoToJson(
  _RouteShadeEvaluationDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'modelVersion': instance.modelVersion,
  'coverage': instance.coverage,
  'dataVersion': instance.dataVersion,
  'attribution': instance.attribution,
  'solarAltitudeDegrees': instance.solarAltitudeDegrees,
};

_RouteGeometryDto _$RouteGeometryDtoFromJson(Map<String, dynamic> json) =>
    _RouteGeometryDto(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList(),
    );

Map<String, dynamic> _$RouteGeometryDtoToJson(_RouteGeometryDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_RouteMetricsDto _$RouteMetricsDtoFromJson(Map<String, dynamic> json) =>
    _RouteMetricsDto(
      shadeRatio: (json['shadeRatio'] as num?)?.toDouble(),
      quietScore: (json['quietScore'] as num?)?.toDouble(),
      lightingScore: (json['lightingScore'] as num?)?.toDouble(),
      trafficSignalCount: _readOptionalWholeNumber(json['trafficSignalCount']),
    );

Map<String, dynamic> _$RouteMetricsDtoToJson(_RouteMetricsDto instance) =>
    <String, dynamic>{
      'shadeRatio': instance.shadeRatio,
      'quietScore': instance.quietScore,
      'lightingScore': instance.lightingScore,
      'trafficSignalCount': instance.trafficSignalCount,
    };

_RouteSnappingDto _$RouteSnappingDtoFromJson(Map<String, dynamic> json) =>
    _RouteSnappingDto(
      origin: RouteSnapDto.fromJson(json['origin'] as Map<String, dynamic>),
      destination: RouteSnapDto.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RouteSnappingDtoToJson(_RouteSnappingDto instance) =>
    <String, dynamic>{
      'origin': instance.origin.toJson(),
      'destination': instance.destination.toJson(),
    };

_RouteSnapDto _$RouteSnapDtoFromJson(Map<String, dynamic> json) =>
    _RouteSnapDto(
      coordinate: RouteCoordinateDto.fromJson(
        json['coordinate'] as Map<String, dynamic>,
      ),
      distanceMeters: (json['distanceMeters'] as num).toDouble(),
    );

Map<String, dynamic> _$RouteSnapDtoToJson(_RouteSnapDto instance) =>
    <String, dynamic>{
      'coordinate': instance.coordinate.toJson(),
      'distanceMeters': instance.distanceMeters,
    };
