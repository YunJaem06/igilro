import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/model_route_prediction.dart';
import '../../domain/entities/prediction_coverage.dart';
import '../dto/model_route_prediction_dto.dart';
import '../dto/prediction_coverage_dto.dart';

final class ModelRoutePredictionMapper {
  const ModelRoutePredictionMapper();

  PredictionCoverage toCoverage(PredictionCoverageDto dto) {
    if (dto.bounds.length != 4 ||
        dto.walkingNetwork.type != 'MultiLineString') {
      throw const FormatException('Invalid coverage geometry.');
    }
    final sw = _coordinate(dto.bounds[0], dto.bounds[1]);
    final ne = _coordinate(dto.bounds[2], dto.bounds[3]);
    final bounds = PredictionBounds(
      west: sw.longitude,
      south: sw.latitude,
      east: ne.longitude,
      north: ne.latitude,
    );
    final center = _coordinate(dto.center.longitude, dto.center.latitude);
    if (bounds.west >= bounds.east ||
        bounds.south >= bounds.north ||
        !bounds.contains(center) ||
        dto.accessPoints.map((point) => point.id).toSet().length !=
            dto.accessPoints.length) {
      throw const FormatException('Invalid coverage bounds or access points.');
    }
    final c = dto.connectivity;
    return PredictionCoverage(
      areaId: _text(dto.areaId),
      name: _text(dto.name),
      bounds: bounds,
      center: center,
      walkingNetwork: dto.walkingNetwork.coordinates
          .map((line) => List<GeoCoordinate>.unmodifiable(_positions(line)))
          .toList(),
      accessPoints: dto.accessPoints
          .map(
            (point) => PredictionAccessPoint(
              id: _text(point.id),
              name: _text(point.name),
              coordinate: _coordinate(
                point.coordinate.longitude,
                point.coordinate.latitude,
              ),
            ),
          )
          .toList(),
      maximumSnappingDistanceMeters: _nonNegative(
        dto.maximumSnappingDistanceMeters,
      ),
      dataVersion: _text(dto.dataVersion),
      predictionDataVersion: _text(dto.predictionDataVersion),
      quality: _text(dto.quality),
      attribution: _text(dto.attribution),
      connectivity: PredictionConnectivity(
        nodeCount: c.nodeCount,
        edgeCount: c.edgeCount,
        weakComponentCount: c.weakComponentCount,
        largestComponentNodeCount: c.largestComponentNodeCount,
        componentPolicy: _text(c.componentPolicy),
        sourceWeakComponentCount: c.sourceWeakComponentCount,
        excludedDisconnectedNodeCount: c.excludedDisconnectedNodeCount,
      ),
    );
  }

  ModelRoutePredictionRequestDto toRequest(RoutePredictionQuery query) =>
      ModelRoutePredictionRequestDto(
        origin: PredictionCoordinateDto(
          longitude: query.origin.longitude,
          latitude: query.origin.latitude,
        ),
        destination: PredictionCoordinateDto(
          longitude: query.destination.longitude,
          latitude: query.destination.latitude,
        ),
        mode: query.mode.name,
        departureAt: query.departureAt?.toUtc().toIso8601String(),
      );

  ModelRoutePrediction toResult(
    ModelRoutePredictionResponseDto dto,
    RoutePredictionQuery query,
  ) {
    final evaluatedAt = DateTime.tryParse(dto.evaluatedAt);
    if (evaluatedAt == null ||
        !RegExp(r'(Z|[+-]\d{2}:\d{2})$').hasMatch(dto.evaluatedAt) ||
        (query.departureAt != null &&
            !evaluatedAt.isAtSameMomentAs(query.departureAt!))) {
      throw const FormatException('Invalid prediction evaluation instant.');
    }
    if (dto.routes.isEmpty ||
        dto.routes.map((route) => route.id).toSet().length !=
            dto.routes.length) {
      throw const FormatException('Expected uniquely identified routes.');
    }
    return ModelRoutePrediction(
      query: query,
      routes: dto.routes.map((route) => _route(route, query.mode)).toList(),
      evaluatedAt: evaluatedAt.toUtc(),
      dataVersion: _text(dto.dataVersion),
      predictionDataVersion: _text(dto.predictionDataVersion),
      modelVersion: _text(dto.modelVersion),
      routingModelVersion: _text(dto.routingModelVersion),
      timeModelVersion: _text(dto.timeModelVersion),
      baselineDuration: _duration(dto.baselineDurationSeconds),
      snapping: PredictionSnapping(
        origin: _snap(dto.snapping.origin),
        destination: _snap(dto.snapping.destination),
      ),
      quality: _text(dto.quality),
      attribution: _text(dto.attribution),
      limitations: dto.limitations.map(_text).toList(),
      buildingModelCount: dto.buildingModelCount,
      terrainTileCount: dto.terrainTileCount,
      omittedBuildingModelCount: dto.omittedBuildingModelCount,
      sampleStepMeters: _nonNegative(dto.sampleStepMeters),
      projectionMaxErrorMeters: _nonNegative(dto.projectionMaxErrorMeters),
      sceneBufferMetersApprox: _nonNegative(dto.sceneBufferMetersApprox),
    );
  }

  PredictedRoute _route(PredictedRouteDto dto, RoutePredictionMode mode) {
    if (dto.mode != mode.name ||
        dto.geometry.type != 'LineString' ||
        dto.geometry.coordinates.length < 2 ||
        dto.prediction.status != 'MODEL_BASED_PREDICTION' ||
        (mode == RoutePredictionMode.fastest &&
            dto.additionalDurationSeconds != 0)) {
      throw const FormatException('Invalid modeled route prediction.');
    }
    final path = _positions(dto.geometry.coordinates);
    final segments = dto.shadeSegments.map((segment) {
      if (segment.geometry.type != 'LineString') {
        throw const FormatException('Invalid shade segment geometry.');
      }
      return PredictedShadeSegment(
        state: switch (segment.state) {
          'SHADE' => PredictedShadeState.shade,
          'SUNLIGHT' => PredictedShadeState.sunlight,
          _ => throw const FormatException('Unknown predicted shade state.'),
        },
        path: _positions(segment.geometry.coordinates),
        fromDistanceMeters: _nonNegative(segment.fromDistanceMeters),
        toDistanceMeters: _nonNegative(segment.toDistanceMeters),
        distanceMeters: _nonNegative(segment.distanceMeters),
      );
    }).toList();
    if (segments.isNotEmpty) {
      var previousDistance = 0.0;
      var previousPoint = path.first;
      for (final segment in segments) {
        if (segment.toDistanceMeters < segment.fromDistanceMeters ||
            (segment.fromDistanceMeters - previousDistance).abs() > 0.01 ||
            (segment.toDistanceMeters -
                        segment.fromDistanceMeters -
                        segment.distanceMeters)
                    .abs() >
                0.01 ||
            !_near(segment.path.first, previousPoint)) {
          throw const FormatException('Discontinuous shade segments.');
        }
        previousDistance = segment.toDistanceMeters;
        previousPoint = segment.path.last;
      }
      if ((previousDistance - dto.distanceMeters).abs() > 0.051 ||
          !_near(previousPoint, path.last)) {
        throw const FormatException('Shade segments must cover the route.');
      }
    }
    return PredictedRoute(
      id: _text(dto.id),
      mode: mode,
      path: path,
      shadeSegments: segments,
      distanceMeters: _nonNegative(dto.distanceMeters),
      duration: _duration(dto.durationSeconds),
      additionalDuration: _duration(dto.additionalDurationSeconds),
      prediction: ModeledShadePrediction(
        status: dto.prediction.status,
        modeledShadeRatio: _ratio(dto.prediction.modeledShadeRatio),
        baselineModeledShadeRatio: _ratio(
          dto.prediction.baselineModeledShadeRatio,
        ),
        physicalShadeCoverage: dto.prediction.physicalShadeCoverage == null
            ? null
            : _ratio(dto.prediction.physicalShadeCoverage!),
      ),
    );
  }

  List<GeoCoordinate> _positions(List<List<double>> positions) {
    if (positions.length < 2) throw const FormatException('Expected a line.');
    return positions.map((position) {
      if (position.length != 2) {
        throw const FormatException('Expected longitude and latitude.');
      }
      return _coordinate(position[0], position[1]);
    }).toList();
  }

  bool _near(GeoCoordinate a, GeoCoordinate b) =>
      (a.longitude - b.longitude).abs() <= 1e-7 &&
      (a.latitude - b.latitude).abs() <= 1e-7;

  PredictionSnap _snap(PredictionSnapDto dto) => PredictionSnap(
    coordinate: _coordinate(dto.coordinate.longitude, dto.coordinate.latitude),
    distanceMeters: _nonNegative(dto.distanceMeters),
  );

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

  double _ratio(double value) {
    if (!value.isFinite || value < 0 || value > 1) {
      throw const FormatException('Invalid prediction ratio.');
    }
    return value;
  }

  double _nonNegative(double value) {
    if (!value.isFinite || value < 0) {
      throw const FormatException('Invalid metric.');
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

  String _text(String value) {
    if (value.trim().isEmpty) throw const FormatException('Expected metadata.');
    return value;
  }
}
