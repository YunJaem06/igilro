// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouteSearchNotifier)
final routeSearchProvider = RouteSearchNotifierProvider._();

final class RouteSearchNotifierProvider
    extends $AsyncNotifierProvider<RouteSearchNotifier, RouteSearchResult?> {
  RouteSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeSearchNotifierHash();

  @$internal
  @override
  RouteSearchNotifier create() => RouteSearchNotifier();
}

String _$routeSearchNotifierHash() =>
    r'0fdbb63dc1ce8e7532ec562960706dac96f64bb7';

abstract class _$RouteSearchNotifier
    extends $AsyncNotifier<RouteSearchResult?> {
  FutureOr<RouteSearchResult?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RouteSearchResult?>, RouteSearchResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RouteSearchResult?>, RouteSearchResult?>,
              AsyncValue<RouteSearchResult?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
