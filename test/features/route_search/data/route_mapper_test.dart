import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/features/route_search/data/dto/route_search_response_dto.dart';
import 'package:igilro/features/route_search/data/mappers/route_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/route_candidate.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';

import '../../../helpers/fake_route_repository.dart';
import '../../../helpers/route_response_fixture.dart';

void main() {
  const mapper = RouteMapper();
  late RouteQuery query;
  late RouteSearchResponseDto dto;
  setUp(() {
    query = RouteQuery(
      origin: routeOrigin,
      destination: routeDestination,
      departureAt: routeDeparture,
    );
    dto = RouteSearchResponseDto.fromJson(routeResponseJson());
  });

  test(
    'serializes only supported request fields with named lon/lat and UTC',
    () {
      final body = mapper.toRequest(query).toJson();
      expect(body, {
        'origin': {'longitude': 127.0302, 'latitude': 37.54002},
        'destination': {'longitude': 127.0318, 'latitude': 37.54002},
        'departureAt': '2026-10-10T05:00:00.000Z',
        'travelMode': 'walking',
        'mode': 'fastest',
      });
    },
  );

  test('preserves GeoJSON order, snapping, units, versions and source', () {
    final result = mapper.toResult(dto, query);
    final route = result.routes.single;
    expect(route.path.length, 3);
    expect(route.path.first.longitude, 127.0302);
    expect(route.path.first.latitude, 37.54);
    expect(route.path[1].longitude, 127.031);
    expect(route.distanceMeters, 141.4);
    expect(route.duration, const Duration(seconds: 102));
    expect(route.additionalDuration, Duration.zero);
    expect(route.metrics.shadeRatio, isNull);
    expect(route.metrics.quietScore, isNull);
    expect(route.metrics.lightingScore, isNull);
    expect(route.metrics.trafficSignalCount, isNull);
    expect(result.snapping.origin.coordinate, route.path.first);
    expect(result.snapping.destination.coordinate, route.path.last);
    expect(result.snapping.origin.coordinate, isNot(query.origin));
    expect(result.snapping.origin.distanceMeters, 2.2);
    expect(result.query, query);
    expect(result.evaluatedAt, routeDeparture);
    expect(result.baselineDuration, const Duration(seconds: 102));
    expect(result.timeModelVersion, 'walking-v1-flat-1.4-steps-0.9');
    expect(
      result.routingModelVersion,
      'dijkstra-v2-distinct8-snap50-direct5km',
    );
    expect(
      route.shadeEvaluation?.status,
      ShadeEvaluationStatus.dataUnavailable,
    );
    expect(route.shadeEvaluation?.coverage, isNull);
    expect(route.shadeEvaluation?.solarAltitudeDegrees, 40.28185900153385);
    expect(result.attribution, '© OpenStreetMap contributors');
    expect(() => route.path.clear(), throwsUnsupportedError);
  });

  test(
    'unknown response extensions are accepted without inventing metrics',
    () {
      final json = routeResponseJson();
      json['futureMetadata'] = {'version': 2};
      (json['routes'] as List).first['futureRouteField'] = true;
      final result = mapper.toResult(
        RouteSearchResponseDto.fromJson(json),
        query,
      );
      expect(result.routes.single.metrics.shadeRatio, isNull);
    },
  );

  test(
    'keeps measured zero distinct from null and signal counts above one',
    () {
      final route = dto.routes.single;
      final changed = dto.copyWith(
        routes: [
          route.copyWith(
            metrics: route.metrics.copyWith(
              shadeRatio: 0,
              quietScore: 0.71,
              lightingScore: 1,
              trafficSignalCount: 8,
            ),
            shadeEvaluation: route.shadeEvaluation!.copyWith(
              status: 'AVAILABLE',
              coverage: 1,
            ),
          ),
        ],
      );
      final metrics = mapper.toResult(changed, query).routes.single.metrics;
      expect(metrics.shadeRatio, 0);
      expect(metrics.quietScore, 0.71);
      expect(metrics.lightingScore, 1);
      expect(metrics.trafficSignalCount, 8);
    },
  );

  test('maps the captured AVAILABLE shade extension and separate building attribution', () {
    final route = dto.routes.single;
    final changed = dto.copyWith(
      routes: [
        route.copyWith(
          metrics: route.metrics.copyWith(shadeRatio: 0.21382726924445294),
          shadeEvaluation: route.shadeEvaluation!.copyWith(
            status: 'AVAILABLE',
            coverage: 1,
            dataVersion: 'buildings-v1-deda27f20bc4b24de1f0efac3d31ea88691d727f631aad58079a55c9d038721a',
            attribution: 'Synthetic test geometry; not real buildings',
          ),
        ),
      ],
    );
    final result = mapper.toResult(changed, query);
    final candidate = result.routes.single;
    expect(candidate.metrics.shadeRatio, 0.21382726924445294);
    expect(candidate.shadeEvaluation?.status, ShadeEvaluationStatus.available);
    expect(candidate.shadeEvaluation?.coverage, 1);
    expect(
      candidate.shadeEvaluation?.attribution,
      'Synthetic test geometry; not real buildings',
    );
    expect(result.attribution, '© OpenStreetMap contributors');
    expect(candidate.shadeEvaluation?.dataVersion, isNot(result.dataVersion));
  });

  final shadeStatuses = {
    'DATA_UNAVAILABLE': ShadeEvaluationStatus.dataUnavailable,
    'INCOMPLETE_COVERAGE': ShadeEvaluationStatus.incompleteCoverage,
    'NIGHT': ShadeEvaluationStatus.night,
    'LOW_SUN': ShadeEvaluationStatus.lowSun,
    'UNSUPPORTED_TIME': ShadeEvaluationStatus.unsupportedTime,
    'FUTURE_STATUS': ShadeEvaluationStatus.unknown,
  };
  for (final entry in shadeStatuses.entries) {
    test('${entry.key} keeps a valid route with null shade ratio', () {
      final route = dto.routes.single;
      final changed = dto.copyWith(
        routes: [
          route.copyWith(
            shadeEvaluation: route.shadeEvaluation!.copyWith(status: entry.key),
          ),
        ],
      );
      final candidate = mapper.toResult(changed, query).routes.single;
      expect(candidate.metrics.shadeRatio, isNull);
      expect(candidate.shadeEvaluation?.status, entry.value);
      expect(candidate.duration, const Duration(seconds: 102));
    });
  }

  test('accepts the previous response without a shadeEvaluation extension', () {
    final changed = dto.copyWith(
      routes: [dto.routes.single.copyWith(shadeEvaluation: null)],
    );
    expect(
      mapper.toResult(changed, query).routes.single.shadeEvaluation,
      isNull,
    );
  });

  test('does not treat incomplete coverage as a complete shade ratio', () {
    final route = dto.routes.single;
    final changed = dto.copyWith(
      routes: [
        route.copyWith(
          metrics: route.metrics.copyWith(shadeRatio: 0.2),
          shadeEvaluation: route.shadeEvaluation!.copyWith(
            status: 'AVAILABLE',
            coverage: 0.8,
          ),
        ),
      ],
    );
    expect(() => mapper.toResult(changed, query), throwsFormatException);
  });

  test(
    'rejects an empty successful response rather than calling it no route',
    () {
      expect(
        () => mapper.toResult(dto.copyWith(routes: []), query),
        throwsFormatException,
      );
    },
  );

  test('rejects repeated route identifiers', () {
    expect(
      () => mapper.toResult(
        dto.copyWith(routes: [dto.routes.single, dto.routes.single]),
        query,
      ),
      throwsFormatException,
    );
  });

  for (final coordinates in <List<List<double>>>[
    <List<double>>[],
    [
      [127.0, 37.0],
    ],
    [
      [127.0],
      [127.01, 37.01],
    ],
    [
      [127.0, 37.0, 0],
      [127.01, 37.01],
    ],
    [
      [37.5, 127.0],
      [37.51, 127.01],
    ],
    [
      [181.0, 37.0],
      [127.01, 37.01],
    ],
    [
      [double.nan, 37.0],
      [127.01, 37.01],
    ],
  ]) {
    test('rejects invalid path coordinates $coordinates', () {
      final route = dto.routes.single;
      final changed = dto.copyWith(
        routes: [
          route.copyWith(
            geometry: route.geometry.copyWith(coordinates: coordinates),
          ),
        ],
      );
      expect(() => mapper.toResult(changed, query), throwsFormatException);
    });
  }

  for (final distance in [-1.0, double.infinity, double.nan]) {
    test('rejects an invalid distance $distance', () {
      final changed = dto.copyWith(
        routes: [dto.routes.single.copyWith(distanceMeters: distance)],
      );
      expect(() => mapper.toResult(changed, query), throwsFormatException);
    });
  }

  for (final ratio in [-0.01, 1.01, double.infinity, double.nan]) {
    test('rejects an invalid environmental ratio $ratio', () {
      final route = dto.routes.single;
      final changed = dto.copyWith(
        routes: [
          route.copyWith(metrics: route.metrics.copyWith(shadeRatio: ratio)),
        ],
      );
      expect(() => mapper.toResult(changed, query), throwsFormatException);
    });
  }

  for (final instant in [
    '2026-10-10T05:00:00',
    '2026-10-10T05:00:01Z',
    'invalid',
  ]) {
    test(
      'rejects an absent UTC marker or mismatched evaluation instant: $instant',
      () {
        expect(
          () => mapper.toResult(dto.copyWith(evaluatedAt: instant), query),
          throwsFormatException,
        );
      },
    );
  }
}
