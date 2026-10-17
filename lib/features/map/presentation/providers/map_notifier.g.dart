// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App DI overrides availability; the feature never reads application config.

@ProviderFor(mapConfigured)
final mapConfiguredProvider = MapConfiguredProvider._();

/// App DI overrides availability; the feature never reads application config.

final class MapConfiguredProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// App DI overrides availability; the feature never reads application config.
  MapConfiguredProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapConfiguredProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapConfiguredHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return mapConfigured(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mapConfiguredHash() => r'a3bccb502718e7c6735c3d79bd7ed4b23fb4f318';

@ProviderFor(MapNotifier)
final mapProvider = MapNotifierProvider._();

final class MapNotifierProvider
    extends $NotifierProvider<MapNotifier, MapState> {
  MapNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapNotifierHash();

  @$internal
  @override
  MapNotifier create() => MapNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
    );
  }
}

String _$mapNotifierHash() => r'e3a9507789b8f5fd9c61c130d1235738e5752502';

abstract class _$MapNotifier extends $Notifier<MapState> {
  MapState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MapState, MapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapState, MapState>,
              MapState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
