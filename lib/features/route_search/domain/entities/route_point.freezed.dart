// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutePoint {
  GeoCoordinate get coordinate;
  RoutePointSource get source;
  String? get name;
  String? get address;
  List<String> get attributions;

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<RoutePoint> get copyWith =>
      _$RoutePointCopyWithImpl<RoutePoint>(this as RoutePoint, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as RoutePoint;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoutePoint &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.source, _this.source) ||
                other.source == _this.source) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.address, _this.address) ||
                other.address == _this.address) &&
            const DeepCollectionEquality().equals(
              other.attributions,
              _this.attributions,
            ));
  }

  @override
  int get hashCode {
    final _this = this as RoutePoint;
    return Object.hash(
      runtimeType,
      _this.coordinate,
      _this.source,
      _this.name,
      _this.address,
      const DeepCollectionEquality().hash(_this.attributions),
    );
  }

  @override
  String toString() {
    final _this = this as RoutePoint;
    return 'RoutePoint(coordinate: ${_this.coordinate}, source: ${_this.source}, name: ${_this.name}, address: ${_this.address}, attributions: ${_this.attributions})';
  }
}

/// @nodoc
abstract mixin class $RoutePointCopyWith<$Res> {
  factory $RoutePointCopyWith(
    RoutePoint value,
    $Res Function(RoutePoint) _then,
  ) = _$RoutePointCopyWithImpl;
  @useResult
  $Res call({
    GeoCoordinate coordinate,
    RoutePointSource source,
    String? name,
    String? address,
    List<String> attributions,
  });

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$RoutePointCopyWithImpl<$Res> implements $RoutePointCopyWith<$Res> {
  _$RoutePointCopyWithImpl(this._self, this._then);

  final RoutePoint _self;
  final $Res Function(RoutePoint) _then;

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinate = null,
    Object? source = null,
    Object? name = freezed,
    Object? address = freezed,
    Object? attributions = null,
  }) {
    return _then(
      RoutePoint(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as RoutePointSource,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        attributions: null == attributions
            ? _self.attributions
            : attributions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RoutePoint].
extension RoutePointPatterns on RoutePoint {
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
    TResult Function(_RoutePoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePoint() when $default != null:
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
    TResult Function(_RoutePoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePoint():
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
    TResult? Function(_RoutePoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePoint() when $default != null:
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
      RoutePointSource source,
      String? name,
      String? address,
      List<String> attributions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePoint() when $default != null:
        return $default(
          _that.coordinate,
          _that.source,
          _that.name,
          _that.address,
          _that.attributions,
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
      RoutePointSource source,
      String? name,
      String? address,
      List<String> attributions,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePoint():
        return $default(
          _that.coordinate,
          _that.source,
          _that.name,
          _that.address,
          _that.attributions,
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
      RoutePointSource source,
      String? name,
      String? address,
      List<String> attributions,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePoint() when $default != null:
        return $default(
          _that.coordinate,
          _that.source,
          _that.name,
          _that.address,
          _that.attributions,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RoutePoint implements RoutePoint {
  const _RoutePoint({
    required this.coordinate,
    required this.source,
    this.name,
    this.address,
    List<String> attributions = const [],
  }) : _attributions = attributions;

  @override
  final GeoCoordinate coordinate;
  @override
  final RoutePointSource source;
  @override
  final String? name;
  @override
  final String? address;
  final List<String> _attributions;
  @override
  @JsonKey()
  List<String> get attributions {
    if (_attributions is EqualUnmodifiableListView) return _attributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributions);
  }

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutePointCopyWith<_RoutePoint> get copyWith =>
      __$RoutePointCopyWithImpl<_RoutePoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutePoint &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(
              other.attributions,
              _attributions,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      coordinate,
      source,
      name,
      address,
      const DeepCollectionEquality().hash(_attributions),
    );
  }

  @override
  String toString() {
    return 'RoutePoint(coordinate: $coordinate, source: $source, name: $name, address: $address, attributions: $attributions)';
  }
}

/// @nodoc
abstract mixin class _$RoutePointCopyWith<$Res>
    implements $RoutePointCopyWith<$Res> {
  factory _$RoutePointCopyWith(
    _RoutePoint value,
    $Res Function(_RoutePoint) _then,
  ) = __$RoutePointCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeoCoordinate coordinate,
    RoutePointSource source,
    String? name,
    String? address,
    List<String> attributions,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$RoutePointCopyWithImpl<$Res> implements _$RoutePointCopyWith<$Res> {
  __$RoutePointCopyWithImpl(this._self, this._then);

  final _RoutePoint _self;
  final $Res Function(_RoutePoint) _then;

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coordinate = null,
    Object? source = null,
    Object? name = freezed,
    Object? address = freezed,
    Object? attributions = null,
  }) {
    return _then(
      _RoutePoint(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as RoutePointSource,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        attributions: null == attributions
            ? _self._attributions
            : attributions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }

  /// Create a copy of RoutePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
