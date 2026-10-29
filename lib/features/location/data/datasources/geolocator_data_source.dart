import 'package:geolocator/geolocator.dart';

import '../../domain/entities/location_access.dart';

final class GeolocatorDataSource {
  const GeolocatorDataSource(this._platform);

  final GeolocatorPlatform _platform;

  Future<bool> isServiceEnabled() => _platform.isLocationServiceEnabled();
  Future<LocationPermission> checkPermission() => _platform.checkPermission();
  Future<LocationPermission> requestPermission() =>
      _platform.requestPermission();
  Future<Position> getCurrentPosition() => _platform.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: 20),
    ),
  );

  Future<bool> openSettings(LocationSettingsTarget target) => switch (target) {
    LocationSettingsTarget.application => _platform.openAppSettings(),
    LocationSettingsTarget.locationService => _platform.openLocationSettings(),
  };

  Stream<Position> watchPositions() => _platform.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 3,
    ),
  );
}
