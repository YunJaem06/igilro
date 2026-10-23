import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_marker.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';

import '../helpers/fake_location_repository.dart';
import '../helpers/fake_route_repository.dart';

const destination = GeoCoordinate(latitude: 37.5700, longitude: 126.9810);

void main() {
  late ProviderContainer container;
  late List<MapMarker> visibleMarkers;
  late List<GeoCoordinate> visibleRoutePath;
  late GeoCoordinate tappedCoordinate;
  late FakeRouteRepository routeRepository;
  setUp(() {
    routeRepository = FakeRouteRepository();
    container = ProviderContainer(
      overrides: [
        mapConfiguredProvider.overrideWithValue(true),
        locationRepositoryProvider.overrideWithValue(FakeLocationRepository()),
        routeRepositoryProvider.overrideWithValue(routeRepository),
      ],
    );
    container.listen(mapProvider, (_, _) {});
    container.read(mapProvider.notifier).markReady();
    visibleMarkers = [];
    visibleRoutePath = [];
    tappedCoordinate = destination;
  });
  tearDown(() => container.dispose());

  Future<void> mount(WidgetTester tester) => tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: HomePage(
          mapSurfaceBuilder:
              (state, markers, routePath, onTap, ready, failure) {
                visibleMarkers = markers;
                visibleRoutePath = routePath;
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

  Future<List<GeoCoordinate>> searchDetour(WidgetTester tester) async {
    final selection = container.read(routeSelectionProvider.notifier);
    selection.useCurrentLocation(sampleLocation.coordinate);
    selection.beginSelection(RouteEndpoint.destination);
    selection.preview(destination);
    selection.confirmSelection();
    final query = RouteQuery(
      origin: sampleLocation.coordinate,
      destination: destination,
      departureAt: routeDeparture,
    );
    // The middle vertex falls outside the endpoints' bounding box. Snapped
    // endpoints also differ from the input pins, as in the server contract.
    const path = [
      GeoCoordinate(latitude: 37.56652, longitude: 126.978),
      GeoCoordinate(latitude: 37.58, longitude: 126.99),
      GeoCoordinate(latitude: 37.57002, longitude: 126.981),
    ];
    final result = sampleRouteResult(query);
    routeRepository.response = Result.success(
      result.copyWith(
        routes: [result.routes.single.copyWith(path: path)],
        snapping: result.snapping.copyWith(
          origin: result.snapping.origin.copyWith(
            coordinate: path.first,
            distanceMeters: 2.2,
          ),
          destination: result.snapping.destination.copyWith(
            coordinate: path.last,
            distanceMeters: 2.2,
          ),
        ),
      ),
    );
    await mount(tester);
    await tap(tester, find.text('경로 검색'));
    return path;
  }

  testWidgets(
    'renders the snapped route and frames its detour and input pins',
    (tester) async {
      final path = await searchDetour(tester);
      expect(visibleRoutePath, path);
      expect(visibleMarkers.map((marker) => marker.coordinate), [
        sampleLocation.coordinate,
        destination,
      ]);
      expect(container.read(mapProvider).framedCoordinates, [
        ...path,
        sampleLocation.coordinate,
        destination,
      ]);
      final revision = container.read(mapProvider).cameraRevision;
      await tap(tester, find.text('전체 경로 보기'));
      expect(container.read(mapProvider).cameraRevision, revision + 1);
      expect(container.read(mapProvider).framedCoordinates, contains(path[1]));
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'preview cancellation preserves the line; confirmation removes it',
    (tester) async {
      final path = await searchDetour(tester);
      final selection = container.read(routeSelectionProvider.notifier);
      selection.beginSelection(RouteEndpoint.destination);
      selection.preview(path[1]);
      await tester.pumpAndSettle();
      expect(visibleRoutePath, path);
      selection.cancelSelection();
      await tester.pumpAndSettle();
      expect(visibleRoutePath, path);
      selection.beginSelection(RouteEndpoint.destination);
      selection.preview(path[1]);
      selection.confirmSelection();
      await tester.pumpAndSettle();
      expect(visibleRoutePath, isEmpty);
      expect(container.read(mapProvider).framedCoordinates, [
        sampleLocation.coordinate,
        path[1],
      ]);
    },
  );

  for (final action in ['swap', 'clear origin', 'clear destination']) {
    testWidgets('$action removes the previous route', (tester) async {
      await searchDetour(tester);
      final selection = container.read(routeSelectionProvider.notifier);
      switch (action) {
        case 'swap':
          selection.swap();
        case 'clear origin':
          selection.clear(RouteEndpoint.origin);
        case 'clear destination':
          selection.clear(RouteEndpoint.destination);
      }
      await tester.pumpAndSettle();
      expect(visibleRoutePath, isEmpty);
    });
  }

  testWidgets('loading and failure clear the line and retry restores it', (
    tester,
  ) async {
    final path = await searchDetour(tester);
    final completion = Completer<Result<RouteSearchResult>>();
    routeRepository.pending = completion.future;
    await tester.ensureVisible(find.text('경로 검색'));
    await tester.tap(find.text('경로 검색'));
    await tester.pump();
    expect(visibleRoutePath, isEmpty);
    completion.complete(
      const Result.failure(Failure(type: FailureType.network)),
    );
    await tester.pumpAndSettle();
    expect(visibleRoutePath, isEmpty);
    expect(container.read(routeSearchProvider).hasError, true);
    routeRepository.pending = null;
    await tap(tester, find.text('다시 검색'));
    expect(visibleRoutePath, path);
  });

  testWidgets('map retry preserves the route and all framing coordinates', (
    tester,
  ) async {
    final path = await searchDetour(tester);
    final framing = container.read(mapProvider).framedCoordinates;
    container.read(mapProvider.notifier).markFailed();
    await tester.pumpAndSettle();
    await tester.tap(find.text('지도 다시 불러오기'));
    await tester.pump();
    expect(container.read(mapProvider).session, 1);
    expect(visibleRoutePath, path);
    expect(container.read(mapProvider).framedCoordinates, framing);
    container.read(mapProvider.notifier).markReady();
    await tester.pumpAndSettle();
    expect(visibleRoutePath, path);
  });

  testWidgets(
    'search submits committed coordinates without replacing input pins',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('현재 위치를 출발지로'));
      await tap(tester, find.text('도착지'));
      await tester.tap(find.byKey(const Key('fake-map')));
      await tester.pumpAndSettle();
      await tap(tester, find.text('도착지로 선택'));
      expect(routeRepository.queries, isEmpty);
      await tap(tester, find.text('경로 검색'));
      expect(routeRepository.queries.single.origin, sampleLocation.coordinate);
      expect(routeRepository.queries.single.destination, destination);
      expect(find.text('22분 · 1.7km'), findsOneWidget);
      expect(visibleMarkers.map((marker) => marker.coordinate), [
        sampleLocation.coordinate,
        destination,
      ]);
      expect(tester.takeException(), isNull);
    },
  );

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
