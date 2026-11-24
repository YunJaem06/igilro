import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'package:igilro/app/bootstrap.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/arrival_summary_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_steps_sheet.dart';
import 'package:igilro/features/navigation/presentation/guidance_time_card.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';
import 'package:igilro/features/route_search/domain/entities/route_point.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';

// The documented Seoul Forest graph snapshot and a real local API are required.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('live running comparison, guidance and arrival work on the map', (
    tester,
  ) async {
    bootstrap();
    await tester.pump();
    final container = ProviderScope.containerOf(
      tester.element(find.byType(HomePage)),
    );
    await _waitUntil(
      tester,
      () => container.read(mapProvider).status == MapLoadStatus.ready,
    );
    expect(find.byType(MapWidget), findsOneWidget);
    container
        .read(routeSelectionProvider.notifier)
        .setEndpoints(
          const RouteEndpoints(
            origin: RoutePoint(
              coordinate: GeoCoordinate(
                longitude: 127.0443258,
                latitude: 37.5429175,
              ),
              source: RoutePointSource.map,
            ),
            destination: RoutePoint(
              coordinate: GeoCoordinate(longitude: 127.0402, latitude: 37.5417),
              source: RoutePointSource.map,
            ),
          ),
        );
    await tester.pump();
    await _tapFinder(tester, find.widgetWithText(ChoiceChip, '러닝길'));
    await _tap(tester, '러닝길 비교');
    await _waitUntil(
      tester,
      () => !container.read(routeSearchProvider).isLoading,
    );

    final search = container.read(routeSearchProvider);
    expect(search.hasError, false, reason: '${search.error}');
    final result = search.requireValue!;
    final fastest = result.routeFor(RouteMode.fastest);
    final running = result.routeFor(RouteMode.running);
    expect(running.path, isNot(equals(fastest.path)));
    expect(
      running.metrics.mappedCrossingCount,
      lessThan(fastest.metrics.mappedCrossingCount!),
    );
    expect(running.guidance?.status, RouteGuidanceStatus.available);
    for (final route in [fastest, running]) {
      expect(
        find.text(
          '${route.duration.inMinutes}분 ${route.duration.inSeconds % 60}초 · ${route.distanceMeters.round()}m',
        ),
        findsOneWidget,
      );
    }
    expect(
      find.text('빠른 길 대비 +${running.additionalDuration.inSeconds}초'),
      findsNothing,
    );

    MapCanvas canvas() => tester.widget<MapCanvas>(find.byType(MapCanvas));
    expect(canvas().routePath, running.path);
    expect(canvas().alternativeRoutePath, fastest.path);
    await _tap(tester, '빠른 길');
    expect(canvas().routePath, fastest.path);
    expect(canvas().alternativeRoutePath, running.path);
    await _tap(tester, '러닝 추천');
    expect(canvas().routePath, running.path);

    await _tap(tester, '상세 보기');
    expect(
      find.text('빠른 길 대비 +${running.additionalDuration.inSeconds}초'),
      findsOneWidget,
    );
    await _tap(tester, '전체 길안내');
    await tester.pump(const Duration(milliseconds: 400));
    final inspectIndex = running.guidance!.steps.length ~/ 2;
    final stepTile = find.byKey(ValueKey('guidance-step-$inspectIndex'));
    await tester.scrollUntilVisible(
      stepTile,
      200,
      scrollable: find.descendant(
        of: find.byKey(const Key('guidance-steps-list')),
        matching: find.byType(Scrollable),
      ),
    );
    final gpsBefore = container.read(mapProvider).currentLocation;
    await _tapFinder(tester, stepTile);
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(GuidanceStepsSheet), findsNothing);
    expect(
      container.read(mapProvider).center,
      running.guidance!.steps[inspectIndex].coordinate,
    );
    expect(container.read(mapProvider).currentLocation, gpsBefore);
    expect(canvas().guidancePoints.single.role, MapGuidancePointRole.selected);
    await _tapFinder(tester, find.byTooltip('전체 경로 보기'));
    expect(canvas().guidancePoints, isEmpty);

    await _tap(tester, '상세 보기');
    await _tap(tester, '미리보기');
    expect(container.read(navigationProvider).isPreview, true);
    expect(
      container.read(navigationProvider).route!.guidance,
      running.guidance,
    );
    expect(container.read(navigationProvider).instruction, isNotNull);
    expect(find.byType(GuidanceTimeCard), findsOneWidget);
    expect(find.textContaining('도착 예정'), findsOneWidget);
    await _waitUntil(
      tester,
      () => container.read(navigationProvider).status == GuidanceStatus.arrived,
    );
    expect(find.byType(ArrivalSummaryCard), findsOneWidget);
    expect(find.text('경로 미리보기가 끝났어요'), findsOneWidget);
    expect(find.byType(GuidanceTimeCard), findsNothing);
    await _tapFinder(tester, find.byKey(const Key('arrival-finish')));
    expect(container.read(navigationProvider).active, false);
    expect(container.read(navigationProvider).session, isNull);
    expect(find.text('안내 시작'), findsOneWidget);
    expect(tester.takeException(), isNull);
    debugPrint(
      'IGILRO_RUNNING_COMPARISON fastest=${fastest.distanceMeters}m/${fastest.duration.inSeconds}s/'
      '${fastest.metrics.mappedCrossingCount} running=${running.distanceMeters}m/'
      '${running.duration.inSeconds}s/${running.metrics.mappedCrossingCount}',
    );
  });
}

Future<void> _tap(WidgetTester tester, String text) =>
    _tapFinder(tester, find.text(text));

Future<void> _tapFinder(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump(const Duration(milliseconds: 350));
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 350));
}

Future<void> _waitUntil(WidgetTester tester, bool Function() ready) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (!ready() && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  expect(ready(), true, reason: 'Local server or native map did not respond.');
}
