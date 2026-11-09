// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_reroute_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Keeps the old route available until a replacement search succeeds.

@ProviderFor(NavigationRerouteNotifier)
final navigationRerouteProvider = NavigationRerouteNotifierProvider._();

/// Keeps the old route available until a replacement search succeeds.
final class NavigationRerouteNotifierProvider
    extends $NotifierProvider<NavigationRerouteNotifier, AsyncValue<void>> {
  /// Keeps the old route available until a replacement search succeeds.
  NavigationRerouteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationRerouteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationRerouteNotifierHash();

  @$internal
  @override
  NavigationRerouteNotifier create() => NavigationRerouteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$navigationRerouteNotifierHash() =>
    r'19ef0226fe5116a9f75a0c76526d40713b0b19f3';

/// Keeps the old route available until a replacement search succeeds.

abstract class _$NavigationRerouteNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
