// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_guidance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RouteGuidanceDto _$RouteGuidanceDtoFromJson(Map<String, dynamic> json) =>
    _RouteGuidanceDto(
      status: json['status'] as String,
      metadataStatus: json['metadataStatus'] as String,
      modelVersion: json['modelVersion'] as String,
      language: json['language'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RouteGuidanceStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteGuidanceDtoToJson(_RouteGuidanceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'metadataStatus': instance.metadataStatus,
      'modelVersion': instance.modelVersion,
      'language': instance.language,
      'steps': instance.steps.map((e) => e.toJson()).toList(),
    };

_RouteGuidanceStepDto _$RouteGuidanceStepDtoFromJson(
  Map<String, dynamic> json,
) => _RouteGuidanceStepDto(
  index: _wholeNumber(json['index']),
  type: json['type'] as String,
  coordinate: RouteCoordinateDto.fromJson(
    json['coordinate'] as Map<String, dynamic>,
  ),
  geometryIndex: _wholeNumber(json['geometryIndex']),
  distanceFromStartMeters: (json['distanceFromStartMeters'] as num).toDouble(),
  distanceToNextStepMeters: (json['distanceToNextStepMeters'] as num)
      .toDouble(),
  durationToNextStepSeconds: (json['durationToNextStepSeconds'] as num)
      .toDouble(),
  instruction: json['instruction'] as String,
  streetName: json['streetName'] as String?,
  bearingBeforeDegrees: (json['bearingBeforeDegrees'] as num?)?.toDouble(),
  bearingAfterDegrees: (json['bearingAfterDegrees'] as num?)?.toDouble(),
  crossing: json['crossing'] == null
      ? null
      : GuidanceCrossingDto.fromJson(json['crossing'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RouteGuidanceStepDtoToJson(
  _RouteGuidanceStepDto instance,
) => <String, dynamic>{
  'index': instance.index,
  'type': instance.type,
  'coordinate': instance.coordinate.toJson(),
  'geometryIndex': instance.geometryIndex,
  'distanceFromStartMeters': instance.distanceFromStartMeters,
  'distanceToNextStepMeters': instance.distanceToNextStepMeters,
  'durationToNextStepSeconds': instance.durationToNextStepSeconds,
  'instruction': instance.instruction,
  'streetName': instance.streetName,
  'bearingBeforeDegrees': instance.bearingBeforeDegrees,
  'bearingAfterDegrees': instance.bearingAfterDegrees,
  'crossing': instance.crossing?.toJson(),
};

_GuidanceCrossingDto _$GuidanceCrossingDtoFromJson(Map<String, dynamic> json) =>
    _GuidanceCrossingDto(trafficSignals: json['trafficSignals'] as bool?);

Map<String, dynamic> _$GuidanceCrossingDtoToJson(
  _GuidanceCrossingDto instance,
) => <String, dynamic>{'trafficSignals': instance.trafficSignals};
