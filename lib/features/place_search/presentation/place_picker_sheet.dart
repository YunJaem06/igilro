import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/error/failure.dart';
import '../../../shared/widgets/source_attributions.dart';
import '../domain/place.dart';
import 'place_search_notifier.dart';

class PlacePickerSheet extends ConsumerStatefulWidget {
  const PlacePickerSheet({
    super.key,
    required this.title,
    required this.onPicked,
    required this.onMap,
    this.currentLocationControl,
  });
  final String title;
  final ValueChanged<Place> onPicked;
  final VoidCallback onMap;
  final Widget? currentLocationControl;
  @override
  ConsumerState<PlacePickerSheet> createState() => _PlacePickerSheetState();
}

class _PlacePickerSheetState extends ConsumerState<PlacePickerSheet> {
  String _query = '';
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_changed);
  }

  void _changed() {
    final value = _controller.value;
    setState(() => _query = value.text.trim());
    ref
        .read(placeSearchProvider.notifier)
        .updateQuery(
          value.text,
          composing: value.composing.isValid && !value.composing.isCollapsed,
        );
  }

  @override
  void dispose() {
    _controller.removeListener(_changed);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentResults = ref.watch(placeSearchProvider);
    final results = _query.isEmpty
        ? const AsyncData<List<Place>?>(null)
        : currentResults;
    final available =
        (MediaQuery.sizeOf(context).height -
                MediaQuery.viewInsetsOf(context).bottom -
                48)
            .clamp(100.0, 1000.0);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          8,
          20,
          MediaQuery.viewInsetsOf(context).bottom + 12,
        ),
        child: SizedBox(
          height: available * 0.78,
          child: ListView(
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                autofocus: true,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: '장소 또는 주소 검색',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
              ),
              const SizedBox(height: 8),
              ?widget.currentLocationControl,
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onMap();
                },
                icon: const Icon(Icons.map_outlined),
                label: const Text('지도에서 선택'),
              ),
              results.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(switch (error) {
                    Failure(code: 'PLACE_SEARCH_NOT_CONFIGURED') =>
                      '장소 검색을 준비하고 있어요. 지도에서 위치를 선택해 주세요.',
                    Failure(type: FailureType.validation) => '검색어를 확인해 주세요.',
                    _ => '장소를 찾지 못했어요. 다시 입력하거나 지도에서 선택해 주세요.',
                  }, textAlign: TextAlign.center),
                ),
                data: (places) => places == null || places.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _query.isEmpty
                              ? '장소명이나 주소를 입력해 주세요.'
                              : '검색 결과가 없어요. 다른 이름으로 검색해 보세요.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Column(
                        children: [
                          for (final place in places)
                            ListTile(
                              leading: const Icon(Icons.place_outlined),
                              title: Text(place.name),
                              subtitle: Text(
                                place.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                widget.onPicked(place);
                              },
                            ),
                          SourceAttributions(
                            sources: places
                                .expand((p) => p.attributions)
                                .toSet()
                                .toList(),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
