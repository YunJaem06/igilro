import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/route_search_result.dart';
import 'route_search_providers.dart';
import 'route_search_kind_notifier.dart';
import 'route_selection_notifier.dart';

part 'route_search_notifier.g.dart';

@riverpod
class RouteSearchNotifier extends _$RouteSearchNotifier {
  int _requestRevision = 0;
  void Function()? _cancelPending;

  @override
  FutureOr<RouteSearchResult?> build() {
    // Committed input changes invalidate results; map previews do not.
    ref.watch(routeSelectionProvider.select((state) => state.endpoints));
    ref.watch(routeSearchKindProvider);
    _requestRevision++;
    ref.onDispose(() {
      _requestRevision++;
      _cancelPending?.call();
      _cancelPending = null;
    });
    return null;
  }

  Future<void> search({DateTime? departureAt}) async {
    if (state.isLoading ||
        ref.read(routeSearchKindProvider) != RouteSearchKind.general) {
      return;
    }
    final endpoints = ref.read(routeSelectionProvider).endpoints;
    final useCase = ref.read(searchRouteUseCaseProvider);
    final revision = ++_requestRevision;
    _cancelPending = useCase.cancel;
    state = const AsyncLoading();

    final result = await useCase(
      endpoints,
      departureAt: departureAt ?? DateTime.now(),
    );
    if (!ref.mounted || revision != _requestRevision) return;
    _cancelPending = null;
    state = switch (result) {
      Success<RouteSearchResult>(:final value) => AsyncData(value),
      Failed<RouteSearchResult>(
        failure: Failure(type: FailureType.cancelled),
      ) =>
        const AsyncData(null),
      Failed<RouteSearchResult>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }
}
