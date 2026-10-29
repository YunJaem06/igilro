import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/core/geo/geo_coordinate.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';
import 'package:igilro/features/navigation/presentation/navigation_notifier.dart';
import 'package:igilro/features/route_search/domain/entities/model_route_prediction.dart';
import 'package:igilro/features/route_search/presentation/providers/route_prediction_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_comparison_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_providers.dart';
import 'package:igilro/features/route_search/presentation/providers/route_selection_notifier.dart';
import 'package:igilro/features/route_search/presentation/state/route_selection_state.dart';

import '../helpers/fake_location_repository.dart';
import '../helpers/fake_prediction_repository.dart';
import '../helpers/fake_route_repository.dart';

void main() {
  late ProviderContainer container;
  late FakePredictionRepository repository;
  late List<GeoCoordinate> visiblePath;
  setUp(() {
    repository = FakePredictionRepository();
    container = ProviderContainer(
      overrides: [
        mapConfiguredProvider.overrideWithValue(true),
        routePredictionRepositoryProvider.overrideWithValue(repository),
        routeRepositoryProvider.overrideWithValue(FakeRouteRepository()),
        locationRepositoryProvider.overrideWithValue(FakeLocationRepository()),
      ],
    );
    container.listen(routeSelectionProvider, (_, _) {});
    container.listen(mapProvider, (_, _) {});
    container.read(mapProvider.notifier).markReady();
    final select = container.read(routeSelectionProvider.notifier);
    select.useCurrentLocation(predictionOrigin);
    select.beginSelection(RouteEndpoint.destination);
    select.preview(predictionDestination);
    select.confirmSelection();
    visiblePath = [];
    addTearDown(container.dispose);
  });
  Future<void> tap(WidgetTester tester, String label) async {
    await tester.ensureVisible(find.text(label));
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  Future<void> mount(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: HomePage(
            mapSurfaceBuilder: (state, markers, path, onTap, ready, failed) {
              visiblePath = path;
              return const ColoredBox(color: Colors.green);
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tap(tester, '그늘길');
    container
        .read(routePredictionOptionsProvider.notifier)
        .setDepartureAt(predictionDeparture);
    await tester.pumpAndSettle();
  }

  testWidgets(
    'two comparable cards preserve paths and hide diagnostics until requested',
    (tester) async {
      await mount(tester);
      await tap(tester, '그늘길 비교');
      expect(repository.queries, [
        predictionQuery(RoutePredictionMode.fastest),
        predictionQuery(),
      ]);
      expect(find.text('예측 그늘 68.6%'), findsOneWidget);
      expect(find.text('예측 그늘 64.0%'), findsOneWidget);
      expect(find.text('실제 그늘 검증: 미검증'), findsNothing);
      expect(find.textContaining('VWorld public'), findsNothing);
      expect(find.text('안내 시작'), findsOneWidget);
      expect(visiblePath, predictionFor(predictionQuery()).routes.first.path);
      expect(
        container.read(mapProvider).framedCoordinates,
        containsAll(
          predictionFor(predictionQuery(RoutePredictionMode.fastest))
              .routes
              .first
              .path,
        ),
      );
      await tap(tester, '빠른 길');
      expect(repository.queries.length, 2);
      expect(visiblePath.length, 14);
      await tap(tester, '상세 보기');
      expect(find.text('실제 그늘 검증: 미검증'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.textContaining('VWorld public'),
        150,
        scrollable: find
            .descendant(
              of: find.byType(BottomSheet),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      expect(find.textContaining('VWorld public'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('개발 진단'),
        150,
        scrollable: find
            .descendant(
              of: find.byType(BottomSheet),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      expect(find.text('개발 진단'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('clearing input removes comparison and line', (tester) async {
    await mount(tester);
    await tap(tester, '그늘길 비교');
    await tester.tap(find.byTooltip('출발지 선택 지우기'));
    await tester.pumpAndSettle();
    expect(visiblePath, isEmpty);
    expect(container.read(routeComparisonProvider).asData?.value, isNull);
    expect(find.text('안내 시작'), findsNothing);
  });

  testWidgets(
    'changing cards after a current-time search preserves the comparison',
    (tester) async {
      await mount(tester);
      container
          .read(routePredictionOptionsProvider.notifier)
          .setDepartureAt(null);
      await tester.pumpAndSettle();
      await tap(tester, '그늘길 비교');
      expect(container.read(routeComparisonProvider).asData?.value, isNotNull);
      await tap(tester, '빠른 길');
      expect(repository.queries.length, 2);
      expect(container.read(routeComparisonProvider).asData?.value, isNotNull);
      expect(visiblePath.length, 14);
    },
  );
  testWidgets('late comparison cannot reappear after input changes', (
    tester,
  ) async {
    await mount(tester);
    final pending = Completer<Result<ModelRoutePrediction>>();
    repository.pending = pending.future;
    await tester.tap(find.text('그늘길 비교'));
    await tester.pump();
    container.read(routeSelectionProvider.notifier).clear(RouteEndpoint.origin);
    await tester.pumpAndSettle();
    pending.complete(
      Result.success(
        predictionFor(predictionQuery(RoutePredictionMode.fastest)),
      ),
    );
    await tester.pumpAndSettle();
    expect(visiblePath, isEmpty);
    expect(repository.queries.length, 1);
  });
  testWidgets('area errors use app wording and allow retry', (tester) async {
    await mount(tester);
    repository.response = const Result.failure(
      Failure(type: FailureType.server, code: 'OUTSIDE_SUPPORTED_AREA'),
    );
    await tap(tester, '그늘길 비교');
    expect(find.textContaining('현재 지원하는 서울숲'), findsOneWidget);
    expect(find.text('안내 시작'), findsNothing);
    repository.response = null;
    await tap(tester, '다시 검색');
    expect(find.text('예측 그늘 68.6%'), findsOneWidget);
  });
  testWidgets('explicit preview stops and removes its virtual location', (
    tester,
  ) async {
    await mount(tester);
    await tap(tester, '그늘길 비교');
    await tester.tap(find.text('미리보기'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('경로 미리보기 · 가상 이동'), findsOneWidget);
    expect(container.read(navigationProvider).isPreview, true);
    expect(container.read(mapProvider).followLocation, true);
    expect(container.read(mapProvider).currentLocation, isNotNull);
    await tester.tap(find.byType(MapCanvas));
    await tester.pump();
    final panned = container.read(mapProvider);
    await tester.pump(const Duration(milliseconds: 500));
    expect(container.read(mapProvider).followLocation, false);
    expect(container.read(mapProvider).cameraRevision, panned.cameraRevision);
    expect(
      container.read(mapProvider).currentLocation,
      isNot(panned.currentLocation),
    );
    await tester.ensureVisible(find.text('안내 종료'));
    await tester.tap(find.text('안내 종료'));
    await tester.pumpAndSettle();
    expect(container.read(navigationProvider).active, false);
    expect(container.read(mapProvider).currentLocation, isNull);
    expect(find.text('안내 시작'), findsOneWidget);
  });
  testWidgets('sample menu searches both routes at the verified instant', (
    tester,
  ) async {
    await mount(tester);
    await tester.tap(find.byTooltip('더보기'));
    await tester.pumpAndSettle();
    await tap(tester, '테스트 경로');
    expect(repository.queries, [
      predictionQuery(RoutePredictionMode.fastest)
          .copyWith(origin: forestOrigin, destination: forestDestination),
      predictionQuery().copyWith(
        origin: forestOrigin,
        destination: forestDestination,
      ),
    ]);
    expect(find.text('예측 그늘 54.6%'), findsOneWidget);
  });
  testWidgets('3D toggles preserve the selected route', (tester) async {
    await mount(tester);
    await tap(tester, '그늘길 비교');
    final before = visiblePath;
    await tester.tap(find.byTooltip('2D로 보기'));
    await tester.pumpAndSettle();
    expect(container.read(mapProvider).is3D, false);
    expect(visiblePath, before);
    await tester.tap(find.byTooltip('3D로 보기'));
    await tester.pumpAndSettle();
    expect(container.read(mapProvider).is3D, true);
  });
  testWidgets('cards remain scrollable with large text on a short screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.5;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await mount(tester);
    await tap(tester, '그늘길 비교');
    expect(tester.takeException(), isNull);
  });
}
