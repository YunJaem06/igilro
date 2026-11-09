import 'dart:convert';
import 'dart:io';

import 'package:igilro/features/route_search/data/dto/model_route_prediction_dto.dart';
import 'package:igilro/features/route_search/data/dto/route_search_response_dto.dart';
import 'package:igilro/features/route_search/data/mappers/model_route_prediction_mapper.dart';
import 'package:igilro/features/route_search/data/mappers/route_mapper.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_query.dart';
import 'package:igilro/features/route_search/domain/entities/route_search_result.dart';

import 'fake_prediction_repository.dart';

Map<String, dynamic> _body(String name) => jsonDecode(
  File('test/fixtures/walking_guidance_$name.json').readAsStringSync(),
) as Map<String, dynamic>;

RouteSearchResult walkingGuidanceResult() {
  final json = _body('general');
  return const RouteMapper().toResult(
    RouteSearchResponseDto.fromJson(json),
    RouteQuery(
      origin: forestOrigin,
      destination: forestDestination,
      departureAt: DateTime.parse(json['evaluatedAt'] as String),
    ),
  );
}

ModelRoutePrediction walkingPrediction(RoutePredictionQuery query) {
  final fixtureMode = query.mode == RoutePredictionMode.sunlight
      ? RoutePredictionMode.shade
      : query.mode;
  final body = _body(fixtureMode.name);
  body['routes'][0]['mode'] = query.mode.name;
  return const ModelRoutePredictionMapper().toResult(
    ModelRoutePredictionResponseDto.fromJson(body),
    query,
  );
}
