import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/presentation/providers/prediction_coverage_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_comparison_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/place_search/presentation/place_search_notifier.dart';

import '../helpers/fake_location_repository.dart';
import '../helpers/fake_prediction_repository.dart';
import '../helpers/fake_place_repository.dart';

void main() {
  late ProviderContainer container;
  late FakePredictionRepository repository;
  setUp(() {
    repository = FakePredictionRepository();
    container = ProviderContainer(
      overrides: [
        mapConfiguredProvider.overrideWithValue(true),
        routePredictionRepositoryProvider.overrideWithValue(repository),
        placeRepositoryProvider.overrideWithValue(FakePlaceRepository()),
        locationRepositoryProvider.overrideWithValue(
          FakeLocationRepository()
            ..location = Result.success(
              LocationFix(
                coordinate: forestOrigin,
                accuracyMeters: 3,
                capturedAt: DateTime.now().toUtc(),
              ),
            ),
        ),
      ],
    );
    container.listen(mapProvider, (_, _) {});
    container.read(mapProvider.notifier).markReady();
    addTearDown(container.dispose);
  });

  Future<void> mount(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: HomePage(
            mapSurfaceBuilder: (state, markers, path, tapped, ready, failed) =>
                const ColoredBox(color: Colors.white),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  MapCanvas map(WidgetTester tester) =>
      tester.widget<MapCanvas>(find.byType(MapCanvas));
  Future<void> tap(WidgetTester tester, String text) async {
    await tester.ensureVisible(find.text(text));
    await tester.tap(find.text(text));
    await tester.pumpAndSettle();
  }

  Future<void> selectEntries(WidgetTester tester) async {
    final entries = map(tester).coverage!.accessPoints;
    map(tester).onAccessPointTapped!(entries.first);
    await tester.pumpAndSettle();
    await tap(tester, '출발지로 설정');
    map(tester).onAccessPointTapped!(entries.last);
    await tester.pumpAndSettle();
    await tap(tester, '도착지로 설정');
    container
        .read(routePredictionOptionsProvider.notifier)
        .setDepartureAt(predictionDeparture);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'server coverage frames bounds and entry selection searches a comparable pair',
    (tester) async {
      await mount(tester);
      final c = sampleCoverage();
      expect(container.read(mapProvider).framedCoordinates, c.bounds.corners);
      expect(container.read(mapProvider).center, c.center);
      expect(map(tester).coverage!.walkingNetwork, c.walkingNetwork);
      expect(repository.queries, isEmpty);
      await selectEntries(tester);
      final endpoints = container.read(routeSelectionProvider).endpoints;
      expect(endpoints.origin!.name, '테스트 출입구 1');
      expect(endpoints.origin!.coordinate, forestOrigin);
      expect(endpoints.destination!.coordinate, forestDestination);
      await tap(tester, '그늘길 비교');
      expect(repository.queries.map((q) => q.departureAt).toSet(), {
        predictionDeparture,
      });
      expect(repository.queries.map((q) => q.mode), RoutePredictionMode.values);
      expect(find.text('예측 그늘 54.6%'), findsOneWidget);
      expect(find.text('예측 그늘 31.1%'), findsOneWidget);
      final route = predictionFor(repository.queries.last).routes.single;
      expect(map(tester).routePath, route.path);
      expect(map(tester).routeSegments.length, 4);
      expect(map(tester).routeSegments[1].path.length, 6);
      expect(map(tester).routeSegments[1].state, MapShadeState.shade);
      expect(find.text('예측 햇빛'), findsOneWidget);
      await tap(tester, '빠른 길');
      expect(repository.queries.length, 2);
      expect(map(tester).alternativeRoutePath, route.path);
      expect(
        map(tester).routePath,
        predictionFor(repository.queries.first).routes.single.path,
      );
      await tester.tap(find.byTooltip('출발지 선택 지우기'));
      await tester.pumpAndSettle();
      expect(map(tester).routePath, isEmpty);
      expect(map(tester).routeSegments, isEmpty);
    },
  );

  testWidgets(
    'map-picked coordinates are confirmed and passed unchanged to both prediction requests',
    (tester) async {
      await mount(tester);
      for (final entry in {
        'origin': forestOrigin,
        'destination': forestDestination,
      }.entries) {
        await tester.tap(find.byKey(ValueKey('route-${entry.key}')));
        await tester.pumpAndSettle();
        await tap(tester, '지도에서 선택');
        map(tester).onCoordinateTapped!(entry.value);
        await tester.pumpAndSettle();
        await tap(tester, entry.key == 'origin' ? '출발지로 선택' : '도착지로 선택');
      }
      await tap(tester, '그늘길 비교');
      expect(repository.queries.length, 2);
      for (final query in repository.queries) {
        expect(query.origin, forestOrigin);
        expect(query.destination, forestDestination);
      }
      expect(
        repository.queries.first.departureAt,
        repository.queries.last.departureAt,
      );
      expect(map(tester).routeSegments.length, 4);
    },
  );

  testWidgets(
    'time changes clear old paint and refresh colors even when the whole path is identical',
    (tester) async {
      repository.handler = (query) async {
        var value = predictionFor(query);
        if (query.departureAt!.hour == 3) {
          final route = value.routes.single;
          value = value.copyWith(
            routes: [
              route.copyWith(
                shadeSegments: route.shadeSegments
                    .map(
                      (s) => s.copyWith(
                        state: s.state == PredictedShadeState.shade
                            ? PredictedShadeState.sunlight
                            : PredictedShadeState.shade,
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        }
        return Result.success(value);
      };
      await mount(tester);
      await selectEntries(tester);
      await tap(tester, '그늘길 비교');
      final before = map(tester);
      container
          .read(routePredictionOptionsProvider.notifier)
          .setDepartureAt(DateTime.utc(2026, 10, 28, 3));
      await tester.pumpAndSettle();
      expect(map(tester).routeSegments, isEmpty);
      await tap(tester, '그늘길 비교');
      expect(map(tester).routePath, before.routePath);
      expect(
        map(tester).routeSegments.first.state,
        isNot(before.routeSegments.first.state),
      );
    },
  );

  testWidgets(
    'existing foreground guidance receives the selected complete route and keeps its segment colors',
    (tester) async {
      await mount(tester);
      await selectEntries(tester);
      await tap(tester, '그늘길 비교');
      final selected = map(tester);
      await tap(tester, '안내 시작');
      final guidance = container.read(navigationProvider);
      expect(guidance.active, true);
      expect(guidance.isPreview, false);
      expect(guidance.route!.path, selected.routePath);
      expect(guidance.route!.path.length, greaterThan(2));
      expect(map(tester).routeSegments, selected.routeSegments);
      expect(map(tester).coverage, isNull);
      await tap(tester, '안내 종료');
      expect(map(tester).coverage, isNotNull);
    },
  );

  testWidgets(
    'outside-area failure clears paint and offers the server coverage camera action',
    (tester) async {
      await mount(tester);
      await selectEntries(tester);
      repository.response = const Result.failure(
        Failure(
          type: FailureType.server,
          code: 'OUTSIDE_SUPPORTED_AREA',
          requestId: 'route-request',
        ),
      );
      await tap(tester, '그늘길 비교');
      expect(map(tester).routeSegments, isEmpty);
      expect(
        (container.read(routeComparisonProvider).error as Failure).requestId,
        'route-request',
      );
      await tap(tester, '서울숲으로 이동');
      expect(
        container.read(mapProvider).framedCoordinates,
        sampleCoverage().bounds.corners,
      );
      expect(find.text('안내 시작'), findsNothing);
    },
  );

  testWidgets(
    'coverage failure can retry with new server bounds and exposes attribution in details',
    (tester) async {
      repository.coverageResponse = const Result.failure(
        Failure(type: FailureType.network),
      );
      await mount(tester);
      expect(map(tester).coverage, isNull);
      repository.coverageResponse = Result.success(
        sampleCoverage().copyWith(
          bounds: sampleCoverage().bounds.copyWith(west: 127.02),
        ),
      );
      await tap(tester, '범위 다시 불러오기');
      expect(repository.coverageRequests, 2);
      expect(map(tester).coverage!.boundary.first.longitude, 127.02);
      expect(
        container.read(mapProvider).framedCoordinates.first.longitude,
        127.02,
      );
      await tester.tap(find.byTooltip('검색 범위와 출처'));
      await tester.pumpAndSettle();
      expect(find.text(sampleCoverage().attribution), findsOneWidget);
      expect(container.read(predictionCoverageProvider).hasError, false);
    },
  );
}
