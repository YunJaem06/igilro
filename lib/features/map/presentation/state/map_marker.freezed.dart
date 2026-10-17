// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapMarker {
  GeoCoordinate get coordinate;
  MapMarkerRole get role;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapMarkerCopyWith<MapMarker> get copyWith =>
      _$MapMarkerCopyWithImpl<MapMarker>(this as MapMarker, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MapMarker;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapMarker &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.role, _this.role) || other.role == _this.role));
  }

  @override
  int get hashCode {
    final _this = this as MapMarker;
    return Object.hash(runtimeType, _this.coordinate, _this.role);
  }

  @override
  String toString() {
    final _this = this as MapMarker;
    return 'MapMarker(coordinate: ${_this.coordinate}, role: ${_this.role})';
  }
}

/// @nodoc
abstract mixin class $MapMarkerCopyWith<$Res> {
  factory $MapMarkerCopyWith(MapMarker value, $Res Function(MapMarker) _then) =
      _$MapMarkerCopyWithImpl;
  @useResult
  $Res call({GeoCoordinate coordinate, MapMarkerRole role});

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$MapMarkerCopyWithImpl<$Res> implements $MapMarkerCopyWith<$Res> {
  _$MapMarkerCopyWithImpl(this._self, this._then);

  final MapMarker _self;
  final $Res Function(MapMarker) _then;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coordinate = null, Object? role = null}) {
    return _then(
      MapMarker(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MapMarkerRole,
      ),
    );
  }

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MapMarker].
extension MapMarkerPatterns on MapMarker {
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
    TResult Function(_MapMarker value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapMarker() when $default != null:
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
    TResult Function(_MapMarker value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapMarker():
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
    TResult? Function(_MapMarker value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapMarker() when $default != null:
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
    TResult Function(GeoCoordinate coordinate, MapMarkerRole role)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapMarker() when $default != null:
        return $default(_that.coordinate, _that.role);
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
    TResult Function(GeoCoordinate coordinate, MapMarkerRole role) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapMarker():
        return $default(_that.coordinate, _that.role);
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
    TResult? Function(GeoCoordinate coordinate, MapMarkerRole role)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapMarker() when $default != null:
        return $default(_that.coordinate, _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapMarker implements MapMarker {
  const _MapMarker({required this.coordinate, required this.role});

  @override
  final GeoCoordinate coordinate;
  @override
  final MapMarkerRole role;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapMarkerCopyWith<_MapMarker> get copyWith =>
      __$MapMarkerCopyWithImpl<_MapMarker>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapMarker &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, coordinate, role);
  }

  @override
  String toString() {
    return 'MapMarker(coordinate: $coordinate, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$MapMarkerCopyWith<$Res>
    implements $MapMarkerCopyWith<$Res> {
  factory _$MapMarkerCopyWith(
    _MapMarker value,
    $Res Function(_MapMarker) _then,
  ) = __$MapMarkerCopyWithImpl;
  @override
  @useResult
  $Res call({GeoCoordinate coordinate, MapMarkerRole role});

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$MapMarkerCopyWithImpl<$Res> implements _$MapMarkerCopyWith<$Res> {
  __$MapMarkerCopyWithImpl(this._self, this._then);

  final _MapMarker _self;
  final $Res Function(_MapMarker) _then;

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? coordinate = null, Object? role = null}) {
    return _then(
      _MapMarker(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MapMarkerRole,
      ),
    );
  }

  /// Create a copy of MapMarker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
