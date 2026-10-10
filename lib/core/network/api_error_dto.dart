import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_dto.freezed.dart';
part 'api_error_dto.g.dart';

@freezed
abstract class ApiErrorDto with _$ApiErrorDto {
  const factory ApiErrorDto({required String code, String? requestId}) =
      _ApiErrorDto;

  factory ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);
}
