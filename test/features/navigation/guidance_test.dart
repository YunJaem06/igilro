import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/navigation/domain/navigation_progress.dart';
import 'package:igilro/features/navigation/presentation/guidance_instruction_card.dart';
import 'package:igilro/features/navigation/presentation/guidance_panel.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';

import '../../helpers/fake_location_repository.dart';

const points = [
  GeoCoordinate(latitude: 37.54, longitude: 127.03),
  GeoCoordinate(latitude: 37.54, longitude: 127.031),
  GeoCoordinate(latitude: 37.541, longitude: 127.031),
  GeoCoordinate(latitude: 37.541, longitude: 127.032),
];

final guide = RouteGuidance(
  status: RouteGuidanceStatus.available,
  metadataStatus: GuidanceMetadataStatus.osmTags,
  modelVersion: 'synthetic-test-guidance',
  language: 'ko',
  steps: [
    for (var i = 0; i < points.length; i++)
      RouteGuidanceStep(
        index: i,
        type: [
          ManeuverType.depart,
          ManeuverType.turnRight,
          ManeuverType.crossing,
          ManeuverType.arrive,
        ][i],
        coordinate: points[i],
        geometryIndex: i,
        distanceFromStartMeters: i * 100,
        distanceToNextStepMeters: i == 3 ? 0 : 100,
        durationToNextStep: Duration(seconds: i == 3 ? 0 : 60),
        instruction: ['출발하세요', '오른쪽으로 도세요', '횡단 지점입니다', '안내 끝점입니다'][i],
        crossing: i == 2 ? const RouteCrossing() : null,
      ),
  ],
);
NavigationRoute line({RouteGuidance? guidance}) => NavigationRoute(
  path: points,
  distanceMeters: 300,
  duration: const Duration(seconds: 180),
  guidance: guidance,
);
NavigationProgress progress(double fraction, double geometryPosition) =>
    NavigationProgress(
      remainingMeters: 300 * (1 - fraction),
      distanceToRoute: 0,
      fraction: fraction,
      bearing: 90,
      arrived: false,
      geometryPosition: geometryPosition,
    );
LocationFix fix(GeoCoordinate point, {double accuracy = 5}) => LocationFix(
  coordinate: point,
  accuracyMeters: accuracy,
  capturedAt: DateTime.now().toUtc(),
);

void main() {
  test(
    'next instruction uses current progress, not the entire next-step distance',
    () {
      final next = nextInstruction(line(guidance: guide), progress(.25, .75))!;
      expect(next.step.type, ManeuverType.turnRight);
      expect(next.distanceMeters, 25);
      expect(next.distanceMeters, isNot(next.step.distanceToNextStepMeters));
      final afterTurn = nextInstruction(
        line(guidance: guide),
        progress(.5, 1.5),
      )!;
      expect(afterTurn.step.type, ManeuverType.crossing);
      expect(afterTurn.distanceMeters, 50);
    },
  );

  test('the instruction at a vertex is retained until the matched position passes it', () {
    final route = line(guidance: guide);
    expect(
      nextInstruction(route, progress(1 / 3, 1))!.step.type,
      ManeuverType.turnRight,
    );
    expect(
      nextInstruction(route, progress(.34, 1.01))!.step.type,
      ManeuverType.crossing,
    );
  });

  test('map matching retains original indexes when geometry has duplicate vertices', () {
    final route = NavigationRoute(
      path: [points[0], points[0], points[1]],
      distanceMeters: 100,
      duration: const Duration(seconds: 60),
    );
    final measured = measureProgress(
      route,
      fix(const GeoCoordinate(latitude: 37.54, longitude: 127.0305)),
    );
    expect(measured.geometryPosition, closeTo(1.5, .001));
  });

  test('missing and future guidance do not become invented directions', () {
    expect(nextInstruction(line(), progress(.2, .5)), isNull);
    for (final status in [
      RouteGuidanceStatus.unavailable,
      RouteGuidanceStatus.unknown,
    ]) {
      expect(
        nextInstruction(
          line(guidance: guide.copyWith(status: status)),
          progress(.2, .5),
        ),
        isNull,
      );
    }
  });

  test(
    'paused, weak, off-route and approach states suppress old instructions',
    () {
      for (final status in GuidanceStatus.values) {
        final state = GuidanceState(
          status: status,
          route: line(guidance: guide),
          progress: progress(.25, .75),
        );
        expect(state.instruction != null, status == GuidanceStatus.following);
      }
    },
  );

  test(
    'a first distant GPS outlier hides a turn before off-route confirmation',
    () {
      final state = GuidanceState(
        status: GuidanceStatus.following,
        route: line(guidance: guide),
        fix: fix(points.first),
        progress: const NavigationProgress(
          remainingMeters: 200,
          distanceToRoute: 100,
          fraction: .33,
          bearing: 0,
          arrived: false,
          geometryPosition: 1,
        ),
      );
      expect(state.instruction, isNull);
    },
  );

  for (final signals in [true, false, null]) {
    testWidgets(
      'crossing card distinguishes installed/absent/unknown signals: $signals',
      (tester) async {
        final instruction = NavigationInstruction(
          step: guide.steps[2].copyWith(
            crossing: RouteCrossing(trafficSignals: signals),
          ),
          distanceMeters: 80,
        );
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GuidanceInstructionCard(
                instruction: instruction,
                metadataStatus: GuidanceMetadataStatus.osmTags,
              ),
            ),
          ),
        );
        expect(find.text('약 80m 후'), findsOneWidget);
        expect(find.text('현재 신호 상태는 제공하지 않아요.'), findsOneWidget);
        expect(
          find.text(switch (signals) {
            true => '지도 정보: 횡단 신호등 있음',
            false => '지도 정보: 횡단 신호등 없음',
            null => '횡단 신호등 설치 여부 미확인',
          }),
          findsOneWidget,
        );
      },
    );
  }

  testWidgets(
    'future maneuver uses a neutral icon and plain text on a small screen',
    (tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: GuidanceInstructionCard(
                instruction: NavigationInstruction(
                  step: guide.steps[1].copyWith(
                    type: ManeuverType.unknown,
                    instruction: '<b>다음 지점을 확인해 주세요</b>',
                  ),
                  distanceMeters: 20,
                ),
                metadataStatus: GuidanceMetadataStatus.topologyOnly,
              ),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
      expect(find.byIcon(Icons.turn_right), findsNothing);
      expect(find.text('<b>다음 지점을 확인해 주세요</b>'), findsOneWidget);
      expect(find.text('보행망 기반 안내 · 횡단 정보가 제한될 수 있어요.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'GPS progress changes the server step and weak GPS removes its card',
    (tester) async {
      final updates = StreamController<Result<LocationFix>>();
      final repository = FakeLocationRepository()
        ..location = Result.success(fix(points.first))
        ..updates = updates.stream;
      final container = ProviderContainer(
        overrides: [locationRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);
      addTearDown(updates.close);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: GuidancePanel(onFollow: () {}, onReroute: () {}),
              ),
            ),
          ),
        ),
      );
      container.read(navigationProvider.notifier).start(line(guidance: guide));
      await tester.pumpAndSettle();
      expect(find.text('오른쪽으로 도세요'), findsOneWidget);
      const afterTurn = GeoCoordinate(latitude: 37.5405, longitude: 127.031);
      updates.add(Result.success(fix(afterTurn)));
      await tester.pumpAndSettle();
      expect(find.text('횡단 지점입니다'), findsOneWidget);
      updates.add(Result.success(fix(afterTurn, accuracy: 100)));
      await tester.pumpAndSettle();
      expect(find.text('GPS 신호를 기다리고 있어요'), findsOneWidget);
      expect(find.byType(GuidanceInstructionCard), findsNothing);
      container.read(navigationProvider.notifier).stop();
      await tester.pump();
    },
  );
}
