enum AppEnvironment { development, staging, production }

final class AppConfig {
  const AppConfig._({required this.environment, required this.apiBaseUri});

  factory AppConfig.fromEnvironment() {
    const isRelease = bool.fromEnvironment('dart.vm.product');
    const environment = String.fromEnvironment(
      'APP_ENV',
      defaultValue: isRelease ? 'production' : 'development',
    );
    const apiBaseUrl = String.fromEnvironment('API_BASE_URL');

    return AppConfig.fromValues(
      environment: environment,
      apiBaseUrl: apiBaseUrl,
    );
  }

  factory AppConfig.fromValues({
    required String environment,
    required String apiBaseUrl,
  }) {
    final appEnvironment = switch (environment) {
      'development' => AppEnvironment.development,
      'staging' => AppEnvironment.staging,
      'production' => AppEnvironment.production,
      _ => throw ArgumentError.value(
        environment,
        'environment',
        'Unknown environment',
      ),
    };
    final configuredUrl = apiBaseUrl.trim();
    final url =
        configuredUrl.isEmpty && appEnvironment == AppEnvironment.development
        ? 'http://localhost:8080'
        : configuredUrl;
    final uri = Uri.tryParse(url);

    if (uri == null ||
        !uri.hasAuthority ||
        uri.host.isEmpty ||
        !{'http', 'https'}.contains(uri.scheme) ||
        uri.port < 1 ||
        uri.port > 65535 ||
        uri.userInfo.isNotEmpty ||
        uri.hasQuery ||
        uri.hasFragment ||
        !{'', '/'}.contains(uri.path)) {
      throw ArgumentError.value(
        apiBaseUrl,
        'apiBaseUrl',
        'Expected an HTTP(S) server origin',
      );
    }
    if (appEnvironment != AppEnvironment.development && uri.scheme != 'https') {
      throw ArgumentError.value(
        apiBaseUrl,
        'apiBaseUrl',
        'HTTPS is required outside development',
      );
    }

    return AppConfig._(
      environment: appEnvironment,
      apiBaseUri: uri.replace(path: ''),
    );
  }

  final AppEnvironment environment;
  final Uri apiBaseUri;
}
