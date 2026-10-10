import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/config/app_config.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/network/api_exception.dart';
import 'package:igilro/core/network/dio_client.dart';

import '../../helpers/fake_http_client_adapter.dart';

void main() {
  late Dio dio;
  late DioClient client;

  setUp(() {
    dio = createDio(
      AppConfig.fromValues(
        environment: 'development',
        apiBaseUrl: 'http://10.0.2.2:8080',
      ),
    );
    client = DioClient(dio);
  });
  tearDown(() => dio.close(force: true));

  test(
    'GET sends JSON headers and preserves Korean search parameters',
    () async {
      final adapter = FakeHttpClientAdapter(
        (options) => jsonResponse('{"places":[]}'),
      );
      dio.httpClientAdapter = adapter;

      final response = await client.get<Map<String, dynamic>>(
        '/api/v1/places/search',
        queryParameters: {'query': '서울숲'},
      );

      expect(response.data, {'places': []});
      expect(adapter.requests.single.uri.host, '10.0.2.2');
      expect(adapter.requests.single.uri.port, 8080);
      expect(adapter.requests.single.uri.queryParameters['query'], '서울숲');
      expect(
        adapter.requests.single.headers['Accept'],
        Headers.jsonContentType,
      );
    },
  );

  test('POST preserves the route query body', () async {
    final adapter = FakeHttpClientAdapter(
      (options) => jsonResponse('{"routes":[]}'),
    );
    dio.httpClientAdapter = adapter;
    final query = {
      'origin': {'longitude': 127.0, 'latitude': 37.5},
      'mode': 'fastest',
    };

    await client.post<Map<String, dynamic>>(
      '/api/v1/routes/search',
      data: query,
    );

    expect(adapter.requests.single.method, 'POST');
    expect(adapter.requests.single.data, query);
    expect(adapter.requests.single.contentType, Headers.jsonContentType);
  });

  test('a structured HTTP error preserves its code and request ID', () async {
    dio.httpClientAdapter = FakeHttpClientAdapter(
      (options) => jsonResponse(
        '{"code":"INVALID_ROUTE_QUERY","message":"detail","requestId":"request-1"}',
        status: 400,
      ),
    );

    await expectLater(
      client.post<Object>('/api/v1/routes/search'),
      throwsA(
        isA<ApiException>().having(
          (error) => error.failure,
          'failure',
          const Failure(
            type: FailureType.validation,
            code: 'INVALID_ROUTE_QUERY',
            requestId: 'request-1',
          ),
        ),
      ),
    );
  });

  for (final entry in {
    401: FailureType.unauthorized,
    403: FailureType.forbidden,
    404: FailureType.notFound,
    408: FailureType.timeout,
    422: FailureType.validation,
    429: FailureType.rateLimited,
    500: FailureType.server,
    503: FailureType.server,
    504: FailureType.timeout,
  }.entries) {
    test(
      'HTTP ${entry.key} falls back to its status when the body is not JSON',
      () async {
        dio.httpClientAdapter = FakeHttpClientAdapter(
          (options) => ResponseBody.fromString('upstream error', entry.key),
        );

        await expectLater(
          client.get<Object>('/api/v1/routes/search'),
          throwsA(
            isA<ApiException>().having(
              (error) => error.failure.type,
              'type',
              entry.value,
            ),
          ),
        );
      },
    );
  }

  test('a malformed error DTO does not obscure the HTTP failure', () async {
    dio.httpClientAdapter = FakeHttpClientAdapter(
      (options) => jsonResponse('{"code":123,"requestId":false}', status: 503),
    );

    await expectLater(
      client.get<Object>('/api/v1/routes/search'),
      throwsA(
        isA<ApiException>().having(
          (error) => error.failure,
          'failure',
          const Failure(type: FailureType.server),
        ),
      ),
    );
  });

  test('malformed JSON in a successful response becomes invalidData', () async {
    dio.httpClientAdapter = FakeHttpClientAdapter(
      (options) => jsonResponse('{broken'),
    );

    await expectLater(
      client.get<Object>('/api/v1/routes/search'),
      throwsA(
        isA<ApiException>().having(
          (error) => error.failure.type,
          'type',
          FailureType.invalidData,
        ),
      ),
    );
  });

  for (final entry in {
    DioExceptionType.connectionTimeout: FailureType.timeout,
    DioExceptionType.sendTimeout: FailureType.timeout,
    DioExceptionType.receiveTimeout: FailureType.timeout,
    DioExceptionType.transformTimeout: FailureType.timeout,
    DioExceptionType.connectionError: FailureType.network,
    DioExceptionType.badCertificate: FailureType.secureConnection,
  }.entries) {
    test('${entry.key.name} is converted at the network boundary', () async {
      dio.httpClientAdapter = FakeHttpClientAdapter(
        (options) =>
            throw DioException(requestOptions: options, type: entry.key),
      );

      await expectLater(
        client.get<Object>('/api/v1/routes/search'),
        throwsA(
          isA<ApiException>().having(
            (error) => error.failure.type,
            'type',
            entry.value,
          ),
        ),
      );
    });
  }

  test(
    'cancelling a request becomes a distinguishable cancelled failure',
    () async {
      final token = CancelToken()..cancel();

      await expectLater(
        client.get<Object>('/api/v1/routes/search', cancelToken: token),
        throwsA(
          isA<ApiException>().having(
            (error) => error.failure.type,
            'type',
            FailureType.cancelled,
          ),
        ),
      );
    },
  );
}
