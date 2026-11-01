import 'package:flutter/material.dart';

import '../domain/navigation_timing.dart';
import 'navigation_time_formatters.dart';

class GuidanceTimeCard extends StatelessWidget {
  const GuidanceTimeCard({
    super.key,
    required this.estimate,
    this.isPreview = false,
  });

  final NavigationTimeEstimate estimate;
  final bool isPreview;

  @override
  Widget build(BuildContext context) => Container(
    key: const Key('guidance-time-card'),
    margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '예상 ${formatRemainingTime(estimate.remaining)} 남았어요',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        Text(
          '도착 예정 ${formatNavigationTime(context, estimate.arrivalAt, reference: estimate.updatedAt)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          isPreview
              ? '실제 보행 기준 예상이며 미리보기 속도와 달라요.'
              : '서버의 예상 보행 시간과 현재 경로 위치를 기준으로 갱신해요.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
