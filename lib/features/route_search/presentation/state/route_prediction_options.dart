import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/model_route_prediction.dart';

part 'route_prediction_options.freezed.dart';

@freezed
abstract class RoutePredictionOptions with _$RoutePredictionOptions {
  const factory RoutePredictionOptions({
    @Default(RoutePredictionMode.shade) RoutePredictionMode mode,
    DateTime? departureAt,
  }) = _RoutePredictionOptions;
}
