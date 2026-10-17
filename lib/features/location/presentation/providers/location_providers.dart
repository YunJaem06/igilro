import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/location_repository.dart';
import '../../domain/usecases/get_current_location_use_case.dart';
import '../../domain/usecases/open_location_settings_use_case.dart';

part 'location_providers.g.dart';

@Riverpod(keepAlive: true)
LocationRepository locationRepository(Ref ref) {
  throw StateError('locationRepositoryProvider must be overridden by app DI.');
}

@riverpod
GetCurrentLocationUseCase getCurrentLocationUseCase(Ref ref) =>
    GetCurrentLocationUseCase(ref.watch(locationRepositoryProvider));

@riverpod
OpenLocationSettingsUseCase openLocationSettingsUseCase(Ref ref) =>
    OpenLocationSettingsUseCase(ref.watch(locationRepositoryProvider));
