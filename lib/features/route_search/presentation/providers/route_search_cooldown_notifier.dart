import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';

final routeSearchCooldownProvider =
    NotifierProvider<RouteSearchCooldownNotifier, int>(
      RouteSearchCooldownNotifier.new,
    );

/// Both walking search endpoints draw from the same server request budget.
class RouteSearchCooldownNotifier extends Notifier<int> {
  Timer? _timer;

  @override
  int build() {
    ref.onDispose(() => _timer?.cancel());
    return 0;
  }

  void apply(Failure failure) {
    if (!failure.isThrottled) return;
    final delay = failure.retryAfter ?? const Duration(seconds: 1);
    const second = Duration.microsecondsPerSecond;
    final seconds = (delay.inMicroseconds + second - 1) ~/ second;
    if (seconds == 0 || seconds < state) return;

    _timer?.cancel();
    state = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = max(0, seconds - timer.tick);
      if (state == 0) timer.cancel();
    });
  }
}
