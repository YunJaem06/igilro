import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/geo/geo_coordinate.dart';
import '../../features/route_search/domain/entities/model_route_prediction.dart';
import '../../features/route_search/domain/entities/route_endpoints.dart';
import '../../features/route_search/domain/entities/route_point.dart';
import '../../features/route_search/presentation/providers/route_prediction_notifier.dart';
import '../../features/route_search/presentation/providers/route_comparison_notifier.dart';
import '../../features/route_search/presentation/providers/route_prediction_providers.dart';
import '../../features/route_search/presentation/providers/route_search_kind_notifier.dart';
import '../../features/route_search/presentation/providers/route_selection_notifier.dart';

/// A debug-only entry point to the server's documented, verified pilot query.
class PredictionPilotButton extends ConsumerWidget {
  const PredictionPilotButton({super.key, this.onInvoked});
  final VoidCallback? onInvoked;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Tooltip(
    message: '개발용: 서울숲 검증 좌표·시각으로 그늘 예측 검색',
    child: TextButton.icon(
      onPressed:
          ref.watch(routePredictionProvider).isLoading ||
              ref.watch(routeComparisonProvider).isLoading
          ? null
          : () {
              _search(ref);
              onInvoked?.call();
            },
      icon: const Icon(Icons.science_outlined),
      label: const Text('테스트 경로'),
    ),
  );

  void _search(WidgetRef ref) {
    ref
        .read(routeSearchKindProvider.notifier)
        .select(RouteSearchKind.prediction);
    ref
        .read(routeSelectionProvider.notifier)
        .setEndpoints(
          const RouteEndpoints(
            origin: RoutePoint(
              coordinate: GeoCoordinate(longitude: 127.0374, latitude: 37.5445),
              source: RoutePointSource.map,
            ),
            destination: RoutePoint(
              coordinate: GeoCoordinate(longitude: 127.0430, latitude: 37.5480),
              source: RoutePointSource.map,
            ),
          ),
        );
    final options = ref.read(routePredictionOptionsProvider.notifier);
    options.selectMode(RoutePredictionMode.shade);
    options.setDepartureAt(DateTime.utc(2026, 10, 28, 2));
    unawaited(ref.read(routeComparisonProvider.notifier).search());
  }
}
