import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/config/app_config.dart';

void main() {
  test('development can start without a server configuration', () {
    final config = AppConfig.fromValues(
      environment: 'development',
      apiBaseUrl: '',
    );

    expect(config.environment, AppEnvironment.development);
    expect(config.apiBaseUri.toString(), 'http://localhost:8080');
  });

  test('accepts the Android emulator host and normalizes a trailing slash', () {
    final config = AppConfig.fromValues(
      environment: 'development',
      apiBaseUrl: ' http://10.0.2.2:8080/ ',
    );

    expect(config.apiBaseUri.toString(), 'http://10.0.2.2:8080');
  });

  test('accepts an explicit HTTPS production origin', () {
    final config = AppConfig.fromValues(
      environment: 'production',
      apiBaseUrl: 'https://api.example.com',
    );

    expect(config.environment, AppEnvironment.production);
    expect(config.apiBaseUri.scheme, 'https');
  });

  for (final environment in ['staging', 'production']) {
    for (final url in ['', 'http://api.example.com']) {
      test('$environment rejects an unset or insecure server origin: $url', () {
        expect(
          () => AppConfig.fromValues(environment: environment, apiBaseUrl: url),
          throwsArgumentError,
        );
      });
    }
  }

  for (final url in [
    'not-a-url',
    '/api/v1',
    'ftp://localhost:8080',
    'https://user:password@example.com',
    'https://example.com/api/v1',
    'https://example.com?token=value',
    'https://example.com#fragment',
    'http://localhost:0',
    'http://localhost:65536',
  ]) {
    test('rejects a non-origin server configuration: $url', () {
      expect(
        () => AppConfig.fromValues(environment: 'development', apiBaseUrl: url),
        throwsArgumentError,
      );
    });
  }

  test(
    'rejects an unknown environment instead of silently using development',
    () {
      expect(
        () => AppConfig.fromValues(
          environment: 'prod',
          apiBaseUrl: 'https://example.com',
        ),
        throwsArgumentError,
      );
    },
  );
}
