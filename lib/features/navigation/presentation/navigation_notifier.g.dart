// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NavigationNotifier)
final navigationProvider = NavigationNotifierProvider._();

final class NavigationNotifierProvider
    extends $NotifierProvider<NavigationNotifier, GuidanceState> {
  NavigationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationNotifierHash();

  @$internal
  @override
  NavigationNotifier create() => NavigationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuidanceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuidanceState>(value),
    );
  }
}

String _$navigationNotifierHash() =>
    r'2e35eff34d24408a5b1b18635b00d6dbfea47931';

abstract class _$NavigationNotifier extends $Notifier<GuidanceState> {
  GuidanceState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GuidanceState, GuidanceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GuidanceState, GuidanceState>,
              GuidanceState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
