import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/failure.dart';
import '../../features/navigation/presentation/navigation_notifier.dart';
import '../../features/route_search/presentation/providers/route_search_cooldown_notifier.dart';
import '../../features/route_search/presentation/widgets/route_explorer_panel.dart';
import 'navigation_reroute_notifier.dart';

class NavigationReroutePanel extends ConsumerWidget {
  const NavigationReroutePanel({super.key, required this.error});

  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final failure = error;
    final retrySeconds = ref.watch(routeSearchCooldownProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          failure == null ? '새 경로를 찾고 있어요' : '새 경로를 찾지 못했어요',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        if (failure == null)
          const LinearProgressIndicator()
        else
          Text(switch (failure) {
            Failure(
              type: FailureType.permissionDenied ||
                  FailureType.permissionDeniedForever,
            ) =>
              '위치 권한을 허용해 주세요.',
            Failure(type: FailureType.serviceDisabled) => '기기의 위치 서비스를 켜 주세요.',
            Failure(code: 'REROUTE_WEAK_GPS') =>
              '현재 위치를 확인할 수 있도록 GPS 신호를 확인해 주세요.',
            Failure(code: 'REROUTE_LOCATION_UNAVAILABLE') =>
              '현재 위치를 확인하지 못했어요. 위치 서비스와 GPS 신호를 확인해 주세요.',
            _ => routeErrorMessage(failure),
          }),
        const SizedBox(height: 8),
        if (failure != null)
          FilledButton(
            onPressed: retrySeconds == 0
                ? ref.read(navigationRerouteProvider.notifier).reroute
                : null,
            child: Text(retrySeconds > 0 ? '$retrySeconds초 후 다시 검색' : '다시 시도'),
          ),
        TextButton(
          onPressed: ref.read(navigationProvider.notifier).stop,
          child: const Text('안내 종료'),
        ),
      ],
    );
  }
}
