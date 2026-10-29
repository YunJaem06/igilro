import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../dto/place_search_response_dto.dart';

final class PlaceRemoteDataSource {
  const PlaceRemoteDataSource(this._client);

  final DioClient _client;

  Future<PlaceSearchResponseDto> search(
    String query, {
    CancelToken? cancelToken,
  }) async {
    final response = await _client.get<Object?>(
      '/api/v1/places/search',
      queryParameters: {'query': query},
      cancelToken: cancelToken,
    );
    final body = response.data;
    if (body is! Map<String, dynamic>) {
      throw const FormatException('Expected a place response object.');
    }
    try {
      return PlaceSearchResponseDto.fromJson(body);
    } on TypeError {
      throw const FormatException('Invalid place response fields.');
    }
  }
}
