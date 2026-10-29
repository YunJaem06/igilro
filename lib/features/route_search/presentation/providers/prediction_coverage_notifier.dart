import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../domain/entities/prediction_coverage.dart';
import 'route_prediction_providers.dart';

part 'prediction_coverage_notifier.g.dart';

@Riverpod(retry: _noRetry)
class PredictionCoverageNotifier extends _$PredictionCoverageNotifier {
  @override
  Future<PredictionCoverage> build() async {
    final repository = ref.watch(routePredictionRepositoryProvider);
    ref.onDispose(repository.cancelCoverage);
    final result = await repository.coverage();
    return switch (result) {
      Success<PredictionCoverage>(:final value) => value,
      Failed<PredictionCoverage>(:final failure) => throw failure,
    };
  }
}

Duration? _noRetry(int retryCount, Object error) => null;
