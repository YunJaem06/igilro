import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/config/app_config.dart';
import '../../core/network/dio_client.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) {
  throw StateError('appConfigProvider must be overridden in bootstrap.');
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final instance = createDio(ref.watch(appConfigProvider));
  ref.onDispose(() => instance.close(force: true));
  return instance;
}

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) => DioClient(ref.watch(dioProvider));
