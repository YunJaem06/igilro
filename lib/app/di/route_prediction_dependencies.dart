import '../../core/network/dio_client.dart';
import '../../features/route_search/data/datasources/route_prediction_remote_data_source.dart';
import '../../features/route_search/data/mappers/model_route_prediction_mapper.dart';
import '../../features/route_search/data/repositories/route_prediction_repository_impl.dart';
import '../../features/route_search/domain/repositories/route_prediction_repository.dart';

RoutePredictionRepository createRoutePredictionRepository(DioClient client) =>
    RoutePredictionRepositoryImpl(
      RoutePredictionRemoteDataSource(client),
      const ModelRoutePredictionMapper(),
    );
