import 'package:dio/dio.dart';

import '../error/failure.dart';
import 'api_error_dto.dart';
import 'api_exception.dart';

ApiException mapNetworkException(DioException exception) {
  final type = switch (exception.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => FailureType.timeout,
    DioExceptionType.connectionError => FailureType.network,
    DioExceptionType.cancel => FailureType.cancelled,
    DioExceptionType.badCertificate => FailureType.secureConnection,
    DioExceptionType.badResponse => _mapStatus(exception.response?.statusCode),
    DioExceptionType.unknown =>
      exception.error is FormatException
          ? FailureType.invalidData
          : FailureType.unexpected,
  };
  final dto = _parseError(exception.response?.data);

  return ApiException(
    Failure(type: type, code: dto?.code, requestId: dto?.requestId),
  );
}

FailureType _mapStatus(int? status) => switch (status) {
  400 || 422 => FailureType.validation,
  401 => FailureType.unauthorized,
  403 => FailureType.forbidden,
  404 => FailureType.notFound,
  408 || 504 => FailureType.timeout,
  429 => FailureType.rateLimited,
  int value when value >= 500 => FailureType.server,
  _ => FailureType.unexpected,
};

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
