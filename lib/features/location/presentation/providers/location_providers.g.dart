// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationRepository)
final locationRepositoryProvider = LocationRepositoryProvider._();

final class LocationRepositoryProvider
    extends
        $FunctionalProvider<
          LocationRepository,
          LocationRepository,
          LocationRepository
        >
    with $Provider<LocationRepository> {
  LocationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationRepository create(Ref ref) {
    return locationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationRepository>(value),
    );
  }
}

String _$locationRepositoryHash() =>
    r'15a3edb4b95b1a040d28e665fc367adff87594cc';

@ProviderFor(getCurrentLocationUseCase)
final getCurrentLocationUseCaseProvider = GetCurrentLocationUseCaseProvider._();

final class GetCurrentLocationUseCaseProvider
    extends
        $FunctionalProvider<
          GetCurrentLocationUseCase,
          GetCurrentLocationUseCase,
          GetCurrentLocationUseCase
        >
    with $Provider<GetCurrentLocationUseCase> {
  GetCurrentLocationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentLocationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentLocationUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentLocationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentLocationUseCase create(Ref ref) {
    return getCurrentLocationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentLocationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentLocationUseCase>(value),
    );
  }
}

String _$getCurrentLocationUseCaseHash() =>
    r'3a95ac323e90dbfaf17e06f384d3909e97eb50bc';

@ProviderFor(openLocationSettingsUseCase)
final openLocationSettingsUseCaseProvider =
    OpenLocationSettingsUseCaseProvider._();

final class OpenLocationSettingsUseCaseProvider
    extends
        $FunctionalProvider<
          OpenLocationSettingsUseCase,
          OpenLocationSettingsUseCase,
          OpenLocationSettingsUseCase
        >
    with $Provider<OpenLocationSettingsUseCase> {
  OpenLocationSettingsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'openLocationSettingsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$openLocationSettingsUseCaseHash();

  @$internal
  @override
  $ProviderElement<OpenLocationSettingsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OpenLocationSettingsUseCase create(Ref ref) {
    return openLocationSettingsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OpenLocationSettingsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OpenLocationSettingsUseCase>(value),
    );
  }
}

String _$openLocationSettingsUseCaseHash() =>
    r'3276431b2626303f002935695acf245db64bfb53';
