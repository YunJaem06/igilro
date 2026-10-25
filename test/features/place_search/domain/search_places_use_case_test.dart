import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/place_search/domain/entities/place.dart';
import 'package:igilro/features/place_search/domain/usecases/search_places_use_case.dart';

import '../../../helpers/fake_place_repository.dart';

void main() {
  test('blank queries never reach the repository', () async {
    final repository = FakePlaceRepository();
    final result =
        await SearchPlacesUseCase(repository)(' \t\n ') as Failed<List<Place>>;
    expect(result.failure.type, FailureType.validation);
    expect(repository.queries, isEmpty);
  });

  test(
    'normalizes whitespace without changing Korean or punctuation',
    () async {
      final repository = FakePlaceRepository();
      final useCase = SearchPlacesUseCase(repository);
      final result = await useCase('  서울숲  &\n카페  ') as Success<List<Place>>;
      expect(repository.queries, ['서울숲 & 카페']);
      expect(result.value, [forestPlace, stationPlace]);
      useCase.cancel();
      expect(repository.cancellations, 1);
    },
  );
}
