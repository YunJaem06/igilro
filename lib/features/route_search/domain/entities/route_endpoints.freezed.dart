// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_endpoints.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteEndpoints {
  RoutePoint? get origin;
  RoutePoint? get destination;

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteEndpointsCopyWith<RouteEndpoints> get copyWith =>
      _$RouteEndpointsCopyWithImpl<RouteEndpoints>(
        this as RouteEndpoints,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteEndpoints;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteEndpoints &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination));
  }

  @override
  int get hashCode {
    final _this = this as RouteEndpoints;
    return Object.hash(runtimeType, _this.origin, _this.destination);
  }

  @override
  String toString() {
    final _this = this as RouteEndpoints;
    return 'RouteEndpoints(origin: ${_this.origin}, destination: ${_this.destination})';
  }
}

/// @nodoc
abstract mixin class $RouteEndpointsCopyWith<$Res> {
  factory $RouteEndpointsCopyWith(
    RouteEndpoints value,
    $Res Function(RouteEndpoints) _then,
  ) = _$RouteEndpointsCopyWithImpl;
  @useResult
  $Res call({RoutePoint? origin, RoutePoint? destination});

  $RoutePointCopyWith<$Res>? get origin;
  $RoutePointCopyWith<$Res>? get destination;
}

/// @nodoc
class _$RouteEndpointsCopyWithImpl<$Res>
    implements $RouteEndpointsCopyWith<$Res> {
  _$RouteEndpointsCopyWithImpl(this._self, this._then);

  final RouteEndpoints _self;
  final $Res Function(RouteEndpoints) _then;

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? origin = freezed, Object? destination = freezed}) {
    return _then(
      RouteEndpoints(
        origin: freezed == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
        destination: freezed == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
      ),
    );
  }

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get origin {
    if (_self.origin == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.origin!, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get destination {
    if (_self.destination == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.destination!, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteEndpoints].
extension RouteEndpointsPatterns on RouteEndpoints {
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
    TResult Function(_RouteEndpoints value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints() when $default != null:
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
    TResult Function(_RouteEndpoints value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints():
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
    TResult? Function(_RouteEndpoints value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints() when $default != null:
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
    TResult Function(RoutePoint? origin, RoutePoint? destination)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints() when $default != null:
        return $default(_that.origin, _that.destination);
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
    TResult Function(RoutePoint? origin, RoutePoint? destination) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints():
        return $default(_that.origin, _that.destination);
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
    TResult? Function(RoutePoint? origin, RoutePoint? destination)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteEndpoints() when $default != null:
        return $default(_that.origin, _that.destination);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteEndpoints extends RouteEndpoints {
  const _RouteEndpoints({this.origin, this.destination}) : super._();

  @override
  final RoutePoint? origin;
  @override
  final RoutePoint? destination;

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteEndpointsCopyWith<_RouteEndpoints> get copyWith =>
      __$RouteEndpointsCopyWithImpl<_RouteEndpoints>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteEndpoints &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, origin, destination);
  }

  @override
  String toString() {
    return 'RouteEndpoints(origin: $origin, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class _$RouteEndpointsCopyWith<$Res>
    implements $RouteEndpointsCopyWith<$Res> {
  factory _$RouteEndpointsCopyWith(
    _RouteEndpoints value,
    $Res Function(_RouteEndpoints) _then,
  ) = __$RouteEndpointsCopyWithImpl;
  @override
  @useResult
  $Res call({RoutePoint? origin, RoutePoint? destination});

  @override
  $RoutePointCopyWith<$Res>? get origin;
  @override
  $RoutePointCopyWith<$Res>? get destination;
}

/// @nodoc
class __$RouteEndpointsCopyWithImpl<$Res>
    implements _$RouteEndpointsCopyWith<$Res> {
  __$RouteEndpointsCopyWithImpl(this._self, this._then);

  final _RouteEndpoints _self;
  final $Res Function(_RouteEndpoints) _then;

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? origin = freezed, Object? destination = freezed}) {
    return _then(
      _RouteEndpoints(
        origin: freezed == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
        destination: freezed == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
      ),
    );
  }

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get origin {
    if (_self.origin == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.origin!, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteEndpoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get destination {
    if (_self.destination == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.destination!, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}
