import '../../core/network/dio_client.dart';
import '../../features/place_search/data/datasources/place_remote_data_source.dart';
import '../../features/place_search/data/mappers/place_mapper.dart';
import '../../features/place_search/data/repositories/place_repository_impl.dart';
import '../../features/place_search/domain/repositories/place_repository.dart';

PlaceRepository createPlaceRepository(DioClient client) =>
    PlaceRepositoryImpl(PlaceRemoteDataSource(client), const PlaceMapper());
