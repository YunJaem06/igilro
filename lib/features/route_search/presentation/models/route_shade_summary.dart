import '../../domain/entities/route_candidate.dart';
import 'route_result_formatters.dart';

/// Display policy for evaluated, missing and future shade statuses.
final class RouteShadeSummary {
  const RouteShadeSummary({
    required this.title,
    required this.description,
    this.ratio,
    this.coverage,
  });

  final String title;
  final String description;
  final double? ratio;
  final double? coverage;

  factory RouteShadeSummary.fromRoute(RouteCandidate route) {
    final evaluation = route.shadeEvaluation;
    if (evaluation == null) {
      return const RouteShadeSummary(
        title: '그늘 정보 없음',
        description: '이 경로에는 그늘 평가 정보가 제공되지 않았어요.',
      );
    }
    return switch (evaluation.status) {
      ShadeEvaluationStatus.available
          when evaluation.coverage == 1 &&
              _validRatio(route.metrics.shadeRatio) =>
        RouteShadeSummary(
          title: '그늘 ${formatRoutePercentage(route.metrics.shadeRatio!)}',
          description: '전체 경로에서 건물 그림자가 드리우는 길이의 비율이에요.',
          ratio: route.metrics.shadeRatio,
        ),
      ShadeEvaluationStatus.dataUnavailable => const RouteShadeSummary(
        title: '그늘 정보 준비 중',
        description: '건물 자료가 없거나 평가를 완료하지 못해 그늘 비율을 제공할 수 없어요.',
      ),
      ShadeEvaluationStatus.incompleteCoverage => RouteShadeSummary(
        title: '일부 구간만 평가 가능',
        description: '자료가 부족한 구간이 있어 전체 경로의 그늘 비율을 표시할 수 없어요.',
        coverage: _validRatio(evaluation.coverage) ? evaluation.coverage : null,
      ),
      ShadeEvaluationStatus.night => const RouteShadeSummary(
        title: '야간',
        description: '해가 진 시간에는 건물 그늘 비율을 제공하지 않아요.',
      ),
      ShadeEvaluationStatus.lowSun => const RouteShadeSummary(
        title: '태양 고도가 낮아요',
        description: '해가 낮게 떠 있어 그늘 계산의 오차가 커질 수 있어 비율을 제공하지 않아요.',
      ),
      ShadeEvaluationStatus.unsupportedTime => const RouteShadeSummary(
        title: '평가할 수 없는 시각',
        description: '선택한 출발 시각은 그늘 평가 지원 범위를 벗어났어요.',
      ),
      ShadeEvaluationStatus.available ||
      ShadeEvaluationStatus.unknown => const RouteShadeSummary(
        title: '그늘 정보 확인 불가',
        description: '이 경로의 그늘 평가 정보를 확인할 수 없어요.',
      ),
    };
  }

  static bool _validRatio(double? value) =>
      value != null && value.isFinite && value >= 0 && value <= 1;
}
