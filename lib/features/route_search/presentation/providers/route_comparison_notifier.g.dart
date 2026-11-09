// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_comparison_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouteComparisonNotifier)
final routeComparisonProvider = RouteComparisonNotifierProvider._();

final class RouteComparisonNotifierProvider
    extends $AsyncNotifierProvider<RouteComparisonNotifier, RouteComparison?> {
  RouteComparisonNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeComparisonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeComparisonNotifierHash();

  @$internal
  @override
  RouteComparisonNotifier create() => RouteComparisonNotifier();
}

String _$routeComparisonNotifierHash() =>
    r'1a25d9adcb0e84677e23d6a7a1e70b23fce1e985';

abstract class _$RouteComparisonNotifier
    extends $AsyncNotifier<RouteComparison?> {
  FutureOr<RouteComparison?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RouteComparison?>, RouteComparison?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RouteComparison?>, RouteComparison?>,
              AsyncValue<RouteComparison?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
