import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/map/presentation/adapters/mapbox_controller.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';

void main() {
  test('retry preserves location and recenter requests work for the same coordinate', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(mapProvider, (_, _) {});
    final notifier = container.read(mapProvider.notifier);
    const coordinate = GeoCoordinate(latitude: 37.5, longitude: 127);
    notifier.focusOn(coordinate);
    notifier.focusOn(coordinate);
    expect(container.read(mapProvider).cameraRevision, 2);
    notifier.markFailed();
    notifier.retry();
    final state = container.read(mapProvider);
    expect(state.status, MapLoadStatus.loading);
    expect(state.session, 1);
    expect(state.currentLocation, coordinate);
  });

  test('Mapbox point conversion uses longitude then latitude', () {
    final point = MapboxController.pointFor(
      const GeoCoordinate(latitude: 37.5, longitude: 127),
    );
    expect(point.coordinates.lng, 127);
    expect(point.coordinates.lat, 37.5);
  });

  test(
    'framing points does not turn route endpoints into current location',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(mapProvider, (_, _) {});
      final notifier = container.read(mapProvider.notifier);
      const location = GeoCoordinate(latitude: 37.5, longitude: 127);
      const destination = GeoCoordinate(latitude: 37.6, longitude: 127.1);
      notifier.focusOn(location);
      notifier.framePoints([location, destination]);
      final framed = container.read(mapProvider);
      expect(framed.currentLocation, location);
      expect(framed.framedCoordinates, [location, destination]);
      notifier.framePoints([destination, destination]);
      expect(container.read(mapProvider).framedCoordinates, isEmpty);
      expect(container.read(mapProvider).center, destination);
      expect(container.read(mapProvider).currentLocation, location);
      notifier.focusOn(location);
      expect(container.read(mapProvider).framedCoordinates, isEmpty);
    },
  );

  test('tap conversion wraps world copies and rejects invalid coordinates', () {
    expect(
      MapboxController.coordinateFor(Point(coordinates: Position(181, 37)))!
          .longitude,
      -179,
    );
    expect(
      MapboxController.coordinateFor(Point(coordinates: Position(0, 91))),
      isNull,
    );
    expect(
      MapboxController.coordinateFor(
        Point(coordinates: Position(double.nan, 37)),
      ),
      isNull,
    );
  });
}
