import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_marker.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';

import '../helpers/fake_location_repository.dart';

const destination = GeoCoordinate(latitude: 37.5700, longitude: 126.9810);

void main() {
  late ProviderContainer container;
  late List<MapMarker> visibleMarkers;
  late GeoCoordinate tappedCoordinate;
  setUp(() {
    container = ProviderContainer(
      overrides: [
        mapConfiguredProvider.overrideWithValue(true),
        locationRepositoryProvider.overrideWithValue(FakeLocationRepository()),
      ],
    );
    container.listen(mapProvider, (_, _) {});
    container.read(mapProvider.notifier).markReady();
    visibleMarkers = [];
    tappedCoordinate = destination;
  });
  tearDown(() => container.dispose());

  Future<void> mount(WidgetTester tester) => tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: HomePage(
          mapSurfaceBuilder: (state, markers, onTap, ready, failure) {
            visibleMarkers = markers;
            return GestureDetector(
              key: const Key('fake-map'),
              onTap: () => onTap?.call(tappedCoordinate),
              child: const ColoredBox(color: Colors.green),
            );
          },
        ),
      ),
    ),
  );

  Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'location, map selection, swap and clear update map and readiness',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('현재 위치를 출발지로'));
      expect(
        container.read(routeSelectionProvider).endpoints.origin!.coordinate,
        sampleLocation.coordinate,
      );
      expect(visibleMarkers.single.role, MapMarkerRole.origin);
      await tap(tester, find.text('도착지'));
      expect(find.text('지도에서 원하는 위치를 눌러 주세요.'), findsOneWidget);
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      expect(visibleMarkers.last.role, MapMarkerRole.selection);
      expect(
        container.read(routeSelectionProvider).endpoints.destination,
        isNull,
      );
      await tap(tester, find.text('도착지로 선택'));
      expect(visibleMarkers.map((marker) => marker.role), [
        MapMarkerRole.origin,
        MapMarkerRole.destination,
      ]);
      expect(container.read(mapProvider).framedCoordinates, [
        sampleLocation.coordinate,
        destination,
      ]);
      expect(find.text('두 지점이 준비됐어요.'), findsOneWidget);
      await tap(tester, find.byTooltip('출발·도착 교환'));
      expect(visibleMarkers.first.coordinate, destination);
      expect(visibleMarkers.last.coordinate, sampleLocation.coordinate);
      await tap(tester, find.byTooltip('도착지 선택 지우기'));
      expect(visibleMarkers.single.coordinate, destination);
      expect(container.read(routeSelectionProvider).endpoints.canSearch, false);
      final showButton = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, '두 지점 보기'),
      );
      expect(showButton.onPressed, isNull);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'location arriving during map selection keeps the destination candidate',
    (tester) async {
      final completion = Completer<Result<LocationFix>>();
      final repository =
          container.read(locationRepositoryProvider) as FakeLocationRepository;
      repository.pendingLocation = completion.future;
      await mount(tester);
      await tap(tester, find.text('현재 위치를 출발지로'));
      await tap(tester, find.text('도착지'));
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      completion.complete(Result.success(sampleLocation));
      await tester.pumpAndSettle();
      expect(
        container.read(routeSelectionProvider).candidate!.coordinate,
        destination,
      );
      expect(
        container.read(routeSelectionProvider).endpoints.origin!.coordinate,
        sampleLocation.coordinate,
      );
      await tap(tester, find.text('도착지로 선택'));
      expect(container.read(routeSelectionProvider).endpoints.canSearch, true);
    },
  );

  testWidgets('cancel discards preview without replacing the committed pin', (
    tester,
  ) async {
    await mount(tester);
    await tap(tester, find.text('현재 위치를 출발지로'));
    await tap(tester, find.text('출발지'));
    await tester.tap(find.byKey(const Key('fake-map')));
    await tester.pumpAndSettle();
    expect(visibleMarkers.single.role, MapMarkerRole.selection);
    expect(visibleMarkers.single.coordinate, destination);
    await tap(tester, find.text('선택 취소'));
    expect(visibleMarkers.single.role, MapMarkerRole.origin);
    expect(visibleMarkers.single.coordinate, sampleLocation.coordinate);
  });

  testWidgets(
    'identical points display guidance and disable viewing readiness',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('현재 위치를 출발지로'));
      tappedCoordinate = sampleLocation.coordinate;
      await tap(tester, find.text('도착지'));
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      await tap(tester, find.text('도착지로 선택'));
      expect(find.text('출발지와 도착지를 서로 다른 위치로 선택해 주세요.'), findsOneWidget);
      expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, '두 지점 보기'))
            .onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'map failure blocks confirmation and retry preserves committed endpoints',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('현재 위치를 출발지로'));
      await tap(tester, find.text('도착지'));
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      container.read(mapProvider.notifier).markFailed();
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, '도착지로 선택'))
            .onPressed,
        isNull,
      );
      await tester.tap(find.text('지도 다시 불러오기'));
      await tester.pump();
      expect(
        container.read(routeSelectionProvider).endpoints.origin!.coordinate,
        sampleLocation.coordinate,
      );
      container.read(mapProvider.notifier).markReady();
      await tester.pumpAndSettle();
      await tap(tester, find.text('도착지로 선택'));
      expect(visibleMarkers.last.role, MapMarkerRole.destination);
    },
  );

  testWidgets(
    'pending selection remains usable with large text on a short screen',
    (tester) async {
      tester.view.physicalSize = const Size(320, 360);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await mount(tester);
      await tap(tester, find.text('출발지'));
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      await tap(tester, find.text('출발지로 선택'));
      expect(
        container.read(routeSelectionProvider).endpoints.origin!.coordinate,
        destination,
      );
      expect(tester.takeException(), isNull);
    },
  );
}
