import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../shared/widgets/source_attributions.dart';
import '../../domain/entities/model_route_prediction.dart';
import '../providers/route_comparison_notifier.dart';
import '../providers/route_prediction_notifier.dart';
import '../providers/route_prediction_providers.dart';
import '../providers/route_search_kind_notifier.dart';
import '../providers/route_search_notifier.dart';
import '../providers/route_selection_notifier.dart';
import 'route_result_card.dart';
import 'route_shade_info.dart';

class RouteExplorerPanel extends ConsumerWidget {
  const RouteExplorerPanel({
    super.key,
    required this.onStart,
    required this.onPreview,
    this.onShowCoverage,
  });
  final VoidCallback onStart;
  final VoidCallback onPreview;
  final VoidCallback? onShowCoverage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kind = ref.watch(routeSearchKindProvider);
    final options = ref.watch(routePredictionOptionsProvider);
    final comparisonState = ref.watch(routeComparisonProvider);
    final predictionState = ref.watch(routePredictionProvider);
    final generalState = ref.watch(routeSearchProvider);
    final pair = comparisonState.asData?.value;
    final model = pair?.forMode(options.mode) ?? predictionState.asData?.value;
    final general = generalState.asData?.value;
    final route = model?.routes.first;
    final isPrediction = kind == RouteSearchKind.prediction;
    final loading = isPrediction
        ? comparisonState.isLoading || predictionState.isLoading
        : generalState.isLoading;
    final error = isPrediction
        ? comparisonState.error ?? predictionState.error
        : generalState.error;
    final hasResult = isPrediction ? model != null : general != null;
    final canSearch = ref.watch(routeSelectionProvider).endpoints.canSearch;
    final samePoint = ref.watch(routeSelectionProvider).endpoints.isSamePoint;
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (hasResult && !loading)
              IconButton(
                tooltip: '경로 다시 검색',
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  if (isPrediction) {
                    ref.read(routeComparisonProvider.notifier).search();
                  } else {
                    ref.read(routeSearchProvider.notifier).search();
                  }
                },
              ),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final value in RouteSearchKind.values)
                    ChoiceChip(
                      showCheckmark: false,
                      label: Text(
                        value == RouteSearchKind.general ? '도보' : '그늘길',
                      ),
                      avatar: Icon(
                        value == RouteSearchKind.general
                            ? Icons.directions_walk
                            : Icons.wb_shade,
                        size: 18,
                      ),
                      selected: kind == value,
                      onSelected: (_) => ref
                          .read(routeSearchKindProvider.notifier)
                          .select(value),
                    ),
                ],
              ),
            ),
            if (isPrediction)
              IconButton(
                icon: const Icon(Icons.schedule),
                tooltip: '출발 시각',
                onPressed: () => _pickTime(context, ref, options.departureAt),
              ),
          ],
        ),
        const SizedBox(height: 10),
        if (loading)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 12),
                Expanded(child: Text('걸어갈 길을 찾고 있어요…')),
              ],
            ),
          ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              routeErrorMessage(error),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        if (error case Failure(code: 'OUTSIDE_SUPPORTED_AREA'))
          TextButton.icon(
            onPressed: onShowCoverage,
            icon: const Icon(Icons.travel_explore),
            label: const Text('서울숲으로 이동'),
          ),
        if (isPrediction && model != null) ...[
          if (pair != null)
            Row(
              children: [
                Expanded(
                  child: _choice(
                    context,
                    ref,
                    pair.fastest,
                    options.mode,
                    comparison: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _choice(
                    context,
                    ref,
                    pair.shade,
                    options.mode,
                    comparison: true,
                  ),
                ),
              ],
            )
          else
            _choice(context, ref, model, route!.mode),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  '예측값 · ${_time(model.evaluatedAt)} 기준',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextButton(
                onPressed: () => _modelDetails(context, ref, model),
                child: const Text('상세 보기'),
              ),
            ],
          ),
        ] else if (!isPrediction && general != null) ...[
          Text(
            '${_duration(general.routes.first.duration)} · ${_distance(general.routes.first.distanceMeters)}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          RouteShadeInfo(
            route: general.routes.first,
            evaluatedAt: general.evaluatedAt,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _details(context, '경로 정보', [
                RouteResultCard(
                  result: general,
                  endpoints: ref.read(routeSelectionProvider).endpoints,
                ),
                ..._placeSources(ref),
              ]),
              child: const Text('상세 보기'),
            ),
          ),
        ] else if (!loading && error == null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              canSearch
                  ? isPrediction
                        ? '빠른 길과 그늘길을 함께 비교해 보세요.'
                        : '선택한 두 지점을 걸어서 연결해요.'
                  : samePoint
                  ? '출발지와 도착지를 서로 다른 위치로 선택해 주세요.'
                  : '출발지와 도착지를 선택해 주세요.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
    final actions = hasResult && !loading
        ? Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onPreview,
                  child: const Text('미리보기'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: onStart,
                  icon: const Icon(Icons.navigation_rounded),
                  label: const Text('안내 시작'),
                ),
              ),
            ],
          )
        : FilledButton.icon(
            onPressed: canSearch && !loading
                ? () {
                    if (isPrediction) {
                      ref.read(routeComparisonProvider.notifier).search();
                    } else {
                      ref.read(routeSearchProvider.notifier).search();
                    }
                  }
                : null,
            icon: const Icon(Icons.search),
            label: Text(
              error != null
                  ? '다시 검색'
                  : isPrediction
                  ? '그늘길 비교'
                  : '경로 검색',
            ),
          );
    return LayoutBuilder(
      builder: (context, constraints) {
        final children = <Widget>[content, const SizedBox(height: 8), actions];
        if (constraints.maxHeight <
            MediaQuery.textScalerOf(context).scale(100)) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(child: content),
            ),
            const SizedBox(height: 8),
            actions,
          ],
        );
      },
    );
  }

  Widget _choice(
    BuildContext context,
    WidgetRef ref,
    ModelRoutePrediction model,
    RoutePredictionMode selected, {
    bool comparison = false,
  }) {
    final route = model.routes.first;
    final active = route.mode == selected;
    final color = Theme.of(context).colorScheme;
    return Material(
      color: active ? color.primaryContainer : color.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: active ? color.primary : color.outlineVariant),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => ref
            .read(routePredictionOptionsProvider.notifier)
            .selectMode(
              route.mode,
              evaluatedAt: comparison ? null : model.evaluatedAt,
            ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                route.mode == RoutePredictionMode.shade ? '그늘 많은 길' : '빠른 길',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${_duration(route.duration)} · ${_distance(route.distanceMeters)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Text(
                '예측 그늘 ${(route.prediction.modeledShadeRatio * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                  color: color.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _placeSources(WidgetRef ref) => [
    for (final point in [
      ref.read(routeSelectionProvider).endpoints.origin,
      ref.read(routeSelectionProvider).endpoints.destination,
    ])
      for (final source in point?.attributions ?? <String>[])
        SourceAttributions(sources: [source]),
  ];

  void _modelDetails(
    BuildContext context,
    WidgetRef ref,
    ModelRoutePrediction model,
  ) {
    final route = model.routes.first;
    _details(context, '경로와 예측 안내', [
      const Text('모델 기반 예측', style: TextStyle(fontWeight: FontWeight.bold)),
      const Text('건물·지형 모델 기반이며 나무·구름 등의 영향은 반영하지 않았어요.'),
      Text(
        '예상 ${route.duration.inSeconds}초 · ${route.distanceMeters.toStringAsFixed(1)}m',
      ),
      Text('빠른 길 대비 +${route.additionalDuration.inSeconds}초'),
      Text(
        route.prediction.physicalShadeCoverage == null
            ? '실제 그늘 검증: 미검증'
            : '물리 그늘 커버리지 ${(route.prediction.physicalShadeCoverage! * 100).toStringAsFixed(1)}%',
      ),
      Text('평가 시각 ${_time(model.evaluatedAt)}'),
      const Text(
        '3D 지도의 건물 그림자는 Mapbox 자료에 기반한 시각 표현입니다. 경로 예측에 사용한 공공 3D 자료와 다를 수 있어요.',
      ),
      Text(
        route.shadeSegments.isEmpty
            ? '이 응답에는 구간별 예측이 제공되지 않았어요.'
            : '초록은 예측 그늘, 주황은 예측 햇빛 구간이에요. 색상 경계는 모델 샘플의 근사예요.',
      ),
      const Text('공원의 나무 그늘은 반영하지 않았어요. 예측 0%도 실제 그늘이 없다는 뜻은 아니에요.'),
      Text(
        '출발지 접근 ${_distance(model.snapping.origin.distanceMeters)} · 도착지 접근 ${_distance(model.snapping.destination.distanceMeters)}',
      ),
      const Text('접근 거리는 경로 거리·시간에 포함되지 않아요.'),
      SelectableText(model.attribution),
      ..._placeSources(ref),
      if (kDebugMode)
        ExpansionTile(
          title: const Text('개발 진단'),
          children: [
            SelectableText(
              'graph: ${model.dataVersion}\nscene: ${model.predictionDataVersion}\nmodel: ${model.modelVersion}\nrouting: ${model.routingModelVersion}\nquality: ${model.quality}',
            ),
          ],
        ),
    ]);
  }

  void _details(BuildContext context, String title, List<Widget> children) =>
      showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (_) => SafeArea(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.65,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                for (final child in children)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: child,
                  ),
              ],
            ),
          ),
        ),
      );

  Future<void> _pickTime(
    BuildContext context,
    WidgetRef ref,
    DateTime? value,
  ) async {
    final now = value?.toLocal() ?? DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );
    if (time != null && context.mounted) {
      ref
          .read(routePredictionOptionsProvider.notifier)
          .setDepartureAt(
            DateTime(date.year, date.month, date.day, time.hour, time.minute),
          );
    }
  }
}

String _duration(Duration value) =>
    '${(value.inSeconds / 60).ceil().clamp(1, 100000)}분';
String _distance(double value) => value >= 1000
    ? '${(value / 1000).toStringAsFixed(1)}km'
    : '${value.round()}m';
String _time(DateTime instant) {
  final t = instant.toLocal();
  return '${t.month}/${t.day} ${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}

String routeErrorMessage(Object error) => switch (error) {
  Failure(code: 'OUTSIDE_SUPPORTED_AREA') => '현재 지원하는 서울숲 지역 안에서 위치를 선택해 주세요.',
  Failure(code: 'ROUTE_NOT_FOUND') =>
    '두 지점을 연결할 보행로를 찾지 못했어요. 표시된 보행로에 가까운 위치나 출입 지점을 다시 선택해 주세요.',
  Failure(code: 'INVALID_REQUEST' || 'INVALID_ROUTE_QUERY') =>
    '출발·도착 위치와 출발 시각을 확인해 주세요.',
  Failure(code: 'SHADE_TIME_UNSUPPORTED') =>
    '이 시각에는 그늘 예측을 제공할 수 없어요. 출발 시각을 바꿔 주세요.',
  Failure(code: 'ROUTE_SEARCH_LIMIT_EXCEEDED') =>
    '경로 검색 한도에 도달했어요. 잠시 후 다시 검색하거나 가까운 위치를 선택해 주세요.',
  Failure(code: 'PREDICTION_DATA_UNAVAILABLE' || 'ROUTING_DATA_UNAVAILABLE') =>
    '경로 자료를 준비하고 있어요. 잠시 후 다시 시도해 주세요.',
  Failure(type: FailureType.network) => '서버에 연결하지 못했어요. 연결 상태를 확인해 주세요.',
  Failure(type: FailureType.timeout) => '검색이 늦어지고 있어요. 다시 시도해 주세요.',
  Failure(code: 'COMPARISON_CHANGED') => '비교 중 자료가 바뀌었어요. 다시 검색해 주세요.',
  _ => '경로를 찾지 못했어요. 위치와 요청 조건을 확인해 주세요.',
};
