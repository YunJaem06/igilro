import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/di/place_dependencies.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/place_search/data/dto/place_search_response_dto.dart';
import 'package:igilro/features/place_search/data/mappers/place_mapper.dart';
import 'package:igilro/features/place_search/domain/entities/place.dart';
import 'package:igilro/features/place_search/domain/repositories/place_repository.dart';

import '../../../helpers/fake_http_client_adapter.dart';
import '../../../helpers/fake_place_repository.dart';

Map<String, Object?> placeJson() => {
  'id': forestPlace.id,
  'name': forestPlace.name,
  'address': forestPlace.address,
  'coordinate': {'longitude': 127.0374, 'latitude': 37.5445},
};

void main() {
  late Dio dio;
  late FakeHttpClientAdapter adapter;
  late PlaceRepository repository;
  void respond(FutureOr<ResponseBody> Function(RequestOptions) handle) {
    adapter = FakeHttpClientAdapter(handle);
    dio.httpClientAdapter = adapter;
  }

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.test'));
    respond(
      (_) => jsonResponse(
        jsonEncode({
          'places': [placeJson()],
        }),
      ),
    );
    repository = createPlaceRepository(DioClient(dio));
  });
  tearDown(() {
    repository.cancelSearch();
    dio.close(force: true);
  });

  test(
    'GET encodes the Korean query and maps coordinates to immutable places',
    () async {
      final result =
          await repository.search('서울숲 & 카페') as Success<List<Place>>;
      final request = adapter.requests.single;
      expect(request.method, 'GET');
      expect(request.uri.path, '/api/v1/places/search');
      expect(request.uri.queryParameters, {'query': '서울숲 & 카페'});
      expect(request.data, isNull);
      expect(result.value, [forestPlace]);
      expect(() => result.value.clear(), throwsUnsupportedError);
    },
  );

  test('an empty places array is a successful empty search', () async {
    respond((_) => jsonResponse('{"places": []}'));
    expect(
      (await repository.search('없는 장소') as Success<List<Place>>).value,
      isEmpty,
    );
  });

  final malformed = <String, Object?>{
    'non-object': [],
    'missing array': {},
    'null array': {'places': null},
    'missing address': {
      'places': [placeJson()..remove('address')],
    },
    'wrong name type': {
      'places': [placeJson()..['name'] = 12],
    },
    'blank id': {
      'places': [placeJson()..['id'] = ' '],
    },
    'blank name': {
      'places': [placeJson()..['name'] = ' '],
    },
    'out of bounds': {
      'places': [
        placeJson()..['coordinate'] = {'longitude': 190, 'latitude': 37},
      ],
    },
    'missing latitude': {
      'places': [
        placeJson()..['coordinate'] = {'longitude': 127},
      ],
    },
  };
  for (final entry in malformed.entries) {
    test('rejects malformed response: ${entry.key}', () async {
      respond((_) => jsonResponse(jsonEncode(entry.value)));
      final result = await repository.search('서울숲') as Failed<List<Place>>;
      expect(result.failure.type, FailureType.invalidData);
    });
  }

  test(
    'mapper rejects nonfinite coordinates before constructing domain values',
    () {
      final dto = PlaceSearchResponseDto(
        places: [
          PlaceDto(
            id: 'test:place',
            name: '장소',
            address: '',
            coordinate: PlaceCoordinateDto(longitude: double.nan, latitude: 37),
          ),
        ],
      );
      expect(() => const PlaceMapper().toPlaces(dto), throwsFormatException);
    },
  );

  test('unknown fields and an empty address remain usable', () async {
    respond(
      (_) => jsonResponse(
        jsonEncode({
          'places': [
            placeJson()
              ..['address'] = ''
              ..['newField'] = true,
          ],
          'nextField': null,
        }),
      ),
    );
    final result = await repository.search('서울숲') as Success<List<Place>>;
    expect(result.value.single.address, isEmpty);
  });

  for (final (status, code, type) in [
    (404, 'NOT_FOUND', FailureType.notFound),
    (400, 'INVALID_REQUEST', FailureType.validation),
    (429, 'TOO_MANY_REQUESTS', FailureType.rateLimited),
    (503, 'SERVICE_UNAVAILABLE', FailureType.server),
  ]) {
    test('preserves $status/$code and request id', () async {
      respond(
        (_) => jsonResponse(
          jsonEncode({
            'code': code,
            'requestId': 'place-request',
            'message': 'private diagnostics',
          }),
          status: status,
        ),
      );
      final result = await repository.search('서울숲') as Failed<List<Place>>;
      expect(
        result.failure,
        Failure(type: type, code: code, requestId: 'place-request'),
      );
      expect(result.failure.toString(), isNot(contains('private diagnostics')));
    });
  }

  test(
    'new requests and explicit cancellation terminate old HTTP requests',
    () async {
      final response = Completer<ResponseBody>();
      final started = Completer<void>();
      respond((_) {
        if (adapter.requests.length == 1) {
          started.complete();
          return response.future;
        }
        return jsonResponse('{"places": []}');
      });
      final first = repository.search('서울');
      await started.future;
      expect(await repository.search('서울숲'), isA<Success<List<Place>>>());
      expect(
        (await first as Failed<List<Place>>).failure.type,
        FailureType.cancelled,
      );
      response.complete(jsonResponse('{"places": []}'));

      final waiting = Completer<ResponseBody>();
      final waitingStarted = Completer<void>();
      respond((_) {
        waitingStarted.complete();
        return waiting.future;
      });
      final pending = repository.search('성수');
      await waitingStarted.future;
      repository.cancelSearch();
      expect(
        (await pending as Failed<List<Place>>).failure.type,
        FailureType.cancelled,
      );
      waiting.complete(jsonResponse('{"places": []}'));
    },
  );
}
