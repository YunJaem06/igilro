import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/route_search/domain/entities/route_endpoints.dart';
import 'package:igilro/features/route_search/domain/entities/route_point.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/domain/usecases/search_route_use_case.dart';

import '../../../helpers/fake_route_repository.dart';

const origin = RoutePoint(
  coordinate: routeOrigin,
  source: RoutePointSource.currentLocation,
);
const destination = RoutePoint(
  coordinate: routeDestination,
  source: RoutePointSource.map,
);

void main() {
  late FakeRouteRepository repository;
  late SearchRouteUseCase search;
  setUp(() {
    repository = FakeRouteRepository();
    search = SearchRouteUseCase(repository);
  });

  for (final endpoints in [
    const RouteEndpoints(),
    const RouteEndpoints(origin: origin),
    const RouteEndpoints(destination: destination),
  ]) {
    test('missing endpoints never reach the repository: $endpoints', () async {
      final result = await search(endpoints, departureAt: routeDeparture);
      expect(
        (result as Failed<RouteSearchResult>).failure.code,
        'ROUTE_ENDPOINTS_REQUIRED',
      );
      expect(repository.queries, isEmpty);
    });
  }

  test(
    'identical coordinates are rejected even if their sources differ',
    () async {
      final result = await search(
        const RouteEndpoints(
          origin: origin,
          destination: RoutePoint(
            coordinate: routeOrigin,
            source: RoutePointSource.map,
          ),
        ),
        departureAt: routeDeparture,
      );
      expect(
        (result as Failed<RouteSearchResult>).failure.code,
        'ROUTE_ENDPOINTS_IDENTICAL',
      );
      expect(repository.queries, isEmpty);
    },
  );

  test(
    'keeps selected coordinates and normalizes the departure instant',
    () async {
      final departure = DateTime.parse('2026-10-19T14:00:00+09:00');
      final result = await search(
        const RouteEndpoints(origin: origin, destination: destination),
        departureAt: departure,
      );
      expect(result, isA<Success<RouteSearchResult>>());
      final query = repository.queries.single;
      expect(query.origin, routeOrigin);
      expect(query.destination, routeDestination);
      expect(query.departureAt, DateTime.utc(2026, 10, 19, 5));
      expect(query.departureAt.isUtc, true);
    },
  );

  test('preserves a server business failure and its request ID', () async {
    const failure = Failure(
      type: FailureType.notFound,
      code: 'ROUTE_NOT_FOUND',
      requestId: 'test-request-id',
    );
    repository.response = const Result.failure(failure);
    final result = await search(
      const RouteEndpoints(origin: origin, destination: destination),
      departureAt: routeDeparture,
    );
    expect((result as Failed<RouteSearchResult>).failure, failure);
  });
}
