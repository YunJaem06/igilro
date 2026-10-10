import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class RouterErrorPage extends StatelessWidget {
  const RouterErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이길로')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('페이지를 찾을 수 없어요.'),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => context.goNamed(AppRoutes.home.name),
                  child: const Text('처음으로'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
