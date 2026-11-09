import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/result.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/route_comparison.dart';
import '../../domain/usecases/compare_route_predictions_use_case.dart';
import 'route_prediction_providers.dart';
import 'route_search_cooldown_notifier.dart';
import 'route_selection_notifier.dart';
import 'route_search_kind_notifier.dart';

part 'route_comparison_notifier.g.dart';

@riverpod
class RouteComparisonNotifier extends _$RouteComparisonNotifier {
  int _revision = 0;
  CompareRoutePredictionsUseCase? _pending;

  bool get hasFastestToCompare => _pending?.hasFastestToCompare ?? false;

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

  void applyRerouteResult(RouteComparison result) {
    _revision++;
    _pending?.cancel();
    _pending = null;
    state = AsyncData(result);
  }

  Future<void> search() async {
    if (state.isLoading ||
        ref.read(routeSearchCooldownProvider) > 0 ||
        ref.read(routeSearchKindProvider) != RouteSearchKind.prediction) {
      return;
    }
    final revision = ++_revision;
    final useCase =
        _pending ??
        CompareRoutePredictionsUseCase(
          ref.read(searchRoutePredictionUseCaseProvider),
        );
    _pending = useCase;
    state = const AsyncLoading();
    final result = useCase.canRetry
        ? await useCase.retry()
        : await useCase(
            ref.read(routeSelectionProvider).endpoints,
            departureAt: ref.read(routePredictionOptionsProvider).departureAt,
          );
    if (!ref.mounted || revision != _revision) return;
    if (!useCase.canRetry) _pending = null;
    if (result case Failed<RouteComparison>(:final failure)) {
      ref.read(routeSearchCooldownProvider.notifier).apply(failure);
    }
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
