import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/location_fix.dart';
import 'location_providers.dart';

part 'location_notifier.g.dart';

@riverpod
class LocationNotifier extends _$LocationNotifier {
  @override
  FutureOr<LocationFix?> build() => null;

  Future<void> locate() async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    final result = await ref.read(getCurrentLocationUseCaseProvider).call();
    if (!ref.mounted) return;
    state = switch (result) {
      Success<LocationFix>(:final value) => AsyncData(value),
      Failed<LocationFix>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }

  Future<bool> openSettings() async {
    final failure = state.error;
    if (failure is! Failure) return false;
    final result = await ref
        .read(openLocationSettingsUseCaseProvider)
        .call(failure);
    if (!ref.mounted) return false;
    switch (result) {
      case Success<bool>(:final value):
        return value;
      case Failed<bool>(:final failure):
        state = AsyncError(failure, StackTrace.current);
        return false;
    }
  }
}
