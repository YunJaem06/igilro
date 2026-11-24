import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/route_search/presentation/providers/prediction_coverage_notifier.dart';

class PredictionCoverageControl extends ConsumerWidget {
  const PredictionCoverageControl({super.key, required this.onShow});
  final VoidCallback onShow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      elevation: 1,
      child: IconButton(
        tooltip: '검색 범위와 출처',
        icon: const Icon(Icons.travel_explore, size: 22),
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (sheetContext) => Consumer(
            builder: (_, ref, _) => SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: ref
                    .watch(predictionCoverageProvider)
                    .when(
                      loading: () => const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (_, _) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('검색 범위를 불러오지 못했어요.'),
                          TextButton.icon(
                            icon: const Icon(Icons.refresh),
                            label: const Text('범위 다시 불러오기'),
                            onPressed: () =>
                                ref.invalidate(predictionCoverageProvider),
                          ),
                        ],
                      ),
                      data: (value) => Column(
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
                          const SizedBox(height: 12),
                          FilledButton.icon(
                            onPressed: () {
                              Navigator.pop(sheetContext);
                              onShow();
                            },
                            icon: const Icon(Icons.travel_explore),
                            label: const Text('서울숲 검색 범위'),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
