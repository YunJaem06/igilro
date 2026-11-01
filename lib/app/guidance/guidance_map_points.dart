import '../../features/map/presentation/state/map_overlays.dart';
import '../../features/navigation/domain/navigation_progress.dart';
import '../../features/route_search/domain/entities/route_guidance.dart';

List<MapGuidancePoint> guidanceMapPoints(
  RouteGuidance? guide, {
  NavigationStepProgress? progress,
  int? selectedIndex,
}) {
  if (guide == null || guide.status != RouteGuidanceStatus.available) {
    return const [];
  }
  final indices = <int>{
    if (progress != null) progress.currentIndex,
    ?progress?.nextIndex,
    ?selectedIndex,
  };
  return [
    for (final index in indices)
      if (index >= 0 && index < guide.steps.length)
        MapGuidancePoint(
          coordinate: guide.steps[index].coordinate,
          role: index == selectedIndex
              ? MapGuidancePointRole.selected
              : index == progress?.nextIndex
              ? MapGuidancePointRole.next
              : MapGuidancePointRole.current,
          label:
              '${[if (index == progress?.currentIndex) '현재', if (index == progress?.nextIndex) '다음', if (index == selectedIndex) '선택'].join('·')} ${index + 1}',
        ),
  ];
}
