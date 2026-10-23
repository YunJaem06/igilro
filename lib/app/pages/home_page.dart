import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/location/presentation/widgets/current_location_control.dart';
import '../../features/map/presentation/providers/map_notifier.dart';
import '../../features/map/presentation/state/map_marker.dart';
import '../../features/map/presentation/state/map_state.dart';
import '../../features/map/presentation/widgets/map_canvas.dart';
import '../../features/route_search/presentation/providers/route_selection_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_notifier.dart';
import '../../features/route_search/presentation/state/route_selection_state.dart';
import '../../features/route_search/presentation/widgets/route_selection_panel.dart';
import '../../features/route_search/presentation/widgets/route_search_control.dart';

/// Composes selection, map and location without feature-to-feature dependencies.
class HomePage extends ConsumerWidget {
  const HomePage({super.key, this.mapSurfaceBuilder});

  final MapSurfaceBuilder? mapSurfaceBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(routeSelectionProvider);
    final result = ref.watch(routeSearchProvider).asData?.value;
    final routePath = result?.routes.first.path ?? const [];
    final mapReady =
        ref.watch(mapConfiguredProvider) &&
        ref.watch(mapProvider.select((state) => state.status)) ==
            MapLoadStatus.ready;
    ref.listen(routeSelectionProvider.select((state) => state.endpoints), (
      _,
      endpoints,
    ) {
      ref.read(mapProvider.notifier).framePoints([
        if (endpoints.origin != null) endpoints.origin!.coordinate,
        if (endpoints.destination != null) endpoints.destination!.coordinate,
      ]);
    });
    ref.listen(routeSearchProvider, (_, next) {
      final result = next.asData?.value;
      if (result == null) return;
      ref.read(mapProvider.notifier).framePoints([
        ...result.routes.first.path,
        result.query.origin,
        result.query.destination,
      ]);
    });
    return Scaffold(
      appBar: AppBar(title: const Text('이길로')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Expanded(
                child: MapCanvas(
                  surfaceBuilder: mapSurfaceBuilder,
                  routePath: routePath,
                  markers: [
                    if (selection.endpoints.origin != null &&
                        selection.selecting != RouteEndpoint.origin)
                      MapMarker(
                        coordinate: selection.endpoints.origin!.coordinate,
                        role: MapMarkerRole.origin,
                      ),
                    if (selection.endpoints.destination != null &&
                        selection.selecting != RouteEndpoint.destination)
                      MapMarker(
                        coordinate: selection.endpoints.destination!.coordinate,
                        role: MapMarkerRole.destination,
                      ),
                    if (selection.candidate != null)
                      MapMarker(
                        coordinate: selection.candidate!.coordinate,
                        role: MapMarkerRole.selection,
                      ),
                  ],
                  onCoordinateTapped: ref
                      .read(routeSelectionProvider.notifier)
                      .preview,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.55,
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '나에게 맞는 길, 이길로',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        RouteSelectionPanel(
                          mapReady: mapReady,
                          hasRoute: routePath.isNotEmpty,
                          onShowPoints: () =>
                              ref.read(mapProvider.notifier).framePoints([
                                ...routePath,
                                selection.endpoints.origin!.coordinate,
                                selection.endpoints.destination!.coordinate,
                              ]),
                          currentLocationControl: CurrentLocationControl(
                            label: '현재 위치를 출발지로',
                            compact: true,
                            initialMessage: '현재 위치에서 출발할 수 있어요.',
                            onLocated: (fix) {
                              ref
                                  .read(mapProvider.notifier)
                                  .focusOn(fix.coordinate);
                              ref
                                  .read(routeSelectionProvider.notifier)
                                  .useCurrentLocation(fix.coordinate);
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        const RouteSearchControl(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
