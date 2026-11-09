import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/model_route_prediction.dart';
import '../entities/route_comparison.dart';
import '../entities/route_endpoints.dart';
import 'search_route_prediction_use_case.dart';

typedef _ComparisonAttempt = ({
  RouteEndpoints endpoints,
  DateTime departureAt,
  ModelRoutePrediction? fastest,
});

final class CompareRoutePredictionsUseCase {
  CompareRoutePredictionsUseCase(
    this._search, {
    this._alternativeMode = RoutePredictionMode.shade,
  });
  final SearchRoutePredictionUseCase _search;
  final RoutePredictionMode _alternativeMode;
  static const _cancelled = Result<RouteComparison>.failure(
    Failure(type: FailureType.cancelled),
  );
  int _generation = 0;
  _ComparisonAttempt? _retry;

  bool get canRetry => _retry != null;
  bool get hasFastestToCompare => _retry?.fastest != null;

  void cancel() {
    _generation++;
    _retry = null;
    _search.cancel();
  }

  Future<Result<RouteComparison>> call(
    RouteEndpoints endpoints, {
    DateTime? departureAt,
  }) => _compare((
    endpoints: endpoints,
    departureAt: (departureAt ?? DateTime.now()).toUtc(),
    fastest: null,
  ));

  Future<Result<RouteComparison>> retry() async {
    final attempt = _retry;
    return attempt == null ? _cancelled : _compare(attempt);
  }

  Future<Result<RouteComparison>> _compare(_ComparisonAttempt attempt) async {
    cancel();
    final generation = _generation;
    var fastest = attempt.fastest;
    if (fastest == null) {
      final result = await _search(
        attempt.endpoints,
        mode: RoutePredictionMode.fastest,
        departureAt: attempt.departureAt,
      );
      if (generation != _generation) return _cancelled;
      if (result case Failed<ModelRoutePrediction>(:final failure)) {
        if (failure.isThrottled) _retry = attempt;
        return Result.failure(failure);
      }
      fastest = (result as Success<ModelRoutePrediction>).value;
    }
    final alternative = await _search(
      attempt.endpoints,
      mode: _alternativeMode,
      departureAt: attempt.departureAt,
    );
    if (generation != _generation) return _cancelled;
    if (alternative case Failed<ModelRoutePrediction>(:final failure)) {
      if (failure.isThrottled) {
        _retry = (
          endpoints: attempt.endpoints,
          departureAt: attempt.departureAt,
          fastest: fastest,
        );
      }
      return Result.failure(failure);
    }
    final a = fastest;
    final b = (alternative as Success<ModelRoutePrediction>).value;
    if (a.evaluatedAt != b.evaluatedAt ||
        a.dataVersion != b.dataVersion ||
        a.predictionDataVersion != b.predictionDataVersion ||
        a.snapping != b.snapping ||
        a.modelVersion != b.modelVersion ||
        a.timeModelVersion != b.timeModelVersion ||
        a.baselineDuration != b.baselineDuration ||
        (a.routes.first.prediction.modeledShadeRatio -
                    b.routes.first.prediction.baselineModeledShadeRatio)
                .abs() >
            1e-6 ||
        a.routes.first.duration != b.baselineDuration) {
      return const Result.failure(
        Failure(type: FailureType.invalidData, code: 'COMPARISON_CHANGED'),
      );
    }
    return Result.success(RouteComparison(fastest: a, alternative: b));
  }
}
