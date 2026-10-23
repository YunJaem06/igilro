// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteQuery {
  GeoCoordinate get origin;
  GeoCoordinate get destination;
  DateTime get departureAt;

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteQueryCopyWith<RouteQuery> get copyWith =>
      _$RouteQueryCopyWithImpl<RouteQuery>(this as RouteQuery, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as RouteQuery;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteQuery &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination) &&
            (identical(other.departureAt, _this.departureAt) ||
                other.departureAt == _this.departureAt));
  }

  @override
  int get hashCode {
    final _this = this as RouteQuery;
    return Object.hash(
      runtimeType,
      _this.origin,
      _this.destination,
      _this.departureAt,
    );
  }

  @override
  String toString() {
    final _this = this as RouteQuery;
    return 'RouteQuery(origin: ${_this.origin}, destination: ${_this.destination}, departureAt: ${_this.departureAt})';
  }
}

/// @nodoc
abstract mixin class $RouteQueryCopyWith<$Res> {
  factory $RouteQueryCopyWith(
    RouteQuery value,
    $Res Function(RouteQuery) _then,
  ) = _$RouteQueryCopyWithImpl;
  @useResult
  $Res call({
    GeoCoordinate origin,
    GeoCoordinate destination,
    DateTime departureAt,
  });

  $GeoCoordinateCopyWith<$Res> get origin;
  $GeoCoordinateCopyWith<$Res> get destination;
}

/// @nodoc
class _$RouteQueryCopyWithImpl<$Res> implements $RouteQueryCopyWith<$Res> {
  _$RouteQueryCopyWithImpl(this._self, this._then);

  final RouteQuery _self;
  final $Res Function(RouteQuery) _then;

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? departureAt = null,
  }) {
    return _then(
      RouteQuery(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        departureAt: null == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get origin {
    return $GeoCoordinateCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get destination {
    return $GeoCoordinateCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteQuery].
extension RouteQueryPatterns on RouteQuery {
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
    TResult Function(_RouteQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteQuery() when $default != null:
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
    TResult Function(_RouteQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteQuery():
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
    TResult? Function(_RouteQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteQuery() when $default != null:
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
      GeoCoordinate origin,
      GeoCoordinate destination,
      DateTime departureAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteQuery() when $default != null:
        return $default(_that.origin, _that.destination, _that.departureAt);
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
      GeoCoordinate origin,
      GeoCoordinate destination,
      DateTime departureAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteQuery():
        return $default(_that.origin, _that.destination, _that.departureAt);
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
      GeoCoordinate origin,
      GeoCoordinate destination,
      DateTime departureAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteQuery() when $default != null:
        return $default(_that.origin, _that.destination, _that.departureAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteQuery implements RouteQuery {
  const _RouteQuery({
    required this.origin,
    required this.destination,
    required this.departureAt,
  });

  @override
  final GeoCoordinate origin;
  @override
  final GeoCoordinate destination;
  @override
  final DateTime departureAt;

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteQueryCopyWith<_RouteQuery> get copyWith =>
      __$RouteQueryCopyWithImpl<_RouteQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteQuery &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureAt, departureAt) ||
                other.departureAt == departureAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, origin, destination, departureAt);
  }

  @override
  String toString() {
    return 'RouteQuery(origin: $origin, destination: $destination, departureAt: $departureAt)';
  }
}

/// @nodoc
abstract mixin class _$RouteQueryCopyWith<$Res>
    implements $RouteQueryCopyWith<$Res> {
  factory _$RouteQueryCopyWith(
    _RouteQuery value,
    $Res Function(_RouteQuery) _then,
  ) = __$RouteQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeoCoordinate origin,
    GeoCoordinate destination,
    DateTime departureAt,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get origin;
  @override
  $GeoCoordinateCopyWith<$Res> get destination;
}

/// @nodoc
class __$RouteQueryCopyWithImpl<$Res> implements _$RouteQueryCopyWith<$Res> {
  __$RouteQueryCopyWithImpl(this._self, this._then);

  final _RouteQuery _self;
  final $Res Function(_RouteQuery) _then;

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? departureAt = null,
  }) {
    return _then(
      _RouteQuery(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        departureAt: null == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get origin {
    return $GeoCoordinateCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get destination {
    return $GeoCoordinateCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}
