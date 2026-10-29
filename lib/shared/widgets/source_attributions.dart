import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceAttributions extends StatelessWidget {
  const SourceAttributions({super.key, required this.sources});
  final List<String> sources;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [for (final source in sources.toSet()) _source(context, source)],
  );
  Widget _source(BuildContext context, String source) {
    final lines = source.split('\n');
    final uri = Uri.tryParse(lines.last);
    if (uri == null ||
        !{'http', 'https'}.contains(uri.scheme) ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty) {
      return SelectableText(
        source,
        style: Theme.of(context).textTheme.bodySmall,
      );
    }
    return TextButton(
      onPressed: () async {
        var opened = false;
        try {
          opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
        } catch (_) {
          /* Keep attribution readable. */
        }
        if (!opened && context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('링크를 열지 못했어요.')));
        }
      },
      child: Text(
        lines.length > 1
            ? lines.take(lines.length - 1).join('\n')
            : uri.toString(),
      ),
    );
  }
}
