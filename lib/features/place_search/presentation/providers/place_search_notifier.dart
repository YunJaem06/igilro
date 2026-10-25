import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/place.dart';
import 'place_search_providers.dart';

part 'place_search_notifier.g.dart';

@riverpod
class PlaceSearchNotifier extends _$PlaceSearchNotifier {
  Timer? _debounce;
  int _revision = 0;
  String _query = '';
  bool _composing = false;
  void Function()? _cancelPending;

  @override
  FutureOr<List<Place>?> build() {
    ref.onDispose(_cancel);
    return null;
  }

  /// Clear obsolete results immediately, but wait for typing and IME composition.
  void updateQuery(String query, {bool composing = false}) {
    if (query == _query && composing == _composing) return;
    _query = query;
    _composing = composing;
    _cancel();
    if (query.trim().isEmpty || composing) {
      state = const AsyncData(null);
      return;
    }
    state = const AsyncLoading();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      unawaited(search());
    });
  }

  Future<void> search() async {
    _cancel();
    if (_query.trim().isEmpty || _composing) {
      state = const AsyncData(null);
      return;
    }
    final useCase = ref.read(searchPlacesUseCaseProvider);
    final revision = _revision;
    _cancelPending = useCase.cancel;
    state = const AsyncLoading();
    final result = await useCase(_query);
    if (!ref.mounted || revision != _revision) return;
    _cancelPending = null;
    state = switch (result) {
      Success<List<Place>>(:final value) => AsyncData(value),
      Failed<List<Place>>(failure: Failure(type: FailureType.cancelled)) =>
        const AsyncData(null),
      Failed<List<Place>>(:final failure) => AsyncError(
        failure,
        StackTrace.current,
      ),
    };
  }

  void _cancel() {
    _revision++;
    _debounce?.cancel();
    _debounce = null;
    _cancelPending?.call();
    _cancelPending = null;
  }
}
