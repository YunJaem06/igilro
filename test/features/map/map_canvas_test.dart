import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/features/map/presentation/providers/map_notifier.dart';
import 'package:igilro/features/map/presentation/state/map_state.dart';
import 'package:igilro/features/map/presentation/widgets/map_canvas.dart';

void main() {
  testWidgets('map failure presents retry and creates a new loading session', (
    tester,
  ) async {
    final container = ProviderContainer(
      overrides: [mapConfiguredProvider.overrideWithValue(true)],
    );
    addTearDown(container.dispose);
    final sessions = <int>[];
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: MapCanvas(
              surfaceBuilder: (state, markers, onTap, ready, failure) {
                sessions.add(state.session);
                return const ColoredBox(color: Colors.green);
              },
            ),
          ),
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    container.read(mapProvider.notifier).markFailed();
    await tester.pump();
    await tester.tap(find.text('지도 다시 불러오기'));
    await tester.pump();
    expect(sessions.last, 1);
    expect(container.read(mapProvider).status, MapLoadStatus.loading);
    container.read(mapProvider.notifier).markReady();
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('지도 다시 불러오기'), findsNothing);
  });
}
