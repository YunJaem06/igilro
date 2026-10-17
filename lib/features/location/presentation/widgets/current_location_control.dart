import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/location_fix.dart';
import '../providers/location_notifier.dart';

class CurrentLocationControl extends ConsumerStatefulWidget {
  const CurrentLocationControl({
    super.key,
    required this.onLocated,
    this.label = '현재 위치',
    this.initialMessage = '현재 위치를 지도에서 확인해 보세요.',
    this.compact = false,
  });

  final ValueChanged<LocationFix> onLocated;
  final String label;
  final String initialMessage;
  final bool compact;

  @override
  ConsumerState<CurrentLocationControl> createState() =>
      _CurrentLocationControlState();
}

class _CurrentLocationControlState extends ConsumerState<CurrentLocationControl>
    with WidgetsBindingObserver {
  bool _returningFromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _returningFromSettings) {
      _returningFromSettings = false;
      ref.read(locationProvider.notifier).locate();
    }
  }

  Future<void> _openSettings() async {
    _returningFromSettings = true;
    final opened = await ref.read(locationProvider.notifier).openSettings();
    if (!mounted) return;
    if (!opened) {
      _returningFromSettings = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('설정 앱에서 위치 접근을 허용해 주세요.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationProvider);
    ref.listen(locationProvider, (previous, next) {
      if (next case AsyncData<LocationFix?>(:final value) when value != null) {
        widget.onLocated(value);
      }
    });
    final failure = state.error;
    final needsSettings =
        failure is Failure &&
        (failure.type == FailureType.permissionDeniedForever ||
            failure.type == FailureType.serviceDisabled);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!widget.compact || state.hasError || state.value != null) ...[
          Text(
            state.when(
              skipLoadingOnRefresh: false,
              data: (fix) => fix == null
                  ? widget.initialMessage
                  : '현재 위치 · 정확도 약 ${fix.accuracyMeters.round()}m',
              loading: () => '현재 위치를 확인하고 있어요.',
              error: (error, _) => _messageFor(error),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
        ],
        FilledButton.icon(
          onPressed: state.isLoading
              ? null
              : needsSettings
              ? _openSettings
              : ref.read(locationProvider.notifier).locate,
          icon: const Icon(Icons.my_location_rounded),
          label: Text(
            state.isLoading
                ? '위치 확인 중'
                : needsSettings
                ? '설정 열기'
                : widget.label,
          ),
        ),
      ],
    );
  }

  String _messageFor(Object error) => switch (error) {
    Failure(type: FailureType.permissionDenied) =>
      '위치 권한을 허용하면 현재 위치를 볼 수 있어요.',
    Failure(type: FailureType.permissionDeniedForever) =>
      '설정에서 이길로의 위치 접근을 허용해 주세요.',
    Failure(type: FailureType.serviceDisabled) => '기기의 위치 서비스를 켜 주세요.',
    Failure(type: FailureType.timeout) => '위치 확인이 늦어지고 있어요. 다시 시도해 주세요.',
    _ => '위치를 확인하지 못했어요. 다시 시도해 주세요.',
  };

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
