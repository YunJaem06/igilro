import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/route_candidate.dart';
import '../../domain/entities/route_query.dart';
import '../../domain/entities/route_search_result.dart';
import '../dto/route_search_request_dto.dart';
import '../dto/route_search_response_dto.dart';

final class RouteMapper {
  const RouteMapper();

  RouteSearchRequestDto toRequest(RouteQuery query) => RouteSearchRequestDto(
    origin: _toCoordinate(query.origin),
    destination: _toCoordinate(query.destination),
    departureAt: query.departureAt.toUtc().toIso8601String(),
  );

  RouteSearchResult toResult(RouteSearchResponseDto dto, RouteQuery query) {
    if (dto.routes.isEmpty ||
        dto.routes.map((route) => route.id).toSet().length !=
            dto.routes.length) {
      throw const FormatException(
        'Expected non-empty, uniquely identified routes.',
      );
    }
    final evaluatedAt = DateTime.tryParse(dto.evaluatedAt);
    if (evaluatedAt == null || !dto.evaluatedAt.endsWith('Z')) {
      throw const FormatException('Expected a UTC evaluation instant.');
    }
    if (!evaluatedAt.isAtSameMomentAs(query.departureAt)) {
      throw const FormatException('Evaluation instant differs from the query.');
    }
    return RouteSearchResult(
      query: query,
      routes: dto.routes.map(_toRoute).toList(growable: false),
      evaluatedAt: evaluatedAt.toUtc(),
      dataVersion: _nonBlank(dto.dataVersion),
      timeModelVersion: _nonBlank(dto.timeModelVersion),
      routingModelVersion: _nonBlank(dto.routingModelVersion),
      baselineDuration: _duration(dto.baselineDurationSeconds),
      snapping: RouteSnapping(
        origin: _toSnap(dto.snapping.origin),
        destination: _toSnap(dto.snapping.destination),
      ),
      attribution: _nonBlank(dto.attribution),
    );
  }

  RouteCandidate _toRoute(RouteCandidateDto dto) {
    if (dto.mode != 'fastest' ||
        dto.geometry.type != 'LineString' ||
        dto.geometry.coordinates.length < 2 ||
        dto.additionalDurationSeconds != 0) {
      throw const FormatException('Invalid fastest walking route.');
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
    return RouteCandidate(
      id: _nonBlank(dto.id),
      path: dto.geometry.coordinates
          .map((position) {
            if (position.length != 2) {
              throw const FormatException(
                'Expected a two-dimensional position.',
              );
            }
            return _coordinate(position[0], position[1]);
          })
          .toList(growable: false),
      distanceMeters: _distance(dto.distanceMeters),
      duration: _duration(dto.durationSeconds),
      additionalDuration: _duration(dto.additionalDurationSeconds),
      metrics: RouteMetrics(
        shadeRatio: shadeRatio,
        quietScore: _ratio(dto.metrics.quietScore),
        lightingScore: _ratio(dto.metrics.lightingScore),
        trafficSignalCount: signals,
      ),
      shadeEvaluation: shade,
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
