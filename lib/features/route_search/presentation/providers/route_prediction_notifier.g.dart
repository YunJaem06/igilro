// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_prediction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RoutePredictionNotifier)
final routePredictionProvider = RoutePredictionNotifierProvider._();

final class RoutePredictionNotifierProvider
    extends
        $AsyncNotifierProvider<RoutePredictionNotifier, ModelRoutePrediction?> {
  RoutePredictionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routePredictionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routePredictionNotifierHash();

  @$internal
  @override
  RoutePredictionNotifier create() => RoutePredictionNotifier();
}

String _$routePredictionNotifierHash() =>
    r'a61d18a07a8b85af96406da094cc522fa38ea722';

abstract class _$RoutePredictionNotifier
    extends $AsyncNotifier<ModelRoutePrediction?> {
  FutureOr<ModelRoutePrediction?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ModelRoutePrediction?>, ModelRoutePrediction?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ModelRoutePrediction?>,
                ModelRoutePrediction?
              >,
              AsyncValue<ModelRoutePrediction?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
