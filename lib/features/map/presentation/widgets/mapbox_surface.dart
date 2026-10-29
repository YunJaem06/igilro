import 'dart:async';
import 'dart:ui' as ui show Size;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../adapters/mapbox_controller.dart';
import '../state/map_marker.dart';
import '../state/map_state.dart';
import '../state/map_overlays.dart';

class MapboxSurface extends StatefulWidget {
  const MapboxSurface({
    super.key,
    required this.state,
    required this.markers,
    this.routePath = const [],
    this.alternativeRoutePath = const [],
    this.routeSegments = const [],
    this.coverage,
    this.onAccessPointTapped,
    this.onCoordinateTapped,
    this.onMapCreated,
    required this.onReady,
    required this.onFailure,
  });

  final MapState state;
  final List<MapMarker> markers;
  final List<GeoCoordinate> routePath;
  final List<GeoCoordinate> alternativeRoutePath;
  final List<MapRouteSegment> routeSegments;
  final MapCoverage? coverage;
  final ValueChanged<MapAccessPoint>? onAccessPointTapped;
  final ValueChanged<GeoCoordinate>? onCoordinateTapped;

  /// Optional observer for device tests; the surface still owns SDK lifetime.
  final ValueChanged<MapboxMap>? onMapCreated;
  final VoidCallback onReady;
  final VoidCallback onFailure;

  @override
  State<MapboxSurface> createState() => _MapboxSurfaceState();
}

class _MapboxSurfaceState extends State<MapboxSurface> {
  MapboxController? _controller;
  Timer? _loadingTimeout;
  bool _styleReady = false;
  bool _applyScheduled = false;
  bool _moveCameraPending = false;
  ui.Size _viewportSize = ui.Size.zero;
  late final CameraViewportState _initialViewport;

  @override
  void initState() {
    super.initState();
    _initialViewport = CameraViewportState(
      center: MapboxController.pointFor(widget.state.center),
      zoom: widget.state.zoom,
      bearing: widget.state.bearing,
      pitch: widget.state.is3D ? 55 : 0,
    );
    _loadingTimeout = Timer(const Duration(seconds: 30), () {
      if (mounted && !_styleReady) widget.onFailure();
    });
  }

  @override
  void didUpdateWidget(covariant MapboxSurface oldWidget) {
    super.didUpdateWidget(oldWidget);
    final moveCamera =
        oldWidget.state.cameraRevision != widget.state.cameraRevision;
    if (_styleReady &&
        (moveCamera ||
            oldWidget.state.currentLocation != widget.state.currentLocation ||
            oldWidget.state.lightingAt != widget.state.lightingAt ||
            oldWidget.coverage != widget.coverage ||
            !listEquals(oldWidget.routeSegments, widget.routeSegments) ||
            !listEquals(oldWidget.markers, widget.markers) ||
            !listEquals(oldWidget.routePath, widget.routePath) ||
            !listEquals(
              oldWidget.alternativeRoutePath,
              widget.alternativeRoutePath,
            ))) {
      _scheduleApply(moveCamera: moveCamera);
    }
  }

  void _scheduleApply({required bool moveCamera}) {
    _moveCameraPending |= moveCamera;
    if (_applyScheduled) return;
    _applyScheduled = true;
    // The result panel can resize the native map in this same frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyScheduled = false;
      final moveCamera = _moveCameraPending;
      _moveCameraPending = false;
      if (mounted && _styleReady) {
        unawaited(_apply(moveCamera: moveCamera));
      }
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  Future<void> _apply({required bool moveCamera}) async {
    try {
      await _controller?.apply(
        widget.state,
        widget.markers,
        routePath: widget.routePath,
        alternativeRoutePath: widget.alternativeRoutePath,
        routeSegments: widget.routeSegments,
        coverage: widget.coverage,
        moveCamera: moveCamera,
        viewportSize: _viewportSize,
      );
    } on PlatformException {
      if (mounted) widget.onFailure();
    }
  }

  Future<void> _onStyleLoaded() async {
    _styleReady = false;
    try {
      await _controller?.initialize();
      if (!mounted) return;
      await WidgetsBinding.instance.endOfFrame;
      if (!mounted) return;
      _styleReady = true;
      await _controller?.apply(
        widget.state,
        widget.markers,
        routePath: widget.routePath,
        alternativeRoutePath: widget.alternativeRoutePath,
        routeSegments: widget.routeSegments,
        coverage: widget.coverage,
        moveCamera: true,
        viewportSize: _viewportSize,
      );
      if (!mounted) return;
      _loadingTimeout?.cancel();
      widget.onReady();
    } on PlatformException {
      if (mounted) widget.onFailure();
    }
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      if (_styleReady &&
          _viewportSize != constraints.biggest &&
          widget.state.framedCoordinates.isNotEmpty) {
        _scheduleApply(moveCamera: true);
      }
      _viewportSize = constraints.biggest;
      return MapWidget(
        viewport: _initialViewport,
        onMapCreated: (map) {
          _controller = MapboxController(
            map,
            onAccessPointTapped: (point) {
              if (mounted) widget.onAccessPointTapped?.call(point);
            },
          );
          map.addInteraction(
            TapInteraction.onMap(_onMapTap),
            interactionID: 'igilro.coordinate_selection',
          );
          // A basemap place or building can otherwise claim the map tap.
          map.addInteraction(
            TapInteraction(StandardPOIs(), (_, event) => _onMapTap(event)),
            interactionID: 'igilro.poi_selection',
          );
          map.addInteraction(
            TapInteraction(
              StandardPlaceLabels(),
              (_, event) => _onMapTap(event),
            ),
            interactionID: 'igilro.place_selection',
          );
          map.addInteraction(
            TapInteraction(StandardBuildings(), (_, event) => _onMapTap(event)),
            interactionID: 'igilro.building_selection',
          );
          widget.onMapCreated?.call(map);
        },
        onStyleLoadedListener: (_) => unawaited(_onStyleLoaded()),
        onMapLoadErrorListener: (event) {
          // A missing tile must not discard an otherwise usable map.
          if (mounted && event.type == MapLoadErrorType.STYLE) {
            widget.onFailure();
          }
        },
      );
    },
  );

  void _onMapTap(MapContentGestureContext event) {
    if (!mounted || !_styleReady) return;
    final coordinate = MapboxController.coordinateFor(event.point);
    if (coordinate != null) widget.onCoordinateTapped?.call(coordinate);
  }

  @override
  void dispose() {
    _loadingTimeout?.cancel();
    _controller?.dispose();
    super.dispose();
  }
}
