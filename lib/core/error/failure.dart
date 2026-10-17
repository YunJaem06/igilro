import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

enum FailureType {
  network,
  timeout,
  cancelled,
  secureConnection,
  validation,
  unauthorized,
  forbidden,
  notFound,
  rateLimited,
  server,
  invalidData,
  permissionDenied,
  permissionDeniedForever,
  serviceDisabled,
  unexpected,
}

@freezed
abstract class Failure with _$Failure implements Exception {
  const factory Failure({
    required FailureType type,
    String? code,
    String? requestId,
  }) = _Failure;
}
