import 'package:geolocator/geolocator.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/location_access.dart';
import '../../domain/entities/location_fix.dart';

final class LocationMapper {
  const LocationMapper();

  LocationAccess toAccess(LocationPermission permission) =>
      switch (permission) {
        LocationPermission.always ||
        LocationPermission.whileInUse => LocationAccess.granted,
        LocationPermission.deniedForever => LocationAccess.deniedForever,
        LocationPermission.denied ||
        LocationPermission.unableToDetermine => LocationAccess.denied,
      };

  LocationFix toFix(Position position) {
    if (!position.latitude.isFinite ||
        position.latitude < -90 ||
        position.latitude > 90 ||
        !position.longitude.isFinite ||
        position.longitude < -180 ||
        position.longitude > 180 ||
        !position.accuracy.isFinite ||
        position.accuracy < 0) {
      throw const FormatException('Invalid location fix');
    }
    return LocationFix(
      coordinate: GeoCoordinate(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
      accuracyMeters: position.accuracy,
      capturedAt: position.timestamp,
      headingDegrees:
          position.heading.isFinite &&
              position.heading >= 0 &&
              position.heading < 360
          ? position.heading
          : null,
      speedMetersPerSecond: position.speed.isFinite && position.speed >= 0
          ? position.speed
          : null,
    );
  }
}
