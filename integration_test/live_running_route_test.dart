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
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
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

  testWidgets('live running comparison selects both routes on the native map', (
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
    await _tap(tester, '러닝길');
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
      findsOneWidget,
    );

    MapCanvas canvas() => tester.widget<MapCanvas>(find.byType(MapCanvas));
    expect(canvas().routePath, running.path);
    expect(canvas().alternativeRoutePath, fastest.path);
    await _tap(tester, '빠른 길');
    expect(canvas().routePath, fastest.path);
    expect(canvas().alternativeRoutePath, running.path);
    await _tap(tester, '러닝 추천');
    expect(canvas().routePath, running.path);
    await _tap(tester, '미리보기');
    expect(container.read(navigationProvider).isPreview, true);
    expect(
      container.read(navigationProvider).route!.guidance,
      running.guidance,
    );
    expect(tester.takeException(), isNull);
    debugPrint(
      'IGILRO_RUNNING_COMPARISON fastest=${fastest.distanceMeters}m/${fastest.duration.inSeconds}s/'
      '${fastest.metrics.mappedCrossingCount} running=${running.distanceMeters}m/'
      '${running.duration.inSeconds}s/${running.metrics.mappedCrossingCount}',
    );
  });
}

Future<void> _tap(WidgetTester tester, String text) async {
  final finder = find.text(text);
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

Future<void> _waitUntil(WidgetTester tester, bool Function() ready) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (!ready() && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  expect(ready(), true, reason: 'Local server or native map did not respond.');
}
