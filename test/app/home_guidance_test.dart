import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/guidance_map_inspection_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_time_card.dart';
import 'package:igilro/features/navigation/presentation/arrival_summary_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_steps_sheet.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
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
  late FakePredictionRepository predictions;
  late FakeLocationRepository location;
  late StreamController<Result<LocationFix>> updates;
  const offRoute = GeoCoordinate(latitude: 37.5500, longitude: 127.0345);
  const retryPosition = GeoCoordinate(latitude: 37.5498, longitude: 127.0355);
  LocationFix position(GeoCoordinate coordinate, {double accuracy = 5}) =>
      LocationFix(
        coordinate: coordinate,
        accuracyMeters: accuracy,
        capturedAt: DateTime.now().toUtc(),
      );
  LocationFix fix(int geometryIndex, {double accuracy = 5}) =>
      position(route.path[geometryIndex], accuracy: accuracy);
  setUp(() {
    repository = FakeRouteRepository()..response = Result.success(result);
    updates = StreamController<Result<LocationFix>>.broadcast();
    location = FakeLocationRepository()
      ..location = Result.success(fix(0))
      ..updates = updates.stream;
    predictions = FakePredictionRepository()
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
  Future<void> leaveRoute(WidgetTester tester) async {
    await tap(tester, find.text('안내 시작'));
    final outside = Result.success(position(offRoute));
    updates
      ..add(outside)
      ..add(outside);
    location.location = outside;
    await tester.pumpAndSettle();
    expect(container.read(navigationProvider).status, GuidanceStatus.offRoute);
  }

  Future<Completer<Result<RouteSearchResult>>> beginPendingReroute(
    WidgetTester tester,
  ) async {
    final pending = Completer<Result<RouteSearchResult>>();
    repository.pending = pending.future;
    final reroute = find.text('현재 위치로 재검색');
    await tester.ensureVisible(reroute);
    await tester.pump();
    await tester.tap(reroute);
    await tester.pump();
    return pending;
  }

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
    'arrival shows a summary, clears manual inspection and returns to the same result on completion',
    (tester) async {
      await mount(tester);
      await tap(tester, find.text('안내 시작'));
      expect(find.byType(GuidanceTimeCard), findsOneWidget);
      await inspect(tester, 8);
      updates.add(Result.success(fix(route.path.length - 1)));
      await tester.pumpAndSettle();
      expect(find.byType(ArrivalSummaryCard), findsOneWidget);
      expect(find.byType(GuidanceMapInspectionCard), findsNothing);
      expect(find.byType(GuidanceTimeCard), findsNothing);
      expect(container.read(mapProvider).followLocation, false);
      expect(
        container.read(mapProvider).framedCoordinates,
        containsAll(route.path),
      );
      expect(container.read(mapProvider).currentLocation, route.path.last);
      await tap(tester, find.byKey(const Key('arrival-finish')));
      expect(container.read(navigationProvider).active, false);
      expect(find.text('안내 시작'), findsOneWidget);
      expect(canvas(tester).routePath, route.path);
      expect(canvas(tester).guidancePoints, isEmpty);
    },
  );

  testWidgets(
    'reroute keeps the old route until success and resumes with a new ETA',
    (tester) async {
      await mount(tester);
      await leaveRoute(tester);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      final session = container.read(navigationProvider).session!;
      final pending = await beginPendingReroute(tester);
      expect(find.text('새 경로를 찾고 있어요'), findsOneWidget);
      expect(find.byType(GuidanceTimeCard), findsNothing);
      expect(canvas(tester).routePath, route.path);
      expect(container.read(routeSelectionProvider).endpoints, endpoints);
      expect(repository.queries, hasLength(2));
      final query = repository.queries.last;
      expect(query.origin, offRoute);
      expect(query.destination, endpoints.destination!.coordinate);
      final replacement = sampleRouteResult(query);
      pending.complete(Result.success(replacement));
      await tester.pumpAndSettle();

      final current = container.read(navigationProvider);
      expect(current.status, GuidanceStatus.following);
      expect(current.session!.startedAt, session.startedAt);
      expect(current.route!.path, [offRoute, forestDestination]);
      expect(canvas(tester).routePath, current.route!.path);
      expect(container.read(mapProvider).followLocation, true);
      expect(
        current.timeEstimate!.remaining,
        replacement.routes.single.duration,
      );
      expect(find.byType(GuidanceTimeCard), findsOneWidget);
      expect(find.text('안내 시작'), findsNothing);
      expect(
        container.read(routeSelectionProvider).endpoints.destination,
        endpoints.destination,
      );
      await tap(tester, find.text('안내 종료'));
    },
  );

  for (final mode in RoutePredictionMode.values) {
    testWidgets('prediction reroute retries from a fresh fix and keeps $mode', (
      tester,
    ) async {
      await mount(tester);
      await tap(tester, find.text('그늘길'));
      final options = container.read(routePredictionOptionsProvider.notifier);
      options.setDepartureAt(predictionDeparture);
      options.selectMode(mode);
      await tester.pumpAndSettle();
      await tap(tester, find.text('그늘길 비교'));
      await leaveRoute(tester);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      final oldPath = canvas(tester).routePath;
      predictions.handler = (_) async =>
          const Result.failure(Failure(type: FailureType.network));
      await tap(tester, find.text('현재 위치로 재검색'));
      expect(find.text('새 경로를 찾지 못했어요'), findsOneWidget);
      expect(find.textContaining('서버에 연결하지 못했어요'), findsOneWidget);
      expect(canvas(tester).routePath, oldPath);
      expect(container.read(routeSelectionProvider).endpoints, endpoints);
      expect(find.text('안내 시작'), findsNothing);

      location.location = Result.success(
        position(retryPosition, accuracy: 100),
      );
      await tap(tester, find.text('다시 시도'));
      expect(find.textContaining('GPS 신호를 확인해 주세요'), findsOneWidget);
      expect(predictions.queries, hasLength(3));
      location.location = Result.success(position(retryPosition));
      predictions.handler = (query) async {
        final prediction = walkingPrediction(query);
        final candidate = prediction.routes.single;
        return Result.success(
          prediction.copyWith(
            routes: [
              candidate.copyWith(
                path: [
                  query.origin,
                  if (query.mode == RoutePredictionMode.shade) offRoute,
                  query.destination,
                ],
                guidance: null,
                shadeSegments: [],
              ),
            ],
          ),
        );
      };
      await tap(tester, find.text('다시 시도'));

      expect(predictions.queries, hasLength(5));
      for (final query in predictions.queries.skip(3)) {
        expect(query.origin, retryPosition);
        expect(query.destination, endpoints.destination!.coordinate);
        expect(query.departureAt, predictionDeparture);
      }
      expect(container.read(routePredictionOptionsProvider).mode, mode);
      final current = container.read(navigationProvider);
      expect(current.status, GuidanceStatus.following);
      expect(current.route!.path, [
        retryPosition,
        if (mode == RoutePredictionMode.shade) offRoute,
        forestDestination,
      ]);
      expect(canvas(tester).routePath, current.route!.path);
      expect(find.byType(GuidanceTimeCard), findsOneWidget);
      await tap(tester, find.text('안내 종료'));
    });
  }

  testWidgets(
    'ending guidance cancels a pending reroute and ignores its reply',
    (tester) async {
      await mount(tester);
      await leaveRoute(tester);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      final pending = await beginPendingReroute(tester);
      final cancellations = repository.cancellations;
      await tap(tester, find.text('안내 종료'));
      expect(repository.cancellations, cancellations + 1);
      pending.complete(
        Result.success(sampleRouteResult(repository.queries.last)),
      );
      await tester.pumpAndSettle();

      expect(container.read(navigationProvider).active, false);
      expect(container.read(routeSelectionProvider).endpoints, endpoints);
      expect(canvas(tester).routePath, route.path);
      expect(find.text('안내 시작'), findsOneWidget);
    },
  );

  testWidgets(
    'backgrounding cancels reroute and leaves the original guide paused',
    (tester) async {
      await mount(tester);
      await leaveRoute(tester);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      final pending = await beginPendingReroute(tester);
      final cancellations = repository.cancellations;
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      expect(repository.cancellations, cancellations + 1);
      pending.complete(
        Result.success(sampleRouteResult(repository.queries.last)),
      );
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();

      expect(container.read(navigationProvider).status, GuidanceStatus.paused);
      expect(container.read(routeSelectionProvider).endpoints, endpoints);
      expect(canvas(tester).routePath, route.path);
      expect(find.text('안내 계속'), findsOneWidget);
      await tap(tester, find.text('안내 종료'));
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
