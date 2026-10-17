import 'package:geolocator/geolocator.dart';

import '../../features/location/data/datasources/geolocator_data_source.dart';
import '../../features/location/data/mappers/location_mapper.dart';
import '../../features/location/data/repositories/location_repository_impl.dart';
import '../../features/location/domain/repositories/location_repository.dart';

LocationRepository createLocationRepository() => LocationRepositoryImpl(
  GeolocatorDataSource(GeolocatorPlatform.instance),
  const LocationMapper(),
);
