import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/route_comparison.dart';
import '../../domain/usecases/compare_route_predictions_use_case.dart';
import 'route_prediction_providers.dart';
import 'route_selection_notifier.dart';
import 'route_search_kind_notifier.dart';

part 'route_comparison_notifier.g.dart';

@riverpod
class RouteComparisonNotifier extends _$RouteComparisonNotifier {
  int _revision = 0;
  CompareRoutePredictionsUseCase? _pending;
  @override
  FutureOr<RouteComparison?> build() {
    ref.watch(routeSelectionProvider.select((value) => value.endpoints));
    ref.watch(
      routePredictionOptionsProvider.select((value) => value.departureAt),
    );
    ref.watch(routeSearchKindProvider);
    _revision++;
    ref.onDispose(() {
      _revision++;
      _pending?.cancel();
      _pending = null;
    });
    return null;
  }

  Future<void> search() async {
    if (state.isLoading ||
        ref.read(routeSearchKindProvider) != RouteSearchKind.prediction) {
      return;
    }
    final revision = ++_revision;
    final useCase = CompareRoutePredictionsUseCase(
      ref.read(searchRoutePredictionUseCaseProvider),
    );
    _pending = useCase;
    state = const AsyncLoading();
    final result = await useCase(
      ref.read(routeSelectionProvider).endpoints,
      departureAt: ref.read(routePredictionOptionsProvider).departureAt,
    );
    if (!ref.mounted || revision != _revision) return;
    _pending = null;
    state = switch (result) {
      Success<RouteComparison>(:final value) => AsyncData(value),
      Failed<RouteComparison>(failure: Failure(type: FailureType.cancelled)) =>
        const AsyncData(null),
      Failed<RouteComparison>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }
}
