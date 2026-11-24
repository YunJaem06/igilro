import 'package:flutter/material.dart';

import '../domain/navigation_progress.dart';
import '../domain/navigation_timing.dart';
import 'navigation_time_formatters.dart';

class ArrivalSummaryCard extends StatelessWidget {
  const ArrivalSummaryCard({
    super.key,
    required this.route,
    this.session,
    required this.isPreview,
    required this.onDone,
    this.onShowGuidance,
    this.compact = false,
  });

  final NavigationRoute route;
  final NavigationSession? session;
  final bool isPreview;
  final VoidCallback onDone;
  final VoidCallback? onShowGuidance;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final completedAt = session?.completedAt;
    return Container(
      key: const Key('arrival-summary-card'),
      padding: EdgeInsets.all(compact ? 10 : 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!compact)
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.check_circle,
                size: 36,
                color: Color(0xFF23785C),
              ),
            ),
          if (!compact) const SizedBox(height: 12),
          Semantics(
            liveRegion: true,
            header: true,
            child: Text(
              isPreview ? '경로 미리보기가 끝났어요' : '목적지에 도착했어요',
              style: compact
                  ? Theme.of(context).textTheme.titleLarge
                  : Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 8),
          _row(
            context,
            '경로 거리',
            formatNavigationDistance(route.distanceMeters),
          ),
          if (compact)
            Text(isPreview ? '가상 이동 결과' : '안내가 완료됐어요.')
          else if (isPreview) ...[
            _row(context, '경로 예상 시간', formatRemainingTime(route.duration)),
            const Text('가상 이동 결과입니다. 실제 이동 시간과 거리를 기록하지 않아요.'),
          ] else if (completedAt != null) ...[
            _row(
              context,
              '도착 시각',
              formatNavigationTime(context, completedAt, includeDate: true),
            ),
            _row(
              context,
              '안내 진행 시간',
              formatGuidanceElapsed(session!.elapsedAt(completedAt)),
            ),
            const Text('안내 진행 시간은 일시정지한 시간을 제외해요.'),
          ],
          if (!compact) ...[
            const SizedBox(height: 8),
            const Text('경로 거리는 검색된 보행로 기준이에요.'),
          ],
          const SizedBox(height: 8),
          if (compact)
            TextButton(
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (sheetContext) => SafeArea(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: ArrivalSummaryCard(
                        route: route,
                        session: session,
                        isPreview: isPreview,
                        onDone: () {
                          Navigator.pop(sheetContext);
                          onDone();
                        },
                        onShowGuidance: onShowGuidance == null
                            ? null
                            : () {
                                Navigator.pop(sheetContext);
                                onShowGuidance!();
                              },
                      ),
                    ),
                  ),
                ),
              ),
              child: const Text('상세 보기'),
            ),
          if (!compact && onShowGuidance != null)
            OutlinedButton.icon(
              onPressed: onShowGuidance,
              icon: const Icon(Icons.format_list_numbered),
              label: const Text('전체 길안내'),
            ),
          FilledButton.icon(
            key: const Key('arrival-finish'),
            onPressed: onDone,
            icon: const Icon(Icons.done),
            label: const Text('완료'),
          ),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Wrap(
      spacing: 12,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(label),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    ),
  );
}
