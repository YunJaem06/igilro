import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/model_route_prediction.dart';
import 'route_prediction_providers.dart';
import 'route_search_kind_notifier.dart';
import 'route_selection_notifier.dart';

part 'route_prediction_notifier.g.dart';

@riverpod
class RoutePredictionNotifier extends _$RoutePredictionNotifier {
  int _revision = 0;
  void Function()? _cancelPending;

  @override
  FutureOr<ModelRoutePrediction?> build() {
    ref.watch(routeSelectionProvider.select((state) => state.endpoints));
    ref.watch(routePredictionOptionsProvider);
    ref.watch(routeSearchKindProvider);
    _revision++;
    ref.onDispose(() {
      _revision++;
      _cancelPending?.call();
      _cancelPending = null;
    });
    return null;
  }

  Future<void> search() async {
    if (state.isLoading ||
        ref.read(routeSearchKindProvider) != RouteSearchKind.prediction) {
      return;
    }
    final endpoints = ref.read(routeSelectionProvider).endpoints;
    final options = ref.read(routePredictionOptionsProvider);
    final useCase = ref.read(searchRoutePredictionUseCaseProvider);
    final revision = ++_revision;
    _cancelPending = useCase.cancel;
    state = const AsyncLoading();
    final result = await useCase(
      endpoints,
      mode: options.mode,
      departureAt: options.departureAt,
    );
    if (!ref.mounted || revision != _revision) return;
    _cancelPending = null;
    state = switch (result) {
      Success<ModelRoutePrediction>(:final value) => AsyncData(value),
      Failed<ModelRoutePrediction>(
        failure: Failure(type: FailureType.cancelled),
      ) =>
        const AsyncData(null),
      Failed<ModelRoutePrediction>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }
}
