import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/di/route_dependencies.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/network/dio_client.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/domain/repositories/route_repository.dart';

import '../../../helpers/fake_http_client_adapter.dart';
import '../../../helpers/fake_route_repository.dart';
import '../../../helpers/route_response_fixture.dart';

void main() {
  late Dio dio;
  late FakeHttpClientAdapter adapter;
  late RouteRepository repository;
  late RouteQuery query;

  void useAdapter(FutureOr<ResponseBody> Function(RequestOptions) handle) {
    adapter = FakeHttpClientAdapter(handle);
    dio.httpClientAdapter = adapter;
  }

  setUp(() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.test',
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        headers: {'Accept': Headers.jsonContentType},
      ),
    );
    useAdapter((_) => jsonResponse(jsonEncode(routeResponseJson())));
    repository = createRouteRepository(DioClient(dio));
    query = RouteQuery(
      origin: routeOrigin,
      destination: routeDestination,
      departureAt: routeDeparture,
    );
  });
  tearDown(() {
    repository.cancelSearch();
    dio.close(force: true);
  });

  test('the composed repository posts selected coordinates and decodes the server response', () async {
    final result = await repository.search(query) as Success<RouteSearchResult>;
    final request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(
      request.uri.toString(),
      'https://api.example.test/api/v1/routes/search',
    );
    expect(request.contentType, Headers.jsonContentType);
    expect(request.headers['Accept'], Headers.jsonContentType);
    expect(request.data, {
      'origin': {'longitude': 127.0302, 'latitude': 37.54002},
      'destination': {'longitude': 127.0318, 'latitude': 37.54002},
      'departureAt': '2026-10-10T05:00:00.000Z',
      'travelMode': 'walking',
      'mode': 'fastest',
    });
    expect(result.value.routes.single.distanceMeters, 141.4);
    expect(result.value.snapping.origin.distanceMeters, 2.2);
  });

  final errors = [
    (400, 'INVALID_ROUTE_QUERY', FailureType.validation),
    (422, 'OUTSIDE_SUPPORTED_AREA', FailureType.validation),
    (404, 'ROUTE_NOT_FOUND', FailureType.notFound),
    (404, 'NOT_FOUND', FailureType.notFound),
    (429, 'TOO_MANY_REQUESTS', FailureType.rateLimited),
    (503, 'ROUTING_DATA_UNAVAILABLE', FailureType.server),
  ];
  for (final (status, code, type) in errors) {
    test(
      'preserves $status/$code and requestId without exposing the server message',
      () async {
        useAdapter(
          (_) => jsonResponse(
            jsonEncode({
              'code': code,
              'requestId': 'test-request-id',
              'message': 'diagnostic server message',
              'timestamp': '2026-10-19T05:00:00Z',
              'errors': [],
            }),
            status: status,
          ),
        );
        final result =
            await repository.search(query) as Failed<RouteSearchResult>;
        expect(
          result.failure,
          Failure(type: type, code: code, requestId: 'test-request-id'),
        );
        expect(
          result.failure.toString(),
          isNot(contains('diagnostic server message')),
        );
      },
    );
  }

  final malformed = <String, Object? Function()>{
    'non-object body': () => [],
    'missing required fields': () => {'routes': []},
    'wrong field type': () => routeResponseJson()..['dataVersion'] = 1,
    'empty routes': () => routeResponseJson()..['routes'] = [],
    'fractional seconds': () {
      final body = routeResponseJson();
      (body['routes'] as List).first['durationSeconds'] = 573.5;
      return body;
    },
    'fractional signal count': () {
      final body = routeResponseJson();
      (body['routes'] as List).first['metrics']['trafficSignalCount'] = 1.5;
      return body;
    },
    'negative duration': () {
      final body = routeResponseJson();
      (body['routes'] as List).first['durationSeconds'] = -1;
      return body;
    },
    'unexpected geometry wrapper': () {
      final body = routeResponseJson();
      (body['routes'] as List).first['geometry']['type'] = 'Feature';
      return body;
    },
  };
  for (final entry in malformed.entries) {
    test(
      'malformed successful response becomes invalidData: ${entry.key}',
      () async {
        useAdapter((_) => jsonResponse(jsonEncode(entry.value())));
        final result =
            await repository.search(query) as Failed<RouteSearchResult>;
        expect(result.failure.type, FailureType.invalidData);
      },
    );
  }

  test('a connection timeout becomes a typed failure', () async {
    useAdapter(
      (options) => throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionTimeout,
      ),
    );
    final result = await repository.search(query) as Failed<RouteSearchResult>;
    expect(result.failure.type, FailureType.timeout);
  });

  test(
    'a new search cancels the previous HTTP request without cancelling itself',
    () async {
      final oldResponse = Completer<ResponseBody>();
      final started = Completer<void>();
      var calls = 0;
      useAdapter((_) {
        if (++calls == 1) {
          started.complete();
          return oldResponse.future;
        }
        return jsonResponse(jsonEncode(routeResponseJson()));
      });
      final oldSearch = repository.search(query);
      await started.future;
      final newSearch = await repository.search(query);
      expect(newSearch, isA<Success<RouteSearchResult>>());
      final oldResult = await oldSearch as Failed<RouteSearchResult>;
      expect(oldResult.failure.type, FailureType.cancelled);
      oldResponse.complete(jsonResponse(jsonEncode(routeResponseJson())));
      expect(adapter.requests.length, 2);
    },
  );

  test('explicit cancellation terminates a pending HTTP request', () async {
    final response = Completer<ResponseBody>();
    final started = Completer<void>();
    useAdapter((_) {
      started.complete();
      return response.future;
    });
    final search = repository.search(query);
    await started.future;
    repository.cancelSearch();
    final result = await search as Failed<RouteSearchResult>;
    expect(result.failure.type, FailureType.cancelled);
    response.complete(jsonResponse(jsonEncode(routeResponseJson())));
  });
}
