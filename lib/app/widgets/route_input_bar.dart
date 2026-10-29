import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/place_search/presentation/place_picker_sheet.dart';
import '../../features/route_search/domain/entities/route_point.dart';
import '../../features/route_search/presentation/providers/route_selection_notifier.dart';
import '../../features/route_search/presentation/state/route_selection_state.dart';
import '../../features/location/presentation/widgets/current_location_control.dart';
import '../../features/map/presentation/providers/map_notifier.dart';

class RouteInputBar extends ConsumerWidget {
  const RouteInputBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(routeSelectionProvider);
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            const Column(
              children: [
                Icon(Icons.trip_origin, size: 18, color: Color(0xFF23785C)),
                SizedBox(height: 18),
                Icon(Icons.place, size: 20, color: Color(0xFF4268C5)),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  _field(
                    context,
                    ref,
                    RouteEndpoint.origin,
                    state.endpoints.origin,
                  ),
                  const Divider(height: 1),
                  _field(
                    context,
                    ref,
                    RouteEndpoint.destination,
                    state.endpoints.destination,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: state.endpoints.isComplete
                  ? ref.read(routeSelectionProvider.notifier).swap
                  : null,
              tooltip: '출발·도착 교환',
              icon: const Icon(Icons.swap_vert_rounded),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    BuildContext context,
    WidgetRef ref,
    RouteEndpoint endpoint,
    RoutePoint? point,
  ) {
    final label = endpoint == RouteEndpoint.origin ? '출발지' : '도착지';
    final text =
        point?.name ??
        (point == null
            ? '$label 입력'
            : point.source == RoutePointSource.currentLocation
            ? '현재 위치'
            : '지도에서 선택한 $label');
    return InkWell(
      key: ValueKey('route-${endpoint.name}'),
      borderRadius: BorderRadius.circular(12),
      onTap: () => _pick(context, ref, endpoint),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: point == null
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : null,
                ),
              ),
            ),
            if (point != null)
              SizedBox(
                width: 30,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  tooltip: '$label 선택 지우기',
                  icon: const Icon(Icons.close, size: 16),
                  onPressed: () =>
                      ref.read(routeSelectionProvider.notifier).clear(endpoint),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _pick(BuildContext context, WidgetRef ref, RouteEndpoint endpoint) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => PlacePickerSheet(
        title: endpoint == RouteEndpoint.origin ? '어디서 출발할까요?' : '어디로 갈까요?',
        onMap: () =>
            ref.read(routeSelectionProvider.notifier).beginSelection(endpoint),
        onPicked: (place) {
          ref
              .read(routeSelectionProvider.notifier)
              .setPoint(
                endpoint,
                RoutePoint(
                  coordinate: place.coordinate,
                  source: RoutePointSource.place,
                  name: place.name,
                  address: place.address,
                  attributions: place.attributions,
                ),
              );
        },
        currentLocationControl: endpoint == RouteEndpoint.origin
            ? CurrentLocationControl(
                compact: true,
                label: '현재 위치에서 출발',
                onLocated: (fix) {
                  if (!sheetContext.mounted) return;
                  Navigator.pop(sheetContext);
                  ref
                      .read(routeSelectionProvider.notifier)
                      .useCurrentLocation(fix.coordinate);
                  ref.read(mapProvider.notifier).focusOn(fix.coordinate);
                },
              )
            : null,
      ),
    );
  }
}
