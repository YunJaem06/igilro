import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/geo/geo_coordinate.dart';
import '../entities/route_endpoints.dart';
import '../entities/route_query.dart';
import '../entities/route_search_result.dart';
import '../repositories/route_repository.dart';

final class SearchRouteUseCase {
  const SearchRouteUseCase(this._repository);

  final RouteRepository _repository;

  Future<Result<RouteSearchResult>> call(
    RouteEndpoints endpoints, {
    required DateTime departureAt,
  }) async {
    final origin = endpoints.origin?.coordinate;
    final destination = endpoints.destination?.coordinate;
    if (origin == null || destination == null) {
      return const Result.failure(
        Failure(type: FailureType.validation, code: 'ROUTE_ENDPOINTS_REQUIRED'),
      );
    }
    if (!_isValid(origin) || !_isValid(destination)) {
      return const Result.failure(
        Failure(type: FailureType.validation, code: 'INVALID_ROUTE_QUERY'),
      );
    }
    if (origin == destination) {
      return const Result.failure(
        Failure(
          type: FailureType.validation,
          code: 'ROUTE_ENDPOINTS_IDENTICAL',
        ),
      );
    }
    return _repository.search(
      RouteQuery(
        origin: origin,
        destination: destination,
        departureAt: departureAt.toUtc(),
      ),
    );
  }

  void cancel() => _repository.cancelSearch();

  bool _isValid(GeoCoordinate coordinate) =>
      coordinate.latitude.isFinite &&
      coordinate.longitude.isFinite &&
      coordinate.latitude >= -90 &&
      coordinate.latitude <= 90 &&
      coordinate.longitude >= -180 &&
      coordinate.longitude <= 180;
}
