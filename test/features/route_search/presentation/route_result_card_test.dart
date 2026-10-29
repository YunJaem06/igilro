import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/theme/app_theme.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/route_search/domain/entities/route_candidate.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/entities/route_point.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/presentation/widgets/route_result_card.dart';

import '../../../helpers/fake_route_repository.dart';

void main() {
  late RouteSearchResult result;
  const endpoints = RouteEndpoints(
    origin: RoutePoint(
      coordinate: routeOrigin,
      source: RoutePointSource.place,
      name: '서울숲',
    ),
    destination: RoutePoint(
      coordinate: routeDestination,
      source: RoutePointSource.place,
      name: '뚝섬역',
    ),
  );
  setUp(() {
    result = sampleRouteResult(
      RouteQuery(
        origin: routeOrigin,
        destination: routeDestination,
        departureAt: routeDeparture,
      ),
    );
  });

  void shade(ShadeEvaluationStatus status, {double? ratio, double? coverage}) {
    result = result.copyWith(
      routes: [
        result.routes.single.copyWith(
          metrics: RouteMetrics(shadeRatio: ratio),
          shadeEvaluation: RouteShadeEvaluation(
            status: status,
            modelVersion: 'test-shade',
            coverage: coverage,
            attribution: '건물 자료 테스트 출처',
          ),
        ),
      ],
    );
  }

  Future<void> mount(
    WidgetTester tester, {
    RouteEndpoints selected = endpoints,
    bool dark = false,
  }) => tester.pumpWidget(
    MaterialApp(
      theme: dark ? AppTheme.dark : AppTheme.light,
      home: Scaffold(
        body: SingleChildScrollView(
          child: RouteResultCard(result: result, endpoints: selected),
        ),
      ),
    ),
  );

  testWidgets(
    'names, duration, ratio and both credits are visible; details start collapsed',
    (tester) async {
      shade(ShadeEvaluationStatus.available, ratio: 0.82, coverage: 1);
      await mount(tester);
      expect(find.text('22분 · 1.7km'), findsOneWidget);
      expect(find.text('서울숲'), findsOneWidget);
      expect(find.text('뚝섬역'), findsOneWidget);
      expect(find.text('그늘 82%'), findsOneWidget);
      expect(
        tester
            .widget<LinearProgressIndicator>(
              find.byType(LinearProgressIndicator),
            )
            .value,
        0.82,
      );
      expect(find.textContaining('평가 기준 '), findsOneWidget);
      expect(find.text('© OpenStreetMap contributors'), findsOneWidget);
      expect(find.text('건물 자료 테스트 출처'), findsOneWidget);
      expect(find.textContaining('보행로 출발점:'), findsNothing);
      await tester.ensureVisible(find.text('상세 정보'));
      await tester.tap(find.text('상세 정보'));
      await tester.pumpAndSettle();
      expect(find.textContaining('보행로 출발점:'), findsOneWidget);
      expect(find.textContaining('보행로 도착점:'), findsOneWidget);
      expect(find.textContaining('접근 거리는 경로 거리·시간에 포함되지'), findsOneWidget);
      expect(find.textContaining('나무·구름과 이동 중 시간 변화'), findsOneWidget);
    },
  );

  testWidgets(
    'night and missing data never display 0% or a shade progress bar',
    (tester) async {
      for (final status in [
        ShadeEvaluationStatus.night,
        ShadeEvaluationStatus.dataUnavailable,
      ]) {
        shade(status);
        await mount(tester);
        expect(find.text('22분 · 1.7km'), findsOneWidget);
        expect(find.text('그늘 0%'), findsNothing);
        expect(find.byType(LinearProgressIndicator), findsNothing);
      }
    },
  );

  testWidgets('partial coverage is clearly labeled as evaluation coverage', (
    tester,
  ) async {
    shade(ShadeEvaluationStatus.incompleteCoverage, coverage: 0.64);
    await mount(tester);
    expect(find.text('일부 구간만 평가 가능'), findsOneWidget);
    expect(find.text('평가 가능한 구간 64%'), findsOneWidget);
    expect(find.text('그늘 64%'), findsNothing);
  });

  testWidgets(
    'current location and map points have readable fallbacks; stale names are ignored',
    (tester) async {
      await mount(
        tester,
        selected: const RouteEndpoints(
          origin: RoutePoint(
            coordinate: routeOrigin,
            source: RoutePointSource.currentLocation,
          ),
          destination: RoutePoint(
            coordinate: GeoCoordinate(latitude: 37, longitude: 127),
            source: RoutePointSource.place,
            name: '다른 검색의 도착지',
          ),
        ),
      );
      expect(find.text('현재 위치'), findsOneWidget);
      expect(find.text('지도에서 선택한 위치'), findsOneWidget);
      expect(find.text('다른 검색의 도착지'), findsNothing);
      expect(find.text('그늘 정보 없음'), findsOneWidget);
    },
  );

  testWidgets('expanded details reset on a new query', (tester) async {
    await mount(tester);
    await tester.ensureVisible(find.text('상세 정보'));
    await tester.tap(find.text('상세 정보'));
    await tester.pumpAndSettle();
    expect(find.textContaining('보행로 출발점:'), findsOneWidget);
    result = result.copyWith(
      query: result.query.copyWith(
        departureAt: routeDeparture.add(const Duration(hours: 1)),
      ),
    );
    await mount(tester);
    await tester.pumpAndSettle();
    expect(find.textContaining('보행로 출발점:'), findsNothing);
  });

  testWidgets(
    'long names and expanded details fit a narrow screen with large text in dark mode',
    (tester) async {
      tester.view.physicalSize = const Size(320, 520);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      shade(ShadeEvaluationStatus.available, ratio: 0, coverage: 1);
      await mount(
        tester,
        dark: true,
        selected: endpoints.copyWith(
          origin: endpoints.origin!.copyWith(name: '서울숲 아주 긴 이름을 가진 출발 장소'),
        ),
      );
      await tester.ensureVisible(find.text('상세 정보'));
      await tester.tap(find.text('상세 정보'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('건물 자료 테스트 출처'));
      expect(find.text('그늘 0%'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
