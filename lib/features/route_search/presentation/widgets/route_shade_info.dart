import 'package:flutter/material.dart';

import '../../domain/entities/route_candidate.dart';
import '../models/route_result_formatters.dart';
import '../models/route_shade_summary.dart';

class RouteShadeInfo extends StatelessWidget {
  const RouteShadeInfo({
    super.key,
    required this.route,
    required this.evaluatedAt,
  });

  final RouteCandidate route;
  final DateTime evaluatedAt;

  @override
  Widget build(BuildContext context) {
    final summary = RouteShadeSummary.fromRoute(route);
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.wb_shade_rounded, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('건물 그늘', style: theme.textTheme.labelLarge),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              summary.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: summary.ratio != null ? theme.colorScheme.primary : null,
              ),
            ),
            if (summary.ratio case final double ratio) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: ratio,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
                semanticsLabel: '경로의 건물 그늘 비율',
                semanticsValue: formatRoutePercentage(ratio),
              ),
            ],
            const SizedBox(height: 8),
            Text(summary.description),
            if (summary.coverage case final double coverage) ...[
              const SizedBox(height: 8),
              Text('평가 가능한 구간 ${formatRoutePercentage(coverage)}'),
            ],
            if (route.shadeEvaluation != null) ...[
              const SizedBox(height: 12),
              Text(
                '평가 기준 ${formatRouteEvaluationTime(evaluatedAt)}',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
