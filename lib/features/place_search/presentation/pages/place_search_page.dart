import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../../../shared/widgets/source_attributions.dart';
import '../../domain/entities/place.dart';
import '../providers/place_search_notifier.dart';

class PlaceSearchPage extends ConsumerStatefulWidget {
  const PlaceSearchPage({
    super.key,
    required this.endpointLabel,
    required this.onSelected,
    required this.onClose,
    this.onSelectOnMap,
  });

  final String endpointLabel;
  final ValueChanged<Place> onSelected;
  final VoidCallback onClose;
  final VoidCallback? onSelectOnMap;

  @override
  ConsumerState<PlaceSearchPage> createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends ConsumerState<PlaceSearchPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onEditingChanged);
  }

  void _onEditingChanged() {
    final value = _controller.value;
    ref
        .read(placeSearchProvider.notifier)
        .updateQuery(
          value.text,
          composing: value.composing.isValid && !value.composing.isCollapsed,
        );
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onEditingChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(placeSearchProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: '장소 검색 닫기',
          icon: const Icon(Icons.close_rounded),
          onPressed: widget.onClose,
        ),
        title: Text('${widget.endpointLabel} 검색'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: TextField(
                key: const Key('place-search-input'),
                controller: _controller,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  labelText: '장소명 또는 주소',
                  hintText: '예: 서울숲',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _controller.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: '검색어 지우기',
                          onPressed: _controller.clear,
                          icon: const Icon(Icons.close_rounded),
                        ),
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  final notifier = ref.read(placeSearchProvider.notifier);
                  notifier.updateQuery(_controller.text);
                  unawaited(notifier.search());
                },
              ),
            ),
            Expanded(
              child: result.when(
                skipLoadingOnRefresh: false,
                skipLoadingOnReload: false,
                loading: () =>
                    const _SearchMessage(message: '장소를 찾고 있어요.', loading: true),
                error: (error, _) => _SearchMessage(
                  message: _errorMessage(error),
                  onRetry: () =>
                      ref.read(placeSearchProvider.notifier).search(),
                ),
                data: (places) {
                  if (places == null) {
                    return const _SearchMessage(message: '장소명이나 주소를 입력해 주세요.');
                  }
                  if (places.isEmpty) {
                    return const _SearchMessage(
                      message: '검색 결과가 없어요. 다른 장소명이나 주소로 검색해 주세요.',
                    );
                  }
                  return ListView.separated(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: places.length + 1,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      if (index == places.length) {
                        return SourceAttributions(
                          sources: places
                              .expand((place) => place.attributions)
                              .toSet()
                              .toList(),
                        );
                      }
                      final place = places[index];
                      return ListTile(
                        leading: const Icon(Icons.place_outlined),
                        title: Text(place.name),
                        subtitle: Text(
                          place.address.isEmpty ? '주소 정보 없음' : place.address,
                        ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => widget.onSelected(place),
                      );
                    },
                  );
                },
              ),
            ),
            if (widget.onSelectOnMap != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton.icon(
                  onPressed: widget.onSelectOnMap,
                  icon: const Icon(Icons.map_outlined),
                  label: const Text('지도에서 선택'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchMessage extends StatelessWidget {
  const _SearchMessage({
    required this.message,
    this.loading = false,
    this.onRetry,
  });

  final String message;
  final bool loading;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => ListView(
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    padding: const EdgeInsets.all(24),
    children: [
      if (loading)
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CircularProgressIndicator(),
          ),
        ),
      Text(message, textAlign: TextAlign.center),
      if (onRetry != null)
        Center(
          child: TextButton(onPressed: onRetry, child: const Text('다시 검색')),
        ),
    ],
  );
}

String _errorMessage(Object error) {
  if (error is! Failure) return '장소를 검색하지 못했어요. 다시 시도해 주세요.';
  return switch (error.type) {
    FailureType.network => '서버에 연결할 수 없어요. 네트워크 연결을 확인해 주세요.',
    FailureType.timeout => '검색 응답이 늦어지고 있어요. 다시 시도해 주세요.',
    FailureType.notFound => '장소 검색 서비스를 아직 사용할 수 없어요. 지도에서 위치를 선택해 주세요.',
    FailureType.rateLimited => '검색 요청이 많아요. 잠시 후 다시 시도해 주세요.',
    FailureType.validation => '검색어를 확인하고 다시 입력해 주세요.',
    FailureType.invalidData => '장소 정보를 읽지 못했어요. 다시 시도해 주세요.',
    _ => '장소 검색 서비스를 이용할 수 없어요. 잠시 후 다시 시도해 주세요.',
  };
}
