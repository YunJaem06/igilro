import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../providers/map_notifier.dart';
import '../state/map_marker.dart';
import '../state/map_state.dart';
import '../state/map_overlays.dart';
import 'mapbox_surface.dart';

typedef MapSurfaceBuilder = Widget Function(
  MapState state,
  List<MapMarker> markers,
  List<GeoCoordinate> routePath,
  ValueChanged<GeoCoordinate>? onCoordinateTapped,
  VoidCallback onReady,
  VoidCallback onFailure,
);

class MapCanvas extends ConsumerWidget {
  const MapCanvas({
    super.key,
    this.surfaceBuilder,
    this.markers = const [],
    this.routePath = const [],
    this.alternativeRoutePath = const [],
    this.routeSegments = const [],
    this.coverage,
    this.onAccessPointTapped,
    this.onCoordinateTapped,
  });

  /// Replaces the native map surface in widget tests, preserving app behavior.
  final MapSurfaceBuilder? surfaceBuilder;
  final List<MapMarker> markers;
  final List<GeoCoordinate> routePath;
  final List<GeoCoordinate> alternativeRoutePath;
  final List<MapRouteSegment> routeSegments;
  final MapCoverage? coverage;
  final ValueChanged<MapAccessPoint>? onAccessPointTapped;
  final ValueChanged<GeoCoordinate>? onCoordinateTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(mapConfiguredProvider)) {
      return const _MapMessage(message: '지도를 준비하고 있어요.');
    }
    final state = ref.watch(mapProvider);
    final notifier = ref.read(mapProvider.notifier);
    final surface =
        surfaceBuilder?.call(
          state,
          markers,
          routePath,
          state.status == MapLoadStatus.ready ? onCoordinateTapped : null,
          notifier.markReady,
          notifier.markFailed,
        ) ??
        MapboxSurface(
          key: ValueKey(state.session),
          state: state,
          markers: markers,
          routePath: routePath,
          alternativeRoutePath: alternativeRoutePath,
          routeSegments: routeSegments,
          coverage: coverage,
          onAccessPointTapped: onAccessPointTapped,
          onCoordinateTapped: state.status == MapLoadStatus.ready
              ? onCoordinateTapped
              : null,
          onReady: notifier.markReady,
          onFailure: notifier.markFailed,
        );
    return Stack(
      fit: StackFit.expand,
      children: [
        surface,
        if (state.status == MapLoadStatus.loading)
          const IgnorePointer(
            child: Center(
              child: CircularProgressIndicator(semanticsLabel: '지도 불러오는 중'),
            ),
          ),
        if (state.status == MapLoadStatus.failed)
          _MapMessage(
            message: '지도를 불러오지 못했어요.\n연결 상태를 확인하고 다시 시도해 주세요.',
            onRetry: notifier.retry,
          ),
      ],
    );
  }
}

class _MapMessage extends StatelessWidget {
  const _MapMessage({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Theme.of(context).colorScheme.surfaceContainer,
    child: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 12),
              FilledButton(onPressed: onRetry, child: const Text('지도 다시 불러오기')),
            ],
          ],
        ),
      ),
    ),
  );
}
