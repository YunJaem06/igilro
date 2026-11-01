import 'package:flutter/material.dart';

import '../../route_search/domain/entities/route_guidance.dart';
import 'guidance_maneuver_icon.dart';

/// Describes a manually inspected point without suggesting the user is there.
class GuidanceMapInspectionCard extends StatelessWidget {
  const GuidanceMapInspectionCard({
    super.key,
    required this.step,
    required this.onOpenList,
    required this.onClear,
  });

  final RouteGuidanceStep step;
  final VoidCallback onOpenList;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      onTap: onOpenList,
      leading: Icon(
        guidanceManeuverIcon(step.type),
        color: const Color(0xFFE28A20),
      ),
      title: Text(
        '${step.index + 1}번 안내 지점',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        step.instruction,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        tooltip: '안내 지점 선택 해제',
        onPressed: onClear,
        icon: const Icon(Icons.close),
      ),
    ),
  );
}
