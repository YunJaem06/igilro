import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/pages/home_page.dart';
import 'package:igilro/core/error/failure.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/route_search/presentation/providers/route_search_kind_notifier.dart';

import '../helpers/fake_location_repository.dart';

void main() {
  for (final succeeds in [true, false]) {
    testWidgets(
      'home location button retains a delayed ${succeeds ? 'fix' : 'failure'} without an open picker',
      (tester) async {
        final pending = Completer<Result<LocationFix>>();
        final repository = FakeLocationRepository()
          ..pendingLocation = pending.future;
        final container = ProviderContainer(
          overrides: [
            mapConfiguredProvider.overrideWithValue(true),
            locationRepositoryProvider.overrideWithValue(repository),
            routeSearchKindProvider.overrideWith(_GeneralSearchKind.new),
          ],
        );
        addTearDown(container.dispose);
        container.listen(mapProvider, (_, _) {});
        container.read(mapProvider.notifier).markReady();
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: HomePage(
                mapSurfaceBuilder: (
                  state,
                  markers,
                  path,
                  onTap,
                  ready,
                  failed,
                ) => const ColoredBox(color: Colors.green),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final button = find.byWidgetPredicate(
          (widget) =>
              widget is FloatingActionButton && widget.tooltip == '현재 위치 보기',
        );
        await tester.tap(button);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));
        final whileLoading = tester.widget<FloatingActionButton>(button);
        expect(
          repository.calls.where((call) => call == 'position'),
          hasLength(1),
        );
        pending.complete(
          succeeds
              ? Result.success(sampleLocation)
              : const Result.failure(
                  Failure(type: FailureType.permissionDenied),
                ),
        );
        await tester.pumpAndSettle();

        if (succeeds) {
          expect(container.read(mapProvider).center, sampleLocation.coordinate);
          expect(
            container.read(mapProvider).currentLocation,
            sampleLocation.coordinate,
          );
        } else {
          expect(
            find.text('현재 위치를 확인하지 못했어요. 위치 권한과 GPS를 확인해 주세요.'),
            findsOneWidget,
          );
        }
        expect(whileLoading.onPressed, isNull);
        expect(
          tester.widget<FloatingActionButton>(button).onPressed,
          isNotNull,
        );
        expect(tester.takeException(), isNull);
      },
    );
  }
}

class _GeneralSearchKind extends RouteSearchKindNotifier {
  @override
  RouteSearchKind build() => RouteSearchKind.general;
}
