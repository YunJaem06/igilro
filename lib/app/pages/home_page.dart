import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('이길로')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.route_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                    semanticLabel: '이길로',
                  ),
                  const SizedBox(height: 24),
                  Text('나에게 맞는 길, 이길로', style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(
                    '그늘과 햇빛, 주변 환경까지.\n원하는 길을 골라 걸어요.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
