import 'package:flutter/material.dart';

import '../../route_search/domain/entities/route_guidance.dart';
import '../domain/navigation_progress.dart';

class GuidanceInstructionCard extends StatelessWidget {
  const GuidanceInstructionCard({
    super.key,
    required this.instruction,
    required this.metadataStatus,
  });

  final NavigationInstruction instruction;
  final GuidanceMetadataStatus metadataStatus;

  @override
  Widget build(BuildContext context) {
    final step = instruction.step;
    final crossing = step.crossing;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(_icon(step.type), size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instruction.distanceMeters < 1
                      ? '안내 지점 근처'
                      : '약 ${instruction.distanceMeters.ceil()}m 후',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  step.instruction,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (step.streetName != null) Text(step.streetName!),
                if (crossing != null) ...[
                  const SizedBox(height: 8),
                  Text(switch (crossing.trafficSignals) {
                    true => '지도 정보: 횡단 신호등 있음',
                    false => '지도 정보: 횡단 신호등 없음',
                    null => '횡단 신호등 설치 여부 미확인',
                  }),
                  const Text('현재 신호 상태는 제공하지 않아요.'),
                ],
                if (metadataStatus != GuidanceMetadataStatus.osmTags) ...[
                  const SizedBox(height: 8),
                  Text(
                    metadataStatus == GuidanceMetadataStatus.topologyOnly
                        ? '보행망 기반 안내 · 횡단 정보가 제한될 수 있어요.'
                        : '안내 정보 출처를 확인할 수 없어요.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _icon(ManeuverType type) => switch (type) {
    ManeuverType.depart => Icons.directions_walk,
    ManeuverType.continueStraight => Icons.straight,
    ManeuverType.keepLeft => Icons.turn_slight_left,
    ManeuverType.keepRight => Icons.turn_slight_right,
    ManeuverType.turnLeft => Icons.turn_left,
    ManeuverType.turnRight => Icons.turn_right,
    ManeuverType.uTurn => Icons.u_turn_left,
    ManeuverType.crossing => Icons.directions_walk,
    ManeuverType.stairs => Icons.stairs,
    ManeuverType.arrive => Icons.flag,
    ManeuverType.unknown => Icons.info_outline,
  };
}
