import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'package:igilro/app/bootstrap.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/map/presentation/state/map_overlays.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/guidance_steps_sheet.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/domain/entities/route_guidance.dart';
import 'package:igilro/features/route_search/presentation/providers/prediction_coverage_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_comparison_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';

// Runs the production bootstrap and real server. No fake repositories or HTTP
// responses; preview is the app's explicitly labeled virtual traversal.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'live model coverage, comparison and server guidance reach the home UI',
    (tester) async {
      bootstrap();
      await tester.pump();
      final container = ProviderScope.containerOf(
        tester.element(find.byType(HomePage)),
      );
      await _waitUntil(
        tester,
        () =>
            container.read(mapProvider).status != MapLoadStatus.loading &&
            !container.read(predictionCoverageProvider).isLoading,
      );
      expect(container.read(mapProvider).status, MapLoadStatus.ready);
      expect(find.byType(MapWidget), findsOneWidget);
      final coverage = container.read(predictionCoverageProvider);
      expect(coverage.hasError, false, reason: '${coverage.error}');
      expect(coverage.requireValue.walkingNetwork, isNotEmpty);
      expect(coverage.requireValue.accessPoints, isNotEmpty);
      expect(find.text('범위 다시 불러오기'), findsNothing);

      await _tap(tester, find.byTooltip('더보기'));
      await tester.pump(const Duration(milliseconds: 400));
      await _tap(tester, find.text('테스트 경로'));
      await _waitUntil(
        tester,
        () => !container.read(routeComparisonProvider).isLoading,
      );
      final comparison = container.read(routeComparisonProvider);
      expect(comparison.hasError, false, reason: '${comparison.error}');
      final pair = comparison.requireValue!;
      expect(pair.fastest.dataVersion, coverage.requireValue.dataVersion);
      expect(
        pair.shade.predictionDataVersion,
        coverage.requireValue.predictionDataVersion,
      );
      for (final mode in [
        RoutePredictionMode.shade,
        RoutePredictionMode.fastest,
      ]) {
        final prediction = pair.forMode(mode);
        final route = prediction.routes.single;
        expect(route.shadeSegments, isNotEmpty);
        expect(route.guidance?.status, RouteGuidanceStatus.available);
        expect(route.guidance!.steps.length, greaterThanOrEqualTo(2));
        await _tap(
          tester,
          find.text(mode == RoutePredictionMode.shade ? '그늘 많은 길' : '빠른 길'),
        );
        expect(container.read(routePredictionOptionsProvider).mode, mode);
        await _tap(tester, find.text('전체 길안내'));
        await tester.pump(const Duration(milliseconds: 400));
        final inspectIndex = route.guidance!.steps.length ~/ 2;
        final tile = find.byKey(ValueKey('guidance-step-$inspectIndex'));
        await tester.scrollUntilVisible(
          tile,
          200,
          scrollable: find.descendant(
            of: find.byKey(const Key('guidance-steps-list')),
            matching: find.byType(Scrollable),
          ),
        );
        await tester.pump(const Duration(milliseconds: 100));
        final gpsBefore = container.read(mapProvider).currentLocation;
        await _tap(tester, tile);
        await tester.pump(const Duration(seconds: 1));
        expect(find.byType(GuidanceStepsSheet), findsNothing);
        expect(
          container.read(mapProvider).center,
          route.guidance!.steps[inspectIndex].coordinate,
        );
        expect(container.read(mapProvider).currentLocation, gpsBefore);
        expect(
          tester
              .widget<MapCanvas>(find.byType(MapCanvas))
              .guidancePoints
              .single
              .role,
          MapGuidancePointRole.selected,
        );
        await _tap(tester, find.byTooltip('전체 경로 보기'));
        expect(
          tester.widget<MapCanvas>(find.byType(MapCanvas)).guidancePoints,
          isEmpty,
        );
        await _tap(tester, find.text('미리보기'));
        final navigation = container.read(navigationProvider);
        expect(navigation.isPreview, true);
        expect(navigation.route!.guidance, route.guidance);
        expect(navigation.instruction, isNotNull);
        expect(
          tester.widget<MapCanvas>(find.byType(MapCanvas)).guidancePoints,
          hasLength(2),
        );
        expect(find.text('경로 미리보기 · 가상 이동'), findsOneWidget);
        expect(
          find.text(navigation.instruction!.step.instruction),
          findsOneWidget,
        );
        debugPrint(
          'IGILRO_MODEL_${mode.name.toUpperCase()} distance=${route.distanceMeters} shade=${route.prediction.modeledShadeRatio} guidanceSteps=${route.guidance!.steps.length}',
        );
        await tester.pump(const Duration(seconds: 1));
        await _tap(tester, find.text('안내 종료'));
        expect(container.read(navigationProvider).active, false);
      }
      expect(tester.takeException(), isNull);
    },
  );
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

Future<void> _waitUntil(WidgetTester tester, bool Function() complete) async {
  final deadline = DateTime.now().add(const Duration(seconds: 45));
  while (!complete() && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  expect(
    complete(),
    true,
    reason: 'Live model request or map did not complete.',
  );
}
