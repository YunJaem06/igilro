// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_route_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeRoute)
final activeRouteProvider = ActiveRouteProvider._();

final class ActiveRouteProvider
    extends $FunctionalProvider<ActiveRoute?, ActiveRoute?, ActiveRoute?>
    with $Provider<ActiveRoute?> {
  ActiveRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeRouteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeRouteHash();

  @$internal
  @override
  $ProviderElement<ActiveRoute?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ActiveRoute? create(Ref ref) {
    return activeRoute(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActiveRoute? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActiveRoute?>(value),
    );
  }
}

String _$activeRouteHash() => r'4e976da21373d56bd4ed7e76b9635e8b25763d0c';
