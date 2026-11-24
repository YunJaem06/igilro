import 'package:flutter/material.dart';

import '../domain/navigation_timing.dart';
import 'navigation_time_formatters.dart';

class GuidanceTimeCard extends StatelessWidget {
  const GuidanceTimeCard({
    super.key,
    required this.estimate,
    this.isPreview = false,
    this.compact = false,
    this.remainingMeters,
  });

  final NavigationTimeEstimate estimate;
  final bool isPreview;
  final bool compact;
  final double? remainingMeters;

  @override
  Widget build(BuildContext context) => Container(
    key: const Key('guidance-time-card'),
    margin: EdgeInsets.only(top: compact ? 8 : 12),
    padding: EdgeInsets.all(compact ? 10 : 16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '예상 ${formatRemainingTime(estimate.remaining)} 남았어요',
              style: compact
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.headlineSmall,
            ),
            if (remainingMeters != null)
              Text('${formatNavigationDistance(remainingMeters!)} 남음'),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '도착 예정 ${formatNavigationTime(context, estimate.arrivalAt, reference: estimate.updatedAt)}',
          style: compact
              ? Theme.of(context).textTheme.bodySmall
              : Theme.of(context).textTheme.titleMedium,
        ),
        if (!compact) ...[
          const SizedBox(height: 8),
          Text(
            isPreview
                ? '실제 보행 기준 예상이며 미리보기 속도와 달라요.'
                : '서버의 예상 보행 시간과 현재 경로 위치를 기준으로 갱신해요.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    ),
  );
}
