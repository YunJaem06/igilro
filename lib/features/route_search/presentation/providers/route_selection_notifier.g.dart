// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_selection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouteSelectionNotifier)
final routeSelectionProvider = RouteSelectionNotifierProvider._();

final class RouteSelectionNotifierProvider
    extends $NotifierProvider<RouteSelectionNotifier, RouteSelectionState> {
  RouteSelectionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeSelectionNotifierHash();

  @$internal
  @override
  RouteSelectionNotifier create() => RouteSelectionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteSelectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteSelectionState>(value),
    );
  }
}

String _$routeSelectionNotifierHash() =>
    r'9a34132785facb052cab95a90d7d6dd060c0714e';

abstract class _$RouteSelectionNotifier extends $Notifier<RouteSelectionState> {
  RouteSelectionState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RouteSelectionState, RouteSelectionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RouteSelectionState, RouteSelectionState>,
              RouteSelectionState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
