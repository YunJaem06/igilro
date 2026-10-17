import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/entities/route_point.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

const originCoordinate = GeoCoordinate(latitude: 37.5665, longitude: 126.9780);
const destinationCoordinate = GeoCoordinate(
  latitude: 37.5700,
  longitude: 126.9810,
);

void main() {
  late ProviderContainer container;
  late RouteSelectionNotifier notifier;
  setUp(() {
    container = ProviderContainer();
    container.listen(routeSelectionProvider, (_, _) {});
    notifier = container.read(routeSelectionProvider.notifier);
  });
  tearDown(() => container.dispose());

  test('map taps outside selection do not change endpoints', () {
    notifier.preview(originCoordinate);
    notifier.confirmSelection();
    expect(container.read(routeSelectionProvider), const RouteSelectionState());
  });

  test('confirm without a candidate keeps selection pending', () {
    notifier.beginSelection(RouteEndpoint.origin);
    notifier.confirmSelection();
    final state = container.read(routeSelectionProvider);
    expect(state.selecting, RouteEndpoint.origin);
    expect(state.endpoints.origin, isNull);
  });

  test('candidate is separate from committed endpoints and cancellation preserves them', () {
    notifier.useCurrentLocation(originCoordinate);
    notifier.beginSelection(RouteEndpoint.origin);
    notifier.preview(destinationCoordinate);
    expect(
      container.read(routeSelectionProvider).endpoints.origin!.coordinate,
      originCoordinate,
    );
    notifier.cancelSelection();
    final state = container.read(routeSelectionProvider);
    expect(state.candidate, isNull);
    expect(state.selecting, isNull);
    expect(state.endpoints.origin!.source, RoutePointSource.currentLocation);
    expect(state.endpoints.origin!.coordinate, originCoordinate);
  });

  test('confirm commits only the selected endpoint', () {
    notifier.useCurrentLocation(originCoordinate);
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(destinationCoordinate);
    notifier.confirmSelection();
    final state = container.read(routeSelectionProvider);
    expect(state.endpoints.origin!.coordinate, originCoordinate);
    expect(state.endpoints.destination!.coordinate, destinationCoordinate);
    expect(state.endpoints.destination!.source, RoutePointSource.map);
    expect(state.endpoints.canSearch, true);
    expect(state.selecting, isNull);
    expect(state.candidate, isNull);
  });

  test('changing selection target discards the previous candidate', () {
    notifier.beginSelection(RouteEndpoint.origin);
    notifier.preview(originCoordinate);
    notifier.beginSelection(RouteEndpoint.destination);
    expect(container.read(routeSelectionProvider).candidate, isNull);
    expect(container.read(routeSelectionProvider).endpoints.origin, isNull);
  });

  test('swap preserves point sources and clear removes only one endpoint', () {
    notifier.useCurrentLocation(originCoordinate);
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(destinationCoordinate);
    notifier.confirmSelection();
    notifier.swap();
    final swapped = container.read(routeSelectionProvider).endpoints;
    expect(swapped.origin!.coordinate, destinationCoordinate);
    expect(swapped.destination!.coordinate, originCoordinate);
    expect(swapped.destination!.source, RoutePointSource.currentLocation);
    notifier.clear(RouteEndpoint.origin);
    final cleared = container.read(routeSelectionProvider).endpoints;
    expect(cleared.origin, isNull);
    expect(cleared.destination, swapped.destination);
    expect(cleared.canSearch, false);
  });

  test('swap cannot mutate an incomplete or pending selection', () {
    notifier.useCurrentLocation(originCoordinate);
    final before = container.read(routeSelectionProvider);
    notifier.swap();
    expect(container.read(routeSelectionProvider), before);
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(destinationCoordinate);
    final pending = container.read(routeSelectionProvider);
    notifier.swap();
    expect(container.read(routeSelectionProvider), pending);
  });

  test('current location updates origin without replacing destination', () {
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(destinationCoordinate);
    notifier.confirmSelection();
    notifier.useCurrentLocation(originCoordinate);
    expect(
      container.read(routeSelectionProvider).endpoints.destination!.coordinate,
      destinationCoordinate,
    );
    expect(
      container.read(routeSelectionProvider).endpoints.origin!.source,
      RoutePointSource.currentLocation,
    );
  });

  test('current location acquired during destination selection preserves the candidate', () {
    notifier.beginSelection(RouteEndpoint.destination);
    notifier.preview(destinationCoordinate);
    notifier.useCurrentLocation(originCoordinate);
    final state = container.read(routeSelectionProvider);
    expect(state.selecting, RouteEndpoint.destination);
    expect(state.candidate!.coordinate, destinationCoordinate);
    notifier.confirmSelection();
    expect(container.read(routeSelectionProvider).endpoints.canSearch, true);
  });

  test(
    'readiness rejects missing or identical endpoints regardless of source',
    () {
      const origin = RoutePoint(
        coordinate: originCoordinate,
        source: RoutePointSource.currentLocation,
      );
      const identicalDestination = RoutePoint(
        coordinate: originCoordinate,
        source: RoutePointSource.map,
      );
      expect(const RouteEndpoints().canSearch, false);
      expect(const RouteEndpoints(origin: origin).canSearch, false);
      const endpoints = RouteEndpoints(
        origin: origin,
        destination: identicalDestination,
      );
      expect(endpoints.isComplete, true);
      expect(endpoints.isSamePoint, true);
      expect(endpoints.canSearch, false);
    },
  );
}
