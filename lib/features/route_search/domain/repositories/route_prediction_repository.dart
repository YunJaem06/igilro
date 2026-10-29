import '../../../../core/error/result.dart';
import '../entities/model_route_prediction.dart';
import '../entities/prediction_coverage.dart';

abstract interface class RoutePredictionRepository {
  Future<Result<ModelRoutePrediction>> search(RoutePredictionQuery query);
  void cancelSearch();
  Future<Result<PredictionCoverage>> coverage();
  void cancelCoverage();
}
