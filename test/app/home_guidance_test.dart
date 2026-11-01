import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/guidance_map_inspection_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_steps_sheet.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_kind_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../helpers/fake_location_repository.dart';
import '../helpers/fake_prediction_repository.dart';
import '../helpers/fake_route_repository.dart';
import '../helpers/walking_guidance_fixture.dart';

void main() {
  final result = walkingGuidanceResult();
  final route = result.routes.single;
  final guide = route.guidance!;
  late ProviderContainer container;
  late FakeRouteRepository repository;
  late StreamController<Result<LocationFix>> updates;
  LocationFix fix(int geometryIndex, {double accuracy = 5}) => LocationFix(
    coordinate: route.path[geometryIndex],
    accuracyMeters: accuracy,
    capturedAt: DateTime.now().toUtc(),
  );
  setUp(() {
    repository = FakeRouteRepository()..response = Result.success(result);
    updates = StreamController<Result<LocationFix>>.broadcast();
    final location = FakeLocationRepository()
      ..location = Result.success(fix(0))
      ..updates = updates.stream;
    final predictions = FakePredictionRepository()
      ..handler = (query) async => Result.success(walkingPrediction(query));
    container = ProviderContainer(
      overrides: [
        mapConfiguredProvider.overrideWithValue(true),
        routeRepositoryProvider.overrideWithValue(repository),
        routePredictionRepositoryProvider.overrideWithValue(predictions),
        locationRepositoryProvider.overrideWithValue(location),
      ],
    );
    container.listen(routeSearchKindProvider, (_, _) {});
    container.listen(routeSelectionProvider, (_, _) {});
    container.listen(mapProvider, (_, _) {});
    container
        .read(routeSearchKindProvider.notifier)
        .select(RouteSearchKind.general);
    container.read(mapProvider.notifier).markReady();
    container.read(mapProvider.notifier).focusOn(route.path.first);
    final selection = container.read(routeSelectionProvider.notifier);
    selection.useCurrentLocation(forestOrigin);
    selection.beginSelection(RouteEndpoint.destination);
    selection.preview(forestDestination);
    selection.confirmSelection();
    addTearDown(updates.close);
    addTearDown(container.dispose);
  });
  Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pump();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> mount(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: HomePage(
            mapSurfaceBuilder: (_, _, _, _, _, _) =>
                const ColoredBox(color: Colors.green),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tap(tester, find.text('경로 검색'));
  }

  MapCanvas canvas(WidgetTester tester) =>
      tester.widget<MapCanvas>(find.byType(MapCanvas));
  Future<void> inspect(WidgetTester tester, int index) async {
    await tap(tester, find.text('전체 길안내'));
    final tile = find.byKey(ValueKey('guidance-step-$index'));
    await tester.scrollUntilVisible(
      tile,
      150,
      scrollable: find.descendant(
        of: find.byKey(const Key('guidance-steps-list')),
        matching: find.byType(Scrollable),
      ),
    );
    await tap(tester, tile);
  }

  testWidgets(
    'result list focuses a step without changing GPS, endpoints or route',
    (tester) async {
      await mount(tester);
      final before = container.read(mapProvider);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      await inspect(tester, 6);
      final inspected = container.read(mapProvider);
      expect(inspected.center, guide.steps[6].coordinate);
      expect(inspected.currentLocation, before.currentLocation);
      expect(inspected.followLocation, false);
      expect(inspected.framedCoordinates, isEmpty);
      expect(canvas(tester).routePath, route.path);
      expect(canvas(tester).guidancePoints.single.label, '선택 7');
      expect(container.read(routeSelectionProvider).endpoints, endpoints);
      expect(find.byType(GuidanceMapInspectionCard), findsOneWidget);
      expect(find.text('7번 안내 지점'), findsOneWidget);
      await tap(tester, find.byTooltip('안내 지점 선택 해제'));
      expect(canvas(tester).guidancePoints, isEmpty);
      expect(
        container.read(mapProvider).framedCoordinates,
        containsAll(route.path),
      );
      expect(
        container.read(mapProvider).currentLocation,
        before.currentLocation,
      );
      await tap(tester, find.text('상세 보기'));
      await tap(tester, find.text('전체 길안내').last);
      expect(find.byType(GuidanceStepsSheet), findsOneWidget);
    },
  );

  testWidgets(
    'inspection keeps navigation progressing and follow restores automatic highlights',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('안내 시작'));
      expect(canvas(tester).guidancePoints.map((p) => p.role), [
        MapGuidancePointRole.current,
        MapGuidancePointRole.next,
      ]);
      await inspect(tester, 8);
      final inspected = container.read(mapProvider);
      final oldProgress = container
          .read(navigationProvider)
          .progress!
          .geometryPosition;
      updates.add(Result.success(fix(guide.steps[5].geometryIndex + 1)));
      await tester.pumpAndSettle();
      expect(
        container.read(navigationProvider).progress!.geometryPosition,
        greaterThan(oldProgress),
      );
      expect(container.read(mapProvider).center, inspected.center);
      expect(
        container.read(mapProvider).currentLocation,
        isNot(inspected.currentLocation),
      );
      expect(
        canvas(tester).guidancePoints
            .any((p) => p.role == MapGuidancePointRole.selected),
        true,
      );
      await tap(tester, find.text('전체 길안내'));
      await tester.scrollUntilVisible(
        find.text('다음 안내'),
        100,
        scrollable: find.descendant(
          of: find.byKey(const Key('guidance-steps-list')),
          matching: find.byType(Scrollable),
        ),
      );
      expect(find.text('현재 구간'), findsOneWidget);
      await tap(tester, find.byTooltip('길안내 목록 닫기'));
      await tap(tester, find.text('따라가기'));
      expect(container.read(mapProvider).followLocation, true);
      expect(
        container.read(mapProvider).center,
        container.read(navigationProvider).fix!.coordinate,
      );
      expect(
        canvas(tester).guidancePoints
            .any((p) => p.role == MapGuidancePointRole.selected),
        false,
      );
      updates.add(
        Result.success(fix(guide.steps[5].geometryIndex + 1, accuracy: 100)),
      );
      await tester.pumpAndSettle();
      expect(canvas(tester).guidancePoints, isEmpty);
      expect(find.text('전체 길안내'), findsOneWidget);
      container.read(navigationProvider.notifier).stop();
      await tester.pumpAndSettle();
    },
  );

  testWidgets('a stale open list cannot move the map after endpoints change', (
    tester,
  ) async {
    await mount(tester);
    await tap(tester, find.text('전체 길안내'));
    container
        .read(routeSelectionProvider.notifier)
        .clear(RouteEndpoint.destination);
    await tester.pumpAndSettle();
    final revision = container.read(mapProvider).cameraRevision;
    await tap(tester, find.byKey(const ValueKey('guidance-step-0')));
    expect(container.read(mapProvider).cameraRevision, revision);
    expect(canvas(tester).guidancePoints, isEmpty);
    expect(find.byType(GuidanceMapInspectionCard), findsNothing);
  });

  testWidgets(
    'prediction modes have independent guidance and clear inspected steps on change',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('그늘길'));
      container
          .read(routePredictionOptionsProvider.notifier)
          .setDepartureAt(predictionDeparture);
      await tester.pumpAndSettle();
      await tap(tester, find.text('그늘길 비교'));
      await inspect(tester, 4);
      expect(
        canvas(tester).guidancePoints.single.coordinate,
        walkingPrediction(
          predictionQuery().copyWith(
            origin: forestOrigin,
            destination: forestDestination,
          ),
        ).routes.single.guidance!.steps[4].coordinate,
      );
      await tap(tester, find.text('빠른 길'));
      expect(canvas(tester).guidancePoints, isEmpty);
      expect(find.byType(GuidanceMapInspectionCard), findsNothing);
      await tap(tester, find.text('전체 길안내'));
      expect(find.text('전체 길안내 · 19단계'), findsOneWidget);
    },
  );

  testWidgets(
    'an older response keeps progress navigation without offering an empty list',
    (tester) async {
      repository.response = Result.success(
        result.copyWith(routes: [route.copyWith(guidance: null)]),
      );
      await mount(tester);
      expect(find.text('전체 길안내'), findsNothing);
      await tap(tester, find.text('안내 시작'));
      expect(find.text('전체 길안내'), findsNothing);
      expect(canvas(tester).guidancePoints, isEmpty);
      expect(find.text('단계별 안내 정보가 없어 경로 진행 상황만 표시해요.'), findsOneWidget);
      container.read(navigationProvider.notifier).stop();
      await tester.pumpAndSettle();
    },
  );
}
