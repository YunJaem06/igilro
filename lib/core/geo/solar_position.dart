import 'dart:math' as math;

import 'geo_coordinate.dart';

/// NOAA fractional-year approximation, matching the server's solar convention.
/// This lights Mapbox buildings; it is not a server shade-coverage calculation.
final class SolarPosition {
  const SolarPosition(this.altitude, this.azimuth);
  final double altitude;
  final double azimuth;

  static SolarPosition at(GeoCoordinate position, DateTime instant) {
    final time = instant.toUtc();
    final start = DateTime.utc(time.year);
    final days = DateTime.utc(time.year + 1).difference(start).inDays;
    final hour = time.hour + time.minute / 60 + time.second / 3600;
    final gamma =
        2 *
        math.pi /
        days *
        (DateTime.utc(
              time.year,
              time.month,
              time.day,
            ).difference(start).inDays +
            (hour - 12) / 24);
    final equation =
        229.18 *
        (0.000075 +
            0.001868 * math.cos(gamma) -
            0.032077 * math.sin(gamma) -
            0.014615 * math.cos(2 * gamma) -
            0.040849 * math.sin(2 * gamma));
    final declination =
        0.006918 -
        0.399912 * math.cos(gamma) +
        0.070257 * math.sin(gamma) -
        0.006758 * math.cos(2 * gamma) +
        0.000907 * math.sin(2 * gamma) -
        0.002697 * math.cos(3 * gamma) +
        0.00148 * math.sin(3 * gamma);
    final minutes = (hour * 60 + equation + 4 * position.longitude) % 1440;
    final angle = (minutes / 4 - 180) * math.pi / 180;
    final latitude = position.latitude * math.pi / 180;
    final altitude = math.asin(
      (math.sin(latitude) * math.sin(declination) +
              math.cos(latitude) * math.cos(declination) * math.cos(angle))
          .clamp(-1.0, 1.0),
    );
    final azimuth =
        math.atan2(
          math.sin(angle),
          math.cos(angle) * math.sin(latitude) -
              math.tan(declination) * math.cos(latitude),
        ) +
        math.pi;
    return SolarPosition(
      altitude * 180 / math.pi,
      (azimuth * 180 / math.pi + 360) % 360,
    );
  }
}
