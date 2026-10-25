import 'package:flutter/material.dart';

/// Resizes the map itself so SDK attribution and camera bounds stay visible.
class MapSearchSheet extends StatefulWidget {
  const MapSearchSheet({
    super.key,
    required this.map,
    required this.child,
    required this.scrollController,
  });

  final Widget map;
  final Widget child;
  final ScrollController scrollController;

  @override
  State<MapSearchSheet> createState() => _MapSearchSheetState();
}

class _MapSearchSheetState extends State<MapSearchSheet> {
  static const _minimum = 0.25;
  static const _initial = 0.55;
  static const _maximum = 0.8;
  double _fraction = _initial;

  void _resize(double fraction) =>
      setState(() => _fraction = fraction.clamp(_minimum, _maximum));

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final height = constraints.maxHeight;
      final handleHeight = (height * 0.4).clamp(0.0, 40.0);
      final minimum = height > 0
          ? ((handleHeight + 24) / height).clamp(_minimum, _maximum)
          : _minimum;
      final fraction = _fraction.clamp(minimum, _maximum);
      final expanded = fraction > _initial;
      return Column(
        children: [
          Expanded(child: widget.map),
          SizedBox(
            key: const Key('map-search-sheet'),
            height: height * fraction,
            child: Material(
              color: Theme.of(context).colorScheme.surface,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              child: Column(
                children: [
                  Semantics(
                    label: '검색 및 경로 결과 영역 크기',
                    value: '${(fraction * 100).round()}%',
                    increasedValue:
                        '${((fraction + 0.1).clamp(minimum, _maximum) * 100).round()}%',
                    decreasedValue:
                        '${((fraction - 0.1).clamp(minimum, _maximum) * 100).round()}%',
                    onIncrease: () => _resize(fraction + 0.1),
                    onDecrease: () => _resize(fraction - 0.1),
                    child: Tooltip(
                      message: expanded ? '검색 패널 줄이기' : '검색 패널 펼치기',
                      child: GestureDetector(
                        key: const Key('map-search-sheet-handle'),
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragUpdate: (details) {
                          if (constraints.maxHeight <= 0) return;
                          _resize(
                            fraction - details.delta.dy / constraints.maxHeight,
                          );
                        },
                        onTap: () => _resize(expanded ? _initial : _maximum),
                        child: SizedBox(
                          height: handleHeight,
                          width: double.infinity,
                          child: Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.outline,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: widget.scrollController,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: widget.child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
