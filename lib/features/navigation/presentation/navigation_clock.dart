import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_clock.g.dart';

/// A replaceable clock for session timestamps and location freshness checks.
@riverpod
DateTime Function() navigationNow(Ref ref) => DateTime.now;
