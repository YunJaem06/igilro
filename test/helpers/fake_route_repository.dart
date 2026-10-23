import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/route_search/domain/entities/route_candidate.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';
import 'package:igilro/features/route_search/domain/repositories/route_repository.dart';

const routeOrigin = GeoCoordinate(latitude: 37.54002, longitude: 127.0302);
const routeDestination = GeoCoordinate(latitude: 37.54002, longitude: 127.0318);
final routeDeparture = DateTime.utc(2026, 10, 10, 5);

RouteSearchResult sampleRouteResult(RouteQuery query) => RouteSearchResult(
  query: query,
  routes: [
    RouteCandidate(
      id: 'test-route',
      path: [query.origin, query.destination],
      distanceMeters: 1700,
      duration: const Duration(minutes: 22),
      additionalDuration: Duration.zero,
      metrics: const RouteMetrics(),
    ),
  ],
  evaluatedAt: query.departureAt.toUtc(),
  dataVersion: 'test-network-v1',
  timeModelVersion: 'test-time-v1',
  routingModelVersion: 'test-routing-v1',
  baselineDuration: const Duration(minutes: 22),
  snapping: RouteSnapping(
    origin: RouteSnap(coordinate: query.origin, distanceMeters: 0),
    destination: RouteSnap(coordinate: query.destination, distanceMeters: 0),
  ),
  attribution: '© OpenStreetMap contributors',
);

class FakeRouteRepository implements RouteRepository {
  final queries = <RouteQuery>[];
  int cancellations = 0;
  Result<RouteSearchResult>? response;
  Future<Result<RouteSearchResult>>? pending;

  @override
  Future<Result<RouteSearchResult>> search(RouteQuery query) {
    queries.add(query);
    return pending ??
        Future.value(response ?? Result.success(sampleRouteResult(query)));
  }

  @override
  void cancelSearch() => cancellations++;
}
