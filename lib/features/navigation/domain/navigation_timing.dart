import '../../route_search/domain/entities/route_guidance.dart';
import 'navigation_progress.dart';

/// Server walking-time estimate at the last reliable position, not a countdown.
final class NavigationTimeEstimate {
  const NavigationTimeEstimate({
    required this.remaining,
    required this.updatedAt,
    required this.arrivalAt,
  });

  final Duration remaining;
  final DateTime updatedAt;
  final DateTime arrivalAt;
}

Duration? estimateRemainingDuration(
  NavigationRoute route,
  NavigationProgress progress,
) {
  if (route.duration <= Duration.zero ||
      !progress.fraction.isFinite ||
      !progress.geometryPosition.isFinite) {
    return null;
  }
  final fraction = progress.fraction.clamp(0.0, 1.0);
  final guidance = route.guidance;
  var remainingRatio = 1 - fraction;
  if (guidance?.status == RouteGuidanceStatus.available &&
      guidance!.steps.length >= 2 &&
      route.distanceMeters > 0) {
    final traveled = route.distanceMeters * fraction;
    var totalTime = 0;
    var remainingTime = 0.0;
    for (var i = 0; i < guidance.steps.length - 1; i++) {
      final step = guidance.steps[i];
      final next = guidance.steps[i + 1];
      final micros = step.durationToNextStep.inMicroseconds;
      totalTime += micros;
      if (progress.geometryPosition > next.geometryIndex + 1e-6) continue;
      final completed = step.distanceToNextStepMeters > 0
          ? ((traveled - step.distanceFromStartMeters) /
                    step.distanceToNextStepMeters)
                .clamp(0.0, 1.0)
          : 0.0;
      remainingTime += micros * (1 - completed);
    }
    if (totalTime > 0) remainingRatio = remainingTime / totalTime;
  }
  return Duration(
    microseconds:
        (route.duration.inMicroseconds * remainingRatio.clamp(0.0, 1.0))
            .round(),
  );
}

/// Measures this foreground guidance session, excluding explicit/background pause.
/// It does not claim to measure GPS travel distance or time spent before guidance.
final class NavigationSession {
  const NavigationSession._({
    required this.startedAt,
    required this.activeSince,
    required this.accumulated,
    this.completedAt,
  });

  factory NavigationSession.start(DateTime now) => NavigationSession._(
    startedAt: now.toUtc(),
    activeSince: now.toUtc(),
    accumulated: Duration.zero,
  );

  final DateTime startedAt;
  final DateTime? activeSince;
  final Duration accumulated;
  final DateTime? completedAt;

  Duration elapsedAt(DateTime now) {
    final segment = activeSince == null
        ? Duration.zero
        : now.difference(activeSince!);
    return accumulated + (segment.isNegative ? Duration.zero : segment);
  }

  NavigationSession pause(DateTime now) => completedAt != null
      ? this
      : NavigationSession._(
          startedAt: startedAt,
          activeSince: null,
          accumulated: elapsedAt(now),
        );

  NavigationSession resume(DateTime now) =>
      completedAt != null || activeSince != null
      ? this
      : NavigationSession._(
          startedAt: startedAt,
          activeSince: now.toUtc(),
          accumulated: accumulated,
        );

  NavigationSession complete(DateTime now) => completedAt != null
      ? this
      : NavigationSession._(
          startedAt: startedAt,
          activeSince: null,
          accumulated: elapsedAt(now),
          completedAt: now.toUtc(),
        );
}
