// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_clock.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A replaceable clock for session timestamps and location freshness checks.

@ProviderFor(navigationNow)
final navigationNowProvider = NavigationNowProvider._();

/// A replaceable clock for session timestamps and location freshness checks.

final class NavigationNowProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// A replaceable clock for session timestamps and location freshness checks.
  NavigationNowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationNowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationNowHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return navigationNow(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$navigationNowHash() => r'8de037fa860d449a6ed7f79849e8a8bd10622cbb';
