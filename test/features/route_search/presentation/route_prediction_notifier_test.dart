import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/usecases/search_route_prediction_use_case.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_kind_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../../../helpers/fake_prediction_repository.dart';

void main() {
  late FakePredictionRepository repository;
  late ProviderContainer container;
  setUp(() {
    repository = FakePredictionRepository();
    container = ProviderContainer(
      overrides: [
        routePredictionRepositoryProvider.overrideWithValue(repository),
      ],
    );
    container.listen(routeSelectionProvider, (_, _) {});
    container
        .read(routeSearchKindProvider.notifier)
        .select(RouteSearchKind.prediction);
    final selection = container.read(routeSelectionProvider.notifier);
    selection.useCurrentLocation(predictionOrigin);
    selection.beginSelection(RouteEndpoint.destination);
    selection.preview(predictionDestination);
    selection.confirmSelection();
    container
        .read(routePredictionOptionsProvider.notifier)
        .setDepartureAt(predictionDeparture);
    container.listen(routePredictionProvider, (_, _) {});
    addTearDown(container.dispose);
  });

  test('initializing does not search; a tap snapshots the explicit shade mode and UTC time', () async {
    expect(repository.queries, isEmpty);
    await container.read(routePredictionProvider.notifier).search();
    expect(repository.queries.single, predictionQuery());
    expect(repository.queries.single.departureAt!.isUtc, true);
  });

  test('use case rejects missing or identical endpoints before HTTP', () async {
    final useCase = SearchRoutePredictionUseCase(repository);
    expect(
      await useCase(const RouteEndpoints(), mode: RoutePredictionMode.shade),
      isA<Failed<ModelRoutePrediction>>(),
    );
    final endpoints = container.read(routeSelectionProvider).endpoints;
    expect(
      await useCase(
        endpoints.copyWith(destination: endpoints.origin),
        mode: RoutePredictionMode.shade,
      ),
      isA<Failed<ModelRoutePrediction>>(),
    );
    expect(repository.queries, isEmpty);
  });

  test('duplicate taps are ignored while loading', () async {
    final completion = Completer<Result<ModelRoutePrediction>>();
    repository.pending = completion.future;
    final first = container.read(routePredictionProvider.notifier).search();
    await container.read(routePredictionProvider.notifier).search();
    expect(repository.queries, hasLength(1));
    completion.complete(
      Result.success(predictionFor(repository.queries.single)),
    );
    await first;
  });

  for (final change in ['origin', 'destination', 'time', 'mode', 'general']) {
    test('$change change cancels and ignores a late response', () async {
      final completion = Completer<Result<ModelRoutePrediction>>();
      repository.pending = completion.future;
      final request = container.read(routePredictionProvider.notifier).search();
      final oldQuery = repository.queries.single;
      switch (change) {
        case 'origin':
          container
              .read(routeSelectionProvider.notifier)
              .useCurrentLocation(predictionDestination);
        case 'destination':
          container
              .read(routeSelectionProvider.notifier)
              .clear(RouteEndpoint.destination);
        case 'time':
          container
              .read(routePredictionOptionsProvider.notifier)
              .setDepartureAt(
                predictionDeparture.add(const Duration(hours: 1)),
              );
        case 'mode':
          container
              .read(routePredictionOptionsProvider.notifier)
              .selectMode(RoutePredictionMode.fastest);
        case 'general':
          container
              .read(routeSearchKindProvider.notifier)
              .select(RouteSearchKind.general);
      }
      await container.pump();
      expect(repository.cancellations, 1);
      completion.complete(Result.success(predictionFor(oldQuery)));
      await request;
      expect(container.read(routePredictionProvider).value, isNull);
    });
  }

  test(
    'preview and cancel preserve results; a failed retry clears them',
    () async {
      final notifier = container.read(routePredictionProvider.notifier);
      await notifier.search();
      final previous = container.read(routePredictionProvider).value;
      final selection = container.read(routeSelectionProvider.notifier);
      selection.beginSelection(RouteEndpoint.origin);
      selection.preview(predictionDestination);
      selection.cancelSelection();
      await container.pump();
      expect(container.read(routePredictionProvider).value, previous);
      repository.response = const Result.failure(
        Failure(type: FailureType.server, code: 'PREDICTION_DATA_UNAVAILABLE'),
      );
      await notifier.search();
      expect(container.read(routePredictionProvider).asData, isNull);
      expect(container.read(routePredictionProvider).hasError, true);
    },
  );

  test('new time search cannot be overwritten by the old request', () async {
    final completion = Completer<Result<ModelRoutePrediction>>();
    repository.pending = completion.future;
    final request = container.read(routePredictionProvider.notifier).search();
    final oldQuery = repository.queries.single;
    container
        .read(routePredictionOptionsProvider.notifier)
        .setDepartureAt(predictionDeparture.add(const Duration(minutes: 30)));
    await container.pump();
    repository.pending = null;
    await container.read(routePredictionProvider.notifier).search();
    final current = container.read(routePredictionProvider).value;
    completion.complete(Result.success(predictionFor(oldQuery)));
    await request;
    expect(container.read(routePredictionProvider).value, current);
    expect(current!.query.departureAt, isNot(oldQuery.departureAt));
  });

  test('disposal cancels pending work', () async {
    final completion = Completer<Result<ModelRoutePrediction>>();
    repository.pending = completion.future;
    final request = container.read(routePredictionProvider.notifier).search();
    final query = repository.queries.single;
    container.dispose();
    completion.complete(Result.success(predictionFor(query)));
    await request;
    expect(repository.cancellations, 1);
  });
}
