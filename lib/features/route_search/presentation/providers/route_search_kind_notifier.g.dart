// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_search_kind_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouteSearchKindNotifier)
final routeSearchKindProvider = RouteSearchKindNotifierProvider._();

final class RouteSearchKindNotifierProvider
    extends $NotifierProvider<RouteSearchKindNotifier, RouteSearchKind> {
  RouteSearchKindNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeSearchKindProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeSearchKindNotifierHash();

  @$internal
  @override
  RouteSearchKindNotifier create() => RouteSearchKindNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteSearchKind value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteSearchKind>(value),
    );
  }
}

String _$routeSearchKindNotifierHash() =>
    r'9366bceb2fa6653564ec40f4e09488a50f083d5a';

abstract class _$RouteSearchKindNotifier extends $Notifier<RouteSearchKind> {
  RouteSearchKind build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RouteSearchKind, RouteSearchKind>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RouteSearchKind, RouteSearchKind>,
              RouteSearchKind,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
