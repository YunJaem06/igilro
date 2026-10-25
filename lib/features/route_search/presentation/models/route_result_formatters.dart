String formatRouteDuration(Duration duration) {
  final minutes = (duration.inSeconds / 60).ceil();
  if (minutes == 0) return '1분 미만';
  if (minutes < 60) return '$minutes분';
  final remaining = minutes % 60;
  return remaining == 0
      ? '${minutes ~/ 60}시간'
      : '${minutes ~/ 60}시간 $remaining분';
}

String formatRouteDistance(double meters) {
  if (meters > 0 && meters < 1) return '1m 미만';
  return meters < 1000
      ? '${meters.round()}m'
      : '${(meters / 1000).toStringAsFixed(1)}km';
}

/// Avoid rounding a positive value to 0%, or incomplete coverage to 100%.
String formatRoutePercentage(double ratio) {
  if (ratio > 0 && ratio < 0.01) return '1% 미만';
  if (ratio > 0.99 && ratio < 1) return '99% 초과';
  return '${(ratio * 100).round()}%';
}

String formatRouteEvaluationTime(DateTime instant) {
  final local = instant.toLocal();
  String two(int value) => value.toString().padLeft(2, '0');
  return '${local.year}.${two(local.month)}.${two(local.day)} '
      '${two(local.hour)}:${two(local.minute)} · 기기 시간';
}
