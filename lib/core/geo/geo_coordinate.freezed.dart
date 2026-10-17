// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoCoordinate {
  double get latitude;
  double get longitude;

  /// Create a copy of GeoCoordinate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<GeoCoordinate> get copyWith =>
      _$GeoCoordinateCopyWithImpl<GeoCoordinate>(
        this as GeoCoordinate,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as GeoCoordinate;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeoCoordinate &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude) &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude));
  }

  @override
  int get hashCode {
    final _this = this as GeoCoordinate;
    return Object.hash(runtimeType, _this.latitude, _this.longitude);
  }

  @override
  String toString() {
    final _this = this as GeoCoordinate;
    return 'GeoCoordinate(latitude: ${_this.latitude}, longitude: ${_this.longitude})';
  }
}

/// @nodoc
abstract mixin class $GeoCoordinateCopyWith<$Res> {
  factory $GeoCoordinateCopyWith(
    GeoCoordinate value,
    $Res Function(GeoCoordinate) _then,
  ) = _$GeoCoordinateCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$GeoCoordinateCopyWithImpl<$Res>
    implements $GeoCoordinateCopyWith<$Res> {
  _$GeoCoordinateCopyWithImpl(this._self, this._then);

  final GeoCoordinate _self;
  final $Res Function(GeoCoordinate) _then;

  /// Create a copy of GeoCoordinate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      GeoCoordinate(
        latitude: null == latitude
            ? _self.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _self.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GeoCoordinate].
extension GeoCoordinatePatterns on GeoCoordinate {
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
    TResult Function(_GeoCoordinate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate() when $default != null:
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
    TResult Function(_GeoCoordinate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate():
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
    TResult? Function(_GeoCoordinate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate() when $default != null:
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
    TResult Function(double latitude, double longitude)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate() when $default != null:
        return $default(_that.latitude, _that.longitude);
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
    TResult Function(double latitude, double longitude) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate():
        return $default(_that.latitude, _that.longitude);
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
    TResult? Function(double latitude, double longitude)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GeoCoordinate() when $default != null:
        return $default(_that.latitude, _that.longitude);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GeoCoordinate implements GeoCoordinate {
  const _GeoCoordinate({required this.latitude, required this.longitude})
    : assert(latitude >= -90 && latitude <= 90),
      assert(longitude >= -180 && longitude <= 180);

  @override
  final double latitude;
  @override
  final double longitude;

  /// Create a copy of GeoCoordinate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeoCoordinateCopyWith<_GeoCoordinate> get copyWith =>
      __$GeoCoordinateCopyWithImpl<_GeoCoordinate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeoCoordinate &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, latitude, longitude);
  }

  @override
  String toString() {
    return 'GeoCoordinate(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$GeoCoordinateCopyWith<$Res>
    implements $GeoCoordinateCopyWith<$Res> {
  factory _$GeoCoordinateCopyWith(
    _GeoCoordinate value,
    $Res Function(_GeoCoordinate) _then,
  ) = __$GeoCoordinateCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$GeoCoordinateCopyWithImpl<$Res>
    implements _$GeoCoordinateCopyWith<$Res> {
  __$GeoCoordinateCopyWithImpl(this._self, this._then);

  final _GeoCoordinate _self;
  final $Res Function(_GeoCoordinate) _then;

  /// Create a copy of GeoCoordinate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _GeoCoordinate(
        latitude: null == latitude
            ? _self.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _self.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}
