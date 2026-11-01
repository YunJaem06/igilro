import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/guidance/guidance_map_points.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/navigation/domain/navigation_progress.dart';
import 'package:igilro/features/navigation/presentation/guidance_selection_notifier.dart';
import 'package:igilro/features/navigation/presentation/guidance_steps_sheet.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';

import '../../helpers/walking_guidance_fixture.dart';

void main() {
  final candidate = walkingGuidanceResult().routes.single;
  final guide = candidate.guidance!;
  final route = NavigationRoute(
    path: candidate.path,
    distanceMeters: candidate.distanceMeters,
    duration: candidate.duration,
    guidance: guide,
  );
  NavigationProgress progress(double geometryPosition) => NavigationProgress(
    remainingMeters: 400,
    distanceToRoute: 0,
    fraction: .5,
    bearing: 0,
    arrived: false,
    geometryPosition: geometryPosition,
  );

  test(
    'current leg, next maneuver and arrival follow original geometry indexes',
    () {
      final step = guide.steps[5];
      final before = measureGuidanceSteps(
        route,
        progress(step.geometryIndex.toDouble()),
      )!;
      expect(before.currentIndex, 4);
      expect(before.nextIndex, 5);
      final after = measureGuidanceSteps(
        route,
        progress(step.geometryIndex + .1),
      )!;
      expect(after.currentIndex, 5);
      expect(after.nextIndex, 6);
      final arrived = measureGuidanceSteps(route, progress(39), arrived: true)!;
      expect(arrived.currentIndex, guide.steps.length - 1);
      expect(arrived.nextIndex, isNull);
    },
  );

  test(
    'weak or paused GPS hides automatic highlights without removing inspection',
    () {
      for (final status in GuidanceStatus.values) {
        final state = GuidanceState(
          status: status,
          route: route,
          progress: progress(guide.steps[5].geometryIndex + .1),
        );
        final points = guidanceMapPoints(
          guide,
          progress: state.stepProgress,
          selectedIndex: 9,
        );
        if (status == GuidanceStatus.following) {
          expect(points.map((p) => p.role), [
            MapGuidancePointRole.current,
            MapGuidancePointRole.next,
            MapGuidancePointRole.selected,
          ]);
        } else if (status == GuidanceStatus.arrived) {
          expect(points, hasLength(2));
        } else {
          expect(points.single.role, MapGuidancePointRole.selected);
        }
      }
      final points = guidanceMapPoints(
        guide,
        progress: const NavigationStepProgress(currentIndex: 4, nextIndex: 5),
        selectedIndex: 5,
      );
      expect(points, hasLength(2));
      expect(points.last.role, MapGuidancePointRole.selected);
      expect(points.last.label, '다음·선택 6');
      expect(points.last.coordinate, guide.steps[5].coordinate);
      expect(guidanceMapPoints(null, selectedIndex: 5), isEmpty);
      expect(
        guidanceMapPoints(
          guide.copyWith(status: RouteGuidanceStatus.unknown),
          selectedIndex: 5,
        ),
        isEmpty,
      );
    },
  );

  test(
    'inspection is route scoped and rejects invalid or unavailable steps',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final first = guidanceSelectionProvider(guide, routeKey: 'first');
      final second = guidanceSelectionProvider(guide, routeKey: 'second');
      container.listen(first, (_, _) {});
      container.listen(second, (_, _) {});
      container.read(first.notifier).selectStep(4);
      container.read(first.notifier).selectStep(-1);
      container.read(first.notifier).selectStep(guide.steps.length);
      expect(container.read(first), 4);
      expect(container.read(second), isNull);
      container.read(first.notifier).clear();
      expect(container.read(first), isNull);
      final unavailable = guidanceSelectionProvider(
        guide.copyWith(status: RouteGuidanceStatus.unavailable),
        routeKey: 'first',
      );
      container.read(unavailable.notifier).selectStep(4);
      expect(container.read(unavailable), isNull);
    },
  );

  testWidgets(
    'a long list remains scrollable with large text and returns the server step',
    (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      RouteGuidanceStep? inspected;
      final unknown = guide.copyWith(
        metadataStatus: GuidanceMetadataStatus.unknown,
        steps: [
          ...guide.steps.take(guide.steps.length - 1),
          guide.steps.last.copyWith(
            type: ManeuverType.unknown,
            instruction: '<b>아주 긴 안내문도 원문 그대로 표시하고 마지막 안내까지 스크롤해요</b>',
          ),
        ],
      );
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Builder(
              builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    showDragHandle: true,
                    builder: (_) => GuidanceStepsSheet(
                      routeKey: 'route',
                      guidance: unknown,
                      onInspect: (step) => inspected = step,
                      onShowWholeRoute: () {},
                    ),
                  ),
                  child: const Text('목록 열기'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('목록 열기'));
      await tester.pumpAndSettle();
      expect(find.text('안내 정보 출처를 확인할 수 없어요.'), findsOneWidget);
      final last = find.byKey(
        ValueKey('guidance-step-${guide.steps.length - 1}'),
      );
      await tester.scrollUntilVisible(
        last,
        250,
        scrollable: find.descendant(
          of: find.byKey(const Key('guidance-steps-list')),
          matching: find.byType(Scrollable),
        ),
      );
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
      await tester.pumpAndSettle();
      // With 2x text this row is taller than the viewport. Tap the visible
      // portion, as a user would, rather than its off-screen geometric center.
      final viewport = find.byKey(const Key('guidance-steps-list'));
      final visible = tester.getRect(last).intersect(tester.getRect(viewport));
      expect(visible.height, greaterThan(0));
      expect(find.byTooltip('길안내 목록 닫기').hitTestable(), findsOneWidget);
      await tester.tapAt(visible.center);
      await tester.pumpAndSettle();
      expect(inspected, unknown.steps.last);
      expect(find.byType(GuidanceStepsSheet), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
}
