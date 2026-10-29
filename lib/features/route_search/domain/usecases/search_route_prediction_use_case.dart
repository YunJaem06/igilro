import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/geo/geo_coordinate.dart';
import '../entities/model_route_prediction.dart';
import '../entities/route_endpoints.dart';
import '../repositories/route_prediction_repository.dart';

final class SearchRoutePredictionUseCase {
  const SearchRoutePredictionUseCase(this._repository);

  final RoutePredictionRepository _repository;

  Future<Result<ModelRoutePrediction>> call(
    RouteEndpoints endpoints, {
    required RoutePredictionMode mode,
    DateTime? departureAt,
  }) async {
    final origin = endpoints.origin?.coordinate;
    final destination = endpoints.destination?.coordinate;
    if (origin == null || destination == null) {
      return const Result.failure(
        Failure(type: FailureType.validation, code: 'ROUTE_ENDPOINTS_REQUIRED'),
      );
    }
    if (!_valid(origin) || !_valid(destination)) {
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
      RoutePredictionQuery(
        origin: origin,
        destination: destination,
        mode: mode,
        departureAt: departureAt?.toUtc(),
      ),
    );
  }

  void cancel() => _repository.cancelSearch();

  bool _valid(GeoCoordinate value) =>
      value.latitude.isFinite &&
      value.longitude.isFinite &&
      value.latitude >= -90 &&
      value.latitude <= 90 &&
      value.longitude >= -180 &&
      value.longitude <= 180;
}
