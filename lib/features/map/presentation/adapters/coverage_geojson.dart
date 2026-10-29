import 'dart:convert';

import '../../../../core/geo/geo_coordinate.dart';
import '../state/map_overlays.dart';

/// Small serialisation boundary for the SDK; no server DTOs enter the map.
String coverageGeoJson(MapCoverage? coverage) => jsonEncode({
  'type': 'FeatureCollection',
  'features': [
    if (coverage != null) ...[
      {
        'type': 'Feature',
        'id': 'bounds',
        'properties': {'kind': 'bounds'},
        'geometry': {
          'type': 'Polygon',
          'coordinates': [
            [
              ...coverage.boundary.map(_position),
              _position(coverage.boundary.first),
            ],
          ],
        },
      },
      {
        'type': 'Feature',
        'id': 'network',
        'properties': {'kind': 'network'},
        'geometry': {
          'type': 'MultiLineString',
          'coordinates': coverage.walkingNetwork
              .map((line) => line.map(_position).toList())
              .toList(),
        },
      },
    ],
  ],
});

List<double> _position(GeoCoordinate point) => [
  point.longitude,
  point.latitude,
];
