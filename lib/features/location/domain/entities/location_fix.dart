import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/geo/geo_coordinate.dart';

part 'location_fix.freezed.dart';

@freezed
abstract class LocationFix with _$LocationFix {
  const factory LocationFix({
    required GeoCoordinate coordinate,
    required double accuracyMeters,
    required DateTime capturedAt,
  }) = _LocationFix;
}
