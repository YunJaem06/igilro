import 'dart:math' as math;

import '../../location/domain/entities/location_fix.dart';
import '../../../core/geo/geo_coordinate.dart';

final class NavigationRoute {
  NavigationRoute({
    required List<GeoCoordinate> path,
    required this.distanceMeters,
    required this.duration,
  }) : path = List.unmodifiable(path);
  final List<GeoCoordinate> path;
  final double distanceMeters;
  final Duration duration;
}

final class NavigationProgress {
  const NavigationProgress({
    required this.remainingMeters,
    required this.distanceToRoute,
    required this.fraction,
    required this.bearing,
    required this.arrived,
  });
  final double remainingMeters;
  final double distanceToRoute;
  final double fraction;
  final double bearing;
  final bool arrived;
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
  );
}
