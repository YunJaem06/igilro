import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/route_search/data/dto/model_route_prediction_dto.dart';
import 'package:igilro/features/route_search/data/dto/route_search_response_dto.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/data/mappers/route_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';

import '../../../helpers/route_response_fixture.dart';

Map<String, dynamic> captured(String name) => jsonDecode(
  File('test/fixtures/walking_guidance_$name.json').readAsStringSync(),
) as Map<String, dynamic>;

const origin = GeoCoordinate(longitude: 127.0374, latitude: 37.5445);
const destination = GeoCoordinate(longitude: 127.043, latitude: 37.548);

RouteQuery query(Map<String, dynamic> json) => RouteQuery(
  origin: origin,
  destination: destination,
  departureAt: DateTime.parse(json['evaluatedAt'] as String),
);

Map<String, dynamic> synthetic({bool? signals}) {
  final body = routeResponseJson();
  final route = (body['routes'] as List).first as Map<String, dynamic>;
  final points = (route['geometry'] as Map)['coordinates'] as List;
  route['guidance'] = {
    'status': 'AVAILABLE',
    'metadataStatus': 'OSM_TAGS',
    'modelVersion': 'synthetic-guidance',
    'language': 'ko',
    'steps': [
      for (var i = 0; i < 3; i++)
        {
          'index': i,
          'type': ['DEPART', 'CROSSING', 'ARRIVE'][i],
          'coordinate': {'longitude': points[i][0], 'latitude': points[i][1]},
          'geometryIndex': i,
          'distanceFromStartMeters': i * 70.7,
          'distanceToNextStepMeters': i == 2 ? 0 : 70.7,
          'durationToNextStepSeconds': i == 2 ? 0 : 51,
          'instruction': ['출발하세요', '횡단 지점입니다', '안내 끝점입니다'][i],
          if (i == 1) 'crossing': {'trafficSignals': signals},
        },
    ],
  };
  return body;
}

RouteGuidance? guidance(Map<String, dynamic> body) => const RouteMapper()
    .toResult(RouteSearchResponseDto.fromJson(body), query(body))
    .routes
    .single
    .guidance;

Map<String, dynamic> guideJson(Map<String, dynamic> body) =>
    (body['routes'] as List).first['guidance'] as Map<String, dynamic>;

void main() {
  test(
    'captured walking response preserves all 19 original path references',
    () {
      final body = captured('general');
      final result = const RouteMapper().toResult(
        RouteSearchResponseDto.fromJson(body),
        query(body),
      );
      final route = result.routes.single;
      final guide = route.guidance!;
      expect(guide.status, RouteGuidanceStatus.available);
      expect(guide.metadataStatus, GuidanceMetadataStatus.osmTags);
      expect(guide.steps, hasLength(19));
      for (final step in guide.steps) {
        expect(step.coordinate, route.path[step.geometryIndex]);
      }
      expect(guide.steps.last.geometryIndex, route.path.length - 1);
      expect(guide.steps.last.type, ManeuverType.arrive);
      expect(() => guide.steps.clear(), throwsUnsupportedError);
    },
  );

  for (final mode in [RoutePredictionMode.fastest, RoutePredictionMode.shade]) {
    test(
      'captured ${mode.name} prediction keeps its own guidance and shade segments',
      () {
        final body = captured(mode.name);
        final result = const ModelRoutePredictionMapper().toResult(
          ModelRoutePredictionResponseDto.fromJson(body),
          RoutePredictionQuery(
            origin: origin,
            destination: destination,
            mode: mode,
            departureAt: DateTime.parse(body['evaluatedAt'] as String),
          ),
        );
        final route = result.routes.single;
        expect(
          route.guidance!.steps,
          hasLength(mode == RoutePredictionMode.fastest ? 19 : 23),
        );
        expect(route.shadeSegments, hasLength(4));
        for (final step in route.guidance!.steps) {
          expect(step.coordinate, route.path[step.geometryIndex]);
        }
      },
    );
  }

  test('older responses without guidance still produce a usable route', () {
    expect(guidance(routeResponseJson()), isNull);
  });

  for (final value in [true, false, null]) {
    test(
      'crossing signal installation preserves $value without inventing a live signal',
      () {
        final step = guidance(synthetic(signals: value))!.steps[1];
        expect(step.crossing, isNotNull);
        expect(step.crossing!.trafficSignals, value);
      },
    );
  }

  test('a turn can also carry crossing metadata', () {
    final body = synthetic(signals: true);
    (guideJson(body)['steps'] as List)[1]['type'] = 'TURN_RIGHT';
    final step = guidance(body)!.steps[1];
    expect(step.type, ManeuverType.turnRight);
    expect(step.crossing!.trafficSignals, true);
  });

  test(
    'unknown maneuver remains unknown and preserves plain instruction text',
    () {
      final body = synthetic();
      (guideJson(body)['steps'] as List)[1]['type'] = 'FUTURE_MANEUVER';
      final step = guidance(body)!.steps[1];
      expect(step.type, ManeuverType.unknown);
      expect(step.instruction, '횡단 지점입니다');
    },
  );

  for (final status in ['UNAVAILABLE', 'FUTURE_STATUS']) {
    test('$status does not expose instructions as available', () {
      final body = synthetic();
      guideJson(body)['status'] = status;
      final result = guidance(body)!;
      expect(
        result.status,
        status == 'UNAVAILABLE'
            ? RouteGuidanceStatus.unavailable
            : RouteGuidanceStatus.unknown,
      );
      expect(result.steps, isEmpty);
    });
  }

  final malformed = <String, void Function(Map<String, dynamic>)>{
    'out-of-range geometry index': (s) => s['geometryIndex'] = 99,
    'fractional geometry index': (s) => s['geometryIndex'] = 1.5,
    'coordinate outside original geometry': (s) =>
        s['coordinate']['longitude'] = 127.5,
    'non-consecutive instruction index': (s) => s['index'] = 8,
    'non-finite distance': (s) => s['distanceFromStartMeters'] = double.nan,
    'discontinuous step distance': (s) => s['distanceToNextStepMeters'] = 80,
    'negative time': (s) => s['durationToNextStepSeconds'] = -1,
    'inconsistent total duration': (s) => s['durationToNextStepSeconds'] = 55,
    'invalid bearing': (s) => s['bearingAfterDegrees'] = double.infinity,
    'blank instruction': (s) => s['instruction'] = ' ',
  };
  for (final entry in malformed.entries) {
    test('rejects ${entry.key}', () {
      final body = synthetic();
      entry.value(
        (guideJson(body)['steps'] as List)[1] as Map<String, dynamic>,
      );
      expect(() => guidance(body), throwsFormatException);
    });
  }
}
