import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/route_candidate.dart';
import '../../domain/entities/route_query.dart';
import '../../domain/entities/route_search_result.dart';
import '../dto/route_search_request_dto.dart';
import '../dto/route_search_response_dto.dart';
import 'route_guidance_mapper.dart';

final class RouteMapper {
  const RouteMapper();

  RouteSearchRequestDto toRequest(RouteQuery query) => RouteSearchRequestDto(
    origin: _toCoordinate(query.origin),
    destination: _toCoordinate(query.destination),
    departureAt: query.departureAt.toUtc().toIso8601String(),
    mode: query.mode.name,
  );

  RouteSearchResult toResult(RouteSearchResponseDto dto, RouteQuery query) {
    final comparison = query.mode == RouteMode.running;
    if (dto.routes.length != (comparison ? 2 : 1) ||
        dto.routes.first.mode != RouteMode.fastest.name ||
        (comparison && dto.routes.last.mode != RouteMode.running.name) ||
        dto.routes.map((route) => route.id).toSet().length !=
            dto.routes.length) {
      throw const FormatException('Unexpected route modes or duplicate IDs.');
    }
    final evaluatedAt = DateTime.tryParse(dto.evaluatedAt);
    if (evaluatedAt == null || !dto.evaluatedAt.endsWith('Z')) {
      throw const FormatException('Expected a UTC evaluation instant.');
    }
    if (!evaluatedAt.isAtSameMomentAs(query.departureAt)) {
      throw const FormatException('Evaluation instant differs from the query.');
    }
    final routes = dto.routes
        .map(
          (route) => _toRoute(route, dto.baselineDurationSeconds, comparison),
        )
        .toList(growable: false);
    final snapping = RouteSnapping(
      origin: _toSnap(dto.snapping.origin),
      destination: _toSnap(dto.snapping.destination),
    );
    if (comparison &&
        routes.any(
          (route) =>
              route.path.first != snapping.origin.coordinate ||
              route.path.last != snapping.destination.coordinate,
        )) {
      throw const FormatException('The comparison uses different endpoints.');
    }
    return RouteSearchResult(
      query: query,
      routes: routes,
      evaluatedAt: evaluatedAt.toUtc(),
      dataVersion: _nonBlank(dto.dataVersion),
      timeModelVersion: _nonBlank(dto.timeModelVersion),
      routingModelVersion: _nonBlank(dto.routingModelVersion),
      baselineDuration: _duration(dto.baselineDurationSeconds),
      snapping: snapping,
      attribution: _nonBlank(dto.attribution),
    );
  }

  RouteCandidate _toRoute(
    RouteCandidateDto dto,
    int baseline,
    bool comparison,
  ) {
    final mode = RouteMode.values.byName(dto.mode);
    if (dto.geometry.type != 'LineString' ||
        dto.geometry.coordinates.length < 2 ||
        dto.durationSeconds - baseline != dto.additionalDurationSeconds ||
        (mode == RouteMode.fastest && dto.additionalDurationSeconds != 0)) {
      throw const FormatException('Invalid walking route.');
    }
    final stairs = dto.metrics.stairsMeters;
    final crossings = dto.metrics.mappedCrossingCount;
    if (comparison && (stairs == null || crossings == null || crossings < 0)) {
      throw const FormatException('Missing running comparison metrics.');
    }
    final signals = dto.metrics.trafficSignalCount;
    if (signals != null && signals < 0) {
      throw const FormatException('Invalid signal count.');
    }
    final shade = _toShade(dto.shadeEvaluation);
    final shadeRatio = _ratio(dto.metrics.shadeRatio);
    if (shade != null) {
      if (shade.status == ShadeEvaluationStatus.available &&
          (shade.coverage != 1 || shadeRatio == null)) {
        throw const FormatException(
          'A complete shade evaluation needs a ratio.',
        );
      }
      if (shade.status != ShadeEvaluationStatus.available &&
          shade.status != ShadeEvaluationStatus.unknown &&
          shadeRatio != null) {
        throw const FormatException('An unevaluated shade ratio must be null.');
      }
    }
    final path = dto.geometry.coordinates
        .map((position) {
          if (position.length != 2) {
            throw const FormatException('Expected a two-dimensional position.');
          }
          return _coordinate(position[0], position[1]);
        })
        .toList(growable: false);
    final distance = _distance(dto.distanceMeters);
    final duration = _duration(dto.durationSeconds);
    return RouteCandidate(
      id: _nonBlank(dto.id),
      mode: mode,
      path: path,
      distanceMeters: distance,
      duration: duration,
      additionalDuration: _duration(dto.additionalDurationSeconds),
      metrics: RouteMetrics(
        shadeRatio: shadeRatio,
        quietScore: _ratio(dto.metrics.quietScore),
        lightingScore: _ratio(dto.metrics.lightingScore),
        trafficSignalCount: signals,
        stairsMeters: stairs == null ? null : _distance(stairs),
        mappedCrossingCount: crossings,
      ),
      shadeEvaluation: shade,
      guidance: const RouteGuidanceMapper().toEntity(
        dto.guidance,
        path: path,
        distanceMeters: distance,
        duration: duration,
      ),
    );
  }

  RouteShadeEvaluation? _toShade(RouteShadeEvaluationDto? dto) {
    if (dto == null) return null;
    final altitude = dto.solarAltitudeDegrees;
    if (altitude != null &&
        (!altitude.isFinite || altitude < -90 || altitude > 90)) {
      throw const FormatException('Invalid solar altitude.');
    }
    return RouteShadeEvaluation(
      status: switch (dto.status) {
        'AVAILABLE' => ShadeEvaluationStatus.available,
        'DATA_UNAVAILABLE' => ShadeEvaluationStatus.dataUnavailable,
        'INCOMPLETE_COVERAGE' => ShadeEvaluationStatus.incompleteCoverage,
        'NIGHT' => ShadeEvaluationStatus.night,
        'LOW_SUN' => ShadeEvaluationStatus.lowSun,
        'UNSUPPORTED_TIME' => ShadeEvaluationStatus.unsupportedTime,
        _ => ShadeEvaluationStatus.unknown,
      },
      modelVersion: _nonBlank(dto.modelVersion),
      coverage: _ratio(dto.coverage),
      dataVersion: dto.dataVersion == null ? null : _nonBlank(dto.dataVersion!),
      attribution: dto.attribution == null ? null : _nonBlank(dto.attribution!),
      solarAltitudeDegrees: altitude,
    );
  }

  RouteSnap _toSnap(RouteSnapDto dto) => RouteSnap(
    coordinate: _coordinate(dto.coordinate.longitude, dto.coordinate.latitude),
    distanceMeters: _distance(dto.distanceMeters),
  );

  RouteCoordinateDto _toCoordinate(GeoCoordinate value) =>
      RouteCoordinateDto(longitude: value.longitude, latitude: value.latitude);

  GeoCoordinate _coordinate(double longitude, double latitude) {
    if (!longitude.isFinite ||
        !latitude.isFinite ||
        longitude < -180 ||
        longitude > 180 ||
        latitude < -90 ||
        latitude > 90) {
      throw const FormatException('Invalid WGS84 coordinate.');
    }
    return GeoCoordinate(longitude: longitude, latitude: latitude);
  }

  double _distance(double value) {
    if (!value.isFinite || value < 0) {
      throw const FormatException('Invalid distance.');
    }
    return value;
  }

  Duration _duration(int seconds) {
    if (seconds < 0 ||
        seconds > 0x7fffffffffffffff ~/ Duration.microsecondsPerSecond) {
      throw const FormatException('Invalid duration.');
    }
    return Duration(seconds: seconds);
  }

  double? _ratio(double? value) {
    if (value != null && (!value.isFinite || value < 0 || value > 1)) {
      throw const FormatException('Invalid environmental metric.');
    }
    return value;
  }

  String _nonBlank(String value) {
    if (value.trim().isEmpty) {
      throw const FormatException('Expected a non-blank value.');
    }
    return value;
  }
}
