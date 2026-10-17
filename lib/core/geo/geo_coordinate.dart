import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_coordinate.freezed.dart';

/// Geographic coordinates independent of Mapbox and platform location types.
@freezed
abstract class GeoCoordinate with _$GeoCoordinate {
  @Assert('latitude >= -90 && latitude <= 90')
  @Assert('longitude >= -180 && longitude <= 180')
  const factory GeoCoordinate({
    required double latitude,
    required double longitude,
  }) = _GeoCoordinate;
}
