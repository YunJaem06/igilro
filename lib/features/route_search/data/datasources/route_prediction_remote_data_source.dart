import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../dto/model_route_prediction_dto.dart';
import '../dto/prediction_coverage_dto.dart';

final class RoutePredictionRemoteDataSource {
  const RoutePredictionRemoteDataSource(this._client);

  final DioClient _client;

  Future<PredictionCoverageDto> coverage({CancelToken? cancelToken}) async {
    final response = await _client.get<Object?>(
      '/api/v1/routes/predictions/coverage',
      cancelToken: cancelToken,
    );
    final body = response.data;
    if (body is! Map<String, dynamic>) {
      throw const FormatException('Expected coverage response object.');
    }
    try {
      return PredictionCoverageDto.fromJson(body);
    } on TypeError {
      throw const FormatException('Invalid coverage response fields.');
    }
  }

  Future<ModelRoutePredictionResponseDto> search(
    ModelRoutePredictionRequestDto request, {
    CancelToken? cancelToken,
  }) async {
    final response = await _client.post<Object?>(
      '/api/v1/routes/predictions/search',
      data: request.toJson(),
      cancelToken: cancelToken,
    );
    final body = response.data;
    if (body is! Map<String, dynamic>) {
      throw const FormatException('Expected prediction response object.');
    }
    try {
      return ModelRoutePredictionResponseDto.fromJson(body);
    } on TypeError {
      throw const FormatException('Invalid prediction response fields.');
    }
  }
}
