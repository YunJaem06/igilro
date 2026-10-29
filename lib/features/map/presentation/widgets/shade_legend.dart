import 'package:flutter/material.dart';

import '../state/map_overlays.dart';

class ShadeLegend extends StatelessWidget {
  const ShadeLegend({super.key});

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Wrap(
          spacing: 12,
          runSpacing: 4,
          children: [
            _item('예측 그늘', MapRouteColors.shade),
            _item('예측 햇빛', MapRouteColors.sunlight),
          ],
        ),
      ),
    ),
  );

  Widget _item(String text, int color) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(width: 14, height: 4, color: Color(color)),
      const SizedBox(width: 5),
      Text(text, style: const TextStyle(fontSize: 12)),
    ],
  );
}
