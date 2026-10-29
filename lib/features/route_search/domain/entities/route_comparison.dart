import 'model_route_prediction.dart';

final class RouteComparison {
  const RouteComparison({required this.fastest, required this.shade});
  final ModelRoutePrediction fastest;
  final ModelRoutePrediction shade;
  ModelRoutePrediction forMode(RoutePredictionMode mode) =>
      mode == RoutePredictionMode.fastest ? fastest : shade;
}
