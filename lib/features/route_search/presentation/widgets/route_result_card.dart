import 'package:flutter/material.dart';

import '../../../../core/geo/geo_coordinate.dart';
import '../../domain/entities/route_endpoints.dart';
import '../../domain/entities/route_point.dart';
import '../../domain/entities/route_search_result.dart';
import '../models/route_result_formatters.dart';
import 'route_shade_info.dart';

class RouteResultCard extends StatelessWidget {
  const RouteResultCard({
    super.key,
    required this.result,
    required this.endpoints,
  });

  final RouteSearchResult result;
  final RouteEndpoints endpoints;

  @override
  Widget build(BuildContext context) {
    final route = result.routes.first;
    final theme = Theme.of(context);
    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('도보 경로', style: theme.textTheme.titleMedium),
                Chip(
                  avatar: Icon(
                    Icons.directions_walk_rounded,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                  label: const Text('빠른 길'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${formatRouteDuration(route.duration)} · '
              '${formatRouteDistance(route.distanceMeters)}',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text('보행로 기준 · 접근 구간 제외', style: theme.textTheme.bodySmall),
            const SizedBox(height: 16),
            _EndpointSummary(
              label: '출발',
              point: endpoints.origin?.coordinate == result.query.origin
                  ? endpoints.origin
                  : null,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 10),
            _EndpointSummary(
              label: '도착',
              point:
                  endpoints.destination?.coordinate == result.query.destination
                  ? endpoints.destination
                  : null,
              color: const Color(0xFF4268C5),
            ),
            const SizedBox(height: 16),
            RouteShadeInfo(route: route, evaluatedAt: result.evaluatedAt),
            const SizedBox(height: 8),
            ExpansionTile(
              key: ValueKey((result.query, route.id)),
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: 12),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              title: const Text('상세 정보'),
              children: [
                Text(
                  '보행로 출발점: ${_coordinateText(result.snapping.origin.coordinate)}'
                  ' · 접근 ${formatRouteDistance(result.snapping.origin.distanceMeters)}',
                ),
                const SizedBox(height: 8),
                Text(
                  '보행로 도착점: ${_coordinateText(result.snapping.destination.coordinate)}'
                  ' · 접근 ${formatRouteDistance(result.snapping.destination.distanceMeters)}',
                ),
                const SizedBox(height: 8),
                const Text('보행로까지의 접근 거리는 경로 거리·시간에 포함되지 않아요.'),
                if (route.shadeEvaluation != null) ...[
                  const SizedBox(height: 12),
                  const Text(
                    '그늘은 출발 시각의 건물 그림자를 기준으로 추정해요. '
                    '나무·구름과 이동 중 시간 변화는 반영하지 않아요.',
                  ),
                ],
              ],
            ),
            const SizedBox(height: 4),
            Text(result.attribution, style: theme.textTheme.bodySmall),
            if (route.shadeEvaluation?.attribution case final String source)
              Text(source, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _EndpointSummary extends StatelessWidget {
  const _EndpointSummary({
    required this.label,
    required this.point,
    required this.color,
  });

  final String label;
  final RoutePoint? point;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final name = point?.name?.trim();
    final text = name != null && name.isNotEmpty
        ? name
        : point?.source == RoutePointSource.currentLocation
        ? '현재 위치'
        : '지도에서 선택한 위치';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(Icons.location_on_rounded, color: color, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelMedium),
              Text(text, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ],
    );
  }
}

String _coordinateText(GeoCoordinate coordinate) =>
    '${coordinate.latitude.toStringAsFixed(5)}, '
    '${coordinate.longitude.toStringAsFixed(5)}';
