// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaceSearchNotifier)
final placeSearchProvider = PlaceSearchNotifierProvider._();

final class PlaceSearchNotifierProvider
    extends $AsyncNotifierProvider<PlaceSearchNotifier, List<Place>?> {
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
}

String _$placeSearchNotifierHash() =>
    r'b0f50d6c97fafdc9a0857730a330cab5cc5161e8';

abstract class _$PlaceSearchNotifier extends $AsyncNotifier<List<Place>?> {
  FutureOr<List<Place>?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Place>?>, List<Place>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Place>?>, List<Place>?>,
              AsyncValue<List<Place>?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
