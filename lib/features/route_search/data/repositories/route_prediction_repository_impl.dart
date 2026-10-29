import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/api_exception.dart';
import '../../domain/entities/model_route_prediction.dart';
import '../../domain/entities/prediction_coverage.dart';
import '../../domain/repositories/route_prediction_repository.dart';
import '../datasources/route_prediction_remote_data_source.dart';
import '../mappers/model_route_prediction_mapper.dart';

final class RoutePredictionRepositoryImpl implements RoutePredictionRepository {
  RoutePredictionRepositoryImpl(this._source, this._mapper);

  final RoutePredictionRemoteDataSource _source;
  final ModelRoutePredictionMapper _mapper;
  CancelToken? _pending;
  CancelToken? _pendingCoverage;

  @override
  Future<Result<PredictionCoverage>> coverage() async {
    cancelCoverage();
    final token = CancelToken();
    _pendingCoverage = token;
    try {
      final dto = await _source.coverage(cancelToken: token);
      return Result.success(_mapper.toCoverage(dto));
    } on ApiException catch (exception) {
      return Result.failure(exception.failure);
    } on FormatException {
      return const Result.failure(Failure(type: FailureType.invalidData));
    } finally {
      if (identical(_pendingCoverage, token)) _pendingCoverage = null;
    }
  }

  @override
  void cancelCoverage() {
    _pendingCoverage?.cancel();
    _pendingCoverage = null;
  }

  @override
  Future<Result<ModelRoutePrediction>> search(
    RoutePredictionQuery query,
  ) async {
    cancelSearch();
    final token = CancelToken();
    _pending = token;
    try {
      final dto = await _source.search(
        _mapper.toRequest(query),
        cancelToken: token,
      );
      return Result.success(_mapper.toResult(dto, query));
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
