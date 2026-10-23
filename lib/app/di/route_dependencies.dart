import '../../core/network/dio_client.dart';
import '../../features/route_search/data/datasources/route_remote_data_source.dart';
import '../../features/route_search/data/mappers/route_mapper.dart';
import '../../features/route_search/data/repositories/route_repository_impl.dart';
import '../../features/route_search/domain/repositories/route_repository.dart';

RouteRepository createRouteRepository(DioClient client) =>
    RouteRepositoryImpl(RouteRemoteDataSource(client), const RouteMapper());
