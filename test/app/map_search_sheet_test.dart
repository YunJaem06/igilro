import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/widgets/map_search_sheet.dart';

void main() {
  testWidgets(
    'a short viewport keeps the handle and scroll area inside the panel',
    (tester) async {
      tester.view.physicalSize = const Size(320, 160);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MapSearchSheet(
              scrollController: controller,
              map: const ColoredBox(key: Key('short-map'), color: Colors.green),
              child: const SizedBox(height: 800, child: Text('경로 결과')),
            ),
          ),
        ),
      );
      await tester.drag(
        find.byKey(const Key('map-search-sheet-handle')),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle();
      expect(
        tester.getSize(find.byKey(const Key('short-map'))).height,
        greaterThan(0),
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'tap and drag resize the panel while preserving visible map space and scrolling',
    (tester) async {
      final controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MapSearchSheet(
              scrollController: controller,
              map: const ColoredBox(key: Key('map-space'), color: Colors.green),
              child: Column(
                children: List.generate(
                  30,
                  (index) => SizedBox(height: 48, child: Text('항목 $index')),
                ),
              ),
            ),
          ),
        ),
      );
      final map = find.byKey(const Key('map-space'));
      final initialHeight = tester.getSize(map).height;
      await tester.tap(find.byTooltip('검색 패널 펼치기'));
      await tester.pumpAndSettle();
      expect(tester.getSize(map).height, lessThan(initialHeight));
      expect(tester.getSize(map).height, greaterThan(0));
      await tester.drag(
        find.byKey(const Key('map-search-sheet-handle')),
        const Offset(0, 500),
      );
      await tester.pumpAndSettle();
      expect(tester.getSize(map).height, greaterThan(initialHeight));
      controller.jumpTo(controller.position.maxScrollExtent);
      await tester.pumpAndSettle();
      expect(find.text('항목 29').hitTestable(), findsOneWidget);
      await tester.drag(
        find.byKey(const Key('map-search-sheet-handle')),
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();
      expect(tester.getSize(map).height, greaterThan(0));
      expect(tester.takeException(), isNull);
    },
  );
}
