import 'dart:math' as math;
import 'dart:ui' as ui show Size;

import 'package:flutter/foundation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../../../../core/geo/solar_position.dart';
import '../state/map_marker.dart';
import '../state/map_state.dart';
import '../state/map_overlays.dart';
import 'coverage_geojson.dart';
import 'map_pin_image.dart';

/// Owned by one Mapbox surface. SDK objects never enter Riverpod state.
final class MapboxController {
  MapboxController(this._map, {this.onAccessPointTapped});

  final ValueChanged<MapAccessPoint>? onAccessPointTapped;

  static const routeLayerId = 'igilro.route';
  static const segmentsLayerId = 'igilro.route-segments';
  static const coverageSourceId = 'igilro.coverage';
  static const networkLayerId = 'igilro.walking-network';
  static const boundsLayerId = 'igilro.coverage-bounds';

  final MapboxMap _map;
  PolylineAnnotationManager? _routes;
  PolylineAnnotationManager? _alternatives;
  PolylineAnnotationManager? _segments;
  PointAnnotationManager? _accessPoints;
  Cancelable? _accessTaps;
  final _accessById = <String, MapAccessPoint>{};
  GeoJsonSource? _coverageSource;
  MapCoverage? _lastCoverage;
  CircleAnnotationManager? _routeEnds;
  CircleAnnotationManager? _locations;
  PointAnnotationManager? _pins;
  final _pinImages = <MapMarkerRole, Uint8List>{};
  GeoCoordinate? _lastLocation;
  List<MapMarker> _lastMarkers = const [];
  MapRoutePaint? _lastRoutePaint;
  List<GeoCoordinate> _lastAlternativePath = const [];
  bool _disposed = false;
  String? _lastLightKey;
  Future<void> _pending = Future.value();

  Future<void> initialize() => _enqueue(() async {
    // A style reload needs fresh managers and rendering caches.
    _accessTaps?.cancel();
    for (final id in [
      _routes?.id,
      _alternatives?.id,
      _segments?.id,
      _accessPoints?.id,
      _routeEnds?.id,
      _locations?.id,
      _pins?.id,
    ].nonNulls) {
      if (_disposed) return;
      await _map.annotations.removeAnnotationManagerById(id);
    }
    if (_disposed) return;
    _lastLocation = null;
    _accessById.clear();
    _lastLightKey = null;
    await _map.setStyleImportConfigProperty('basemap', 'show3dObjects', true);
    if (_disposed) return;
    _lastMarkers = const [];
    _lastRoutePaint = null;
    _lastCoverage = null;
    _lastAlternativePath = const [];
    for (final id in [networkLayerId, boundsLayerId, 'igilro.coverage-fill']) {
      final exists = await _map.styleLayerExists(id);
      if (_disposed) return;
      if (exists) await _map.removeStyleLayer(id);
      if (_disposed) return;
    }
    final sourceExists = await _map.styleSourceExists(coverageSourceId);
    if (_disposed) return;
    if (sourceExists) {
      await _map.removeStyleSource(coverageSourceId);
    }
    if (_disposed) return;
    _coverageSource = GeoJsonSource(
      id: coverageSourceId,
      data: coverageGeoJson(null),
    );
    await _map.addSource(_coverageSource!);
    if (_disposed) return;
    await _map.addLayer(
      FillLayer(
        id: 'igilro.coverage-fill',
        sourceId: coverageSourceId,
        slot: 'middle',
        filter: [
          '==',
          ['get', 'kind'],
          'bounds',
        ],
        fillColor: 0xFF23785C,
        fillOpacity: 0.04,
      ),
    );
    if (_disposed) return;
    await _map.addLayer(
      LineLayer(
        id: boundsLayerId,
        sourceId: coverageSourceId,
        slot: 'middle',
        filter: [
          '==',
          ['get', 'kind'],
          'bounds',
        ],
        lineColor: 0xFF527D6D,
        lineWidth: 2,
        lineDasharray: [3, 2],
      ),
    );
    if (_disposed) return;
    await _map.addLayer(
      LineLayer(
        id: networkLayerId,
        sourceId: coverageSourceId,
        slot: 'middle',
        filter: [
          '==',
          ['get', 'kind'],
          'network',
        ],
        lineColor: 0xFF6A958A,
        lineOpacity: 0.65,
        lineWidth: 2,
      ),
    );
    if (_disposed) return;
    // Network and access points are below the alternative/selected routes;
    // location and selected endpoint pins are created last.
    _accessPoints = await _map.annotations.createPointAnnotationManager(
      id: 'igilro.access-points',
    );
    if (_disposed) return;
    _accessTaps = _accessPoints!.tapEvents(
      onTap: (annotation) {
        final point = _accessById[annotation.id];
        if (!_disposed && point != null) onAccessPointTapped?.call(point);
      },
    );
    _alternatives = await _map.annotations.createPolylineAnnotationManager(
      id: 'igilro.alternative',
    );
    if (_disposed) return;
    _routes = await _map.annotations.createPolylineAnnotationManager(
      id: routeLayerId,
    );
    if (_disposed) return;
    _segments = await _map.annotations.createPolylineAnnotationManager(
      id: segmentsLayerId,
    );
    if (_disposed) return;
    await _routes!.setLineCap(LineCap.ROUND);
    if (_disposed) return;
    _routeEnds = await _map.annotations.createCircleAnnotationManager(
      id: 'igilro.route-endpoints',
    );
    if (_disposed) return;
    _locations = await _map.annotations.createCircleAnnotationManager();
    if (_disposed) return;
    _pins = await _map.annotations.createPointAnnotationManager();
    if (_disposed) return;
    await _pins!.setIconAllowOverlap(true);
    if (_disposed) return;
    await _pins!.setTextAllowOverlap(true);
    for (final role in MapMarkerRole.values) {
      if (_disposed) return;
      _pinImages[role] = await createMapPinImage(switch (role) {
        MapMarkerRole.origin => 0xFF23785C,
        MapMarkerRole.destination => 0xFF4268C5,
        MapMarkerRole.selection => 0xFFE28A20,
      });
    }
  });

  Future<void> apply(
    MapState state,
    List<MapMarker> markers, {
    List<GeoCoordinate> routePath = const [],
    List<GeoCoordinate> alternativeRoutePath = const [],
    List<MapRouteSegment> routeSegments = const [],
    MapCoverage? coverage,
    required bool moveCamera,
    required ui.Size viewportSize,
  }) => _enqueue(() async {
    final instant = state.lightingAt ?? DateTime.now().toUtc();
    final key =
        '${instant.millisecondsSinceEpoch ~/ 60000}:'
        '${state.center.latitude.toStringAsFixed(2)}:${state.center.longitude.toStringAsFixed(2)}';
    if (key != _lastLightKey) {
      final sun = SolarPosition.at(state.center, instant);
      await _map.setLights(
        AmbientLight(
          id: 'igilro.ambient',
          intensity: sun.altitude > 0 ? 0.55 : 0.3,
          color: 0xFFFFFFFF,
        ),
        DirectionalLight(
          id: 'igilro.sun',
          castShadows: sun.altitude > 0,
          direction: [sun.azimuth, (90 - sun.altitude).clamp(0.0, 90.0)],
          intensity: sun.altitude > 0 ? 0.8 : 0,
          shadowIntensity: 0.8,
          color: 0xFFFFF5E6,
        ),
      );
      _lastLightKey = key;
    }
    await _showCoverage(coverage);
    if (_disposed) return;
    if (moveCamera) {
      final camera = state.framedCoordinates.isEmpty
          ? CameraOptions(
              center: pointFor(state.center),
              zoom: state.zoom,
              bearing: state.followLocation ? state.bearing : 0,
              pitch: state.is3D ? 55 : 0,
            )
          : await _map.cameraForCoordinatesPadding(
              state.framedCoordinates.map(pointFor).toList(growable: false),
              CameraOptions(bearing: 0, pitch: state.is3D ? 55 : 0),
              MbxEdgeInsets(
                top: math.min(
                  viewportSize.height * 0.35,
                  math.max(48, viewportSize.height * 0.20),
                ),
                left: viewportSize.width * 0.12,
                bottom: math.min(
                  viewportSize.height * 0.25,
                  math.max(28, viewportSize.height * 0.12),
                ),
                right: viewportSize.width * 0.12,
              ),
              19,
              null,
            );
      if (_disposed) return;
      await _map.flyTo(camera, MapAnimationOptions(duration: 600));
    }
    if (_disposed) return;
    if (!listEquals(alternativeRoutePath, _lastAlternativePath)) {
      await _alternatives?.deleteAll();
      if (_disposed) return;
      if (alternativeRoutePath.length >= 2) {
        await _alternatives?.create(
          PolylineAnnotationOptions(
            geometry: LineString(
              coordinates: alternativeRoutePath
                  .map((p) => Position(p.longitude, p.latitude))
                  .toList(),
            ),
            lineColor: 0xFF94A59D,
            lineWidth: 5,
            lineBorderWidth: 1,
            lineBorderColor: 0xFFFFFFFF,
          ),
        );
      }
      _lastAlternativePath = List.unmodifiable(alternativeRoutePath);
    }
    await _showRoute(MapRoutePaint(path: routePath, segments: routeSegments));
    if (_disposed) return;
    await _showLocation(state.currentLocation);
    if (_disposed) return;
    await _showPins(markers);
  });

  Future<void> _showRoute(MapRoutePaint paint) async {
    final path = paint.path;
    final routes = _routes;
    if (routes == null || _disposed || paint == _lastRoutePaint) return;
    await routes.deleteAll();
    await _segments?.deleteAll();
    if (_disposed) return;
    await _routeEnds?.deleteAll();
    if (_disposed) return;
    if (path.length >= 2) {
      await routes.create(
        PolylineAnnotationOptions(
          geometry: LineString(
            coordinates: path
                .map((point) => Position(point.longitude, point.latitude))
                .toList(growable: false),
          ),
          lineColor: MapRouteColors.neutral,
          lineWidth: 6,
          lineBorderColor: 0xFFFFFFFF,
          lineBorderWidth: 2,
          lineJoin: LineJoin.ROUND,
        ),
      );
      if (_disposed) return;
      await _segments?.createMulti([
        for (final segment in paint.segments)
          PolylineAnnotationOptions(
            geometry: LineString(
              coordinates: segment.path
                  .map((p) => Position(p.longitude, p.latitude))
                  .toList(),
            ),
            lineColor: segment.state == MapShadeState.shade
                ? MapRouteColors.shade
                : MapRouteColors.sunlight,
            lineWidth: 6,
            lineBorderColor: 0xFFFFFFFF,
            lineBorderWidth: 2,
            lineJoin: LineJoin.ROUND,
          ),
      ]);
      if (_disposed) return;
      await _routeEnds?.createMulti([
        for (final coordinate in [path.first, path.last])
          CircleAnnotationOptions(
            geometry: pointFor(coordinate),
            circleRadius: 5,
            circleColor: 0xFFFFFFFF,
            circleStrokeColor: 0xFF23785C,
            circleStrokeWidth: 2,
          ),
      ]);
    }
    _lastRoutePaint = paint;
  }

  Future<void> _showCoverage(MapCoverage? coverage) async {
    if (coverage == _lastCoverage || _disposed) return;
    await _coverageSource?.updateGeoJSON(coverageGeoJson(coverage));
    if (_disposed) return;
    await _accessPoints?.deleteAll();
    _accessById.clear();
    if (coverage != null) {
      final image = await createMapPinImage(0xFF527D6D);
      final annotations = await _accessPoints?.createMulti([
        for (final point in coverage.accessPoints)
          PointAnnotationOptions(
            geometry: pointFor(point.coordinate),
            image: image,
            iconSize: 0.35,
            iconAnchor: IconAnchor.BOTTOM,
            textField: point.name,
            textSize: 11,
            textOffset: [0, 0.5],
            textAnchor: TextAnchor.TOP,
            textColor: 0xFF345F50,
            textHaloColor: 0xFFFFFFFF,
            textHaloWidth: 2,
          ),
      ]);
      if (_disposed) return;
      for (var i = 0; i < (annotations?.length ?? 0); i++) {
        final annotation = annotations![i];
        if (annotation != null) {
          _accessById[annotation.id] = coverage.accessPoints[i];
        }
      }
    }
    _lastCoverage = coverage;
  }

  Future<void> _showLocation(GeoCoordinate? coordinate) async {
    final locations = _locations;
    if (locations == null || coordinate == _lastLocation || _disposed) return;
    await locations.deleteAll();
    if (_disposed || coordinate == null) {
      _lastLocation = null;
      return;
    }
    await locations.create(
      CircleAnnotationOptions(
        geometry: pointFor(coordinate),
        circleRadius: 8,
        circleColor: 0xFF23785C,
        circleStrokeColor: 0xFFFFFFFF,
        circleStrokeWidth: 3,
      ),
    );
    _lastLocation = coordinate;
  }

  Future<void> _showPins(List<MapMarker> markers) async {
    final pins = _pins;
    if (pins == null || _disposed || listEquals(markers, _lastMarkers)) return;
    await pins.deleteAll();
    if (_disposed) return;
    if (markers.isNotEmpty) {
      await pins.createMulti(
        markers
            .map(
              (marker) => PointAnnotationOptions(
                geometry: pointFor(marker.coordinate),
                image: _pinImages[marker.role],
                iconSize: 0.5,
                iconAnchor: IconAnchor.BOTTOM,
                textField: switch (marker.role) {
                  MapMarkerRole.origin => '출발',
                  MapMarkerRole.destination => '도착',
                  MapMarkerRole.selection => '선택',
                },
                textSize: 14,
                textAnchor: TextAnchor.TOP,
                textOffset: [0, 0.25],
                textColor: 0xFF172B24,
                textHaloColor: 0xFFFFFFFF,
                textHaloWidth: 2,
              ),
            )
            .toList(growable: false),
      );
    }
    _lastMarkers = List.unmodifiable(markers);
  }

  Future<void> _enqueue(Future<void> Function() action) {
    final operation = _pending.then((_) async {
      if (!_disposed) await action();
    });
    // A handled platform error must not poison subsequent commands.
    _pending = operation.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return operation;
  }

  void dispose() {
    _disposed = true;
    _routes = null;
    _alternatives = null;
    _segments = null;
    _accessTaps?.cancel();
    _accessPoints = null;
    _coverageSource = null;
    _accessById.clear();
    _routeEnds = null;
    _locations = null;
    _pins = null;
    _pinImages.clear();
    // MapWidget owns and disposes the underlying native map. Only invalidate
    // this adapter; disposing the SDK map here would release it twice.
  }

  static Point pointFor(GeoCoordinate coordinate) =>
      Point(coordinates: Position(coordinate.longitude, coordinate.latitude));

  static GeoCoordinate? coordinateFor(Point point) {
    final latitude = point.coordinates.lat.toDouble();
    final longitude = point.coordinates.lng.toDouble();
    if (!latitude.isFinite ||
        !longitude.isFinite ||
        latitude < -90 ||
        latitude > 90) {
      return null;
    }
    return GeoCoordinate(
      latitude: latitude,
      longitude: longitude >= -180 && longitude <= 180
          ? longitude
          : (longitude + 180) % 360 - 180,
    );
  }
}
