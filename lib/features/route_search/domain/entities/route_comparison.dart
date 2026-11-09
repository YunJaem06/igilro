import 'model_route_prediction.dart';

final class RouteComparison {
  const RouteComparison({required this.fastest, required this.alternative});
  final ModelRoutePrediction fastest;
  final ModelRoutePrediction alternative;
  ModelRoutePrediction forMode(RoutePredictionMode mode) =>
      mode == RoutePredictionMode.fastest ? fastest : alternative;
  ModelRoutePrediction otherThan(RoutePredictionMode mode) =>
      mode == RoutePredictionMode.fastest ? alternative : fastest;
}
