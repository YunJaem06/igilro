import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../core/config/app_config.dart';
import '../features/location/presentation/providers/location_providers.dart';
import '../features/map/presentation/providers/map_notifier.dart';
import '../features/route_search/presentation/providers/route_search_providers.dart';
import '../features/route_search/presentation/providers/route_prediction_providers.dart';
import 'app.dart';
import 'di/app_providers.dart';
import 'di/location_dependencies.dart';
import 'di/route_dependencies.dart';
import 'di/route_prediction_dependencies.dart';

void bootstrap() {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig.fromEnvironment();
  if (config.mapboxAccessToken.isNotEmpty) {
    MapboxOptions.setAccessToken(config.mapboxAccessToken);
    MapboxMapsOptions.setLanguage('ko');
  }

  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        mapConfiguredProvider.overrideWithValue(
          config.mapboxAccessToken.isNotEmpty,
        ),
        locationRepositoryProvider.overrideWith(
          (ref) => createLocationRepository(),
        ),
        routeRepositoryProvider.overrideWith((ref) {
          final repository = createRouteRepository(
            ref.watch(dioClientProvider),
          );
          ref.onDispose(repository.cancelSearch);
          return repository;
        }),
        routePredictionRepositoryProvider.overrideWith((ref) {
          final repository = createRoutePredictionRepository(
            ref.watch(dioClientProvider),
          );
          ref.onDispose(repository.cancelSearch);
          ref.onDispose(repository.cancelCoverage);
          return repository;
        }),
      ],
      child: const IgilroApp(),
    ),
  );
}
