// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_fix.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationFix {
  GeoCoordinate get coordinate;
  double get accuracyMeters;
  DateTime get capturedAt;

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationFixCopyWith<LocationFix> get copyWith =>
      _$LocationFixCopyWithImpl<LocationFix>(this as LocationFix, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as LocationFix;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationFix &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.accuracyMeters, _this.accuracyMeters) ||
                other.accuracyMeters == _this.accuracyMeters) &&
            (identical(other.capturedAt, _this.capturedAt) ||
                other.capturedAt == _this.capturedAt));
  }

  @override
  int get hashCode {
    final _this = this as LocationFix;
    return Object.hash(
      runtimeType,
      _this.coordinate,
      _this.accuracyMeters,
      _this.capturedAt,
    );
  }

  @override
  String toString() {
    final _this = this as LocationFix;
    return 'LocationFix(coordinate: ${_this.coordinate}, accuracyMeters: ${_this.accuracyMeters}, capturedAt: ${_this.capturedAt})';
  }
}

/// @nodoc
abstract mixin class $LocationFixCopyWith<$Res> {
  factory $LocationFixCopyWith(
    LocationFix value,
    $Res Function(LocationFix) _then,
  ) = _$LocationFixCopyWithImpl;
  @useResult
  $Res call({
    GeoCoordinate coordinate,
    double accuracyMeters,
    DateTime capturedAt,
  });

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$LocationFixCopyWithImpl<$Res> implements $LocationFixCopyWith<$Res> {
  _$LocationFixCopyWithImpl(this._self, this._then);

  final LocationFix _self;
  final $Res Function(LocationFix) _then;

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinate = null,
    Object? accuracyMeters = null,
    Object? capturedAt = null,
  }) {
    return _then(
      LocationFix(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        accuracyMeters: null == accuracyMeters
            ? _self.accuracyMeters
            : accuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        capturedAt: null == capturedAt
            ? _self.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocationFix].
extension LocationFixPatterns on LocationFix {
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
    TResult Function(_LocationFix value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationFix() when $default != null:
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
    TResult Function(_LocationFix value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFix():
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
    TResult? Function(_LocationFix value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFix() when $default != null:
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
    TResult Function(
      GeoCoordinate coordinate,
      double accuracyMeters,
      DateTime capturedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationFix() when $default != null:
        return $default(
          _that.coordinate,
          _that.accuracyMeters,
          _that.capturedAt,
        );
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
    TResult Function(
      GeoCoordinate coordinate,
      double accuracyMeters,
      DateTime capturedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFix():
        return $default(
          _that.coordinate,
          _that.accuracyMeters,
          _that.capturedAt,
        );
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
    TResult? Function(
      GeoCoordinate coordinate,
      double accuracyMeters,
      DateTime capturedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFix() when $default != null:
        return $default(
          _that.coordinate,
          _that.accuracyMeters,
          _that.capturedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocationFix implements LocationFix {
  const _LocationFix({
    required this.coordinate,
    required this.accuracyMeters,
    required this.capturedAt,
  });

  @override
  final GeoCoordinate coordinate;
  @override
  final double accuracyMeters;
  @override
  final DateTime capturedAt;

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationFixCopyWith<_LocationFix> get copyWith =>
      __$LocationFixCopyWithImpl<_LocationFix>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationFix &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.accuracyMeters, accuracyMeters) ||
                other.accuracyMeters == accuracyMeters) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, coordinate, accuracyMeters, capturedAt);
  }

  @override
  String toString() {
    return 'LocationFix(coordinate: $coordinate, accuracyMeters: $accuracyMeters, capturedAt: $capturedAt)';
  }
}

/// @nodoc
abstract mixin class _$LocationFixCopyWith<$Res>
    implements $LocationFixCopyWith<$Res> {
  factory _$LocationFixCopyWith(
    _LocationFix value,
    $Res Function(_LocationFix) _then,
  ) = __$LocationFixCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeoCoordinate coordinate,
    double accuracyMeters,
    DateTime capturedAt,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$LocationFixCopyWithImpl<$Res> implements _$LocationFixCopyWith<$Res> {
  __$LocationFixCopyWithImpl(this._self, this._then);

  final _LocationFix _self;
  final $Res Function(_LocationFix) _then;

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coordinate = null,
    Object? accuracyMeters = null,
    Object? capturedAt = null,
  }) {
    return _then(
      _LocationFix(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        accuracyMeters: null == accuracyMeters
            ? _self.accuracyMeters
            : accuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        capturedAt: null == capturedAt
            ? _self.capturedAt
            : capturedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }

  /// Create a copy of LocationFix
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
