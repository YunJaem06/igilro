import 'dart:convert';
import 'dart:io';

import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/route_search/data/dto/model_route_prediction_dto.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/repositories/route_prediction_repository.dart';
import 'package:igilro/features/route_search/domain/entities/prediction_coverage.dart';
import 'package:igilro/features/route_search/data/dto/prediction_coverage_dto.dart';

const predictionOrigin = GeoCoordinate(
  longitude: 127.0389239,
  latitude: 37.5476013,
);
const predictionDestination = GeoCoordinate(
  longitude: 127.0381515,
  latitude: 37.5475288,
);
final predictionDeparture = DateTime.parse('2026-10-28T11:00:00+09:00');

Map<String, dynamic> coverageJson() => jsonDecode(
  File('test/fixtures/prediction_coverage.json').readAsStringSync(),
) as Map<String, dynamic>;
PredictionCoverage sampleCoverage() => const ModelRoutePredictionMapper()
    .toCoverage(PredictionCoverageDto.fromJson(coverageJson()));

const forestOrigin = GeoCoordinate(longitude: 127.0374, latitude: 37.5445);
const forestDestination = GeoCoordinate(longitude: 127.0430, latitude: 37.5480);
Map<String, dynamic> forestPredictionJson(RoutePredictionMode mode) =>
    jsonDecode(
      File('test/fixtures/seoul_forest_prediction_${mode.name}.json')
          .readAsStringSync(),
    ) as Map<String, dynamic>;

Map<String, dynamic> predictionJson([
  RoutePredictionMode mode = RoutePredictionMode.shade,
]) => jsonDecode(
  File('test/fixtures/model_route_prediction_${mode.name}.json')
      .readAsStringSync(),
) as Map<String, dynamic>;

RoutePredictionQuery predictionQuery([
  RoutePredictionMode mode = RoutePredictionMode.shade,
]) => RoutePredictionQuery(
  origin: predictionOrigin,
  destination: predictionDestination,
  mode: mode,
  departureAt: predictionDeparture,
);

ModelRoutePrediction predictionFor(RoutePredictionQuery query) {
  final body = query.origin == forestOrigin
      ? forestPredictionJson(query.mode)
      : predictionJson(query.mode);
  if (query.departureAt != null) {
    body['evaluatedAt'] = query.departureAt!.toUtc().toIso8601String();
  }
  return const ModelRoutePredictionMapper().toResult(
    ModelRoutePredictionResponseDto.fromJson(body),
    query,
  );
}

class FakePredictionRepository implements RoutePredictionRepository {
  final queries = <RoutePredictionQuery>[];
  int cancellations = 0;
  int coverageRequests = 0;
  int coverageCancellations = 0;
  Result<PredictionCoverage>? coverageResponse;
  Future<Result<PredictionCoverage>>? pendingCoverage;
  Result<ModelRoutePrediction>? response;
  Future<Result<ModelRoutePrediction>>? pending;
  Future<Result<ModelRoutePrediction>> Function(RoutePredictionQuery query)?
  handler;

  @override
  Future<Result<ModelRoutePrediction>> search(RoutePredictionQuery query) {
    queries.add(query);
    if (handler != null) return handler!(query);
    return pending ??
        Future.value(response ?? Result.success(predictionFor(query)));
  }

  @override
  void cancelSearch() => cancellations++;

  @override
  Future<Result<PredictionCoverage>> coverage() {
    coverageRequests++;
    return pendingCoverage ??
        Future.value(coverageResponse ?? Result.success(sampleCoverage()));
  }

  @override
  void cancelCoverage() => coverageCancellations++;
}
