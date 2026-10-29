import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/place_search/domain/place.dart';
import 'package:igilro/features/place_search/domain/search_places_use_case.dart';
import 'package:igilro/features/place_search/data/place_search_dto.dart';
import 'package:igilro/features/place_search/data/place_mapper.dart';
import 'package:igilro/features/place_search/data/place_repository_impl.dart';
import 'package:igilro/features/place_search/presentation/place_search_notifier.dart';

import '../../helpers/fake_http_client_adapter.dart';
import '../../helpers/fake_place_repository.dart';

const place = Place(
  id: 'source:1',
  name: '서울숲',
  address: '서울시 성동구',
  coordinate: GeoCoordinate(latitude: 37.54, longitude: 127.03),
  attributions: [],
);
Map<String, dynamic> body() => {
  'places': [
    {
      'id': 'source:1',
      'name': '서울숲',
      'address': '서울시 성동구',
      'coordinate': {'longitude': 127, 'latitude': 37.54},
    },
  ],
  'attributions': [
    {'text': 'Provider', 'url': 'https://example.com/'},
  ],
};

void main() {
  test('DTO accepts integer numbers and mapper keeps attribution links', () {
    final mapped = const PlaceMapper().toPlaces(
      PlaceSearchResponseDto.fromJson(body()),
    );
    expect(mapped.single.coordinate.longitude, 127.0);
    expect(mapped.single.attributions, ['Provider\nhttps://example.com/']);
    expect(() => mapped.add(place), throwsUnsupportedError);
  });
  test('invalid coordinates and unsafe attribution links are rejected', () {
    final bad = body();
    (bad['places'] as List).first['coordinate']['longitude'] = 181;
    expect(
      () => const PlaceMapper().toPlaces(PlaceSearchResponseDto.fromJson(bad)),
      throwsFormatException,
    );
    final unsafe = body()
      ..['attributions'] = [
        {'text': 'bad', 'url': 'javascript:alert(1)'},
      ];
    expect(
      () =>
          const PlaceMapper().toPlaces(PlaceSearchResponseDto.fromJson(unsafe)),
      throwsFormatException,
    );
  });
  test(
    'search uses GET with one encoded Unicode query and keeps error identity',
    () async {
      final dio = createDio(
        AppConfig.fromValues(
          environment: 'development',
          apiBaseUrl: 'http://localhost:8080',
        ),
      );
      var fail = false;
      final adapter = FakeHttpClientAdapter(
        (options) => fail
            ? jsonResponse(
                '{"code":"PLACE_SEARCH_NOT_CONFIGURED","requestId":"test-id","message":"private"}',
                status: 503,
              )
            : jsonResponse(jsonEncode(body())),
      );
      dio.httpClientAdapter = adapter;
      final repository = PlaceRepositoryImpl(DioClient(dio));
      expect(await repository.search('서울숲 & 출입구'), isA<Success<List<Place>>>());
      expect(adapter.requests.single.path, '/api/v1/places/search');
      expect(adapter.requests.single.queryParameters, {'query': '서울숲 & 출입구'});
      fail = true;
      final failure =
          (await repository.search('서울숲') as Failed<List<Place>>).failure;
      expect(failure.code, 'PLACE_SEARCH_NOT_CONFIGURED');
      expect(failure.requestId, 'test-id');
      dio.close(force: true);
    },
  );
  test('empty search result remains empty and query validation does not send requests', () async {
    final repository = FakePlaceRepository();
    final useCase = SearchPlacesUseCase(repository);
    expect(await useCase('   '), isA<Failed<List<Place>>>());
    expect(await useCase('a\u0000b'), isA<Failed<List<Place>>>());
    expect(repository.queries, isEmpty);
    expect((await useCase('서울숲') as Success<List<Place>>).value, isEmpty);
  });
  testWidgets(
    'debounce sends only the latest query and ignores stale results',
    (tester) async {
      final repository = FakePlaceRepository();
      final container = ProviderContainer(
        overrides: [placeRepositoryProvider.overrideWithValue(repository)],
      );
      container.listen(placeSearchProvider, (_, _) {});
      final notifier = container.read(placeSearchProvider.notifier);
      notifier.query('서울');
      await tester.pump(const Duration(milliseconds: 300));
      expect(repository.queries, isEmpty);
      final first = Completer<Result<List<Place>>>();
      repository.pending = first.future;
      notifier.query('서울숲');
      await tester.pump(const Duration(milliseconds: 350));
      final second = Completer<Result<List<Place>>>();
      repository.pending = second.future;
      notifier.query('입구');
      await tester.pump(const Duration(milliseconds: 350));
      second.complete(const Result.success([place]));
      await tester.pump();
      first.complete(const Result.failure(Failure(type: FailureType.network)));
      await tester.pump();
      expect(repository.queries, ['서울숲', '입구']);
      expect(container.read(placeSearchProvider).asData!.value.single, place);
      container.dispose();
    },
  );
}
