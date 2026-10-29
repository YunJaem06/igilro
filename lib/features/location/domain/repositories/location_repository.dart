import '../../../../core/error/result.dart';
import '../entities/location_access.dart';
import '../entities/location_fix.dart';

abstract interface class LocationRepository {
  Future<Result<bool>> isServiceEnabled();
  Future<Result<LocationAccess>> checkPermission();
  Future<Result<LocationAccess>> requestPermission();
  Future<Result<LocationFix>> getCurrentLocation();
  Stream<Result<LocationFix>> watchLocation();
  Future<Result<bool>> openSettings(LocationSettingsTarget target);
}
