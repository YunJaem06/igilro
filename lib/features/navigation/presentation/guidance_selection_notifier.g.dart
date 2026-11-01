// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guidance_selection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Map inspection is independent of GPS progress and scoped to one route result.

@ProviderFor(GuidanceSelectionNotifier)
final guidanceSelectionProvider = GuidanceSelectionNotifierFamily._();

/// Map inspection is independent of GPS progress and scoped to one route result.
final class GuidanceSelectionNotifierProvider
    extends $NotifierProvider<GuidanceSelectionNotifier, int?> {
  /// Map inspection is independent of GPS progress and scoped to one route result.
  GuidanceSelectionNotifierProvider._({
    required GuidanceSelectionNotifierFamily super.from,
    required (RouteGuidance, {Object routeKey}) super.argument,
  }) : super(
         retry: null,
         name: r'guidanceSelectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guidanceSelectionNotifierHash();

  @override
  String toString() {
    return r'guidanceSelectionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  GuidanceSelectionNotifier create() => GuidanceSelectionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GuidanceSelectionNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guidanceSelectionNotifierHash() =>
    r'82137ac1d562e9c29ae66e69c97a324fb1867e2e';

/// Map inspection is independent of GPS progress and scoped to one route result.

final class GuidanceSelectionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GuidanceSelectionNotifier,
          int?,
          int?,
          int?,
          (RouteGuidance, {Object routeKey})
        > {
  GuidanceSelectionNotifierFamily._()
    : super(
        retry: null,
        name: r'guidanceSelectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Map inspection is independent of GPS progress and scoped to one route result.

  GuidanceSelectionNotifierProvider call(
    RouteGuidance guidance, {
    required Object routeKey,
  }) => GuidanceSelectionNotifierProvider._(
    argument: (guidance, routeKey: routeKey),
    from: this,
  );

  @override
  String toString() => r'guidanceSelectionProvider';
}

/// Map inspection is independent of GPS progress and scoped to one route result.

abstract class _$GuidanceSelectionNotifier extends $Notifier<int?> {
  late final _$args = ref.$arg as (RouteGuidance, {Object routeKey});
  RouteGuidance get guidance => _$args.$1;
  Object get routeKey => _$args.routeKey;

  int? build(RouteGuidance guidance, {required Object routeKey});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(_$args.$1, routeKey: _$args.routeKey),
    );
  }
}
