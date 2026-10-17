import 'dart:async';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/location_access.dart';
import '../../domain/entities/location_fix.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/geolocator_data_source.dart';
import '../mappers/location_mapper.dart';

final class LocationRepositoryImpl implements LocationRepository {
  const LocationRepositoryImpl(this._source, this._mapper);

  final GeolocatorDataSource _source;
  final LocationMapper _mapper;

  @override
  Future<Result<bool>> isServiceEnabled() => _guard(_source.isServiceEnabled);

  @override
  Future<Result<LocationAccess>> checkPermission() =>
      _guard(() async => _mapper.toAccess(await _source.checkPermission()));

  @override
  Future<Result<LocationAccess>> requestPermission() =>
      _guard(() async => _mapper.toAccess(await _source.requestPermission()));

  @override
  Future<Result<LocationFix>> getCurrentLocation() =>
      _guard(() async => _mapper.toFix(await _source.getCurrentPosition()));

  @override
  Future<Result<bool>> openSettings(LocationSettingsTarget target) =>
      _guard(() => _source.openSettings(target));

  Future<Result<T>> _guard<T>(Future<T> Function() operation) async {
    try {
      return Result.success(await operation());
    } on TimeoutException {
      return const Result.failure(Failure(type: FailureType.timeout));
    } on LocationServiceDisabledException {
      return const Result.failure(Failure(type: FailureType.serviceDisabled));
    } on PermissionDeniedException {
      return const Result.failure(Failure(type: FailureType.permissionDenied));
    } on FormatException {
      return const Result.failure(Failure(type: FailureType.invalidData));
    } on PlatformException {
      return const Result.failure(Failure(type: FailureType.unexpected));
    } on PositionUpdateException {
      return const Result.failure(Failure(type: FailureType.unexpected));
    }
  }
}
