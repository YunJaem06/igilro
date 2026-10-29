import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/place_repository.dart';
import '../../domain/usecases/search_places_use_case.dart';

part 'place_search_providers.g.dart';

@Riverpod(keepAlive: true)
PlaceRepository placeRepository(Ref ref) {
  throw StateError('placeRepositoryProvider must be overridden by app DI.');
}

@riverpod
SearchPlacesUseCase searchPlacesUseCase(Ref ref) =>
    SearchPlacesUseCase(ref.watch(placeRepositoryProvider));
