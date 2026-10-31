import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/route_guidance.dart';
import '../dto/route_guidance_dto.dart';

final class RouteGuidanceMapper {
  const RouteGuidanceMapper();

  RouteGuidance? toEntity(
    RouteGuidanceDto? dto, {
    required List<GeoCoordinate> path,
    required double distanceMeters,
    required Duration duration,
  }) {
    if (dto == null) return null;
    final status = switch (dto.status) {
      'AVAILABLE' => RouteGuidanceStatus.available,
      'UNAVAILABLE' => RouteGuidanceStatus.unavailable,
      _ => RouteGuidanceStatus.unknown,
    };
    final steps = status == RouteGuidanceStatus.available
        ? dto.steps.map((step) => _step(step, path)).toList()
        : <RouteGuidanceStep>[];
    if (status == RouteGuidanceStatus.available) {
      _validateSteps(steps, path, distanceMeters, duration);
    }
    return RouteGuidance(
      status: status,
      metadataStatus: switch (dto.metadataStatus) {
        'OSM_TAGS' => GuidanceMetadataStatus.osmTags,
        'TOPOLOGY_ONLY' => GuidanceMetadataStatus.topologyOnly,
        _ => GuidanceMetadataStatus.unknown,
      },
      modelVersion: _text(dto.modelVersion),
      language: _text(dto.language),
      steps: steps,
    );
  }

  RouteGuidanceStep _step(RouteGuidanceStepDto dto, List<GeoCoordinate> path) {
    final c = dto.coordinate;
    if (!c.longitude.isFinite ||
        !c.latitude.isFinite ||
        c.longitude < -180 ||
        c.longitude > 180 ||
        c.latitude < -90 ||
        c.latitude > 90 ||
        dto.geometryIndex < 0 ||
        dto.geometryIndex >= path.length) {
      throw const FormatException('Invalid guidance coordinate or index.');
    }
    final point = path[dto.geometryIndex];
    if ((point.longitude - c.longitude).abs() > 1e-7 ||
        (point.latitude - c.latitude).abs() > 1e-7) {
      throw const FormatException('Guidance must reference the original path.');
    }
    final seconds = _nonNegative(dto.durationToNextStepSeconds);
    if (seconds > 0x7fffffffffffffff / Duration.microsecondsPerSecond) {
      throw const FormatException('Guidance duration exceeds supported range.');
    }
    return RouteGuidanceStep(
      index: dto.index,
      type: switch (dto.type) {
        'DEPART' => ManeuverType.depart,
        'CONTINUE' => ManeuverType.continueStraight,
        'KEEP_LEFT' => ManeuverType.keepLeft,
        'KEEP_RIGHT' => ManeuverType.keepRight,
        'TURN_LEFT' => ManeuverType.turnLeft,
        'TURN_RIGHT' => ManeuverType.turnRight,
        'U_TURN' => ManeuverType.uTurn,
        'CROSSING' => ManeuverType.crossing,
        'STAIRS' => ManeuverType.stairs,
        'ARRIVE' => ManeuverType.arrive,
        _ => ManeuverType.unknown,
      },
      coordinate: point,
      geometryIndex: dto.geometryIndex,
      distanceFromStartMeters: _nonNegative(dto.distanceFromStartMeters),
      distanceToNextStepMeters: _nonNegative(dto.distanceToNextStepMeters),
      durationToNextStep: Duration(
        microseconds: (seconds * Duration.microsecondsPerSecond).round(),
      ),
      instruction: _text(dto.instruction),
      streetName: dto.streetName == null ? null : _text(dto.streetName!),
      bearingBeforeDegrees: _bearing(dto.bearingBeforeDegrees),
      bearingAfterDegrees: _bearing(dto.bearingAfterDegrees),
      crossing: dto.crossing == null
          ? null
          : RouteCrossing(trafficSignals: dto.crossing!.trafficSignals),
    );
  }

  void _validateSteps(
    List<RouteGuidanceStep> steps,
    List<GeoCoordinate> path,
    double distance,
    Duration duration,
  ) {
    if (steps.length < 2 ||
        steps.first.type != ManeuverType.depart ||
        steps.last.type != ManeuverType.arrive ||
        steps.first.geometryIndex != 0 ||
        steps.last.geometryIndex != path.length - 1 ||
        steps.first.distanceFromStartMeters.abs() > 0.01 ||
        (steps.last.distanceFromStartMeters - distance).abs() > 0.051 ||
        steps.last.distanceToNextStepMeters != 0 ||
        steps.last.durationToNextStep != Duration.zero) {
      throw const FormatException('Incomplete guidance endpoints.');
    }
    var seconds = 0.0;
    for (var i = 0; i < steps.length; i++) {
      final step = steps[i];
      if (step.index != i) {
        throw const FormatException('Guidance indexes must be consecutive.');
      }
      seconds +=
          step.durationToNextStep.inMicroseconds /
          Duration.microsecondsPerSecond;
      if (i == steps.length - 1) continue;
      final next = steps[i + 1];
      if (next.geometryIndex < step.geometryIndex ||
          next.distanceFromStartMeters < step.distanceFromStartMeters ||
          (next.distanceFromStartMeters -
                      step.distanceFromStartMeters -
                      step.distanceToNextStepMeters)
                  .abs() >
              0.01) {
        throw const FormatException('Discontinuous guidance steps.');
      }
    }
    final routeSeconds =
        duration.inMicroseconds / Duration.microsecondsPerSecond;
    if (seconds > routeSeconds + 0.0001 || routeSeconds - seconds >= 1.0001) {
      throw const FormatException('Guidance duration differs from the route.');
    }
  }

  double _nonNegative(double value) {
    if (!value.isFinite || value < 0) {
      throw const FormatException('Invalid guidance distance or duration.');
    }
    return value;
  }

  double? _bearing(double? value) {
    if (value != null && (!value.isFinite || value < 0 || value > 360)) {
      throw const FormatException('Invalid guidance bearing.');
    }
    return value;
  }

  String _text(String value) {
    if (value.trim().isEmpty) {
      throw const FormatException('Expected non-blank guidance text.');
    }
    return value;
  }
}
