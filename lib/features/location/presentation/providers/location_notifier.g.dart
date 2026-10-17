// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocationNotifier)
final locationProvider = LocationNotifierProvider._();

final class LocationNotifierProvider
    extends $AsyncNotifierProvider<LocationNotifier, LocationFix?> {
  LocationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationNotifierHash();

  @$internal
  @override
  LocationNotifier create() => LocationNotifier();
}

String _$locationNotifierHash() => r'890d665b124172721ffeee4aa7996179c8769d5a';

abstract class _$LocationNotifier extends $AsyncNotifier<LocationFix?> {
  FutureOr<LocationFix?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LocationFix?>, LocationFix?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocationFix?>, LocationFix?>,
              AsyncValue<LocationFix?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
