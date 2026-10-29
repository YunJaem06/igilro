// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapState {
  GeoCoordinate get center;
  double get zoom;
  bool get is3D;
  bool get followLocation;
  double get bearing;
  DateTime? get lightingAt;
  GeoCoordinate? get currentLocation;
  List<GeoCoordinate> get framedCoordinates;
  MapLoadStatus get status;
  int get cameraRevision;
  int get session;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapStateCopyWith<MapState> get copyWith =>
      _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MapState;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapState &&
            (identical(other.center, _this.center) ||
                other.center == _this.center) &&
            (identical(other.zoom, _this.zoom) || other.zoom == _this.zoom) &&
            (identical(other.is3D, _this.is3D) || other.is3D == _this.is3D) &&
            (identical(other.followLocation, _this.followLocation) ||
                other.followLocation == _this.followLocation) &&
            (identical(other.bearing, _this.bearing) ||
                other.bearing == _this.bearing) &&
            (identical(other.lightingAt, _this.lightingAt) ||
                other.lightingAt == _this.lightingAt) &&
            (identical(other.currentLocation, _this.currentLocation) ||
                other.currentLocation == _this.currentLocation) &&
            const DeepCollectionEquality().equals(
              other.framedCoordinates,
              _this.framedCoordinates,
            ) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.cameraRevision, _this.cameraRevision) ||
                other.cameraRevision == _this.cameraRevision) &&
            (identical(other.session, _this.session) ||
                other.session == _this.session));
  }

  @override
  int get hashCode {
    final _this = this as MapState;
    return Object.hash(
      runtimeType,
      _this.center,
      _this.zoom,
      _this.is3D,
      _this.followLocation,
      _this.bearing,
      _this.lightingAt,
      _this.currentLocation,
      const DeepCollectionEquality().hash(_this.framedCoordinates),
      _this.status,
      _this.cameraRevision,
      _this.session,
    );
  }

  @override
  String toString() {
    final _this = this as MapState;
    return 'MapState(center: ${_this.center}, zoom: ${_this.zoom}, is3D: ${_this.is3D}, followLocation: ${_this.followLocation}, bearing: ${_this.bearing}, lightingAt: ${_this.lightingAt}, currentLocation: ${_this.currentLocation}, framedCoordinates: ${_this.framedCoordinates}, status: ${_this.status}, cameraRevision: ${_this.cameraRevision}, session: ${_this.session})';
  }
}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) =
      _$MapStateCopyWithImpl;
  @useResult
  $Res call({
    GeoCoordinate center,
    double zoom,
    bool is3D,
    bool followLocation,
    double bearing,
    DateTime? lightingAt,
    GeoCoordinate? currentLocation,
    List<GeoCoordinate> framedCoordinates,
    MapLoadStatus status,
    int cameraRevision,
    int session,
  });

  $GeoCoordinateCopyWith<$Res> get center;
  $GeoCoordinateCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? center = null,
    Object? zoom = null,
    Object? is3D = null,
    Object? followLocation = null,
    Object? bearing = null,
    Object? lightingAt = freezed,
    Object? currentLocation = freezed,
    Object? framedCoordinates = null,
    Object? status = null,
    Object? cameraRevision = null,
    Object? session = null,
  }) {
    return _then(
      MapState(
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        zoom: null == zoom
            ? _self.zoom
            : zoom // ignore: cast_nullable_to_non_nullable
                  as double,
        is3D: null == is3D
            ? _self.is3D
            : is3D // ignore: cast_nullable_to_non_nullable
                  as bool,
        followLocation: null == followLocation
            ? _self.followLocation
            : followLocation // ignore: cast_nullable_to_non_nullable
                  as bool,
        bearing: null == bearing
            ? _self.bearing
            : bearing // ignore: cast_nullable_to_non_nullable
                  as double,
        lightingAt: freezed == lightingAt
            ? _self.lightingAt
            : lightingAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        currentLocation: freezed == currentLocation
            ? _self.currentLocation
            : currentLocation // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate?,
        framedCoordinates: null == framedCoordinates
            ? _self.framedCoordinates
            : framedCoordinates // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MapLoadStatus,
        cameraRevision: null == cameraRevision
            ? _self.cameraRevision
            : cameraRevision // ignore: cast_nullable_to_non_nullable
                  as int,
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get center {
    return $GeoCoordinateCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $GeoCoordinateCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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
    TResult Function(_MapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
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
    TResult Function(_MapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState():
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
    TResult? Function(_MapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
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
      GeoCoordinate center,
      double zoom,
      bool is3D,
      bool followLocation,
      double bearing,
      DateTime? lightingAt,
      GeoCoordinate? currentLocation,
      List<GeoCoordinate> framedCoordinates,
      MapLoadStatus status,
      int cameraRevision,
      int session,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
        return $default(
          _that.center,
          _that.zoom,
          _that.is3D,
          _that.followLocation,
          _that.bearing,
          _that.lightingAt,
          _that.currentLocation,
          _that.framedCoordinates,
          _that.status,
          _that.cameraRevision,
          _that.session,
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
      GeoCoordinate center,
      double zoom,
      bool is3D,
      bool followLocation,
      double bearing,
      DateTime? lightingAt,
      GeoCoordinate? currentLocation,
      List<GeoCoordinate> framedCoordinates,
      MapLoadStatus status,
      int cameraRevision,
      int session,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState():
        return $default(
          _that.center,
          _that.zoom,
          _that.is3D,
          _that.followLocation,
          _that.bearing,
          _that.lightingAt,
          _that.currentLocation,
          _that.framedCoordinates,
          _that.status,
          _that.cameraRevision,
          _that.session,
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
      GeoCoordinate center,
      double zoom,
      bool is3D,
      bool followLocation,
      double bearing,
      DateTime? lightingAt,
      GeoCoordinate? currentLocation,
      List<GeoCoordinate> framedCoordinates,
      MapLoadStatus status,
      int cameraRevision,
      int session,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapState() when $default != null:
        return $default(
          _that.center,
          _that.zoom,
          _that.is3D,
          _that.followLocation,
          _that.bearing,
          _that.lightingAt,
          _that.currentLocation,
          _that.framedCoordinates,
          _that.status,
          _that.cameraRevision,
          _that.session,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapState implements MapState {
  const _MapState({
    this.center = const GeoCoordinate(latitude: 37.5476, longitude: 127.0385),
    this.zoom = 16,
    this.is3D = true,
    this.followLocation = false,
    this.bearing = 0,
    this.lightingAt,
    this.currentLocation,
    List<GeoCoordinate> framedCoordinates = const [],
    this.status = MapLoadStatus.loading,
    this.cameraRevision = 0,
    this.session = 0,
  }) : _framedCoordinates = framedCoordinates;

  @override
  @JsonKey()
  final GeoCoordinate center;
  @override
  @JsonKey()
  final double zoom;
  @override
  @JsonKey()
  final bool is3D;
  @override
  @JsonKey()
  final bool followLocation;
  @override
  @JsonKey()
  final double bearing;
  @override
  final DateTime? lightingAt;
  @override
  final GeoCoordinate? currentLocation;
  final List<GeoCoordinate> _framedCoordinates;
  @override
  @JsonKey()
  List<GeoCoordinate> get framedCoordinates {
    if (_framedCoordinates is EqualUnmodifiableListView)
      return _framedCoordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_framedCoordinates);
  }

  @override
  @JsonKey()
  final MapLoadStatus status;
  @override
  @JsonKey()
  final int cameraRevision;
  @override
  @JsonKey()
  final int session;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapStateCopyWith<_MapState> get copyWith =>
      __$MapStateCopyWithImpl<_MapState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapState &&
            (identical(other.center, center) || other.center == center) &&
            (identical(other.zoom, zoom) || other.zoom == zoom) &&
            (identical(other.is3D, is3D) || other.is3D == is3D) &&
            (identical(other.followLocation, followLocation) ||
                other.followLocation == followLocation) &&
            (identical(other.bearing, bearing) || other.bearing == bearing) &&
            (identical(other.lightingAt, lightingAt) ||
                other.lightingAt == lightingAt) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality().equals(
              other.framedCoordinates,
              _framedCoordinates,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cameraRevision, cameraRevision) ||
                other.cameraRevision == cameraRevision) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      center,
      zoom,
      is3D,
      followLocation,
      bearing,
      lightingAt,
      currentLocation,
      const DeepCollectionEquality().hash(_framedCoordinates),
      status,
      cameraRevision,
      session,
    );
  }

  @override
  String toString() {
    return 'MapState(center: $center, zoom: $zoom, is3D: $is3D, followLocation: $followLocation, bearing: $bearing, lightingAt: $lightingAt, currentLocation: $currentLocation, framedCoordinates: $framedCoordinates, status: $status, cameraRevision: $cameraRevision, session: $session)';
  }
}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) =
      __$MapStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeoCoordinate center,
    double zoom,
    bool is3D,
    bool followLocation,
    double bearing,
    DateTime? lightingAt,
    GeoCoordinate? currentLocation,
    List<GeoCoordinate> framedCoordinates,
    MapLoadStatus status,
    int cameraRevision,
    int session,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get center;
  @override
  $GeoCoordinateCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$MapStateCopyWithImpl<$Res> implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? center = null,
    Object? zoom = null,
    Object? is3D = null,
    Object? followLocation = null,
    Object? bearing = null,
    Object? lightingAt = freezed,
    Object? currentLocation = freezed,
    Object? framedCoordinates = null,
    Object? status = null,
    Object? cameraRevision = null,
    Object? session = null,
  }) {
    return _then(
      _MapState(
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        zoom: null == zoom
            ? _self.zoom
            : zoom // ignore: cast_nullable_to_non_nullable
                  as double,
        is3D: null == is3D
            ? _self.is3D
            : is3D // ignore: cast_nullable_to_non_nullable
                  as bool,
        followLocation: null == followLocation
            ? _self.followLocation
            : followLocation // ignore: cast_nullable_to_non_nullable
                  as bool,
        bearing: null == bearing
            ? _self.bearing
            : bearing // ignore: cast_nullable_to_non_nullable
                  as double,
        lightingAt: freezed == lightingAt
            ? _self.lightingAt
            : lightingAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        currentLocation: freezed == currentLocation
            ? _self.currentLocation
            : currentLocation // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate?,
        framedCoordinates: null == framedCoordinates
            ? _self._framedCoordinates
            : framedCoordinates // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MapLoadStatus,
        cameraRevision: null == cameraRevision
            ? _self.cameraRevision
            : cameraRevision // ignore: cast_nullable_to_non_nullable
                  as int,
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get center {
    return $GeoCoordinateCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res>? get currentLocation {
    if (_self.currentLocation == null) {
      return null;
    }

    return $GeoCoordinateCopyWith<$Res>(_self.currentLocation!, (value) {
      return _then(_self.copyWith(currentLocation: value));
    });
  }
}
