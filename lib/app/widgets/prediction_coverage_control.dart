import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/route_search/presentation/providers/prediction_coverage_notifier.dart';

class PredictionCoverageControl extends ConsumerWidget {
  const PredictionCoverageControl({super.key, required this.onShow});
  final VoidCallback onShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverage = ref.watch(predictionCoverageProvider);
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: coverage.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(10),
          child: Text('검색 범위 불러오는 중…'),
        ),
        error: (_, _) => TextButton.icon(
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('범위 다시 불러오기'),
          onPressed: () => ref.invalidate(predictionCoverageProvider),
        ),
        data: (value) => Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            TextButton.icon(
              onPressed: onShow,
              icon: const Icon(Icons.travel_explore, size: 18),
              label: const Text('서울숲 검색 범위'),
            ),
            IconButton(
              tooltip: '검색 범위와 출처',
              icon: const Icon(Icons.info_outline, size: 18),
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                showDragHandle: true,
                builder: (_) => SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          value.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '표시된 보행로에서 최대 ${value.maximumSnappingDistanceMeters.round()}m까지 연결을 시도해요.',
                        ),
                        const Text('범위 안에서도 보행로와 멀거나 연결되지 않은 위치는 검색할 수 없어요.'),
                        const SizedBox(height: 12),
                        SelectableText(value.attribution),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
