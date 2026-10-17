import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/error/result.dart';
import 'package:igilro/features/location/domain/entities/location_access.dart';
import 'package:igilro/features/location/domain/entities/location_fix.dart';
import 'package:igilro/features/location/presentation/providers/location_providers.dart';
import 'package:igilro/features/location/presentation/widgets/current_location_control.dart';

import '../../../helpers/fake_location_repository.dart';

void main() {
  testWidgets(
    'location button disables while loading and delivers the fix to composition',
    (tester) async {
      final repository = FakeLocationRepository();
      final completion = Completer<Result<LocationFix>>();
      repository.pendingLocation = completion.future;
      final delivered = <LocationFix>[];
      await tester.pumpWidget(
        ProviderScope(
          overrides: [locationRepositoryProvider.overrideWithValue(repository)],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentLocationControl(onLocated: delivered.add),
            ),
          ),
        ),
      );
      expect(repository.calls, isEmpty);
      await tester.tap(find.text('현재 위치'));
      await tester.pump();
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      completion.complete(Result.success(sampleLocation));
      await tester.pumpAndSettle();
      expect(delivered, [sampleLocation]);
      expect(find.text('현재 위치 · 정확도 약 12m'), findsOneWidget);
    },
  );

  testWidgets(
    'permanent denial opens settings and reacquires after returning',
    (tester) async {
      final repository = FakeLocationRepository()
        ..permission = const Result.success(LocationAccess.deniedForever);
      final delivered = <LocationFix>[];
      await tester.pumpWidget(
        ProviderScope(
          overrides: [locationRepositoryProvider.overrideWithValue(repository)],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentLocationControl(onLocated: delivered.add),
            ),
          ),
        ),
      );
      await tester.tap(find.text('현재 위치'));
      await tester.pumpAndSettle();
      expect(find.text('설정에서 이길로의 위치 접근을 허용해 주세요.'), findsOneWidget);
      await tester.tap(find.text('설정 열기'));
      await tester.pumpAndSettle();
      expect(repository.calls.last, 'settings:application');
      repository.permission = const Result.success(LocationAccess.granted);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();
      expect(delivered, [sampleLocation]);
    },
  );
}
