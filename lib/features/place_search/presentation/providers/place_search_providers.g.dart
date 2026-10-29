// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_providers.dart';

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

String _$placeRepositoryHash() => r'a79441dc205872f82dbda6c31dcb696afd452175';

@ProviderFor(searchPlacesUseCase)
final searchPlacesUseCaseProvider = SearchPlacesUseCaseProvider._();

final class SearchPlacesUseCaseProvider
    extends
        $FunctionalProvider<
          SearchPlacesUseCase,
          SearchPlacesUseCase,
          SearchPlacesUseCase
        >
    with $Provider<SearchPlacesUseCase> {
  SearchPlacesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchPlacesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchPlacesUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchPlacesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchPlacesUseCase create(Ref ref) {
    return searchPlacesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchPlacesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchPlacesUseCase>(value),
    );
  }
}

String _$searchPlacesUseCaseHash() =>
    r'696486b4e2556d15a2c472e565e559c7b9988b23';
