import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/api_exception.dart';
import '../../domain/entities/place.dart';
import '../../domain/repositories/place_repository.dart';
import '../datasources/place_remote_data_source.dart';
import '../mappers/place_mapper.dart';

final class PlaceRepositoryImpl implements PlaceRepository {
  PlaceRepositoryImpl(this._source, this._mapper);

  final PlaceRemoteDataSource _source;
  final PlaceMapper _mapper;
  CancelToken? _pending;

  @override
  Future<Result<List<Place>>> search(String query) async {
    cancelSearch();
    final token = CancelToken();
    _pending = token;
    try {
      final dto = await _source.search(query, cancelToken: token);
      return Result.success(_mapper.toPlaces(dto));
    } on ApiException catch (exception) {
      return Result.failure(exception.failure);
    } on FormatException {
      return const Result.failure(Failure(type: FailureType.invalidData));
    } finally {
      if (identical(_pending, token)) _pending = null;
    }
  }

  @override
  void cancelSearch() {
    _pending?.cancel();
    _pending = null;
  }
}
