import '../error/failure.dart';

final class ApiException implements Exception {
  const ApiException(this.failure);

  final Failure failure;

  @override
  String toString() =>
      'ApiException(${failure.type.name}, code: ${failure.code})';
}
