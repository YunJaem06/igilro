import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/place_search/domain/entities/place.dart';
import 'package:igilro/features/place_search/presentation/pages/place_search_page.dart';
import 'package:igilro/features/place_search/presentation/providers/place_search_providers.dart';

import '../../../helpers/fake_place_repository.dart';

void main() {
  late FakePlaceRepository repository;
  Place? selected;
  var closed = false;
  var mapSelected = false;
  setUp(() {
    repository = FakePlaceRepository();
    selected = null;
    closed = false;
    mapSelected = false;
  });

  Future<void> mount(WidgetTester tester) => tester.pumpWidget(
    ProviderScope(
      overrides: [placeRepositoryProvider.overrideWithValue(repository)],
      child: MaterialApp(
        home: PlaceSearchPage(
          endpointLabel: '출발지',
          onSelected: (place) => selected = place,
          onClose: () => closed = true,
          onSelectOnMap: () => mapSelected = true,
        ),
      ),
    ),
  );

  Future<void> submit(WidgetTester tester) async {
    await tester.enterText(find.byType(TextField), '서울숲');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();
  }

  testWidgets('shows names and addresses and returns a domain place', (
    tester,
  ) async {
    await mount(tester);
    expect(repository.queries, isEmpty);
    await submit(tester);
    expect(find.text(forestPlace.address), findsOneWidget);
    await tester.tap(find.widgetWithText(ListTile, forestPlace.name));
    expect(selected, forestPlace);
    await tester.tap(find.byTooltip('장소 검색 닫기'));
    expect(closed, true);
  });

  testWidgets(
    'distinguishes empty results from service errors and supports retry',
    (tester) async {
      repository.response = const Result.success([]);
      await mount(tester);
      await submit(tester);
      expect(find.textContaining('검색 결과가 없어요.'), findsOneWidget);
      repository.response = const Result.failure(
        Failure(type: FailureType.notFound, code: 'NOT_FOUND'),
      );
      await submit(tester);
      expect(find.textContaining('장소 검색 서비스를 아직 사용할 수 없어요.'), findsOneWidget);
      expect(find.textContaining('검색 결과가 없어요.'), findsNothing);
      await tester.tap(find.text('지도에서 선택'));
      expect(mapSelected, true);
      repository.response = const Result.success([forestPlace]);
      await tester.tap(find.text('다시 검색'));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(ListTile, forestPlace.name), findsOneWidget);
    },
  );

  testWidgets(
    'clear removes pending results and late responses cannot select a place',
    (tester) async {
      final pending = Completer<Result<List<Place>>>();
      repository.handle = (_) => pending.future;
      await mount(tester);
      await tester.enterText(find.byType(TextField), '서울숲');
      await tester.pump(const Duration(milliseconds: 350));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byTooltip('검색어 지우기'));
      await tester.pump();
      pending.complete(const Result.success([forestPlace]));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(ListTile, forestPlace.name), findsNothing);
      expect(find.text('장소명이나 주소를 입력해 주세요.'), findsOneWidget);
      expect(selected, isNull);
      expect(repository.cancellations, 1);
    },
  );

  testWidgets(
    'Korean composing input is searched only after composition ends',
    (tester) async {
      await mount(tester);
      await tester.showKeyboard(find.byType(TextField));
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: '서울숲',
          selection: TextSelection.collapsed(offset: 3),
          composing: TextRange(start: 2, end: 3),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(repository.queries, isEmpty);
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: '서울숲',
          selection: TextSelection.collapsed(offset: 3),
        ),
      );
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle();
      expect(repository.queries, ['서울숲']);
    },
  );

  testWidgets('large text, keyboard and long place labels remain scrollable', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 560);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 180);
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    repository.response = Result.success([
      forestPlace.copyWith(
        name: '서울숲 아주 긴 이름의 장소 검색 결과',
        address: '서울특별시 성동구 아주 긴 도로명과 건물 이름',
      ),
    ]);
    await mount(tester);
    await submit(tester);
    await tester.ensureVisible(find.textContaining('서울숲 아주 긴'));
    await tester.tap(find.textContaining('서울숲 아주 긴'));
    expect(selected?.id, forestPlace.id);
    expect(tester.takeException(), isNull);
  });
}
