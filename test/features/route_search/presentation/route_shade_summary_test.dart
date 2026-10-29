import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/features/route_search/domain/entities/route_candidate.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/presentation/models/route_result_formatters.dart';
import 'package:igilro/features/route_search/presentation/models/route_shade_summary.dart';

import '../../../helpers/fake_route_repository.dart';

void main() {
  final route = sampleRouteResult(
    RouteQuery(
      origin: routeOrigin,
      destination: routeDestination,
      departureAt: routeDeparture,
    ),
  ).routes.single;

  RouteCandidate withShade(
    ShadeEvaluationStatus status, {
    double? ratio,
    double? coverage,
  }) => route.copyWith(
    metrics: RouteMetrics(shadeRatio: ratio),
    shadeEvaluation: RouteShadeEvaluation(
      status: status,
      modelVersion: 'test-shade',
      coverage: coverage,
    ),
  );

  test('only a complete available evaluation displays the shade ratio', () {
    final summary = RouteShadeSummary.fromRoute(
      withShade(ShadeEvaluationStatus.available, ratio: 0.82, coverage: 1),
    );
    expect(summary.title, '그늘 82%');
    expect(summary.ratio, 0.82);
    expect(summary.coverage, isNull);
    final zero = RouteShadeSummary.fromRoute(
      withShade(ShadeEvaluationStatus.available, ratio: 0, coverage: 1),
    );
    expect(zero.title, '그늘 0%');
    expect(zero.ratio, 0);
  });

  for (final (status, title) in [
    (ShadeEvaluationStatus.dataUnavailable, '그늘 정보 준비 중'),
    (ShadeEvaluationStatus.incompleteCoverage, '일부 구간만 평가 가능'),
    (ShadeEvaluationStatus.night, '야간'),
    (ShadeEvaluationStatus.lowSun, '태양 고도가 낮아요'),
    (ShadeEvaluationStatus.unsupportedTime, '평가할 수 없는 시각'),
    (ShadeEvaluationStatus.unknown, '그늘 정보 확인 불가'),
  ]) {
    test('$status never presents a ratio as measured shade', () {
      final summary = RouteShadeSummary.fromRoute(
        withShade(status, ratio: 1, coverage: 0.64),
      );
      expect(summary.title, title);
      expect(summary.ratio, isNull);
      expect(
        summary.coverage,
        status == ShadeEvaluationStatus.incompleteCoverage ? 0.64 : isNull,
      );
    });
  }

  test(
    'missing evaluation and incomplete AVAILABLE metadata stay unmeasured',
    () {
      expect(
        RouteShadeSummary.fromRoute(
          route.copyWith(metrics: const RouteMetrics(shadeRatio: 0.8)),
        ).ratio,
        isNull,
      );
      for (final candidate in [
        withShade(ShadeEvaluationStatus.available, ratio: 0.8, coverage: 0.5),
        withShade(ShadeEvaluationStatus.available, coverage: 1),
        withShade(
          ShadeEvaluationStatus.available,
          ratio: double.nan,
          coverage: 1,
        ),
      ]) {
        expect(RouteShadeSummary.fromRoute(candidate).ratio, isNull);
      }
    },
  );

  test('percentage labels preserve confirmed zero and incomplete coverage', () {
    expect(formatRoutePercentage(0), '0%');
    expect(formatRoutePercentage(0.004), '1% 미만');
    expect(formatRoutePercentage(0.82), '82%');
    expect(formatRoutePercentage(0.9999), '99% 초과');
    expect(formatRoutePercentage(1), '100%');
  });

  test('time and distance labels retain rounding and short-route behavior', () {
    expect(formatRouteDuration(const Duration(seconds: 1)), '1분');
    expect(formatRouteDuration(Duration.zero), '1분 미만');
    expect(formatRouteDuration(const Duration(seconds: 3601)), '1시간 1분');
    expect(formatRouteDistance(0.5), '1m 미만');
    expect(formatRouteDistance(800.8), '801m');
    expect(formatRouteDistance(1700), '1.7km');
    expect(
      formatRouteEvaluationTime(routeDeparture),
      formatRouteEvaluationTime(routeDeparture.toLocal()),
    );
    expect(formatRouteEvaluationTime(routeDeparture), endsWith('· 기기 시간'));
  });
}
