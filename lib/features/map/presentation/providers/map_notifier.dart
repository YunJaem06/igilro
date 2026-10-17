import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../state/map_state.dart';

part 'map_notifier.g.dart';

/// App DI overrides availability; the feature never reads application config.
@Riverpod(keepAlive: true)
bool mapConfigured(Ref ref) => false;

@riverpod
class MapNotifier extends _$MapNotifier {
  @override
  MapState build() => const MapState();

  void markReady() => state = state.copyWith(status: MapLoadStatus.ready);
  void markFailed() => state = state.copyWith(status: MapLoadStatus.failed);

  void retry() => state = state.copyWith(
    status: MapLoadStatus.loading,
    session: state.session + 1,
  );

  void focusOn(GeoCoordinate coordinate) => state = state.copyWith(
    center: coordinate,
    currentLocation: coordinate,
    framedCoordinates: const [],
    zoom: 16,
    // Repeated taps must recenter even after the user drags the map away.
    cameraRevision: state.cameraRevision + 1,
  );

  void framePoints(List<GeoCoordinate> coordinates) {
    final points = coordinates.toSet().toList(growable: false);
    if (points.isEmpty) return;
    state = state.copyWith(
      center: points.first,
      zoom: 16,
      framedCoordinates: points.length > 1 ? points : const [],
      cameraRevision: state.cameraRevision + 1,
    );
  }
}
