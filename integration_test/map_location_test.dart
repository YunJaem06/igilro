import 'package:flutter/material.dart' hide Size;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:igilro/app/di/location_dependencies.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/app/theme/app_theme.dart';
import 'package:igilro/features/location/presentation/providers/location_notifier.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/adapters/mapbox_controller.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/map/presentation/widgets/mapbox_surface.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../test/helpers/fake_route_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('native routes fit the camera and survive reloads', (
    tester,
  ) async {
    final config = AppConfig.fromEnvironment();
    expect(config.mapboxAccessToken, isNotEmpty);
    MapboxOptions.setAccessToken(config.mapboxAccessToken);
    MapboxMapsOptions.setLanguage('ko');
    MapboxMap? nativeMap;
    final routeRepository = FakeRouteRepository();
    var styleReadyCount = 0;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          mapConfiguredProvider.overrideWithValue(true),
          routeRepositoryProvider.overrideWithValue(routeRepository),
          locationRepositoryProvider.overrideWith(
            (ref) => createLocationRepository(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          locale: const Locale('ko'),
          supportedLocales: const [Locale('ko')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: HomePage(
            mapSurfaceBuilder:
                (state, markers, routePath, onTap, ready, failure) =>
                    MapboxSurface(
                      key: ValueKey(state.session),
                      state: state,
                      markers: markers,
                      routePath: routePath,
                      onCoordinateTapped: onTap,
                      onReady: () {
                        styleReadyCount++;
                        ready();
                      },
                      onFailure: failure,
                      onMapCreated: (map) => nativeMap = map,
                    ),
          ),
        ),
      ),
    );
    await tester.pump();
    // Allows a simulator fixture to grant foreground permission after the
    // Flutter test runner reinstalls the application.
    await tester.pump(const Duration(seconds: 3));
    final container = ProviderScope.containerOf(
      tester.element(find.byType(HomePage)),
    );
    expect(
      container.read(mapConfiguredProvider),
      true,
      reason: 'Pass a public token through --dart-define-from-file.',
    );
    final map = find.byType(MapWidget);
    expect(map, findsOneWidget);
    await _waitUntil(
      tester,
      () => container.read(mapProvider).status != MapLoadStatus.loading,
    );
    expect(container.read(mapProvider).status, MapLoadStatus.ready);

    // Grant access after installation or accept the native permission dialog.
    await tester.ensureVisible(find.text('현재 위치를 출발지로'));
    await tester.tap(find.text('현재 위치를 출발지로'));
    await _waitUntil(tester, () => !container.read(locationProvider).isLoading);
    final fix = container.read(locationProvider).value;
    expect(
      fix,
      isNotNull,
      reason: 'Enable location services, grant permission, and seed a simulator location.',
    );
    expect(container.read(mapProvider).currentLocation, fix!.coordinate);
    expect(
      container.read(routeSelectionProvider).endpoints.origin!.coordinate,
      fix.coordinate,
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.ensureVisible(find.byTooltip('지도에서 도착지 선택'));
    await tester.tap(find.byTooltip('지도에서 도착지 선택'));
    await tester.pump();
    final mapBounds = tester.getRect(map);
    // Flutter synthetic pointers are not physical UIKit gestures. Dispatch
    // through the SDK's native event pipeline, as in Mapbox's own SDK tests.
    await nativeMap!.dispatch(
      'click',
      ScreenCoordinate(x: mapBounds.width * 0.7, y: mapBounds.height * 0.35),
    );
    await _waitUntil(
      tester,
      () => container.read(routeSelectionProvider).candidate != null,
    );
    // Native event completion updates provider state before the next Flutter
    // frame enables the confirmation button.
    await tester.pump(const Duration(milliseconds: 300));
    expect(container.read(mapProvider).status, MapLoadStatus.ready);
    expect(
      tester
          .widget<FilledButton>(find.widgetWithText(FilledButton, '도착지로 선택'))
          .onPressed,
      isNotNull,
    );
    await tester.ensureVisible(find.text('도착지로 선택'));
    await tester.tap(find.text('도착지로 선택'));
    await tester.pump(const Duration(seconds: 2));
    final endpoints = container.read(routeSelectionProvider).endpoints;
    expect(endpoints.canSearch, true);
    expect(container.read(mapProvider).framedCoordinates, [
      endpoints.origin!.coordinate,
      endpoints.destination!.coordinate,
    ]);
    final camera = await nativeMap!.getCameraState();
    final bounds = await nativeMap!.coordinateBoundsForCamera(
      CameraOptions(
        center: camera.center,
        zoom: camera.zoom,
        bearing: camera.bearing,
        pitch: camera.pitch,
        padding: camera.padding,
      ),
    );
    for (final point in [endpoints.origin!, endpoints.destination!]) {
      expect(
        point.coordinate.latitude,
        inInclusiveRange(
          bounds.southwest.coordinates.lat,
          bounds.northeast.coordinates.lat,
        ),
      );
      expect(
        point.coordinate.longitude,
        inInclusiveRange(
          bounds.southwest.coordinates.lng,
          bounds.northeast.coordinates.lng,
        ),
      );
    }
    expect(tester.takeException(), isNull);
    // A host-side fixture may capture the actual native pins for visual QA.
    debugPrint('IGILRO_ENDPOINTS_READY');
    await tester.pump(const Duration(seconds: 2));

    // Use a deterministic route fixture: this test exercises native rendering,
    // not server availability or the server's graph calculation.
    final result = sampleRouteResult(
      RouteQuery(
        origin: endpoints.origin!.coordinate,
        destination: endpoints.destination!.coordinate,
        departureAt: DateTime.now().toUtc(),
      ),
    );
    final path = [
      endpoints.origin!.coordinate,
      GeoCoordinate(
        latitude: endpoints.origin!.coordinate.latitude + 0.005,
        longitude: endpoints.origin!.coordinate.longitude + 0.005,
      ),
      endpoints.destination!.coordinate,
    ];
    routeRepository.response = Result.success(
      result.copyWith(routes: [result.routes.single.copyWith(path: path)]),
    );
    await tester.ensureVisible(find.text('경로 검색'));
    await tester.tap(find.text('경로 검색'));
    await tester.pump(const Duration(seconds: 2));
    await _waitForRoute(tester, nativeMap!, visible: true);
    await _expectRouteInCamera(nativeMap!, path);

    // Recreating style managers must restore an unchanged route and its pins.
    final readyBeforeReload = styleReadyCount;
    await nativeMap!.loadStyleURI(MapboxStyles.STANDARD);
    await _waitUntil(tester, () => styleReadyCount > readyBeforeReload);
    await tester.pump(const Duration(seconds: 1));
    await _waitForRoute(tester, nativeMap!, visible: true);
    await _expectRouteInCamera(nativeMap!, path);

    container.read(routeSelectionProvider.notifier).clear(RouteEndpoint.origin);
    await tester.pump(const Duration(seconds: 1));
    await _waitForRoute(tester, nativeMap!, visible: false);
    expect(tester.takeException(), isNull);
  });
}

Future<void> _expectRouteInCamera(
  MapboxMap map,
  List<GeoCoordinate> path,
) async {
  final camera = await map.getCameraState();
  final bounds = await map.coordinateBoundsForCamera(
    CameraOptions(
      center: camera.center,
      zoom: camera.zoom,
      bearing: camera.bearing,
      pitch: camera.pitch,
      padding: camera.padding,
    ),
  );
  for (final point in path) {
    expect(
      point.latitude,
      inInclusiveRange(
        bounds.southwest.coordinates.lat,
        bounds.northeast.coordinates.lat,
      ),
    );
    expect(
      point.longitude,
      inInclusiveRange(
        bounds.southwest.coordinates.lng,
        bounds.northeast.coordinates.lng,
      ),
    );
  }
}

Future<void> _waitForRoute(
  WidgetTester tester,
  MapboxMap map, {
  required bool visible,
}) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
    final size = tester.getSize(find.byType(MapWidget));
    final features = await map.queryRenderedFeatures(
      RenderedQueryGeometry.fromScreenBox(
        ScreenBox(
          min: ScreenCoordinate(x: 0, y: 0),
          max: ScreenCoordinate(x: size.width, y: size.height),
        ),
      ),
      RenderedQueryOptions(layerIds: [MapboxController.routeLayerId]),
    );
    if (features.isNotEmpty == visible) return;
  }
  fail('Native route visibility did not become $visible.');
}

Future<void> _waitUntil(WidgetTester tester, bool Function() complete) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (!complete() && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
  }
  expect(
    complete(),
    true,
    reason: 'Native operation did not complete in time.',
  );
}
