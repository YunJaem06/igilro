import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/place_search/domain/entities/place.dart';
import 'package:igilro/features/place_search/presentation/providers/place_search_notifier.dart';
import 'package:igilro/features/place_search/presentation/providers/place_search_providers.dart';

import '../../../helpers/fake_place_repository.dart';

void main() {
  late FakePlaceRepository repository;
  late ProviderContainer container;
  late PlaceSearchNotifier notifier;
  setUp(() {
    repository = FakePlaceRepository();
    container = ProviderContainer(
      overrides: [placeRepositoryProvider.overrideWithValue(repository)],
    );
    container.listen(placeSearchProvider, (_, _) {});
    notifier = container.read(placeSearchProvider.notifier);
  });
  tearDown(() => container.dispose());

  testWidgets('debounces input and clears obsolete results immediately', (
    tester,
  ) async {
    await tester.pump();
    notifier.updateQuery('서울');
    await tester.pump(const Duration(milliseconds: 250));
    notifier.updateQuery('서울숲');
    await tester.pump(const Duration(milliseconds: 349));
    expect(repository.queries, isEmpty);
    await tester.pump(const Duration(milliseconds: 1));
    expect(repository.queries, ['서울숲']);
    expect(container.read(placeSearchProvider).requireValue, [
      forestPlace,
      stationPlace,
    ]);
    notifier.updateQuery('성수');
    expect(container.read(placeSearchProvider).isLoading, true);
    expect(container.read(placeSearchProvider).asData, isNull);
    notifier.updateQuery(' ');
    await tester.pump(const Duration(seconds: 1));
    expect(container.read(placeSearchProvider).requireValue, isNull);
    expect(repository.queries, ['서울숲']);
  });

  testWidgets('IME composition waits for the committed Korean query', (
    tester,
  ) async {
    await tester.pump();
    notifier.updateQuery('서울ㅅ', composing: true);
    await tester.pump(const Duration(seconds: 1));
    expect(repository.queries, isEmpty);
    notifier.updateQuery('서울숲', composing: true);
    notifier.updateQuery('서울숲');
    await tester.pump(const Duration(milliseconds: 350));
    expect(repository.queries, ['서울숲']);
  });

  testWidgets('submit bypasses debounce and retry recovers a failure', (
    tester,
  ) async {
    await tester.pump();
    repository.response = const Result.failure(
      Failure(type: FailureType.network),
    );
    notifier.updateQuery('서울숲');
    await notifier.search();
    expect(
      container.read(placeSearchProvider).error,
      const Failure(type: FailureType.network),
    );
    repository.response = const Result.success([]);
    await notifier.search();
    await tester.pump(const Duration(seconds: 1));
    expect(repository.queries, ['서울숲', '서울숲']);
    expect(container.read(placeSearchProvider).requireValue, isEmpty);
  });

  testWidgets('late responses cannot replace a newer query or cleared input', (
    tester,
  ) async {
    await tester.pump();
    final old = Completer<Result<List<Place>>>();
    repository.handle = (query) => query == '서울'
        ? old.future
        : Future.value(const Result.success([stationPlace]));
    notifier.updateQuery('서울');
    final first = notifier.search();
    notifier.updateQuery('성수');
    await notifier.search();
    old.complete(const Result.success([forestPlace]));
    await first;
    expect(container.read(placeSearchProvider).requireValue, [stationPlace]);
    expect(repository.cancellations, greaterThanOrEqualTo(1));
    final pending = Completer<Result<List<Place>>>();
    repository.handle = (_) => pending.future;
    notifier.updateQuery('서울숲');
    final next = notifier.search();
    notifier.updateQuery('');
    pending.complete(const Result.success([forestPlace]));
    await next;
    expect(container.read(placeSearchProvider).requireValue, isNull);
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('disposal cancels requests and ignores completion', (
    tester,
  ) async {
    await tester.pump();
    final pending = Completer<Result<List<Place>>>();
    repository.handle = (_) => pending.future;
    notifier.updateQuery('서울숲');
    final search = notifier.search();
    container.dispose();
    expect(repository.cancellations, 1);
    pending.complete(const Result.success([forestPlace]));
    await search;
  });
}
