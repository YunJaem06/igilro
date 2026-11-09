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
  serverBusy,
  server,
  invalidData,
  permissionDenied,
  permissionDeniedForever,
  serviceDisabled,
  unexpected,
}

@freezed
abstract class Failure with _$Failure implements Exception {
  const Failure._();

  const factory Failure({
    required FailureType type,
    String? code,
    String? requestId,
    Duration? retryAfter,
  }) = _Failure;

  bool get isThrottled =>
      type == FailureType.rateLimited || type == FailureType.serverBusy;
}
