import 'dart:math' as math;
import 'dart:ui' as ui show Size;

import 'package:flutter/foundation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../state/map_marker.dart';
import '../state/map_state.dart';
import 'map_pin_image.dart';

/// Owned by one Mapbox surface. SDK objects never enter Riverpod state.
final class MapboxController {
  MapboxController(this._map);

  static const routeLayerId = 'igilro.route';

  final MapboxMap _map;
  PolylineAnnotationManager? _routes;
  CircleAnnotationManager? _locations;
  PointAnnotationManager? _pins;
  final _pinImages = <MapMarkerRole, Uint8List>{};
  GeoCoordinate? _lastLocation;
  List<MapMarker> _lastMarkers = const [];
  List<GeoCoordinate> _lastRoutePath = const [];
  bool _disposed = false;
  Future<void> _pending = Future.value();

  Future<void> initialize() => _enqueue(() async {
    // A style reload needs fresh managers and rendering caches.
    for (final id in [_routes?.id, _locations?.id, _pins?.id].nonNulls) {
      if (_disposed) return;
      await _map.annotations.removeAnnotationManagerById(id);
    }
    _lastLocation = null;
    _lastMarkers = const [];
    _lastRoutePath = const [];
    // Create the route below location and endpoint annotations.
    _routes = await _map.annotations.createPolylineAnnotationManager(
      id: routeLayerId,
    );
    if (_disposed) return;
    await _routes!.setLineCap(LineCap.ROUND);
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
    required bool moveCamera,
    required ui.Size viewportSize,
  }) => _enqueue(() async {
    if (moveCamera) {
      final camera = state.framedCoordinates.isEmpty
          ? CameraOptions(
              center: pointFor(state.center),
              zoom: state.zoom,
              bearing: 0,
              pitch: 0,
            )
          : await _map.cameraForCoordinatesPadding(
              state.framedCoordinates.map(pointFor).toList(growable: false),
              CameraOptions(bearing: 0, pitch: 0),
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
              16,
              null,
            );
      if (_disposed) return;
      await _map.flyTo(camera, MapAnimationOptions(duration: 600));
    }
    if (_disposed) return;
    await _showRoute(routePath);
    if (_disposed) return;
    await _showLocation(state.currentLocation);
    if (_disposed) return;
    await _showPins(markers);
  });

  Future<void> _showRoute(List<GeoCoordinate> path) async {
    final routes = _routes;
    if (routes == null || _disposed || listEquals(path, _lastRoutePath)) return;
    await routes.deleteAll();
    if (_disposed) return;
    if (path.length >= 2) {
      await routes.create(
        PolylineAnnotationOptions(
          geometry: LineString(
            coordinates: path
                .map((point) => Position(point.longitude, point.latitude))
                .toList(growable: false),
          ),
          lineColor: 0xFF23785C,
          lineWidth: 6,
          lineBorderColor: 0xFFFFFFFF,
          lineBorderWidth: 2,
          lineJoin: LineJoin.ROUND,
        ),
      );
    }
    _lastRoutePath = List.unmodifiable(path);
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
