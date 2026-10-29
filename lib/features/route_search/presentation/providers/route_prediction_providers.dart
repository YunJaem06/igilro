import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/model_route_prediction.dart';
import '../../domain/repositories/route_prediction_repository.dart';
import '../../domain/usecases/search_route_prediction_use_case.dart';
import '../state/route_prediction_options.dart';

part 'route_prediction_providers.g.dart';

@Riverpod(keepAlive: true)
RoutePredictionRepository routePredictionRepository(Ref ref) {
  throw StateError(
    'routePredictionRepositoryProvider must be overridden by app DI.',
  );
}

@riverpod
SearchRoutePredictionUseCase searchRoutePredictionUseCase(Ref ref) =>
    SearchRoutePredictionUseCase(ref.watch(routePredictionRepositoryProvider));

@riverpod
class RoutePredictionOptionsNotifier extends _$RoutePredictionOptionsNotifier {
  @override
  RoutePredictionOptions build() => const RoutePredictionOptions();

  void selectMode(RoutePredictionMode mode, {DateTime? evaluatedAt}) =>
      state = state.copyWith(
        mode: mode,
        departureAt: state.departureAt ?? evaluatedAt?.toUtc(),
      );

  void setDepartureAt(DateTime? value) =>
      state = state.copyWith(departureAt: value?.toUtc());
}
