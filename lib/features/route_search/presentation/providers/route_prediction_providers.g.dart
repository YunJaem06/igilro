// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_prediction_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routePredictionRepository)
final routePredictionRepositoryProvider = RoutePredictionRepositoryProvider._();

final class RoutePredictionRepositoryProvider
    extends
        $FunctionalProvider<
          RoutePredictionRepository,
          RoutePredictionRepository,
          RoutePredictionRepository
        >
    with $Provider<RoutePredictionRepository> {
  RoutePredictionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routePredictionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routePredictionRepositoryHash();

  @$internal
  @override
  $ProviderElement<RoutePredictionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoutePredictionRepository create(Ref ref) {
    return routePredictionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutePredictionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutePredictionRepository>(value),
    );
  }
}

String _$routePredictionRepositoryHash() =>
    r'485dbbdfb4322528237f6143ce84b654c58b562f';

@ProviderFor(searchRoutePredictionUseCase)
final searchRoutePredictionUseCaseProvider =
    SearchRoutePredictionUseCaseProvider._();

final class SearchRoutePredictionUseCaseProvider
    extends
        $FunctionalProvider<
          SearchRoutePredictionUseCase,
          SearchRoutePredictionUseCase,
          SearchRoutePredictionUseCase
        >
    with $Provider<SearchRoutePredictionUseCase> {
  SearchRoutePredictionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchRoutePredictionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchRoutePredictionUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchRoutePredictionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchRoutePredictionUseCase create(Ref ref) {
    return searchRoutePredictionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchRoutePredictionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchRoutePredictionUseCase>(value),
    );
  }
}

String _$searchRoutePredictionUseCaseHash() =>
    r'91c7fc608018dcf70c91c78264337c723a8327a1';

@ProviderFor(RoutePredictionOptionsNotifier)
final routePredictionOptionsProvider =
    RoutePredictionOptionsNotifierProvider._();

final class RoutePredictionOptionsNotifierProvider
    extends
        $NotifierProvider<
          RoutePredictionOptionsNotifier,
          RoutePredictionOptions
        > {
  RoutePredictionOptionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routePredictionOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routePredictionOptionsNotifierHash();

  @$internal
  @override
  RoutePredictionOptionsNotifier create() => RoutePredictionOptionsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutePredictionOptions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutePredictionOptions>(value),
    );
  }
}

String _$routePredictionOptionsNotifierHash() =>
    r'3b82d7ba820cb406b179f79672d6c55cf243945e';

abstract class _$RoutePredictionOptionsNotifier
    extends $Notifier<RoutePredictionOptions> {
  RoutePredictionOptions build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<RoutePredictionOptions, RoutePredictionOptions>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RoutePredictionOptions, RoutePredictionOptions>,
              RoutePredictionOptions,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
