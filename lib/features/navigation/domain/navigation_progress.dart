import 'dart:math' as math;

import '../../location/domain/entities/location_fix.dart';
import '../../../core/geo/geo_coordinate.dart';
import '../../route_search/domain/entities/route_guidance.dart';

final class NavigationRoute {
  NavigationRoute({
    required List<GeoCoordinate> path,
    required this.distanceMeters,
    required this.duration,
    this.guidance,
  }) : path = List.unmodifiable(path);
  final List<GeoCoordinate> path;
  final double distanceMeters;
  final Duration duration;
  final RouteGuidance? guidance;
}

final class NavigationProgress {
  const NavigationProgress({
    required this.remainingMeters,
    required this.distanceToRoute,
    required this.fraction,
    required this.bearing,
    required this.arrived,
    this.geometryPosition = 0,
  });
  final double remainingMeters;
  final double distanceToRoute;
  final double fraction;
  final double bearing;
  final bool arrived;

  /// Original segment index plus its matched fraction; never simplified.
  final double geometryPosition;
}

final class NavigationInstruction {
  const NavigationInstruction({
    required this.step,
    required this.distanceMeters,
  });
  final RouteGuidanceStep step;
  final double distanceMeters;
}

final class NavigationStepProgress {
  const NavigationStepProgress({required this.currentIndex, this.nextIndex});
  final int currentIndex;
  final int? nextIndex;
}

NavigationStepProgress? measureGuidanceSteps(
  NavigationRoute route,
  NavigationProgress progress, {
  bool arrived = false,
}) {
  final guide = route.guidance;
  if (guide == null ||
      guide.status != RouteGuidanceStatus.available ||
      guide.steps.length < 2) {
    return null;
  }
  if (arrived) {
    return NavigationStepProgress(currentIndex: guide.steps.last.index);
  }
  final next = nextInstruction(route, progress);
  if (next == null) return null;
  return NavigationStepProgress(
    currentIndex: math.max(0, next.step.index - 1),
    nextIndex: next.step.index,
  );
}

NavigationInstruction? nextInstruction(
  NavigationRoute route,
  NavigationProgress progress,
) {
  final guidance = route.guidance;
  if (guidance == null || guidance.status != RouteGuidanceStatus.available) {
    return null;
  }
  for (final step in guidance.steps.skip(1)) {
    if (step.geometryIndex + 1e-6 >= progress.geometryPosition) {
      final traveled = route.distanceMeters * progress.fraction;
      return NavigationInstruction(
        step: step,
        distanceMeters: math.max(0, step.distanceFromStartMeters - traveled),
      );
    }
  }
  return null;
}

/// Matches a GPS fix to the supplied line; never invents an access route.
NavigationProgress measureProgress(NavigationRoute route, LocationFix fix) {
  const radius = 6371008.8;
  const rad = math.pi / 180;
  final scale = math.cos(fix.coordinate.latitude * rad).abs().clamp(0.01, 1.0);
  double x(GeoCoordinate p) =>
      ((p.longitude - fix.coordinate.longitude + 180) % 360 - 180) *
      rad *
      radius *
      scale;
  double y(GeoCoordinate p) =>
      (p.latitude - fix.coordinate.latitude) * rad * radius;
  var total = 0.0;
  var matched = 0.0;
  var nearest = double.infinity;
  var bearing = 0.0;
  var geometryPosition = 0.0;
  for (var i = 0; i < route.path.length - 1; i++) {
    final a = route.path[i], b = route.path[i + 1];
    final ax = x(a), ay = y(a), dx = x(b) - ax, dy = y(b) - ay;
    final squared = dx * dx + dy * dy;
    if (squared < 0.0001) continue;
    final length = math.sqrt(squared);
    final t = (-(ax * dx + ay * dy) / squared).clamp(0.0, 1.0);
    final distance = math.sqrt(
      math.pow(ax + t * dx, 2) + math.pow(ay + t * dy, 2),
    );
    if (distance < nearest) {
      nearest = distance;
      matched = total + length * t;
      bearing = (math.atan2(dx, dy) / rad + 360) % 360;
      geometryPosition = i + t;
    }
    total += length;
  }
  final fraction = total > 0 ? (matched / total).clamp(0.0, 1.0) : 0.0;
  final endDistance = route.path.isEmpty
      ? double.infinity
      : math.sqrt(
          math.pow(x(route.path.last), 2) + math.pow(y(route.path.last), 2),
        );
  return NavigationProgress(
    remainingMeters: route.distanceMeters * (1 - fraction),
    distanceToRoute: nearest,
    fraction: fraction,
    bearing: bearing,
    arrived: fraction >= 0.9 && endDistance <= 15 && fix.accuracyMeters <= 25,
    geometryPosition: geometryPosition,
  );
}
