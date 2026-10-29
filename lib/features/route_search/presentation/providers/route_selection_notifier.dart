import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/route_endpoints.dart';
import '../../domain/entities/route_point.dart';
import '../state/route_selection_state.dart';

part 'route_selection_notifier.g.dart';

@riverpod
class RouteSelectionNotifier extends _$RouteSelectionNotifier {
  @override
  RouteSelectionState build() => const RouteSelectionState();

  void setEndpoints(RouteEndpoints endpoints) =>
      state = RouteSelectionState(endpoints: endpoints);

  void setPoint(RouteEndpoint endpoint, RoutePoint point) =>
      state = state.copyWith(
        endpoints: endpoint == RouteEndpoint.origin
            ? state.endpoints.copyWith(origin: point)
            : state.endpoints.copyWith(destination: point),
        selecting: null,
        candidate: null,
      );

  void beginSelection(RouteEndpoint endpoint) => state = state.copyWith(
    selecting: endpoint,
    candidate: switch (endpoint) {
      RouteEndpoint.origin => state.endpoints.origin,
      RouteEndpoint.destination => state.endpoints.destination,
    },
  );

  void preview(GeoCoordinate coordinate) {
    if (state.selecting == null) return;
    state = state.copyWith(
      candidate: RoutePoint(
        coordinate: coordinate,
        source: RoutePointSource.map,
      ),
    );
  }

  void confirmSelection() {
    final candidate = state.candidate;
    final selecting = state.selecting;
    if (candidate == null || selecting == null) return;
    state = state.copyWith(
      endpoints: switch (selecting) {
        RouteEndpoint.origin => state.endpoints.copyWith(origin: candidate),
        RouteEndpoint.destination => state.endpoints.copyWith(
          destination: candidate,
        ),
      },
      selecting: null,
      candidate: null,
    );
  }

  void cancelSelection() =>
      state = state.copyWith(selecting: null, candidate: null);

  void useCurrentLocation(GeoCoordinate coordinate) => state = state.copyWith(
    endpoints: state.endpoints.copyWith(
      origin: RoutePoint(
        coordinate: coordinate,
        source: RoutePointSource.currentLocation,
      ),
    ),
    selecting: state.selecting == RouteEndpoint.origin ? null : state.selecting,
    candidate: state.selecting == RouteEndpoint.origin ? null : state.candidate,
  );

  void swap() {
    if (!state.endpoints.isComplete || state.selecting != null) return;
    state = state.copyWith(
      endpoints: state.endpoints.copyWith(
        origin: state.endpoints.destination,
        destination: state.endpoints.origin,
      ),
    );
  }

  void clear(RouteEndpoint endpoint) => state = state.copyWith(
    endpoints: switch (endpoint) {
      RouteEndpoint.origin => state.endpoints.copyWith(origin: null),
      RouteEndpoint.destination => state.endpoints.copyWith(destination: null),
    },
    selecting: null,
    candidate: null,
  );
}
