// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(placeRepository)
final placeRepositoryProvider = PlaceRepositoryProvider._();

final class PlaceRepositoryProvider
    extends
        $FunctionalProvider<PlaceRepository, PlaceRepository, PlaceRepository>
    with $Provider<PlaceRepository> {
  PlaceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlaceRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaceRepository create(Ref ref) {
    return placeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaceRepository>(value),
    );
  }
}

String _$placeRepositoryHash() => r'd3f2f600bc70aea131004dc3cca859814cca8ee0';

@ProviderFor(PlaceSearchNotifier)
final placeSearchProvider = PlaceSearchNotifierProvider._();

final class PlaceSearchNotifierProvider
    extends $NotifierProvider<PlaceSearchNotifier, AsyncValue<List<Place>>> {
  PlaceSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeSearchNotifierHash();

  @$internal
  @override
  PlaceSearchNotifier create() => PlaceSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Place>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Place>>>(value),
    );
  }
}

String _$placeSearchNotifierHash() =>
    r'9b7ae0a6f209a8a4b9ffde9614e9d0e661deef31';

abstract class _$PlaceSearchNotifier
    extends $Notifier<AsyncValue<List<Place>>> {
  AsyncValue<List<Place>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Place>>, AsyncValue<List<Place>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Place>>, AsyncValue<List<Place>>>,
              AsyncValue<List<Place>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
