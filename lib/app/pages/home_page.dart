import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/geo/geo_coordinate.dart';
import '../../features/location/presentation/providers/location_notifier.dart';
import '../../features/map/presentation/providers/map_notifier.dart';
import '../../features/map/presentation/state/map_marker.dart';
import '../../features/map/presentation/state/map_overlays.dart';
import '../../features/map/presentation/widgets/shade_legend.dart';
import '../../features/map/presentation/state/map_state.dart';
import '../../features/map/presentation/widgets/map_canvas.dart';
import '../../features/navigation/domain/navigation_progress.dart';
import '../../features/navigation/presentation/navigation_notifier.dart';
import '../../features/navigation/presentation/guidance_panel.dart';
import '../../features/route_search/domain/entities/model_route_prediction.dart';
import '../../features/route_search/domain/entities/route_point.dart';
import '../../features/route_search/presentation/providers/prediction_coverage_notifier.dart';
import '../../features/route_search/presentation/providers/route_selection_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_providers.dart';
import '../../features/route_search/presentation/providers/route_comparison_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_kind_notifier.dart';
import '../../features/route_search/presentation/state/route_selection_state.dart';
import '../../features/route_search/presentation/widgets/route_explorer_panel.dart';
import '../debug/prediction_pilot_button.dart';
import '../widgets/route_input_bar.dart';
import '../widgets/prediction_coverage_control.dart';
import '../widgets/map_search_sheet.dart';

/// App composition joins map, route selection and foreground guidance.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, this.mapSurfaceBuilder});
  final MapSurfaceBuilder? mapSurfaceBuilder;
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with WidgetsBindingObserver {
  final _panelScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _panelScrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      ref.read(navigationProvider.notifier).pause();
      ref.read(mapProvider.notifier).stopFollowing();
    }
  }

  ModelRoutePrediction? _prediction() {
    final mode = ref.read(routePredictionOptionsProvider).mode;
    return ref.read(routeComparisonProvider).asData?.value?.forMode(mode) ??
        ref.read(routePredictionProvider).asData?.value;
  }

  NavigationRoute? _route() {
    if (ref.read(routeSearchKindProvider) == RouteSearchKind.prediction) {
      final route = _prediction()?.routes.first;
      return route == null
          ? null
          : NavigationRoute(
              path: route.path,
              distanceMeters: route.distanceMeters,
              duration: route.duration,
            );
    }
    final route = ref.read(routeSearchProvider).asData?.value?.routes.first;
    return route == null
        ? null
        : NavigationRoute(
            path: route.path,
            distanceMeters: route.distanceMeters,
            duration: route.duration,
          );
  }

  void _frame() {
    final selection = ref.read(routeSelectionProvider).endpoints;
    final model = _prediction();
    final pair = ref.read(routeComparisonProvider).asData?.value;
    ref.read(mapProvider.notifier).framePoints([
      ...?_route()?.path,
      if (ref.read(routeSearchKindProvider) == RouteSearchKind.prediction &&
          pair != null)
        ...pair
            .forMode(
              ref.read(routePredictionOptionsProvider).mode ==
                      RoutePredictionMode.shade
                  ? RoutePredictionMode.fastest
                  : RoutePredictionMode.shade,
            )
            .routes
            .first
            .path,
      if (selection.origin != null) selection.origin!.coordinate,
      if (selection.destination != null) selection.destination!.coordinate,
    ]);
    if (ref.read(routeSearchKindProvider) == RouteSearchKind.prediction &&
        model != null) {
      ref.read(mapProvider.notifier).setLightingTime(model.evaluatedAt);
    } else {
      ref.read(mapProvider.notifier).setLightingTime(null);
    }
  }

  void _start({bool preview = false}) {
    final route = _route();
    if (route == null) return;
    ref.read(mapProvider.notifier).beginFollowing();
    final nav = ref.read(navigationProvider.notifier);
    if (preview) {
      nav.preview(route);
    } else {
      nav.start(route);
    }
  }

  void _follow() {
    ref.read(mapProvider.notifier).beginFollowing();
    final state = ref.read(navigationProvider);
    if (state.fix != null && state.status != GuidanceStatus.weakGps) {
      ref
          .read(mapProvider.notifier)
          .follow(state.fix!.coordinate, state.progress?.bearing ?? 0);
    }
  }

  Future<void> _locate() async {
    await ref.read(locationProvider.notifier).locate();
    if (!mounted) return;
    final state = ref.read(locationProvider);
    if (state.asData?.value case final fix?) {
      ref.read(mapProvider.notifier).focusOn(fix.coordinate);
    } else if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('현재 위치를 확인하지 못했어요. 위치 권한과 GPS를 확인해 주세요.')),
      );
    }
  }

  Future<void> _showCoverage() async {
    ref
        .read(routeSearchKindProvider.notifier)
        .select(RouteSearchKind.prediction);
    try {
      if (ref.read(predictionCoverageProvider).hasError) {
        ref.invalidate(predictionCoverageProvider);
      }
      final coverage = await ref.read(predictionCoverageProvider.future);
      if (mounted) {
        ref
            .read(mapProvider.notifier)
            .framePoints(coverage.bounds.corners, center: coverage.center);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('검색 범위를 불러오지 못했어요. 다시 시도해 주세요.')),
        );
      }
    }
  }

  void _selectAccessPoint(MapAccessPoint point) {
    if (ref.read(navigationProvider).active) return;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(point.name, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              for (final endpoint in RouteEndpoint.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: FilledButton.tonal(
                    onPressed: () {
                      Navigator.pop(sheetContext);
                      final source = ref
                          .read(predictionCoverageProvider)
                          .asData
                          ?.value
                          .attribution;
                      ref
                          .read(routeSelectionProvider.notifier)
                          .setPoint(
                            endpoint,
                            RoutePoint(
                              coordinate: point.coordinate,
                              source: RoutePointSource.map,
                              name: point.name,
                              attributions: source == null ? [] : [source],
                            ),
                          );
                    },
                    child: Text(
                      endpoint == RouteEndpoint.origin ? '출발지로 설정' : '도착지로 설정',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selection = ref.watch(routeSelectionProvider);
    final kind = ref.watch(routeSearchKindProvider);
    final options = ref.watch(routePredictionOptionsProvider);
    final pair = ref.watch(routeComparisonProvider).asData?.value;
    final single = ref.watch(routePredictionProvider).asData?.value;
    final general = ref.watch(routeSearchProvider).asData?.value;
    final nav = ref.watch(navigationProvider);
    final mapState = ref.watch(mapProvider);
    final showPredictionCoverage =
        kind == RouteSearchKind.prediction && ref.watch(mapConfiguredProvider);
    final coverage = showPredictionCoverage
        ? ref.watch(predictionCoverageProvider).asData?.value
        : null;
    final prediction = pair?.forMode(options.mode) ?? single;
    final path = kind == RouteSearchKind.general
        ? general?.routes.first.path ?? <GeoCoordinate>[]
        : prediction?.routes.first.path ?? <GeoCoordinate>[];
    final alternative = kind == RouteSearchKind.prediction && pair != null
        ? pair
              .forMode(
                options.mode == RoutePredictionMode.shade
                    ? RoutePredictionMode.fastest
                    : RoutePredictionMode.shade,
              )
              .routes
              .first
              .path
        : <GeoCoordinate>[];
    final routeSegments = kind == RouteSearchKind.prediction
        ? prediction?.routes.first.shadeSegments
                  .map(
                    (segment) => MapRouteSegment(
                      state: segment.state == PredictedShadeState.shade
                          ? MapShadeState.shade
                          : MapShadeState.sunlight,
                      path: segment.path,
                    ),
                  )
                  .toList() ??
              <MapRouteSegment>[]
        : <MapRouteSegment>[];
    final mapCoverage = coverage == null || nav.active
        ? null
        : MapCoverage(
            boundary: coverage.bounds.corners,
            walkingNetwork: coverage.walkingNetwork,
            accessPoints: coverage.accessPoints
                .map(
                  (point) => MapAccessPoint(
                    id: point.id,
                    name: point.name,
                    coordinate: point.coordinate,
                  ),
                )
                .toList(),
          );
    final mapReady =
        ref.watch(mapConfiguredProvider) &&
        mapState.status == MapLoadStatus.ready;
    ref.listen(routeSelectionProvider.select((value) => value.endpoints), (
      _,
      next,
    ) {
      ref.read(navigationProvider.notifier).stop();
      _frame();
    });
    if (showPredictionCoverage) {
      ref.listen(predictionCoverageProvider, (previous, next) {
        final value = next.asData?.value;
        final points = ref.read(routeSelectionProvider).endpoints;
        if (value != null &&
            previous?.asData?.value == null &&
            points.origin == null &&
            points.destination == null &&
            !ref.read(navigationProvider).active) {
          ref
              .read(mapProvider.notifier)
              .framePoints(value.bounds.corners, center: value.center);
        }
      });
    }
    ref.listen(routeSearchKindProvider, (_, next) {
      ref.read(navigationProvider.notifier).stop();
      _frame();
    });
    ref.listen(routeSearchProvider, (_, next) {
      if (next.asData?.value != null) _frame();
    });
    ref.listen(routePredictionProvider, (_, next) {
      if (next.asData?.value != null) _frame();
    });
    ref.listen(routeComparisonProvider, (_, next) {
      if (next.asData?.value != null) _frame();
    });
    ref.listen(routePredictionOptionsProvider, (_, next) {
      ref.read(navigationProvider.notifier).stop();
      _frame();
    });
    ref.listen(navigationProvider, (previous, next) {
      if (!next.active) {
        ref.read(mapProvider.notifier).stopFollowing();
        if (previous?.isPreview == true) {
          ref.read(mapProvider.notifier).clearCurrentLocation();
        }
        if (previous?.active == true) _frame();
      }
      if (next.fix != null &&
          {
            GuidanceStatus.following,
            GuidanceStatus.approaching,
            GuidanceStatus.offRoute,
            GuidanceStatus.arrived,
          }.contains(next.status)) {
        final fix = next.fix!;
        final heading = !next.isPreview && (fix.speedMetersPerSecond ?? 0) > 0.5
            ? fix.headingDegrees ?? next.progress?.bearing ?? 0
            : next.progress?.bearing ?? 0;
        if (ref.read(mapProvider).followLocation) {
          ref.read(mapProvider.notifier).follow(fix.coordinate, heading);
        } else {
          ref.read(mapProvider.notifier).updateCurrentLocation(fix.coordinate);
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.route_rounded, color: Color(0xFF23785C)),
            SizedBox(width: 8),
            Flexible(
              child: Text('이길로', maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: path.isNotEmpty || selection.endpoints.canSearch
                ? _frame
                : null,
            icon: const Icon(Icons.fit_screen_rounded),
            tooltip: '전체 경로 보기',
          ),
          PopupMenuButton<String>(
            tooltip: '더보기',
            itemBuilder: (context) => [
              PopupMenuItem(value: 'about', child: const Text('지도와 그늘 예측 안내')),
              if (kDebugMode)
                PopupMenuItem(
                  enabled: false,
                  child: PredictionPilotButton(
                    onInvoked: () => Navigator.pop(context),
                  ),
                ),
            ],
            onSelected: (_) => showModalBottomSheet<void>(
              context: context,
              showDragHandle: true,
              builder: (_) => const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    '현재 서울숲 시범 지역에서 경로를 제공해요.\n\n3D 건물 그림자는 Mapbox 지도의 시각 표현입니다. 경로의 초록·주황 구간은 서버의 모델 예측입니다. 나무·구름 등의 영향은 반영하지 않았어요.\n\n검색 범위 안에서도 보행로에 연결되지 않는 위치가 있어요. 표시된 보행로나 출입 지점을 선택해 주세요.\n\n위치 추적은 안내 중 앱을 사용하는 동안에만 동작해요. 미리보기는 반환된 경로를 가상 이동합니다.',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              if (!nav.active)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.30,
                  ),
                  child: const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
                      child: RouteInputBar(),
                    ),
                  ),
                ),
              Expanded(
                child: MapSearchSheet(
                  key: ValueKey(('search-panel', nav.active)),
                  scrollController: _panelScrollController,
                  scrollable: false,
                  initialFraction: constraints.maxHeight < 400
                      ? 0.60
                      : nav.active
                      ? 0.30
                      : 0.38,
                  map: Stack(
                    fit: StackFit.expand,
                    children: [
                      Listener(
                        onPointerDown: (_) {
                          if (nav.active) {
                            ref.read(mapProvider.notifier).stopFollowing();
                          }
                        },
                        child: MapCanvas(
                          surfaceBuilder: widget.mapSurfaceBuilder,
                          routePath: path,
                          alternativeRoutePath: alternative,
                          routeSegments: routeSegments,
                          coverage: mapCoverage,
                          onAccessPointTapped: nav.active
                              ? null
                              : _selectAccessPoint,
                          markers: [
                            if (selection.endpoints.origin != null &&
                                selection.selecting != RouteEndpoint.origin)
                              MapMarker(
                                coordinate:
                                    selection.endpoints.origin!.coordinate,
                                role: MapMarkerRole.origin,
                              ),
                            if (selection.endpoints.destination != null &&
                                selection.selecting !=
                                    RouteEndpoint.destination)
                              MapMarker(
                                coordinate:
                                    selection.endpoints.destination!.coordinate,
                                role: MapMarkerRole.destination,
                              ),
                            if (selection.candidate != null)
                              MapMarker(
                                coordinate: selection.candidate!.coordinate,
                                role: MapMarkerRole.selection,
                              ),
                          ],
                          onCoordinateTapped: nav.active
                              ? null
                              : ref
                                    .read(routeSelectionProvider.notifier)
                                    .preview,
                        ),
                      ),
                      if (showPredictionCoverage && !nav.active)
                        Positioned(
                          left: 12,
                          bottom: 12,
                          right: 76,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: PredictionCoverageControl(
                              onShow: _showCoverage,
                            ),
                          ),
                        ),
                      if (routeSegments.isNotEmpty)
                        const Positioned(
                          left: 12,
                          top: 12,
                          right: 76,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: ShadeLegend(),
                          ),
                        ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Column(
                          children: [
                            FloatingActionButton.small(
                              heroTag: 'map3d',
                              onPressed: ref
                                  .read(mapProvider.notifier)
                                  .toggle3D,
                              tooltip: mapState.is3D ? '2D로 보기' : '3D로 보기',
                              child: Text(mapState.is3D ? '2D' : '3D'),
                            ),
                            const SizedBox(height: 8),
                            FloatingActionButton.small(
                              heroTag: 'locate',
                              onPressed: nav.active ? _follow : _locate,
                              tooltip: nav.active ? '내 위치 따라가기' : '현재 위치 보기',
                              child: const Icon(Icons.my_location),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: nav.active
                        ? SingleChildScrollView(
                            child: GuidancePanel(
                              onFollow: _follow,
                              onReroute: nav.fix == null || nav.isPreview
                                  ? null
                                  : () {
                                      final coordinate = nav.fix!.coordinate;
                                      ref
                                          .read(navigationProvider.notifier)
                                          .stop();
                                      ref
                                          .read(routeSelectionProvider.notifier)
                                          .useCurrentLocation(coordinate);
                                      if (kind == RouteSearchKind.prediction) {
                                        ref
                                            .read(
                                              routeComparisonProvider.notifier,
                                            )
                                            .search();
                                      } else {
                                        ref
                                            .read(routeSearchProvider.notifier)
                                            .search();
                                      }
                                    },
                            ),
                          )
                        : selection.selecting != null
                        ? SingleChildScrollView(
                            child: _selection(context, mapReady),
                          )
                        : RouteExplorerPanel(
                            onStart: () => _start(),
                            onPreview: () => _start(preview: true),
                            onShowCoverage: _showCoverage,
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

  Widget _selection(BuildContext context, bool mapReady) {
    final state = ref.read(routeSelectionProvider);
    final label = state.selecting == RouteEndpoint.origin ? '출발지' : '도착지';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('$label 선택', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          state.candidate == null ? '지도에서 원하는 위치를 눌러 주세요.' : '선택한 위치로 설정할까요?',
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: ref
                    .read(routeSelectionProvider.notifier)
                    .cancelSelection,
                child: const Text('선택 취소'),
              ),
            ),
            Expanded(
              child: FilledButton(
                onPressed: mapReady && state.candidate != null
                    ? ref.read(routeSelectionProvider.notifier).confirmSelection
                    : null,
                child: Text('$label로 선택'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
