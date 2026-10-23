import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/network/api_exception.dart';
import '../../domain/entities/route_query.dart';
import '../../domain/entities/route_search_result.dart';
import '../../domain/repositories/route_repository.dart';
import '../datasources/route_remote_data_source.dart';
import '../mappers/route_mapper.dart';

final class RouteRepositoryImpl implements RouteRepository {
  RouteRepositoryImpl(this._source, this._mapper);

  final RouteRemoteDataSource _source;
  final RouteMapper _mapper;
  CancelToken? _pending;

  @override
  Future<Result<RouteSearchResult>> search(RouteQuery query) async {
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
