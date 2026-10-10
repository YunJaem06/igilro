// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiErrorDto {
  String get code;
  String? get requestId;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiErrorDtoCopyWith<ApiErrorDto> get copyWith =>
      _$ApiErrorDtoCopyWithImpl<ApiErrorDto>(this as ApiErrorDto, _$identity);

  /// Serializes this ApiErrorDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as ApiErrorDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiErrorDto &&
            (identical(other.code, _this.code) || other.code == _this.code) &&
            (identical(other.requestId, _this.requestId) ||
                other.requestId == _this.requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as ApiErrorDto;
    return Object.hash(runtimeType, _this.code, _this.requestId);
  }

  @override
  String toString() {
    final _this = this as ApiErrorDto;
    return 'ApiErrorDto(code: ${_this.code}, requestId: ${_this.requestId})';
  }
}

/// @nodoc
abstract mixin class $ApiErrorDtoCopyWith<$Res> {
  factory $ApiErrorDtoCopyWith(
    ApiErrorDto value,
    $Res Function(ApiErrorDto) _then,
  ) = _$ApiErrorDtoCopyWithImpl;
  @useResult
  $Res call({String code, String? requestId});
}

/// @nodoc
class _$ApiErrorDtoCopyWithImpl<$Res> implements $ApiErrorDtoCopyWith<$Res> {
  _$ApiErrorDtoCopyWithImpl(this._self, this._then);

  final ApiErrorDto _self;
  final $Res Function(ApiErrorDto) _then;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? requestId = freezed}) {
    return _then(
      ApiErrorDto(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _self.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ApiErrorDto].
extension ApiErrorDtoPatterns on ApiErrorDto {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiErrorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiErrorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApiErrorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String? requestId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
        return $default(_that.code, _that.requestId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String? requestId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto():
        return $default(_that.code, _that.requestId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String? requestId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiErrorDto() when $default != null:
        return $default(_that.code, _that.requestId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ApiErrorDto implements ApiErrorDto {
  const _ApiErrorDto({required this.code, this.requestId});
  factory _ApiErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDtoFromJson(json);

  @override
  final String code;
  @override
  final String? requestId;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiErrorDtoCopyWith<_ApiErrorDto> get copyWith =>
      __$ApiErrorDtoCopyWithImpl<_ApiErrorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiErrorDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiErrorDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, code, requestId);
  }

  @override
  String toString() {
    return 'ApiErrorDto(code: $code, requestId: $requestId)';
  }
}

/// @nodoc
abstract mixin class _$ApiErrorDtoCopyWith<$Res>
    implements $ApiErrorDtoCopyWith<$Res> {
  factory _$ApiErrorDtoCopyWith(
    _ApiErrorDto value,
    $Res Function(_ApiErrorDto) _then,
  ) = __$ApiErrorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String? requestId});
}

/// @nodoc
class __$ApiErrorDtoCopyWithImpl<$Res> implements _$ApiErrorDtoCopyWith<$Res> {
  __$ApiErrorDtoCopyWithImpl(this._self, this._then);

  final _ApiErrorDto _self;
  final $Res Function(_ApiErrorDto) _then;

  /// Create a copy of ApiErrorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? code = null, Object? requestId = freezed}) {
    return _then(
      _ApiErrorDto(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _self.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
