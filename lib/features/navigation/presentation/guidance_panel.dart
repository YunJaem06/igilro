import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/failure.dart';
import 'navigation_notifier.dart';

class GuidancePanel extends ConsumerWidget {
  const GuidancePanel({
    super.key,
    required this.onFollow,
    required this.onReroute,
  });
  final VoidCallback onFollow;
  final VoidCallback? onReroute;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(navigationProvider);
    final notifier = ref.read(navigationProvider.notifier);
    final text = state.isPreview
        ? state.status == GuidanceStatus.arrived
              ? '경로 미리보기가 끝났어요'
              : state.status == GuidanceStatus.paused
              ? '미리보기를 멈췄어요'
              : '경로 미리보기 · 가상 이동'
        : switch (state.status) {
            GuidanceStatus.locating => '현재 위치를 확인하고 있어요',
            GuidanceStatus.approaching => '선택한 경로 근처로 이동해 주세요',
            GuidanceStatus.offRoute => '경로에서 벗어났어요',
            GuidanceStatus.weakGps => 'GPS 신호를 기다리고 있어요',
            GuidanceStatus.paused => '안내를 잠시 멈췄어요',
            GuidanceStatus.arrived => '목적지에 도착했어요',
            GuidanceStatus.failed => switch (state.failure?.type) {
              FailureType.permissionDenied ||
              FailureType.permissionDeniedForever => '위치 권한을 허용해 주세요',
              FailureType.serviceDisabled => '기기의 위치 서비스를 켜 주세요',
              _ => '위치를 확인하지 못했어요',
            },
            _ => '선택한 경로를 따라 걸어주세요',
          };
    final remaining = state.progress?.remainingMeters;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.navigation_rounded, color: Color(0xFF23785C)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
        if (remaining != null &&
            {
              GuidanceStatus.following,
              GuidanceStatus.arrived,
            }.contains(state.status)) ...[
          const SizedBox(height: 8),
          Text(
            remaining < 1000
                ? '${remaining.round()}m 남았어요'
                : '${(remaining / 1000).toStringAsFixed(1)}km 남았어요',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: state.progress!.fraction),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: notifier.stop,
                child: const Text('안내 종료'),
              ),
            ),
            if (state.status == GuidanceStatus.paused ||
                state.status == GuidanceStatus.failed)
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    notifier.resume();
                    onFollow();
                  },
                  child: const Text('안내 계속'),
                ),
              )
            else if (state.status == GuidanceStatus.offRoute ||
                state.status == GuidanceStatus.approaching)
              Expanded(
                child: FilledButton(
                  onPressed: onReroute,
                  child: const Text('현재 위치로 재검색'),
                ),
              )
            else if (state.status != GuidanceStatus.arrived)
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: onFollow,
                  icon: const Icon(Icons.my_location),
                  label: const Text('따라가기'),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
