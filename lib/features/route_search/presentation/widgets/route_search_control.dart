import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../providers/route_search_notifier.dart';
import '../providers/route_selection_notifier.dart';
import '../providers/route_search_kind_notifier.dart';

class RouteSearchControl extends ConsumerWidget {
  const RouteSearchControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(routeSearchProvider);
    final selection = ref.watch(routeSelectionProvider);
    final kind = ref.watch(routeSearchKindProvider);
    if (selection.selecting != null || kind != RouteSearchKind.general) {
      return const SizedBox.shrink();
    }
    final canSearch =
        selection.endpoints.canSearch &&
        selection.selecting == null &&
        !state.isLoading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        state.when(
          skipLoadingOnRefresh: false,
          data: (result) {
            if (result == null) return const SizedBox.shrink();
            final route = result.routes.first;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('도보 경로', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    '${_durationText(route.duration)} · '
                    '${_distanceText(route.distanceMeters)}',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '보행로 출발점: '
                    '${result.snapping.origin.coordinate.latitude.toStringAsFixed(5)}, '
                    '${result.snapping.origin.coordinate.longitude.toStringAsFixed(5)}'
                    ' · 접근 ${_distanceText(result.snapping.origin.distanceMeters)}',
                  ),
                  Text(
                    '보행로 도착점: '
                    '${result.snapping.destination.coordinate.latitude.toStringAsFixed(5)}, '
                    '${result.snapping.destination.coordinate.longitude.toStringAsFixed(5)}'
                    ' · 접근 ${_distanceText(result.snapping.destination.distanceMeters)}',
                  ),
                  const SizedBox(height: 4),
                  const Text('보행로까지의 접근 거리는 경로 거리·시간에 포함되지 않아요.'),
                  const SizedBox(height: 4),
                  Text(
                    result.attribution,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (route.shadeEvaluation?.attribution
                      case final String source)
                    Text(source, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text('도보 경로를 찾고 있어요.'),
          ),
          error: (error, _) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(_messageFor(error)),
          ),
        ),
        FilledButton.icon(
          onPressed: canSearch
              ? () => ref.read(routeSearchProvider.notifier).search()
              : null,
          icon: state.isLoading
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.directions_walk_rounded),
          label: Text(
            state.isLoading
                ? '검색 중'
                : state.hasError
                ? '다시 검색'
                : '경로 검색',
          ),
        ),
      ],
    );
  }
}

String _durationText(Duration duration) {
  final minutes = (duration.inSeconds / 60).ceil();
  if (minutes == 0) return '1분 미만';
  if (minutes < 60) return '$minutes분';
  final remaining = minutes % 60;
  return remaining == 0
      ? '${minutes ~/ 60}시간'
      : '${minutes ~/ 60}시간 $remaining분';
}

String _distanceText(double meters) {
  if (meters > 0 && meters < 1) return '1m 미만';
  return meters < 1000
      ? '${meters.round()}m'
      : '${(meters / 1000).toStringAsFixed(1)}km';
}

String _messageFor(Object error) => switch (error) {
  Failure(code: 'ROUTE_NOT_FOUND') => '선택한 두 지점을 잇는 도보 경로가 없어요.',
  Failure(code: 'OUTSIDE_SUPPORTED_AREA') => '현재 지원하는 지역에서 출발지와 도착지를 선택해 주세요.',
  Failure(code: 'ROUTING_DATA_UNAVAILABLE') =>
    '경로 데이터가 아직 준비되지 않았어요. 잠시 후 다시 시도해 주세요.',
  Failure(code: 'ROUTE_ENDPOINTS_REQUIRED') => '출발지와 도착지를 모두 선택해 주세요.',
  Failure(code: 'ROUTE_ENDPOINTS_IDENTICAL') => '출발지와 도착지를 서로 다른 위치로 선택해 주세요.',
  Failure(type: FailureType.validation) => '출발지와 도착지를 확인해 주세요.',
  Failure(type: FailureType.network) => '서버에 연결하지 못했어요. 네트워크 연결을 확인해 주세요.',
  Failure(type: FailureType.timeout) => '경로 검색이 늦어지고 있어요. 다시 시도해 주세요.',
  Failure(type: FailureType.rateLimited) => '요청이 많아요. 잠시 후 다시 시도해 주세요.',
  Failure(type: FailureType.invalidData) => '경로 정보를 확인하지 못했어요. 다시 시도해 주세요.',
  Failure(type: FailureType.notFound) => '경로 검색 서비스에 연결하지 못했어요.',
  _ => '경로를 검색하지 못했어요. 잠시 후 다시 시도해 주세요.',
};
