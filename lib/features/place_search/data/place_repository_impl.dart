import 'package:dio/dio.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/result.dart';
import '../domain/place.dart';
import 'place_search_dto.dart';
import 'place_mapper.dart';

final class PlaceRepositoryImpl implements PlaceRepository {
  PlaceRepositoryImpl(this._client);
  final DioClient _client;
  CancelToken? _pending;
  @override
  void cancel() {
    _pending?.cancel();
    _pending = null;
  }

  @override
  Future<Result<List<Place>>> search(String query) async {
    cancel();
    final token = CancelToken();
    _pending = token;
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/api/v1/places/search',
        queryParameters: {'query': query},
        cancelToken: token,
      );
      if (response.data == null) throw const FormatException();
      final dto = PlaceSearchResponseDto.fromJson(response.data!);
      return Result.success(const PlaceMapper().toPlaces(dto));
    } on ApiException catch (error) {
      return Result.failure(error.failure);
    } on FormatException {
      return const Result.failure(Failure(type: FailureType.invalidData));
    } on TypeError {
      return const Result.failure(Failure(type: FailureType.invalidData));
    } finally {
      if (identical(_pending, token)) _pending = null;
    }
  }
}
