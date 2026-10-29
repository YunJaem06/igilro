import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../domain/place.dart';
import '../domain/search_places_use_case.dart';

part 'place_search_notifier.g.dart';

@Riverpod(keepAlive: true)
PlaceRepository placeRepository(Ref ref) =>
    throw StateError('Override placeRepositoryProvider in app DI.');

@riverpod
class PlaceSearchNotifier extends _$PlaceSearchNotifier {
  Timer? _timer;
  int _revision = 0;
  @override
  AsyncValue<List<Place>> build() {
    final repository = ref.watch(placeRepositoryProvider);
    ref.onDispose(() {
      _revision++;
      _timer?.cancel();
      repository.cancel();
    });
    return const AsyncData([]);
  }

  void query(String value) {
    final query = value.trim();
    final revision = ++_revision;
    _timer?.cancel();
    ref.read(placeRepositoryProvider).cancel();
    if (query.isEmpty) {
      state = const AsyncData([]);
      return;
    }
    if (query.runes.length > 100) {
      state = AsyncError(
        const Failure(type: FailureType.validation),
        StackTrace.current,
      );
      return;
    }
    state = const AsyncLoading();
    _timer = Timer(const Duration(milliseconds: 350), () async {
      final result = await SearchPlacesUseCase(
        ref.read(placeRepositoryProvider),
      )(query);
      if (!ref.mounted || revision != _revision) return;
      state = switch (result) {
        Success<List<Place>>(:final value) => AsyncData(value),
        Failed<List<Place>>(:final failure) => AsyncError(
          failure,
          StackTrace.current,
        ),
      };
    });
  }
}
