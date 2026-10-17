import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/data/datasources/geolocator_data_source.dart';
import 'package:igilro/features/location/data/mappers/location_mapper.dart';
import 'package:igilro/features/location/data/repositories/location_repository_impl.dart';
import 'package:igilro/features/location/domain/entities/location_access.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';

void main() {
  late FakeLocationPlatform platform;
  late LocationRepositoryImpl repository;
  setUp(() {
    platform = FakeLocationPlatform();
    repository = LocationRepositoryImpl(
      GeolocatorDataSource(platform),
      const LocationMapper(),
    );
  });

  test('maps latitude, longitude, timestamp and approximate accuracy without losing precision', () async {
    platform.position = positionAt(
      latitude: 37.1234,
      longitude: 127.4321,
      accuracy: 1500,
    );
    final fix =
        (await repository.getCurrentLocation() as Success<LocationFix>).value;
    expect(fix.coordinate.latitude, 37.1234);
    expect(fix.coordinate.longitude, 127.4321);
    expect(fix.accuracyMeters, 1500);
    expect(fix.capturedAt, platform.position.timestamp);
    expect(platform.settings?.timeLimit, const Duration(seconds: 20));
  });

  for (final permission in LocationPermission.values) {
    test('maps platform permission $permission to a domain value', () async {
      platform.permission = permission;
      final access =
          (await repository.checkPermission() as Success<LocationAccess>).value;
      expect(access, switch (permission) {
        LocationPermission.always ||
        LocationPermission.whileInUse => LocationAccess.granted,
        LocationPermission.deniedForever => LocationAccess.deniedForever,
        _ => LocationAccess.denied,
      });
    });
  }

  final errors = <Object, FailureType>{
    TimeoutException('test'): FailureType.timeout,
    const LocationServiceDisabledException(): FailureType.serviceDisabled,
    const PermissionDeniedException('test'): FailureType.permissionDenied,
    const PositionUpdateException('test'): FailureType.unexpected,
    PlatformException(code: 'TEST'): FailureType.unexpected,
  };
  for (final entry in errors.entries) {
    test('converts ${entry.key.runtimeType} into a typed failure', () async {
      platform.error = entry.key;
      expect(
        (await repository.getCurrentLocation() as Failed<LocationFix>)
            .failure
            .type,
        entry.value,
      );
    });
  }

  for (final position in [
    positionAt(latitude: double.nan),
    positionAt(latitude: 91),
    positionAt(longitude: 181),
    positionAt(accuracy: -1),
  ]) {
    test(
      'invalid coordinates/accuracy never escape as a domain entity: $position',
      () async {
        platform.position = position;
        expect(
          (await repository.getCurrentLocation() as Failed<LocationFix>)
              .failure
              .type,
          FailureType.invalidData,
        );
      },
    );
  }

  test(
    'programming errors are not swallowed by repository error mapping',
    () async {
      platform.error = StateError('bug');
      expect(repository.getCurrentLocation(), throwsStateError);
    },
  );
}

class FakeLocationPlatform extends GeolocatorPlatform {
  LocationPermission permission = LocationPermission.whileInUse;
  Position position = positionAt();
  LocationSettings? settings;
  Object? error;

  @override
  Future<LocationPermission> checkPermission() async => permission;

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    settings = locationSettings;
    if (error != null) throw error!;
    return position;
  }
}

Position positionAt({
  double latitude = 37.5,
  double longitude = 127,
  double accuracy = 10,
}) => Position(
  latitude: latitude,
  longitude: longitude,
  accuracy: accuracy,
  timestamp: DateTime.utc(2026, 10, 10),
  altitude: 0,
  altitudeAccuracy: 0,
  heading: 0,
  headingAccuracy: 0,
  speed: 0,
  speedAccuracy: 0,
);
