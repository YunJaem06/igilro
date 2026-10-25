import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Size;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'package:igilro/app/di/app_providers.dart';
import 'package:igilro/app/di/location_dependencies.dart';
import 'package:igilro/app/di/route_dependencies.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/app/theme/app_theme.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/presentation/providers/location_notifier.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/adapters/mapbox_controller.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/map/presentation/widgets/mapbox_surface.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/domain/entities/route_candidate.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

// Requires the real local server and the documented Seoul Forest OSM dataset.
// No fake repository, canned HTTP response or external map routing API is used.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('live walking routes render and recover from errors', (
    tester,
  ) async {
    final config = AppConfig.fromEnvironment();
    expect(config.environment, AppEnvironment.development);
    expect(config.mapboxAccessToken, isNotEmpty);
    MapboxOptions.setAccessToken(config.mapboxAccessToken);
    MapboxMapsOptions.setLanguage('ko');
    MapboxMap? nativeMap;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(config),
          mapConfiguredProvider.overrideWithValue(true),
          locationRepositoryProvider.overrideWith(
            (ref) => createLocationRepository(),
          ),
          routeRepositoryProvider.overrideWith((ref) {
            final repository = createRouteRepository(
              ref.watch(dioClientProvider),
            );
            ref.onDispose(repository.cancelSearch);
            return repository;
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          locale: const Locale('ko'),
          supportedLocales: const [Locale('ko')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: HomePage(
            mapSurfaceBuilder: (state, markers, path, onTap, ready, failure) =>
                MapboxSurface(
                  key: ValueKey(state.session),
                  state: state,
                  markers: markers,
                  routePath: path,
                  onCoordinateTapped: onTap,
                  onReady: ready,
                  onFailure: failure,
                  onMapCreated: (map) => nativeMap = map,
                ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 3));
    final container = ProviderScope.containerOf(
      tester.element(find.byType(HomePage)),
    );
    final dio = container.read(dioProvider);
    final statuses = <int>[];
    final responseIds = <String>[];
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          statuses.add(response.statusCode!);
          final id = response.headers.value('x-request-id');
          if (id != null) responseIds.add(id);
          handler.next(response);
        },
        onError: (error, handler) {
          if (error.response?.statusCode case final int status) {
            statuses.add(status);
          }
          handler.next(error);
        },
      ),
    );
    final health = await dio.get<Map<String, dynamic>>('/api/v1/health');
    expect(health.statusCode, 200);
    expect(health.data!['status'], 'UP');
    await _waitUntil(
      tester,
      () => container.read(mapProvider).status != MapLoadStatus.loading,
    );
    expect(container.read(mapProvider).status, MapLoadStatus.ready);

    // The host fixture seeds this coordinate and grants permission after install.
    await _tap(tester, find.text('현재 위치를 출발지로'));
    await _waitUntil(tester, () => !container.read(locationProvider).isLoading);
    final fix = container.read(locationProvider).asData?.value;
    expect(
      fix,
      isNotNull,
      reason:
          'Grant foreground location and seed Seoul Forest: 37.5445,127.0374.',
    );
    expect(fix!.coordinate.latitude, closeTo(37.5445, 0.00002));
    expect(fix.coordinate.longitude, closeTo(127.0374, 0.00002));
    const origin = GeoCoordinate(latitude: 37.5445, longitude: 127.0374);
    const destination = GeoCoordinate(latitude: 37.5480, longitude: 127.0430);
    await _selectPoint(
      tester,
      container,
      nativeMap!,
      RouteEndpoint.destination,
      destination,
    );
    final first = await _search(tester, container);
    expect(statuses.last, 200);
    expect(first, isNotNull);
    final route = first!.routes.first;
    expect(route.distanceMeters, closeTo(800.8, 0.5));
    expect(route.duration.inSeconds, inInclusiveRange(572, 574));
    expect(route.path.length, greaterThan(2));
    expect(first.dataVersion, startsWith('osm-v1-'));
    expect(first.attribution, contains('OpenStreetMap'));
    expect(responseIds, isNotEmpty);
    await tester.ensureVisible(find.text('도보 경로'));
    expect(find.text('10분 · 801m'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    await _expectRouteVisibility(tester, nativeMap!, visible: true);
    await _waitForCameraIncludes(tester, nativeMap!, [
      ...route.path,
      first.query.origin,
      first.query.destination,
    ]);
    expect(find.text('건물 그늘'), findsOneWidget);
    expect(find.textContaining('평가 기준 '), findsOneWidget);
    if (route.shadeEvaluation?.status ==
        ShadeEvaluationStatus.dataUnavailable) {
      expect(find.text('그늘 정보 준비 중'), findsOneWidget);
      expect(find.text('그늘 0%'), findsNothing);
    }
    final mapHeight = tester.getSize(find.byType(MapWidget)).height;
    await tester.tap(find.byTooltip('검색 패널 펼치기'));
    await tester.pump(const Duration(seconds: 1));
    expect(tester.getSize(find.byType(MapWidget)).height, lessThan(mapHeight));
    await _expectRouteVisibility(tester, nativeMap!, visible: true);
    await _waitForCameraIncludes(tester, nativeMap!, [
      ...route.path,
      first.query.origin,
      first.query.destination,
    ]);
    for (final coordinate in [first.query.origin, first.query.destination]) {
      final pixel = await nativeMap!.pixelForCoordinate(
        MapboxController.pointFor(coordinate),
      );
      final height = tester.getSize(find.byType(MapWidget)).height;
      expect(pixel.y, greaterThanOrEqualTo(height * 0.20));
      expect(pixel.y, lessThanOrEqualTo(height - 20));
    }
    debugPrint(
      'IGILRO_LIVE_SUCCESS distance=${route.distanceMeters} seconds=${route.duration.inSeconds} points=${route.path.length} requestId=${responseIds.last}',
    );
    await tester.pump(const Duration(seconds: 2));

    // Real server validation, using map-selected coordinates outside its pilot.
    await _selectPoint(
      tester,
      container,
      nativeMap!,
      RouteEndpoint.origin,
      const GeoCoordinate(latitude: 37.5665, longitude: 126.9780),
    );
    await _search(tester, container);
    expect(statuses.last, 422);
    expect(
      (container.read(routeSearchProvider).error as Failure).code,
      'OUTSIDE_SUPPORTED_AREA',
    );
    await _showMessage(tester, '현재 지원하는 지역에서 출발지와 도착지를 선택해 주세요.');
    await _expectRouteVisibility(tester, nativeMap!, visible: false);
    debugPrint('IGILRO_LIVE_OUTSIDE');
    await tester.pump(const Duration(seconds: 2));

    // This point is inside the pilot but has no walking edge within 50 meters
    // in the documented OSM snapshot. This is an actual server 404.
    await _selectPoint(
      tester,
      container,
      nativeMap!,
      RouteEndpoint.origin,
      const GeoCoordinate(latitude: 37.5331, longitude: 127.0271),
    );
    await _search(tester, container);
    expect(statuses.last, 404);
    expect(
      (container.read(routeSearchProvider).error as Failure).code,
      'ROUTE_NOT_FOUND',
    );
    await _showMessage(tester, '선택한 두 지점을 잇는 도보 경로가 없어요.');
    debugPrint('IGILRO_LIVE_NO_ROUTE');
    await tester.pump(const Duration(seconds: 2));

    // A real connection refusal, without stopping or modifying the dev server.
    await _selectPoint(
      tester,
      container,
      nativeMap!,
      RouteEndpoint.origin,
      origin,
    );
    final reservation = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      0,
    );
    final unavailablePort = reservation.port;
    await reservation.close();
    final originalBaseUrl = dio.options.baseUrl;
    try {
      dio.options.baseUrl = 'http://127.0.0.1:$unavailablePort';
      await _search(tester, container);
      expect(
        (container.read(routeSearchProvider).error as Failure).type,
        FailureType.network,
      );
      await _showMessage(tester, '서버에 연결하지 못했어요. 네트워크 연결을 확인해 주세요.');
      debugPrint('IGILRO_LIVE_NETWORK');
      await tester.pump(const Duration(seconds: 2));
    } finally {
      dio.options.baseUrl = originalBaseUrl;
    }
    final recovered = await _search(tester, container);
    expect(recovered, isNotNull);
    expect(statuses.last, 200);
    await _expectRouteVisibility(tester, nativeMap!, visible: true);
    expect(tester.takeException(), isNull);
  });
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pump();
}

Future<void> _selectPoint(
  WidgetTester tester,
  ProviderContainer container,
  MapboxMap map,
  RouteEndpoint endpoint,
  GeoCoordinate coordinate,
) async {
  final label = endpoint == RouteEndpoint.origin ? '출발지' : '도착지';
  await _tap(tester, find.byTooltip('지도에서 $label 선택'));
  container.read(mapProvider.notifier).framePoints([coordinate]);
  await tester.pump(const Duration(seconds: 1));
  final pixel = await map.pixelForCoordinate(
    MapboxController.pointFor(coordinate),
  );
  await map.dispatch('click', pixel);
  await _waitUntil(tester, () {
    final candidate = container
        .read(routeSelectionProvider)
        .candidate
        ?.coordinate;
    return candidate != null &&
        (candidate.latitude - coordinate.latitude).abs() < 0.000001 &&
        (candidate.longitude - coordinate.longitude).abs() < 0.000001;
  });
  await tester.pump(const Duration(milliseconds: 300));
  await _tap(tester, find.text('$label로 선택'));
  expect(container.read(routeSelectionProvider).selecting, isNull);
}

Future<RouteSearchResult?> _search(
  WidgetTester tester,
  ProviderContainer container,
) async {
  final button = container.read(routeSearchProvider).hasError
      ? '다시 검색'
      : '경로 검색';
  await _tap(tester, find.text(button));
  await _waitUntil(
    tester,
    () => !container.read(routeSearchProvider).isLoading,
  );
  await tester.pump(const Duration(milliseconds: 600));
  return container.read(routeSearchProvider).asData?.value;
}

Future<void> _showMessage(WidgetTester tester, String message) async {
  expect(find.text(message), findsOneWidget);
  await tester.ensureVisible(find.text(message));
  await tester.pump();
}

Future<void> _expectCameraIncludes(
  MapboxMap map,
  List<GeoCoordinate> points,
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
  for (final point in points) {
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

Future<void> _waitForCameraIncludes(
  WidgetTester tester,
  MapboxMap map,
  List<GeoCoordinate> points,
) async {
  for (var attempt = 0; attempt < 40; attempt++) {
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
    if (points.every(
      (point) =>
          point.latitude >= bounds.southwest.coordinates.lat &&
          point.latitude <= bounds.northeast.coordinates.lat &&
          point.longitude >= bounds.southwest.coordinates.lng &&
          point.longitude <= bounds.northeast.coordinates.lng,
    )) {
      final size = tester.getSize(find.byType(MapWidget));
      final pixels = await map.pixelsForCoordinates(
        points.map(MapboxController.pointFor).toList(growable: false),
      );
      if (pixels.every(
        (pixel) => pixel.y >= size.height * 0.20 && pixel.y <= size.height - 20,
      )) {
        return;
      }
    }
    await tester.pump(const Duration(milliseconds: 100));
  }
  await _expectCameraIncludes(map, points);
}

Future<void> _expectRouteVisibility(
  WidgetTester tester,
  MapboxMap map, {
  required bool visible,
}) async {
  final deadline = DateTime.now().add(const Duration(seconds: 30));
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
  fail('Expected native route visibility: $visible');
}

Future<void> _waitUntil(WidgetTester tester, bool Function() complete) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (!complete() && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
  }
  expect(
    complete(),
    true,
    reason: 'Live native operation did not complete in time.',
  );
}
