// The SDK facade constructor is internal; this test intentionally binds its
// platform interface to verify SDK writes without a running native map.
// ignore_for_file: invalid_use_of_internal_member

import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// Exercise the real SDK facade against its platform boundary without a device.
import 'package:mapbox_maps_flutter_platform_interface/mapbox_maps_flutter_platform_interface_internal.dart'
    as platform;
import 'package:igilro/features/map/presentation/adapters/mapbox_controller.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';

import '../../helpers/fake_prediction_repository.dart';

void main() {
  testWidgets(
    'disposing during source initialization stops later SDK operations',
    (tester) async {
      await tester.runAsync(() async {
        final native = _Map();
        final started = Completer<void>();
        final release = Completer<void>();
        native.style.sourceStarted = started;
        native.style.pendingSource = release.future;
        final controller = MapboxController(MapboxMap(native));
        final future = controller.initialize();
        await started.future;
        controller.dispose();
        release.complete();
        await future;
        expect(native.style.layers, isEmpty);
        expect(native.annotations.order, isEmpty);
      });
    },
  );
  final prediction = predictionFor(
    predictionQuery().copyWith(
      origin: forestOrigin,
      destination: forestDestination,
    ),
  );
  final route = prediction.routes.single;
  final segments = route.shadeSegments
      .map(
        (s) => MapRouteSegment(
          state: s.state == PredictedShadeState.shade
              ? MapShadeState.shade
              : MapShadeState.sunlight,
          path: s.path,
        ),
      )
      .toList();

  testWidgets(
    'same full geometry with changed shade state repaints all bends and clearing removes every segment',
    (tester) async {
      await tester.runAsync(() async {
        final native = _Map();
        final controller = MapboxController(MapboxMap(native));
        addTearDown(controller.dispose);
        await controller.initialize();
        Future<void> apply(List<MapRouteSegment> paint, {bool clear = false}) =>
            controller.apply(
              const MapState(),
              [],
              routePath: clear ? [] : route.path,
              routeSegments: paint,
              moveCamera: false,
              viewportSize: const ui.Size(500, 500),
            );
        await apply(segments);
        final lines =
            native.annotations.lines[MapboxController.segmentsLayerId]!;
        expect(lines.options.length, 4);
        expect(lines.options.first.lineColor, MapRouteColors.sunlight);
        expect(lines.options[1].geometry.coordinates.length, 6);
        expect(lines.options[1].geometry.coordinates[2].lng, 127.0395902);
        final writes = lines.writes;
        await apply(segments.map((s) => s.copyWith()).toList());
        expect(
          lines.writes,
          writes,
          reason: 'An equal payload needs no SDK rewrite.',
        );
        await apply([
          segments.first.copyWith(state: MapShadeState.shade),
          ...segments.skip(1),
        ]);
        expect(lines.writes, writes + 4);
        expect(lines.options.first.lineColor, MapRouteColors.shade);
        expect(
          native
              .annotations
              .lines[MapboxController.routeLayerId]!
              .options
              .single
              .geometry
              .coordinates
              .length,
          route.path.length,
        );
        await apply([], clear: true);
        expect(lines.options, isEmpty);
        expect(
          native.annotations.lines[MapboxController.routeLayerId]!.options,
          isEmpty,
        );
      });
    },
  );

  testWidgets(
    'style recreation restores unchanged segments, bounds, walking network, and access points below endpoint pins',
    (tester) async {
      await tester.runAsync(() async {
        final native = _Map();
        final tapped = <MapAccessPoint>[];
        final controller = MapboxController(
          MapboxMap(native),
          onAccessPointTapped: tapped.add,
        );
        addTearDown(controller.dispose);
        final c = sampleCoverage();
        final overlay = MapCoverage(
          boundary: c.bounds.corners,
          walkingNetwork: c.walkingNetwork,
          accessPoints: c.accessPoints
              .map(
                (p) => MapAccessPoint(
                  id: p.id,
                  name: p.name,
                  coordinate: p.coordinate,
                ),
              )
              .toList(),
        );
        Future<void> apply() => controller.apply(
          const MapState(),
          [],
          routePath: route.path,
          routeSegments: segments,
          coverage: overlay,
          moveCamera: false,
          viewportSize: const ui.Size(500, 500),
        );
        await controller.initialize();
        await apply();
        final first =
            native.annotations.lines[MapboxController.segmentsLayerId];
        native.style.layers.clear();
        native.style.sources.clear();
        native.style.data.clear();
        await controller.initialize();
        await apply();
        final restored =
            native.annotations.lines[MapboxController.segmentsLayerId]!;
        expect(restored, isNot(same(first)));
        expect(restored.options.length, 4);
        final data = jsonDecode(
          native.style.data[MapboxController.coverageSourceId]!,
        ) as Map<String, dynamic>;
        expect(data['features'][0]['geometry']['coordinates'][0].length, 5);
        expect(data['features'][1]['geometry']['type'], 'MultiLineString');
        expect(data['features'][1]['geometry']['coordinates'][0].length, 3);
        expect(
          native.annotations.points['igilro.access-points']!.options.length,
          2,
        );
        native.annotations.points['igilro.access-points']!.taps.add(
          platform.PointAnnotationInteractionContext(
            annotation: PointAnnotation(
              id: 'igilro.access-points-0',
              geometry: MapboxController.pointFor(
                overlay.accessPoints.first.coordinate,
              ),
            ),
            gestureState: GestureState.ended,
          ),
        );
        expect(tapped.single, overlay.accessPoints.first);
        expect(
          native.annotations.order.indexOf('igilro.access-points'),
          lessThan(
            native.annotations.order.indexOf(MapboxController.routeLayerId),
          ),
        );
        expect(
          native.annotations.order.indexOf(MapboxController.segmentsLayerId),
          lessThan(native.annotations.order.indexOf('igilro.route-endpoints')),
        );
        await controller.apply(
          const MapState(),
          [],
          moveCamera: false,
          viewportSize: const ui.Size(500, 500),
        );
        expect(
          jsonDecode(
            native.style.data[MapboxController.coverageSourceId]!,
          )['features'],
          isEmpty,
        );
        expect(
          native.annotations.points['igilro.access-points']!.options,
          isEmpty,
        );
      });
    },
  );
}

class _Map extends Fake implements platform.MapboxMapPlatformInterface {
  @override
  final _Style style = _Style();
  @override
  final _Annotations annotations = _Annotations();
}

class _Style extends Fake implements platform.StylePlatformInterface {
  Completer<void>? sourceStarted;
  Future<void>? pendingSource;
  final layers = <String>{};
  final sources = <String>{};
  final data = <String, String>{};
  @override
  Future<bool> styleLayerExists(String id) async => layers.contains(id);
  @override
  Future<bool> styleSourceExists(String id) async => sources.contains(id);
  @override
  Future<void> addStyleLayer(String properties, LayerPosition? position) async {
    layers.add(jsonDecode(properties)['id'] as String);
  }

  @override
  Future<void> removeStyleLayer(String id) async {
    layers.remove(id);
  }

  @override
  Future<void> addStyleSource(String id, String properties) async {
    sources.add(id);
    sourceStarted?.complete();
    await pendingSource;
  }

  @override
  Future<void> removeStyleSource(String id) async {
    sources.remove(id);
  }

  @override
  Future<void> setStyleSourceProperties(String id, String properties) async {}
  @override
  Future<void> setStyleSourceProperty(
    String id,
    String property,
    Object value,
  ) async {
    if (property == 'data') data[id] = value as String;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if ({
      #setLights,
      #setStyleImportConfigProperty,
    }.contains(invocation.memberName)) {
      return Future<void>.value();
    }
    return super.noSuchMethod(invocation);
  }
}

class _Annotations extends Fake
    implements platform.AnnotationManagerPlatformInterface {
  final lines = <String, _Lines>{};
  final points = <String, _Points>{};
  final order = <String>[];
  @override
  Future<platform.PolylineAnnotationManagerPlatformInterface>
  createPolylineAnnotationManager({String? id, String? below}) async {
    final key = id ?? 'line-${order.length}';
    order.add(key);
    return lines[key] = _Lines(key);
  }

  @override
  Future<platform.PointAnnotationManagerPlatformInterface>
  createPointAnnotationManager({String? id, String? below}) async {
    final key = id ?? 'point-${order.length}';
    order.add(key);
    return points[key] = _Points(key);
  }

  @override
  Future<platform.CircleAnnotationManagerPlatformInterface>
  createCircleAnnotationManager({String? id, String? below}) async {
    final key = id ?? 'circle-${order.length}';
    order.add(key);
    return _Circles(key);
  }

  @override
  Future<void> removeAnnotationManagerById(String id) async {
    lines.remove(id);
    await points.remove(id)?.taps.close();
    order.remove(id);
  }
}

class _Lines extends Fake
    implements platform.PolylineAnnotationManagerPlatformInterface {
  _Lines(this.id);
  @override
  final String id;
  final options = <PolylineAnnotationOptions>[];
  int writes = 0;
  @override
  Future<PolylineAnnotation> create(PolylineAnnotationOptions value) async {
    options.add(value);
    writes++;
    return PolylineAnnotation(id: '$id-$writes', geometry: value.geometry);
  }

  @override
  Future<List<PolylineAnnotation?>> createMulti(
    List<PolylineAnnotationOptions> values,
  ) async => [for (final v in values) await create(v)];
  @override
  Future<void> deleteAll() async {
    options.clear();
  }

  @override
  Future<void> setLineCap(LineCap cap) async {}
}

class _Points extends Fake
    implements platform.PointAnnotationManagerPlatformInterface {
  _Points(this.id);
  @override
  final String id;
  final options = <PointAnnotationOptions>[];
  final taps =
      StreamController<platform.PointAnnotationInteractionContext>.broadcast(
        sync: true,
      );
  @override
  Stream<platform.PointAnnotationInteractionContext> get tapInteractionStream =>
      taps.stream;
  @override
  Future<List<PointAnnotation?>> createMulti(
    List<PointAnnotationOptions> values,
  ) async {
    options.addAll(values);
    return [
      for (var i = 0; i < values.length; i++)
        PointAnnotation(id: '$id-$i', geometry: values[i].geometry),
    ];
  }

  @override
  Future<void> deleteAll() async {
    options.clear();
  }

  @override
  Future<void> setIconAllowOverlap(bool value) async {}
  @override
  Future<void> setTextAllowOverlap(bool value) async {}
}

class _Circles extends Fake
    implements platform.CircleAnnotationManagerPlatformInterface {
  _Circles(this.id);
  @override
  final String id;
  @override
  Future<List<CircleAnnotation?>> createMulti(
    List<CircleAnnotationOptions> values,
  ) async => [
    for (var i = 0; i < values.length; i++)
      CircleAnnotation(id: '$id-$i', geometry: values[i].geometry),
  ];
  @override
  Future<void> deleteAll() async {}
}
