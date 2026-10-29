import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_kind_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../../../helpers/fake_route_repository.dart';

void main() {
  late FakeRouteRepository repository;
  late ProviderContainer container;
  setUp(() {
    repository = FakeRouteRepository();
    container = ProviderContainer(
      overrides: [routeRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(routeSelectionProvider, (_, _) {});
    container.listen(routeSearchKindProvider, (_, _) {});
    container
        .read(routeSearchKindProvider.notifier)
        .select(RouteSearchKind.general);
    selectEndpoints(container);
    container.listen(routeSearchProvider, (_, _) {});
    addTearDown(container.dispose);
  });

  test('mounting with complete inputs does not automatically search', () {
    expect(
      container.read(routeSearchProvider),
      const AsyncData<RouteSearchResult?>(null),
    );
    expect(repository.queries, isEmpty);
  });

  test(
    'rapid taps share one request and expose a matching query snapshot',
    () async {
      final response = Completer<Result<RouteSearchResult>>();
      repository.pending = response.future;
      final notifier = container.read(routeSearchProvider.notifier);
      final first = notifier.search(departureAt: routeDeparture);
      expect(container.read(routeSearchProvider).isLoading, true);
      await notifier.search(departureAt: routeDeparture);
      expect(repository.queries.length, 1);
      response.complete(
        Result.success(sampleRouteResult(repository.queries.single)),
      );
      await first;
      expect(
        container.read(routeSearchProvider).value?.query.origin,
        routeOrigin,
      );
      expect(
        container.read(routeSearchProvider).value?.query.destination,
        routeDestination,
      );
    },
  );

  test('a failed request can be retried', () async {
    repository.response = const Result.failure(
      Failure(type: FailureType.timeout),
    );
    final notifier = container.read(routeSearchProvider.notifier);
    await notifier.search(departureAt: routeDeparture);
    expect(
      container.read(routeSearchProvider).error,
      const Failure(type: FailureType.timeout),
    );
    repository.response = null;
    await notifier.search(departureAt: routeDeparture);
    expect(container.read(routeSearchProvider).hasError, false);
    expect(container.read(routeSearchProvider).value, isNotNull);
  });

  test('previewing then cancelling preserves the existing result', () async {
    await container
        .read(routeSearchProvider.notifier)
        .search(departureAt: routeDeparture);
    final result = container.read(routeSearchProvider).value;
    final selection = container.read(routeSelectionProvider.notifier);
    selection.beginSelection(RouteEndpoint.origin);
    selection.preview(routeDestination);
    selection.cancelSelection();
    await container.pump();
    expect(container.read(routeSearchProvider).value, result);
  });

  test('changing endpoints clears the old result', () async {
    await container
        .read(routeSearchProvider.notifier)
        .search(departureAt: routeDeparture);
    container.read(routeSelectionProvider.notifier).swap();
    await container.pump();
    expect(container.read(routeSearchProvider).value, isNull);
    expect(container.read(routeSearchProvider).hasError, false);
  });

  test(
    'a late response cannot overwrite a newer search after input changes',
    () async {
      final oldResponse = Completer<Result<RouteSearchResult>>();
      repository.pending = oldResponse.future;
      final notifier = container.read(routeSearchProvider.notifier);
      final oldRequest = notifier.search(departureAt: routeDeparture);
      final oldQuery = repository.queries.single;
      container.read(routeSelectionProvider.notifier).swap();
      await container.pump();
      expect(repository.cancellations, 1);
      expect(container.read(routeSearchProvider).isLoading, false);
      repository.pending = null;
      await container
          .read(routeSearchProvider.notifier)
          .search(departureAt: routeDeparture);
      final newResult = container.read(routeSearchProvider).value;
      expect(newResult?.query.origin, routeDestination);
      oldResponse.complete(Result.success(sampleRouteResult(oldQuery)));
      await oldRequest;
      expect(container.read(routeSearchProvider).value, newResult);
    },
  );

  test(
    'disposal cancels the request and ignores its eventual completion',
    () async {
      final response = Completer<Result<RouteSearchResult>>();
      repository.pending = response.future;
      final request = container
          .read(routeSearchProvider.notifier)
          .search(departureAt: routeDeparture);
      final query = repository.queries.single;
      container.invalidate(routeSearchProvider);
      response.complete(Result.success(sampleRouteResult(query)));
      await request;
      expect(repository.cancellations, 1);
      expect(container.read(routeSearchProvider).value, isNull);
    },
  );
}

void selectEndpoints(ProviderContainer container) {
  final notifier = container.read(routeSelectionProvider.notifier);
  notifier.useCurrentLocation(routeOrigin);
  notifier.beginSelection(RouteEndpoint.destination);
  notifier.preview(routeDestination);
  notifier.confirmSelection();
}
