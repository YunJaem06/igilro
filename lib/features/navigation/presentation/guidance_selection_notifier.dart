import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../route_search/domain/entities/route_guidance.dart';

part 'guidance_selection_notifier.g.dart';

/// Map inspection is independent of GPS progress and scoped to one route result.
@riverpod
class GuidanceSelectionNotifier extends _$GuidanceSelectionNotifier {
  @override
  int? build(RouteGuidance guidance, {required Object routeKey}) => null;

  void selectStep(int index) {
    if (guidance.status != RouteGuidanceStatus.available ||
        index < 0 ||
        index >= guidance.steps.length) {
      return;
    }
    state = index;
  }

  void clear() => state = null;
}
