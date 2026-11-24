import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'guidance_instruction_card.dart';
import 'guidance_time_card.dart';
import 'navigation_notifier.dart';

class GuidanceDetailsSheet extends ConsumerWidget {
  const GuidanceDetailsSheet({super.key, this.onShowGuidance});

  final VoidCallback? onShowGuidance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationProvider);
    final instruction = state.instruction;
    final estimate = state.timeEstimate;
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.65,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          children: [
            Text('안내 상세', style: Theme.of(context).textTheme.titleLarge),
            if (state.isPreview) const Text('경로 미리보기 · 가상 이동'),
            if (estimate != null)
              GuidanceTimeCard(estimate: estimate, isPreview: state.isPreview),
            if (instruction != null)
              GuidanceInstructionCard(
                instruction: instruction,
                metadataStatus: state.route!.guidance!.metadataStatus,
              ),
            if (state.hasReliableProgress) ...[
              const SizedBox(height: 16),
              LinearProgressIndicator(value: state.progress!.fraction),
            ],
            const SizedBox(height: 16),
            const Text(
              '위치 안내는 앱을 사용하는 동안 동작해요. GPS 상태에 따라 위치와 예상 시간이 달라질 수 있어요.',
            ),
            if (onShowGuidance != null)
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  onShowGuidance!();
                },
                icon: const Icon(Icons.format_list_numbered),
                label: const Text('전체 길안내'),
              ),
          ],
        ),
      ),
    );
  }
}
