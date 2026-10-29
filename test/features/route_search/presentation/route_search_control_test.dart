import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_kind_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';
import 'package:igilro/features/route_search/presentation/widgets/route_search_control.dart';

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
    addTearDown(container.dispose);
  });

  void selectEndpoints() {
    final notifier = container.read(routeSelectionProvider.notifier);
    notifier.useCurrentLocation(routeOrigin);
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(routeDestination);
    notifier.confirmSelection();
  }

  Future<void> mount(WidgetTester tester) => tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: RouteSearchControl()),
        ),
      ),
    ),
  );

  testWidgets('search is disabled until distinct endpoints are confirmed', (
    tester,
  ) async {
    await mount(tester);
    expect(
      tester
          .widget<FilledButton>(find.widgetWithText(FilledButton, '경로 검색'))
          .onPressed,
      isNull,
    );
    expect(repository.queries, isEmpty);
    selectEndpoints();
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<FilledButton>(find.widgetWithText(FilledButton, '경로 검색'))
          .onPressed,
      isNotNull,
    );
    expect(repository.queries, isEmpty);
  });

  testWidgets(
    'search shows loading then real result values, snapping and attribution',
    (tester) async {
      selectEndpoints();
      final completion = Completer<Result<RouteSearchResult>>();
      repository.pending = completion.future;
      await mount(tester);
      await tester.tap(find.text('경로 검색'));
      await tester.pump();
      expect(find.text('도보 경로를 찾고 있어요.'), findsOneWidget);
      expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, '검색 중'))
            .onPressed,
        isNull,
      );
      expect(repository.queries.single.origin, routeOrigin);
      expect(repository.queries.single.destination, routeDestination);
      completion.complete(
        Result.success(sampleRouteResult(repository.queries.single)),
      );
      await tester.pumpAndSettle();
      expect(find.text('22분 · 1.7km'), findsOneWidget);
      expect(find.textContaining('보행로 출발점:'), findsOneWidget);
      expect(find.textContaining('보행로 도착점:'), findsOneWidget);
      expect(find.text('© OpenStreetMap contributors'), findsOneWidget);
      expect(find.textContaining('그늘'), findsNothing);
    },
  );

  final failures = [
    (
      Failure(type: FailureType.notFound, code: 'ROUTE_NOT_FOUND'),
      '선택한 두 지점을 잇는 도보 경로가 없어요.',
    ),
    (
      Failure(type: FailureType.notFound, code: 'NOT_FOUND'),
      '경로 검색 서비스에 연결하지 못했어요.',
    ),
    (
      Failure(type: FailureType.validation, code: 'OUTSIDE_SUPPORTED_AREA'),
      '현재 지원하는 지역에서 출발지와 도착지를 선택해 주세요.',
    ),
    (
      Failure(type: FailureType.server, code: 'ROUTING_DATA_UNAVAILABLE'),
      '경로 데이터가 아직 준비되지 않았어요. 잠시 후 다시 시도해 주세요.',
    ),
  ];
  for (final (failure, message) in failures) {
    testWidgets(
      'business error ${failure.code} has appropriate guidance and retry',
      (tester) async {
        selectEndpoints();
        repository.response = Result.failure(failure);
        await mount(tester);
        await tester.tap(find.text('경로 검색'));
        await tester.pumpAndSettle();
        expect(find.text(message), findsOneWidget);
        repository.response = null;
        await tester.tap(find.text('다시 검색'));
        await tester.pumpAndSettle();
        expect(find.text('22분 · 1.7km'), findsOneWidget);
        expect(find.text(message), findsNothing);
      },
    );
  }

  testWidgets(
    'a cancelled map preview preserves results, committed input changes clear them',
    (tester) async {
      selectEndpoints();
      await mount(tester);
      await tester.tap(find.text('경로 검색'));
      await tester.pumpAndSettle();
      final notifier = container.read(routeSelectionProvider.notifier);
      notifier.beginSelection(RouteEndpoint.origin);
      await tester.pumpAndSettle();
      expect(find.text('경로 검색'), findsNothing);
      notifier.cancelSelection();
      await tester.pumpAndSettle();
      expect(find.text('22분 · 1.7km'), findsOneWidget);
      notifier.swap();
      await tester.pumpAndSettle();
      expect(find.text('22분 · 1.7km'), findsNothing);
      expect(repository.queries.length, 1);
    },
  );
}
