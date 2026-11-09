import 'dart:io' show HttpDate, HttpException;

import 'package:dio/dio.dart';

import '../error/failure.dart';
import 'api_error_dto.dart';
import 'api_exception.dart';

ApiException mapNetworkException(DioException exception) {
  final response = exception.response;
  final dto = _parseError(response?.data);
  final type = switch (exception.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => FailureType.timeout,
    DioExceptionType.connectionError => FailureType.network,
    DioExceptionType.cancel => FailureType.cancelled,
    DioExceptionType.badCertificate => FailureType.secureConnection,
    DioExceptionType.badResponse => _mapStatus(response?.statusCode, dto?.code),
    DioExceptionType.unknown =>
      exception.error is FormatException
          ? FailureType.invalidData
          : FailureType.unexpected,
  };
  return ApiException(
    Failure(
      type: type,
      code: dto?.code,
      requestId: dto?.requestId,
      retryAfter:
          type == FailureType.rateLimited || type == FailureType.serverBusy
          ? _retryAfter(response?.headers['retry-after'])
          : null,
    ),
  );
}

FailureType _mapStatus(int? status, String? code) => switch (status) {
  400 || 422 => FailureType.validation,
  401 => FailureType.unauthorized,
  403 => FailureType.forbidden,
  404 => FailureType.notFound,
  408 || 504 => FailureType.timeout,
  429 => FailureType.rateLimited,
  503 when code == 'ROUTE_SEARCH_BUSY' => FailureType.serverBusy,
  int value when value >= 500 => FailureType.server,
  _ => FailureType.unexpected,
};

Duration? _retryAfter(List<String>? values) {
  if (values == null || values.length != 1) return null;
  final value = values.single.trim();
  const maximum = Duration(days: 1);
  if (RegExp(r'^[0-9]+$').hasMatch(value)) {
    final seconds = int.tryParse(value);
    if (seconds == null || seconds > maximum.inSeconds) return null;
    return Duration(seconds: seconds);
  }
  try {
    final delay = HttpDate.parse(value).difference(DateTime.now());
    if (delay.isNegative) return Duration.zero;
    return delay <= maximum ? delay : null;
  } on HttpException {
    return null;
  }
}

ApiErrorDto? _parseError(Object? body) {
  if (body is! Map<String, dynamic>) return null;

  try {
    final dto = ApiErrorDto.fromJson(body);
    return dto.code.trim().isEmpty ? null : dto;
  } on FormatException {
    return null;
  } on TypeError {
    return null;
  }
}
