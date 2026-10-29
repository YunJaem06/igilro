import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/model_route_prediction.dart';
import '../entities/route_comparison.dart';
import '../entities/route_endpoints.dart';
import 'search_route_prediction_use_case.dart';

final class CompareRoutePredictionsUseCase {
  CompareRoutePredictionsUseCase(this._search);
  final SearchRoutePredictionUseCase _search;
  int _generation = 0;
  void cancel() {
    _generation++;
    _search.cancel();
  }

  Future<Result<RouteComparison>> call(
    RouteEndpoints endpoints, {
    DateTime? departureAt,
  }) async {
    cancel();
    final generation = _generation;
    final instant = (departureAt ?? DateTime.now()).toUtc();
    final fastest = await _search(
      endpoints,
      mode: RoutePredictionMode.fastest,
      departureAt: instant,
    );
    if (generation != _generation) {
      return const Result.failure(Failure(type: FailureType.cancelled));
    }
    if (fastest case Failed<ModelRoutePrediction>(:final failure)) {
      return Result.failure(failure);
    }
    final shade = await _search(
      endpoints,
      mode: RoutePredictionMode.shade,
      departureAt: instant,
    );
    if (generation != _generation) {
      return const Result.failure(Failure(type: FailureType.cancelled));
    }
    if (shade case Failed<ModelRoutePrediction>(:final failure)) {
      return Result.failure(failure);
    }
    final a = (fastest as Success<ModelRoutePrediction>).value;
    final b = (shade as Success<ModelRoutePrediction>).value;
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
    return Result.success(RouteComparison(fastest: a, shade: b));
  }
}
