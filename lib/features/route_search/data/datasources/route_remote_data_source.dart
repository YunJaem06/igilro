import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../dto/route_search_request_dto.dart';
import '../dto/route_search_response_dto.dart';

final class RouteRemoteDataSource {
  const RouteRemoteDataSource(this._client);

  final DioClient _client;

  Future<RouteSearchResponseDto> search(
    RouteSearchRequestDto request, {
    CancelToken? cancelToken,
  }) async {
    final response = await _client.post<Object?>(
      '/api/v1/routes/search',
      data: request.toJson(),
      cancelToken: cancelToken,
    );
    final body = response.data;
    if (body is! Map<String, dynamic>) {
      throw const FormatException('Expected a route response object.');
    }
    try {
      return RouteSearchResponseDto.fromJson(body);
    } on TypeError {
      // Generated JSON casts are confined to this decoding boundary.
      throw const FormatException('Invalid route response fields.');
    }
  }
}
