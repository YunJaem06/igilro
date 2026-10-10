import 'package:dio/dio.dart';

import '../config/app_config.dart';
import 'network_error_mapper.dart';

Dio createDio(AppConfig config) => Dio(
  BaseOptions(
    baseUrl: config.apiBaseUri.toString(),
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    headers: {'Accept': Headers.jsonContentType},
  ),
);

/// DataSources use this boundary so transport exceptions stay in infrastructure.
/// The provider owning [Dio] also owns its lifetime.
final class DioClient {
  const DioClient(this._dio);

  final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) => _request(
    () => _dio.get<T>(
      path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    ),
  );

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    CancelToken? cancelToken,
  }) =>
      _request(() => _dio.post<T>(path, data: data, cancelToken: cancelToken));

  Future<Response<T>> _request<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      return await request();
    } on DioException catch (exception) {
      throw mapNetworkException(exception);
    }
  }
}
