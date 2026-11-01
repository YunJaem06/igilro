import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/navigation_progress.dart';
import '../../route_search/domain/entities/route_guidance.dart';
import 'guidance_maneuver_icon.dart';
import 'guidance_selection_notifier.dart';
import 'navigation_notifier.dart';

class GuidanceStepsSheet extends ConsumerWidget {
  const GuidanceStepsSheet({
    super.key,
    required this.routeKey,
    required this.guidance,
    required this.onInspect,
    required this.onShowWholeRoute,
  });

  final Object routeKey;
  final RouteGuidance guidance;
  final ValueChanged<RouteGuidanceStep> onInspect;
  final VoidCallback onShowWholeRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      guidanceSelectionProvider(guidance, routeKey: routeKey),
    );
    final nav = ref.watch(navigationProvider);
    final progress = nav.route?.guidance == guidance ? nav.stepProgress : null;
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .75,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '전체 길안내 · ${guidance.steps.length}단계',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    tooltip: '길안내 목록 닫기',
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                key: const Key('guidance-steps-list'),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        children: [
                          const Text('안내를 누르면 지도에서 위치를 확인할 수 있어요.'),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              onShowWholeRoute();
                            },
                            icon: const Icon(Icons.fit_screen),
                            label: const Text('전체 경로 보기'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (guidance.metadataStatus != GuidanceMetadataStatus.osmTags)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          guidance.metadataStatus ==
                                  GuidanceMetadataStatus.topologyOnly
                              ? '보행망 기반 안내 · 횡단 정보가 제한될 수 있어요.'
                              : '안내 정보 출처를 확인할 수 없어요.',
                        ),
                      ),
                    ),
                  if (guidance.steps.any((step) => step.crossing != null))
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                        child: Text('횡단 정보는 지도 자료이며 현재 신호 상태는 제공하지 않아요.'),
                      ),
                    ),
                  const SliverToBoxAdapter(child: Divider(height: 1)),
                  SliverList.separated(
                    itemCount: guidance.steps.length,
                    separatorBuilder: (_, _) =>
                        const Divider(height: 1, indent: 64),
                    itemBuilder: (context, i) =>
                        _step(context, guidance.steps[i], selected, progress),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _step(
    BuildContext context,
    RouteGuidanceStep step,
    int? selected,
    NavigationStepProgress? progress,
  ) {
    final current = progress?.currentIndex == step.index;
    final next = progress?.nextIndex == step.index;
    final inspected = selected == step.index;
    final completed = progress != null && step.index < progress.currentIndex;
    return ListTile(
      key: ValueKey('guidance-step-${step.index}'),
      isThreeLine: false,
      selected: inspected || current || next,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer
          .withValues(alpha: .45),
      leading: CircleAvatar(
        backgroundColor: inspected
            ? Theme.of(context).colorScheme.tertiaryContainer
            : next
            ? Theme.of(context).colorScheme.primaryContainer
            : null,
        child: completed
            ? const Icon(Icons.check, size: 18)
            : Text('${step.index + 1}'),
      ),
      trailing: Icon(guidanceManeuverIcon(step.type)),
      title: Text(step.instruction),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (step.streetName != null) Text(step.streetName!),
          Text(
            '출발점에서 ${_distance(step.distanceFromStartMeters)}'
            '${step.type == ManeuverType.arrive ? '' : ' · 다음 안내까지 ${_distance(step.distanceToNextStepMeters)}'}',
          ),
          if (step.crossing != null)
            Text(switch (step.crossing!.trafficSignals) {
              true => '지도 정보: 횡단 신호등 있음',
              false => '지도 정보: 횡단 신호등 없음',
              null => '횡단 신호등 설치 여부 미확인',
            }),
          if (current || next || inspected)
            Wrap(
              spacing: 8,
              children: [
                if (current)
                  const Text(
                    '현재 구간',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (next)
                  const Text(
                    '다음 안내',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (inspected)
                  const Text(
                    '지도에서 확인 중',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              ],
            ),
        ],
      ),
      onTap: () {
        Navigator.pop(context);
        onInspect(step);
      },
    );
  }

  String _distance(double meters) => meters >= 1000
      ? '${(meters / 1000).toStringAsFixed(1)}km'
      : '${meters.round()}m';
}
