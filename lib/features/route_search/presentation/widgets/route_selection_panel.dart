import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/route_point.dart';
import '../providers/route_selection_notifier.dart';
import '../state/route_selection_state.dart';

class RouteSelectionPanel extends ConsumerWidget {
  const RouteSelectionPanel({
    super.key,
    required this.mapReady,
    required this.currentLocationControl,
    required this.onShowPoints,
    this.hasRoute = false,
  });

  final bool mapReady;
  final Widget currentLocationControl;
  final VoidCallback onShowPoints;
  final bool hasRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(routeSelectionProvider);
    final notifier = ref.read(routeSelectionProvider.notifier);
    final selecting = state.selecting;
    if (selecting != null) {
      final label = selecting == RouteEndpoint.origin ? '출발지' : '도착지';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$label 선택', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text('지도에서 원하는 위치를 눌러 주세요.'),
          const SizedBox(height: 8),
          Text(
            state.candidate == null
                ? '선택한 위치가 없어요.'
                : _coordinateText(state.candidate!),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 8,
            runSpacing: 8,
            children: [
              TextButton(
                onPressed: notifier.cancelSelection,
                child: const Text('선택 취소'),
              ),
              FilledButton(
                onPressed: mapReady && state.candidate != null
                    ? notifier.confirmSelection
                    : null,
                child: Text('$label로 선택'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          currentLocationControl,
        ],
      );
    }
    final endpoints = state.endpoints;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _EndpointField(
                    label: '출발지',
                    point: endpoints.origin,
                    color: Theme.of(context).colorScheme.primary,
                    onSelect: mapReady
                        ? () => notifier.beginSelection(RouteEndpoint.origin)
                        : null,
                    onClear: () => notifier.clear(RouteEndpoint.origin),
                  ),
                  const SizedBox(height: 8),
                  _EndpointField(
                    label: '도착지',
                    point: endpoints.destination,
                    color: const Color(0xFF4268C5),
                    onSelect: mapReady
                        ? () =>
                              notifier.beginSelection(RouteEndpoint.destination)
                        : null,
                    onClear: () => notifier.clear(RouteEndpoint.destination),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: endpoints.isComplete ? notifier.swap : null,
              icon: const Icon(Icons.swap_vert_rounded),
              tooltip: '출발·도착 교환',
            ),
          ],
        ),
        const SizedBox(height: 8),
        currentLocationControl,
        const SizedBox(height: 12),
        Text(
          endpoints.isSamePoint
              ? '출발지와 도착지를 서로 다른 위치로 선택해 주세요.'
              : endpoints.canSearch
              ? '두 지점이 준비됐어요.'
              : '출발지와 도착지를 선택해 주세요.',
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: mapReady && endpoints.canSearch ? onShowPoints : null,
          icon: const Icon(Icons.fit_screen_rounded),
          label: Text(hasRoute ? '전체 경로 보기' : '두 지점 보기'),
        ),
      ],
    );
  }
}

class _EndpointField extends StatelessWidget {
  const _EndpointField({
    required this.label,
    required this.point,
    required this.color,
    required this.onSelect,
    required this.onClear,
  });

  final String label;
  final RoutePoint? point;
  final Color color;
  final VoidCallback? onSelect;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) => Material(
    color: Theme.of(context).colorScheme.surfaceContainerLow,
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAlias,
    child: Row(
      children: [
        Expanded(
          child: Semantics(
            label: '지도에서 $label 선택',
            button: true,
            enabled: onSelect != null,
            child: InkWell(
              onTap: onSelect,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: color),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(point == null ? '지도에서 선택' : _pointText(point!)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (point != null)
          IconButton(
            onPressed: onClear,
            tooltip: '$label 선택 지우기',
            icon: const Icon(Icons.close_rounded),
          ),
      ],
    ),
  );
}

String _pointText(RoutePoint point) =>
    point.source == RoutePointSource.currentLocation
    ? '현재 위치'
    : '${point.coordinate.latitude.toStringAsFixed(5)}, ${point.coordinate.longitude.toStringAsFixed(5)}';

String _coordinateText(RoutePoint point) =>
    '위도 ${point.coordinate.latitude.toStringAsFixed(5)} · 경도 ${point.coordinate.longitude.toStringAsFixed(5)}';
