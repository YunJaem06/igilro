// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routeRepository)
final routeRepositoryProvider = RouteRepositoryProvider._();

final class RouteRepositoryProvider
    extends
        $FunctionalProvider<RouteRepository, RouteRepository, RouteRepository>
    with $Provider<RouteRepository> {
  RouteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeRepositoryHash();

  @$internal
  @override
  $ProviderElement<RouteRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouteRepository create(Ref ref) {
    return routeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteRepository>(value),
    );
  }
}

String _$routeRepositoryHash() => r'5a1ada46edb56fa2160faaa6b0beeaa54ebf3ed2';

@ProviderFor(searchRouteUseCase)
final searchRouteUseCaseProvider = SearchRouteUseCaseProvider._();

final class SearchRouteUseCaseProvider
    extends
        $FunctionalProvider<
          SearchRouteUseCase,
          SearchRouteUseCase,
          SearchRouteUseCase
        >
    with $Provider<SearchRouteUseCase> {
  SearchRouteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchRouteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchRouteUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchRouteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchRouteUseCase create(Ref ref) {
    return searchRouteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchRouteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchRouteUseCase>(value),
    );
  }
}

String _$searchRouteUseCaseHash() =>
    r'f414b5255cbd17a05aa9287e458142f528a6e117';
