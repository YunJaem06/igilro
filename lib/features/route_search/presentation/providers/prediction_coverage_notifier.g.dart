// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_coverage_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PredictionCoverageNotifier)
final predictionCoverageProvider = PredictionCoverageNotifierProvider._();

final class PredictionCoverageNotifierProvider
    extends
        $AsyncNotifierProvider<PredictionCoverageNotifier, PredictionCoverage> {
  PredictionCoverageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'predictionCoverageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$predictionCoverageNotifierHash();

  @$internal
  @override
  PredictionCoverageNotifier create() => PredictionCoverageNotifier();
}

String _$predictionCoverageNotifierHash() =>
    r'e7b04537321586cefbd9e8f1a847961192ca4c83';

abstract class _$PredictionCoverageNotifier
    extends $AsyncNotifier<PredictionCoverage> {
  FutureOr<PredictionCoverage> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PredictionCoverage>, PredictionCoverage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PredictionCoverage>, PredictionCoverage>,
              AsyncValue<PredictionCoverage>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
