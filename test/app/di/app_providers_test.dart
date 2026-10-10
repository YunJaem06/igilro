import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/app/di/app_providers.dart';
import 'package:igilro/core/config/app_config.dart';

import '../../helpers/fake_http_client_adapter.dart';

void main() {
  test(
    'config overrides reach the client and container disposal closes Dio',
    () async {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            AppConfig.fromValues(
              environment: 'development',
              apiBaseUrl: 'http://localhost:9090',
            ),
          ),
        ],
      );
      final adapter = FakeHttpClientAdapter(
        (options) => jsonResponse('{"status":"UP"}'),
      );
      try {
        container.read(dioProvider).httpClientAdapter = adapter;
        final response = await container
            .read(dioClientProvider)
            .get<Map<String, dynamic>>('/actuator/health');
        expect(response.data, {'status': 'UP'});
        expect(adapter.requests.single.uri.port, 9090);
      } finally {
        container.dispose();
      }
      expect(adapter.isClosed, isTrue);
    },
  );
}
