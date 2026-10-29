import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_access.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/domain/repositories/location_repository.dart';

final sampleLocation = LocationFix(
  coordinate: const GeoCoordinate(latitude: 37.5665, longitude: 126.9780),
  accuracyMeters: 12,
  capturedAt: DateTime.utc(2026, 10, 10),
);

class FakeLocationRepository implements LocationRepository {
  Stream<Result<LocationFix>>? updates;

  @override
  Stream<Result<LocationFix>> watchLocation() =>
      updates ?? const Stream.empty();
  Result<bool> service = const Result.success(true);
  Result<LocationAccess> permission = const Result.success(
    LocationAccess.granted,
  );
  Result<LocationAccess> requestedPermission = const Result.success(
    LocationAccess.granted,
  );
  Result<LocationFix> location = Result.success(sampleLocation);
  Future<Result<LocationFix>>? pendingLocation;
  final calls = <String>[];

  @override
  Future<Result<bool>> isServiceEnabled() async {
    calls.add('service');
    return service;
  }

  @override
  Future<Result<LocationAccess>> checkPermission() async {
    calls.add('check');
    return permission;
  }

  @override
  Future<Result<LocationAccess>> requestPermission() async {
    calls.add('request');
    return requestedPermission;
  }

  @override
  Future<Result<LocationFix>> getCurrentLocation() async {
    calls.add('position');
    return pendingLocation == null ? location : await pendingLocation!;
  }

  @override
  Future<Result<bool>> openSettings(LocationSettingsTarget target) async {
    calls.add('settings:${target.name}');
    return const Result.success(true);
  }
}
