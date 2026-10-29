// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_overlays.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapRouteSegment {
  MapShadeState get state;
  List<GeoCoordinate> get path;

  /// Create a copy of MapRouteSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapRouteSegmentCopyWith<MapRouteSegment> get copyWith =>
      _$MapRouteSegmentCopyWithImpl<MapRouteSegment>(
        this as MapRouteSegment,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as MapRouteSegment;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapRouteSegment &&
            (identical(other.state, _this.state) ||
                other.state == _this.state) &&
            const DeepCollectionEquality().equals(other.path, _this.path));
  }

  @override
  int get hashCode {
    final _this = this as MapRouteSegment;
    return Object.hash(
      runtimeType,
      _this.state,
      const DeepCollectionEquality().hash(_this.path),
    );
  }

  @override
  String toString() {
    final _this = this as MapRouteSegment;
    return 'MapRouteSegment(state: ${_this.state}, path: ${_this.path})';
  }
}

/// @nodoc
abstract mixin class $MapRouteSegmentCopyWith<$Res> {
  factory $MapRouteSegmentCopyWith(
    MapRouteSegment value,
    $Res Function(MapRouteSegment) _then,
  ) = _$MapRouteSegmentCopyWithImpl;
  @useResult
  $Res call({MapShadeState state, List<GeoCoordinate> path});
}

/// @nodoc
class _$MapRouteSegmentCopyWithImpl<$Res>
    implements $MapRouteSegmentCopyWith<$Res> {
  _$MapRouteSegmentCopyWithImpl(this._self, this._then);

  final MapRouteSegment _self;
  final $Res Function(MapRouteSegment) _then;

  /// Create a copy of MapRouteSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null, Object? path = null}) {
    return _then(
      MapRouteSegment(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as MapShadeState,
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MapRouteSegment].
extension MapRouteSegmentPatterns on MapRouteSegment {
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
    TResult Function(_MapRouteSegment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment() when $default != null:
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
    TResult Function(_MapRouteSegment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment():
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
    TResult? Function(_MapRouteSegment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment() when $default != null:
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
    TResult Function(MapShadeState state, List<GeoCoordinate> path)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment() when $default != null:
        return $default(_that.state, _that.path);
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
    TResult Function(MapShadeState state, List<GeoCoordinate> path) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment():
        return $default(_that.state, _that.path);
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
    TResult? Function(MapShadeState state, List<GeoCoordinate> path)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRouteSegment() when $default != null:
        return $default(_that.state, _that.path);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapRouteSegment implements MapRouteSegment {
  const _MapRouteSegment({
    required this.state,
    required List<GeoCoordinate> path,
  }) : _path = path;

  @override
  final MapShadeState state;
  final List<GeoCoordinate> _path;
  @override
  List<GeoCoordinate> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  /// Create a copy of MapRouteSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapRouteSegmentCopyWith<_MapRouteSegment> get copyWith =>
      __$MapRouteSegmentCopyWithImpl<_MapRouteSegment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapRouteSegment &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other.path, _path));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      state,
      const DeepCollectionEquality().hash(_path),
    );
  }

  @override
  String toString() {
    return 'MapRouteSegment(state: $state, path: $path)';
  }
}

/// @nodoc
abstract mixin class _$MapRouteSegmentCopyWith<$Res>
    implements $MapRouteSegmentCopyWith<$Res> {
  factory _$MapRouteSegmentCopyWith(
    _MapRouteSegment value,
    $Res Function(_MapRouteSegment) _then,
  ) = __$MapRouteSegmentCopyWithImpl;
  @override
  @useResult
  $Res call({MapShadeState state, List<GeoCoordinate> path});
}

/// @nodoc
class __$MapRouteSegmentCopyWithImpl<$Res>
    implements _$MapRouteSegmentCopyWith<$Res> {
  __$MapRouteSegmentCopyWithImpl(this._self, this._then);

  final _MapRouteSegment _self;
  final $Res Function(_MapRouteSegment) _then;

  /// Create a copy of MapRouteSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? state = null, Object? path = null}) {
    return _then(
      _MapRouteSegment(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as MapShadeState,
        path: null == path
            ? _self._path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
      ),
    );
  }
}

/// @nodoc
mixin _$MapRoutePaint {
  List<GeoCoordinate> get path;
  List<MapRouteSegment> get segments;

  /// Create a copy of MapRoutePaint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapRoutePaintCopyWith<MapRoutePaint> get copyWith =>
      _$MapRoutePaintCopyWithImpl<MapRoutePaint>(
        this as MapRoutePaint,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as MapRoutePaint;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapRoutePaint &&
            const DeepCollectionEquality().equals(other.path, _this.path) &&
            const DeepCollectionEquality().equals(
              other.segments,
              _this.segments,
            ));
  }

  @override
  int get hashCode {
    final _this = this as MapRoutePaint;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.path),
      const DeepCollectionEquality().hash(_this.segments),
    );
  }

  @override
  String toString() {
    final _this = this as MapRoutePaint;
    return 'MapRoutePaint(path: ${_this.path}, segments: ${_this.segments})';
  }
}

/// @nodoc
abstract mixin class $MapRoutePaintCopyWith<$Res> {
  factory $MapRoutePaintCopyWith(
    MapRoutePaint value,
    $Res Function(MapRoutePaint) _then,
  ) = _$MapRoutePaintCopyWithImpl;
  @useResult
  $Res call({List<GeoCoordinate> path, List<MapRouteSegment> segments});
}

/// @nodoc
class _$MapRoutePaintCopyWithImpl<$Res>
    implements $MapRoutePaintCopyWith<$Res> {
  _$MapRoutePaintCopyWithImpl(this._self, this._then);

  final MapRoutePaint _self;
  final $Res Function(MapRoutePaint) _then;

  /// Create a copy of MapRoutePaint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? path = null, Object? segments = null}) {
    return _then(
      MapRoutePaint(
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        segments: null == segments
            ? _self.segments
            : segments // ignore: cast_nullable_to_non_nullable
                  as List<MapRouteSegment>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MapRoutePaint].
extension MapRoutePaintPatterns on MapRoutePaint {
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
    TResult Function(_MapRoutePaint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint() when $default != null:
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
    TResult Function(_MapRoutePaint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint():
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
    TResult? Function(_MapRoutePaint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint() when $default != null:
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
    TResult Function(List<GeoCoordinate> path, List<MapRouteSegment> segments)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint() when $default != null:
        return $default(_that.path, _that.segments);
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
    TResult Function(List<GeoCoordinate> path, List<MapRouteSegment> segments)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint():
        return $default(_that.path, _that.segments);
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
    TResult? Function(List<GeoCoordinate> path, List<MapRouteSegment> segments)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapRoutePaint() when $default != null:
        return $default(_that.path, _that.segments);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapRoutePaint implements MapRoutePaint {
  const _MapRoutePaint({
    required List<GeoCoordinate> path,
    List<MapRouteSegment> segments = const [],
  }) : _path = path,
       _segments = segments;

  final List<GeoCoordinate> _path;
  @override
  List<GeoCoordinate> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  final List<MapRouteSegment> _segments;
  @override
  @JsonKey()
  List<MapRouteSegment> get segments {
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segments);
  }

  /// Create a copy of MapRoutePaint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapRoutePaintCopyWith<_MapRoutePaint> get copyWith =>
      __$MapRoutePaintCopyWithImpl<_MapRoutePaint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapRoutePaint &&
            const DeepCollectionEquality().equals(other.path, _path) &&
            const DeepCollectionEquality().equals(other.segments, _segments));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_path),
      const DeepCollectionEquality().hash(_segments),
    );
  }

  @override
  String toString() {
    return 'MapRoutePaint(path: $path, segments: $segments)';
  }
}

/// @nodoc
abstract mixin class _$MapRoutePaintCopyWith<$Res>
    implements $MapRoutePaintCopyWith<$Res> {
  factory _$MapRoutePaintCopyWith(
    _MapRoutePaint value,
    $Res Function(_MapRoutePaint) _then,
  ) = __$MapRoutePaintCopyWithImpl;
  @override
  @useResult
  $Res call({List<GeoCoordinate> path, List<MapRouteSegment> segments});
}

/// @nodoc
class __$MapRoutePaintCopyWithImpl<$Res>
    implements _$MapRoutePaintCopyWith<$Res> {
  __$MapRoutePaintCopyWithImpl(this._self, this._then);

  final _MapRoutePaint _self;
  final $Res Function(_MapRoutePaint) _then;

  /// Create a copy of MapRoutePaint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? path = null, Object? segments = null}) {
    return _then(
      _MapRoutePaint(
        path: null == path
            ? _self._path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        segments: null == segments
            ? _self._segments
            : segments // ignore: cast_nullable_to_non_nullable
                  as List<MapRouteSegment>,
      ),
    );
  }
}

/// @nodoc
mixin _$MapCoverage {
  List<GeoCoordinate> get boundary;
  List<List<GeoCoordinate>> get walkingNetwork;
  List<MapAccessPoint> get accessPoints;

  /// Create a copy of MapCoverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapCoverageCopyWith<MapCoverage> get copyWith =>
      _$MapCoverageCopyWithImpl<MapCoverage>(this as MapCoverage, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MapCoverage;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapCoverage &&
            const DeepCollectionEquality().equals(
              other.boundary,
              _this.boundary,
            ) &&
            const DeepCollectionEquality().equals(
              other.walkingNetwork,
              _this.walkingNetwork,
            ) &&
            const DeepCollectionEquality().equals(
              other.accessPoints,
              _this.accessPoints,
            ));
  }

  @override
  int get hashCode {
    final _this = this as MapCoverage;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.boundary),
      const DeepCollectionEquality().hash(_this.walkingNetwork),
      const DeepCollectionEquality().hash(_this.accessPoints),
    );
  }

  @override
  String toString() {
    final _this = this as MapCoverage;
    return 'MapCoverage(boundary: ${_this.boundary}, walkingNetwork: ${_this.walkingNetwork}, accessPoints: ${_this.accessPoints})';
  }
}

/// @nodoc
abstract mixin class $MapCoverageCopyWith<$Res> {
  factory $MapCoverageCopyWith(
    MapCoverage value,
    $Res Function(MapCoverage) _then,
  ) = _$MapCoverageCopyWithImpl;
  @useResult
  $Res call({
    List<GeoCoordinate> boundary,
    List<List<GeoCoordinate>> walkingNetwork,
    List<MapAccessPoint> accessPoints,
  });
}

/// @nodoc
class _$MapCoverageCopyWithImpl<$Res> implements $MapCoverageCopyWith<$Res> {
  _$MapCoverageCopyWithImpl(this._self, this._then);

  final MapCoverage _self;
  final $Res Function(MapCoverage) _then;

  /// Create a copy of MapCoverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boundary = null,
    Object? walkingNetwork = null,
    Object? accessPoints = null,
  }) {
    return _then(
      MapCoverage(
        boundary: null == boundary
            ? _self.boundary
            : boundary // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        walkingNetwork: null == walkingNetwork
            ? _self.walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as List<List<GeoCoordinate>>,
        accessPoints: null == accessPoints
            ? _self.accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<MapAccessPoint>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MapCoverage].
extension MapCoveragePatterns on MapCoverage {
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
    TResult Function(_MapCoverage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapCoverage() when $default != null:
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
    TResult Function(_MapCoverage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapCoverage():
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
    TResult? Function(_MapCoverage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapCoverage() when $default != null:
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
      List<GeoCoordinate> boundary,
      List<List<GeoCoordinate>> walkingNetwork,
      List<MapAccessPoint> accessPoints,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapCoverage() when $default != null:
        return $default(
          _that.boundary,
          _that.walkingNetwork,
          _that.accessPoints,
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
      List<GeoCoordinate> boundary,
      List<List<GeoCoordinate>> walkingNetwork,
      List<MapAccessPoint> accessPoints,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapCoverage():
        return $default(
          _that.boundary,
          _that.walkingNetwork,
          _that.accessPoints,
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
      List<GeoCoordinate> boundary,
      List<List<GeoCoordinate>> walkingNetwork,
      List<MapAccessPoint> accessPoints,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapCoverage() when $default != null:
        return $default(
          _that.boundary,
          _that.walkingNetwork,
          _that.accessPoints,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapCoverage implements MapCoverage {
  const _MapCoverage({
    required List<GeoCoordinate> boundary,
    required List<List<GeoCoordinate>> walkingNetwork,
    required List<MapAccessPoint> accessPoints,
  }) : _boundary = boundary,
       _walkingNetwork = walkingNetwork,
       _accessPoints = accessPoints;

  final List<GeoCoordinate> _boundary;
  @override
  List<GeoCoordinate> get boundary {
    if (_boundary is EqualUnmodifiableListView) return _boundary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundary);
  }

  final List<List<GeoCoordinate>> _walkingNetwork;
  @override
  List<List<GeoCoordinate>> get walkingNetwork {
    if (_walkingNetwork is EqualUnmodifiableListView) return _walkingNetwork;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walkingNetwork);
  }

  final List<MapAccessPoint> _accessPoints;
  @override
  List<MapAccessPoint> get accessPoints {
    if (_accessPoints is EqualUnmodifiableListView) return _accessPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessPoints);
  }

  /// Create a copy of MapCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapCoverageCopyWith<_MapCoverage> get copyWith =>
      __$MapCoverageCopyWithImpl<_MapCoverage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapCoverage &&
            const DeepCollectionEquality().equals(other.boundary, _boundary) &&
            const DeepCollectionEquality().equals(
              other.walkingNetwork,
              _walkingNetwork,
            ) &&
            const DeepCollectionEquality().equals(
              other.accessPoints,
              _accessPoints,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boundary),
      const DeepCollectionEquality().hash(_walkingNetwork),
      const DeepCollectionEquality().hash(_accessPoints),
    );
  }

  @override
  String toString() {
    return 'MapCoverage(boundary: $boundary, walkingNetwork: $walkingNetwork, accessPoints: $accessPoints)';
  }
}

/// @nodoc
abstract mixin class _$MapCoverageCopyWith<$Res>
    implements $MapCoverageCopyWith<$Res> {
  factory _$MapCoverageCopyWith(
    _MapCoverage value,
    $Res Function(_MapCoverage) _then,
  ) = __$MapCoverageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<GeoCoordinate> boundary,
    List<List<GeoCoordinate>> walkingNetwork,
    List<MapAccessPoint> accessPoints,
  });
}

/// @nodoc
class __$MapCoverageCopyWithImpl<$Res> implements _$MapCoverageCopyWith<$Res> {
  __$MapCoverageCopyWithImpl(this._self, this._then);

  final _MapCoverage _self;
  final $Res Function(_MapCoverage) _then;

  /// Create a copy of MapCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? boundary = null,
    Object? walkingNetwork = null,
    Object? accessPoints = null,
  }) {
    return _then(
      _MapCoverage(
        boundary: null == boundary
            ? _self._boundary
            : boundary // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        walkingNetwork: null == walkingNetwork
            ? _self._walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as List<List<GeoCoordinate>>,
        accessPoints: null == accessPoints
            ? _self._accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<MapAccessPoint>,
      ),
    );
  }
}

/// @nodoc
mixin _$MapAccessPoint {
  String get id;
  String get name;
  GeoCoordinate get coordinate;

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapAccessPointCopyWith<MapAccessPoint> get copyWith =>
      _$MapAccessPointCopyWithImpl<MapAccessPoint>(
        this as MapAccessPoint,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as MapAccessPoint;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapAccessPoint &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate));
  }

  @override
  int get hashCode {
    final _this = this as MapAccessPoint;
    return Object.hash(runtimeType, _this.id, _this.name, _this.coordinate);
  }

  @override
  String toString() {
    final _this = this as MapAccessPoint;
    return 'MapAccessPoint(id: ${_this.id}, name: ${_this.name}, coordinate: ${_this.coordinate})';
  }
}

/// @nodoc
abstract mixin class $MapAccessPointCopyWith<$Res> {
  factory $MapAccessPointCopyWith(
    MapAccessPoint value,
    $Res Function(MapAccessPoint) _then,
  ) = _$MapAccessPointCopyWithImpl;
  @useResult
  $Res call({String id, String name, GeoCoordinate coordinate});

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$MapAccessPointCopyWithImpl<$Res>
    implements $MapAccessPointCopyWith<$Res> {
  _$MapAccessPointCopyWithImpl(this._self, this._then);

  final MapAccessPoint _self;
  final $Res Function(MapAccessPoint) _then;

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      MapAccessPoint(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
      ),
    );
  }

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MapAccessPoint].
extension MapAccessPointPatterns on MapAccessPoint {
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
    TResult Function(_MapAccessPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint() when $default != null:
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
    TResult Function(_MapAccessPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint():
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
    TResult? Function(_MapAccessPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint() when $default != null:
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
    TResult Function(String id, String name, GeoCoordinate coordinate)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint() when $default != null:
        return $default(_that.id, _that.name, _that.coordinate);
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
    TResult Function(String id, String name, GeoCoordinate coordinate) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint():
        return $default(_that.id, _that.name, _that.coordinate);
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
    TResult? Function(String id, String name, GeoCoordinate coordinate)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapAccessPoint() when $default != null:
        return $default(_that.id, _that.name, _that.coordinate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapAccessPoint implements MapAccessPoint {
  const _MapAccessPoint({
    required this.id,
    required this.name,
    required this.coordinate,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final GeoCoordinate coordinate;

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapAccessPointCopyWith<_MapAccessPoint> get copyWith =>
      __$MapAccessPointCopyWithImpl<_MapAccessPoint>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapAccessPoint &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, coordinate);
  }

  @override
  String toString() {
    return 'MapAccessPoint(id: $id, name: $name, coordinate: $coordinate)';
  }
}

/// @nodoc
abstract mixin class _$MapAccessPointCopyWith<$Res>
    implements $MapAccessPointCopyWith<$Res> {
  factory _$MapAccessPointCopyWith(
    _MapAccessPoint value,
    $Res Function(_MapAccessPoint) _then,
  ) = __$MapAccessPointCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, GeoCoordinate coordinate});

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$MapAccessPointCopyWithImpl<$Res>
    implements _$MapAccessPointCopyWith<$Res> {
  __$MapAccessPointCopyWithImpl(this._self, this._then);

  final _MapAccessPoint _self;
  final $Res Function(_MapAccessPoint) _then;

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      _MapAccessPoint(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
      ),
    );
  }

  /// Create a copy of MapAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
