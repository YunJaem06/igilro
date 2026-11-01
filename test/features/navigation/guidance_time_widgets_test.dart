import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/features/navigation/domain/navigation_progress.dart';
import 'package:igilro/features/navigation/domain/navigation_timing.dart';
import 'package:igilro/features/navigation/presentation/arrival_summary_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_panel.dart';
import 'package:igilro/features/navigation/presentation/guidance_time_card.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/navigation/presentation/navigation_time_formatters.dart';

import '../../helpers/walking_guidance_fixture.dart';

class _FixedNavigation extends NavigationNotifier {
  _FixedNavigation(this.initial);
  final GuidanceState initial;
  @override
  GuidanceState build() => initial;
  void replace(GuidanceState next) => state = next;
}

void main() {
  final candidate = walkingGuidanceResult().routes.single;
  final route = NavigationRoute(
    path: candidate.path,
    distanceMeters: candidate.distanceMeters,
    duration: const Duration(minutes: 10),
  );
  const progress = NavigationProgress(
    remainingMeters: 400,
    distanceToRoute: 0,
    fraction: .5,
    bearing: 90,
    arrived: false,
    geometryPosition: 20,
  );
  final now = DateTime(2026, 11, 1, 23, 59, 30).toUtc();
  Future<ProviderContainer> mount(
    WidgetTester tester,
    GuidanceState state,
  ) async {
    final container = ProviderContainer(
      overrides: [
        navigationProvider.overrideWith(() => _FixedNavigation(state)),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          locale: const Locale('ko'),
          supportedLocales: const [Locale('ko')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: GuidancePanel(
                onFollow: () {},
                onReroute: () {},
                onShowGuidance: () {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return container;
  }

  test(
    'remaining and elapsed formats distinguish subminute and hour values',
    () {
      expect(formatRemainingTime(Duration.zero), '1분 미만');
      expect(formatRemainingTime(const Duration(seconds: 59)), '1분 미만');
      expect(formatRemainingTime(const Duration(seconds: 61)), '2분');
      expect(formatRemainingTime(const Duration(minutes: 60)), '1시간');
      expect(formatRemainingTime(const Duration(minutes: 62)), '1시간 2분');
      expect(formatGuidanceElapsed(const Duration(seconds: 45)), '45초');
      expect(formatGuidanceElapsed(const Duration(seconds: 75)), '1분 15초');
      expect(
        formatGuidanceElapsed(const Duration(hours: 1, minutes: 2)),
        '1시간 2분',
      );
    },
  );

  testWidgets(
    'following shows remaining minutes and a next-day ETA, weak GPS and pause remove it',
    (tester) async {
      final container = await mount(
        tester,
        GuidanceState(
          status: GuidanceStatus.following,
          route: route,
          progress: progress,
          updatedAt: now,
        ),
      );
      expect(find.text('예상 5분 남았어요'), findsOneWidget);
      expect(find.textContaining('도착 예정 내일'), findsOneWidget);
      for (final status in [
        GuidanceStatus.weakGps,
        GuidanceStatus.paused,
        GuidanceStatus.offRoute,
        GuidanceStatus.approaching,
        GuidanceStatus.failed,
      ]) {
        (container.read(navigationProvider.notifier) as _FixedNavigation)
            .replace(
              GuidanceState(
                status: status,
                route: route,
                progress: progress,
                updatedAt: now,
              ),
            );
        await tester.pumpAndSettle();
        expect(find.byType(GuidanceTimeCard), findsNothing);
        expect(find.textContaining('도착 예정'), findsNothing);
      }
    },
  );

  testWidgets(
    'an ETA crossing the year labels tomorrow and longer trips include the date',
    (tester) async {
      final from = DateTime(2026, 12, 31, 23, 59).toUtc();
      final labels = <String>[];
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              labels.add(
                formatNavigationTime(
                  context,
                  from.add(const Duration(minutes: 2)),
                  reference: from,
                ),
              );
              labels.add(
                formatNavigationTime(
                  context,
                  from.add(const Duration(days: 2)),
                  reference: from,
                ),
              );
              return const SizedBox();
            },
          ),
        ),
      );
      expect(labels.first, startsWith('내일 '));
      expect(labels.last, startsWith('2027년 1월 2일 '));
    },
  );

  testWidgets(
    'arrival replaces the ongoing card, freezes the actual session summary, and completes',
    (tester) async {
      final session = NavigationSession.start(
        now.subtract(const Duration(minutes: 1, seconds: 15)),
      ).complete(now);
      final container = await mount(
        tester,
        GuidanceState(
          status: GuidanceStatus.arrived,
          route: route,
          progress: progress,
          updatedAt: now,
          session: session,
        ),
      );
      expect(find.byType(ArrivalSummaryCard), findsOneWidget);
      expect(find.byType(GuidanceTimeCard), findsNothing);
      expect(find.text('목적지에 도착했어요'), findsOneWidget);
      expect(find.text('경로 거리'), findsOneWidget);
      expect(find.text('안내 진행 시간'), findsOneWidget);
      expect(find.text('1분 15초'), findsOneWidget);
      expect(find.textContaining('2026년 11월 1일'), findsOneWidget);
      expect(find.textContaining('내일'), findsNothing);
      expect(find.textContaining('남았어요'), findsNothing);
      await tester.pump(const Duration(minutes: 10));
      expect(find.text('1분 15초'), findsOneWidget);
      await tester.ensureVisible(find.byKey(const Key('arrival-finish')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('arrival-finish')));
      await tester.pumpAndSettle();
      expect(container.read(navigationProvider).active, false);
      expect(container.read(navigationProvider).session, isNull);
      expect(find.byType(ArrivalSummaryCard), findsNothing);
    },
  );

  testWidgets(
    'preview completion stays virtual and fits a short narrow screen with large text',
    (tester) async {
      tester.view.physicalSize = const Size(320, 480);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      final container = await mount(
        tester,
        GuidanceState(
          status: GuidanceStatus.following,
          route: route,
          progress: progress,
          updatedAt: now,
          session: NavigationSession.start(now),
          isPreview: true,
        ),
      );
      expect(find.byType(GuidanceTimeCard), findsOneWidget);
      expect(find.text('실제 보행 기준 예상이며 미리보기 속도와 달라요.'), findsOneWidget);
      expect(tester.takeException(), isNull);
      (container.read(navigationProvider.notifier) as _FixedNavigation).replace(
        GuidanceState(
          status: GuidanceStatus.arrived,
          route: route,
          progress: progress,
          updatedAt: now,
          session: NavigationSession.start(now).complete(now),
          isPreview: true,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('경로 미리보기가 끝났어요'), findsOneWidget);
      expect(find.text('안내 진행 시간'), findsNothing);
      expect(find.text('도착 시각'), findsNothing);
      expect(find.text('경로 예상 시간'), findsOneWidget);
      expect(find.text('가상 이동 결과입니다. 실제 이동 시간과 거리를 기록하지 않아요.'), findsOneWidget);
      await tester.ensureVisible(find.byKey(const Key('arrival-finish')));
      await tester.pumpAndSettle();
      expect(
        find.byKey(const Key('arrival-finish')).hitTestable(),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    },
  );
}
