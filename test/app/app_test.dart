import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/app.dart';
import 'package:igilro/app/router/app_router.dart';

void main() {
  testWidgets('the app opens its Korean home screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: IgilroApp()));
    await tester.pumpAndSettle();

    expect(find.text('이길로'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('an unknown route can return to the home screen', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const IgilroApp()),
    );
    await tester.pumpAndSettle();

    container.read(appRouterProvider).go('/unknown');
    await tester.pumpAndSettle();
    expect(find.text('페이지를 찾을 수 없어요.'), findsOneWidget);

    await tester.tap(find.text('처음으로'));
    await tester.pumpAndSettle();
    expect(find.text('이길로'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('home remains readable on a small screen with large text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(const ProviderScope(child: IgilroApp()));
    await tester.pumpAndSettle();

    expect(find.text('이길로'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('route recovery works on a short screen with large text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 240);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const IgilroApp()),
    );
    await tester.pumpAndSettle();
    container.read(appRouterProvider).go('/unknown');
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('처음으로'));
    await tester.tap(find.text('처음으로'));
    await tester.pumpAndSettle();
    expect(find.text('이길로'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
