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

  void toggle3D() => state = state.copyWith(
    is3D: !state.is3D,
    cameraRevision: state.cameraRevision + 1,
  );

  void setLightingTime(DateTime? instant) =>
      state = state.copyWith(lightingAt: instant?.toUtc());

  void follow(GeoCoordinate coordinate, double bearing) =>
      state = state.copyWith(
        center: coordinate,
        currentLocation: coordinate,
        bearing: bearing,
        followLocation: true,
        framedCoordinates: const [],
        zoom: 18,
        cameraRevision: state.cameraRevision + 1,
      );

  void stopFollowing() => state = state.copyWith(followLocation: false);
  void updateCurrentLocation(GeoCoordinate coordinate) =>
      state = state.copyWith(currentLocation: coordinate);
  void clearCurrentLocation() =>
      state = state.copyWith(currentLocation: null, followLocation: false);
  void beginFollowing() => state = state.copyWith(followLocation: true);

  void retry() => state = state.copyWith(
    status: MapLoadStatus.loading,
    session: state.session + 1,
  );

  void focusOn(GeoCoordinate coordinate) => state = state.copyWith(
    center: coordinate,
    currentLocation: coordinate,
    framedCoordinates: const [],
    followLocation: false,
    zoom: 16,
    // Repeated taps must recenter even after the user drags the map away.
    cameraRevision: state.cameraRevision + 1,
  );

  void framePoints(List<GeoCoordinate> coordinates, {GeoCoordinate? center}) {
    final points = coordinates.toSet().toList(growable: false);
    if (points.isEmpty) return;
    state = state.copyWith(
      center: center ?? points.first,
      zoom: 16,
      framedCoordinates: points.length > 1 ? points : const [],
      followLocation: false,
      cameraRevision: state.cameraRevision + 1,
    );
  }
}
