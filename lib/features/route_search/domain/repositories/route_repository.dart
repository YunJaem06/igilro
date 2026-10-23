import '../../../../core/error/result.dart';
import '../entities/route_query.dart';
import '../entities/route_search_result.dart';

abstract interface class RouteRepository {
  Future<Result<RouteSearchResult>> search(RouteQuery query);

  /// Cancels this repository's in-flight search without exposing HTTP types.
  void cancelSearch();
}
