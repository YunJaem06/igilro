// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_prediction_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutePredictionOptions {
  RoutePredictionMode get mode;
  DateTime? get departureAt;

  /// Create a copy of RoutePredictionOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutePredictionOptionsCopyWith<RoutePredictionOptions> get copyWith =>
      _$RoutePredictionOptionsCopyWithImpl<RoutePredictionOptions>(
        this as RoutePredictionOptions,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RoutePredictionOptions;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoutePredictionOptions &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode) &&
            (identical(other.departureAt, _this.departureAt) ||
                other.departureAt == _this.departureAt));
  }

  @override
  int get hashCode {
    final _this = this as RoutePredictionOptions;
    return Object.hash(runtimeType, _this.mode, _this.departureAt);
  }

  @override
  String toString() {
    final _this = this as RoutePredictionOptions;
    return 'RoutePredictionOptions(mode: ${_this.mode}, departureAt: ${_this.departureAt})';
  }
}

/// @nodoc
abstract mixin class $RoutePredictionOptionsCopyWith<$Res> {
  factory $RoutePredictionOptionsCopyWith(
    RoutePredictionOptions value,
    $Res Function(RoutePredictionOptions) _then,
  ) = _$RoutePredictionOptionsCopyWithImpl;
  @useResult
  $Res call({RoutePredictionMode mode, DateTime? departureAt});
}

/// @nodoc
class _$RoutePredictionOptionsCopyWithImpl<$Res>
    implements $RoutePredictionOptionsCopyWith<$Res> {
  _$RoutePredictionOptionsCopyWithImpl(this._self, this._then);

  final RoutePredictionOptions _self;
  final $Res Function(RoutePredictionOptions) _then;

  /// Create a copy of RoutePredictionOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mode = null, Object? departureAt = freezed}) {
    return _then(
      RoutePredictionOptions(
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RoutePredictionOptions].
extension RoutePredictionOptionsPatterns on RoutePredictionOptions {
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
    TResult Function(_RoutePredictionOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions() when $default != null:
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
    TResult Function(_RoutePredictionOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions():
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
    TResult? Function(_RoutePredictionOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions() when $default != null:
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
    TResult Function(RoutePredictionMode mode, DateTime? departureAt)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions() when $default != null:
        return $default(_that.mode, _that.departureAt);
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
    TResult Function(RoutePredictionMode mode, DateTime? departureAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions():
        return $default(_that.mode, _that.departureAt);
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
    TResult? Function(RoutePredictionMode mode, DateTime? departureAt)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionOptions() when $default != null:
        return $default(_that.mode, _that.departureAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RoutePredictionOptions implements RoutePredictionOptions {
  const _RoutePredictionOptions({
    this.mode = RoutePredictionMode.shade,
    this.departureAt,
  });

  @override
  @JsonKey()
  final RoutePredictionMode mode;
  @override
  final DateTime? departureAt;

  /// Create a copy of RoutePredictionOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutePredictionOptionsCopyWith<_RoutePredictionOptions> get copyWith =>
      __$RoutePredictionOptionsCopyWithImpl<_RoutePredictionOptions>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutePredictionOptions &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.departureAt, departureAt) ||
                other.departureAt == departureAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, mode, departureAt);
  }

  @override
  String toString() {
    return 'RoutePredictionOptions(mode: $mode, departureAt: $departureAt)';
  }
}

/// @nodoc
abstract mixin class _$RoutePredictionOptionsCopyWith<$Res>
    implements $RoutePredictionOptionsCopyWith<$Res> {
  factory _$RoutePredictionOptionsCopyWith(
    _RoutePredictionOptions value,
    $Res Function(_RoutePredictionOptions) _then,
  ) = __$RoutePredictionOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({RoutePredictionMode mode, DateTime? departureAt});
}

/// @nodoc
class __$RoutePredictionOptionsCopyWithImpl<$Res>
    implements _$RoutePredictionOptionsCopyWith<$Res> {
  __$RoutePredictionOptionsCopyWithImpl(this._self, this._then);

  final _RoutePredictionOptions _self;
  final $Res Function(_RoutePredictionOptions) _then;

  /// Create a copy of RoutePredictionOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? mode = null, Object? departureAt = freezed}) {
    return _then(
      _RoutePredictionOptions(
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
