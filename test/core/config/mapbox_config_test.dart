import 'package:flutter_test/flutter_test.dart';
import 'package:igilro/core/config/app_config.dart';

void main() {
  test('optional public Mapbox configuration is trimmed', () {
    expect(
      AppConfig.fromValues(
        environment: 'development',
        apiBaseUrl: '',
      ).mapboxAccessToken,
      isEmpty,
    );
    expect(
      AppConfig.fromValues(
        environment: 'development',
        apiBaseUrl: '',
        mapboxAccessToken: ' pk.test.signature ',
      ).mapboxAccessToken,
      'pk.test.signature',
    );
  });

  test('secret tokens and invalid token formats never reach the app', () {
    for (final token in [
      'sk.test.signature',
      'pk.invalid',
      'pk..',
      'invalid',
    ]) {
      expect(
        () => AppConfig.fromValues(
          environment: 'development',
          apiBaseUrl: '',
          mapboxAccessToken: token,
        ),
        throwsArgumentError,
      );
    }
  });
}
