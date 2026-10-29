// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_coverage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PredictionCoverage {
  String get areaId;
  String get name;
  PredictionBounds get bounds;
  GeoCoordinate get center;
  List<List<GeoCoordinate>> get walkingNetwork;
  List<PredictionAccessPoint> get accessPoints;
  double get maximumSnappingDistanceMeters;
  String get dataVersion;
  String get predictionDataVersion;
  String get quality;
  String get attribution;
  PredictionConnectivity get connectivity;

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionCoverageCopyWith<PredictionCoverage> get copyWith =>
      _$PredictionCoverageCopyWithImpl<PredictionCoverage>(
        this as PredictionCoverage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionCoverage;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionCoverage &&
            (identical(other.areaId, _this.areaId) ||
                other.areaId == _this.areaId) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.bounds, _this.bounds) ||
                other.bounds == _this.bounds) &&
            (identical(other.center, _this.center) ||
                other.center == _this.center) &&
            const DeepCollectionEquality().equals(
              other.walkingNetwork,
              _this.walkingNetwork,
            ) &&
            const DeepCollectionEquality().equals(
              other.accessPoints,
              _this.accessPoints,
            ) &&
            (identical(
                  other.maximumSnappingDistanceMeters,
                  _this.maximumSnappingDistanceMeters,
                ) ||
                other.maximumSnappingDistanceMeters ==
                    _this.maximumSnappingDistanceMeters) &&
            (identical(other.dataVersion, _this.dataVersion) ||
                other.dataVersion == _this.dataVersion) &&
            (identical(
                  other.predictionDataVersion,
                  _this.predictionDataVersion,
                ) ||
                other.predictionDataVersion == _this.predictionDataVersion) &&
            (identical(other.quality, _this.quality) ||
                other.quality == _this.quality) &&
            (identical(other.attribution, _this.attribution) ||
                other.attribution == _this.attribution) &&
            (identical(other.connectivity, _this.connectivity) ||
                other.connectivity == _this.connectivity));
  }

  @override
  int get hashCode {
    final _this = this as PredictionCoverage;
    return Object.hash(
      runtimeType,
      _this.areaId,
      _this.name,
      _this.bounds,
      _this.center,
      const DeepCollectionEquality().hash(_this.walkingNetwork),
      const DeepCollectionEquality().hash(_this.accessPoints),
      _this.maximumSnappingDistanceMeters,
      _this.dataVersion,
      _this.predictionDataVersion,
      _this.quality,
      _this.attribution,
      _this.connectivity,
    );
  }

  @override
  String toString() {
    final _this = this as PredictionCoverage;
    return 'PredictionCoverage(areaId: ${_this.areaId}, name: ${_this.name}, bounds: ${_this.bounds}, center: ${_this.center}, walkingNetwork: ${_this.walkingNetwork}, accessPoints: ${_this.accessPoints}, maximumSnappingDistanceMeters: ${_this.maximumSnappingDistanceMeters}, dataVersion: ${_this.dataVersion}, predictionDataVersion: ${_this.predictionDataVersion}, quality: ${_this.quality}, attribution: ${_this.attribution}, connectivity: ${_this.connectivity})';
  }
}

/// @nodoc
abstract mixin class $PredictionCoverageCopyWith<$Res> {
  factory $PredictionCoverageCopyWith(
    PredictionCoverage value,
    $Res Function(PredictionCoverage) _then,
  ) = _$PredictionCoverageCopyWithImpl;
  @useResult
  $Res call({
    String areaId,
    String name,
    PredictionBounds bounds,
    GeoCoordinate center,
    List<List<GeoCoordinate>> walkingNetwork,
    List<PredictionAccessPoint> accessPoints,
    double maximumSnappingDistanceMeters,
    String dataVersion,
    String predictionDataVersion,
    String quality,
    String attribution,
    PredictionConnectivity connectivity,
  });

  $PredictionBoundsCopyWith<$Res> get bounds;
  $GeoCoordinateCopyWith<$Res> get center;
  $PredictionConnectivityCopyWith<$Res> get connectivity;
}

/// @nodoc
class _$PredictionCoverageCopyWithImpl<$Res>
    implements $PredictionCoverageCopyWith<$Res> {
  _$PredictionCoverageCopyWithImpl(this._self, this._then);

  final PredictionCoverage _self;
  final $Res Function(PredictionCoverage) _then;

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? areaId = null,
    Object? name = null,
    Object? bounds = null,
    Object? center = null,
    Object? walkingNetwork = null,
    Object? accessPoints = null,
    Object? maximumSnappingDistanceMeters = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? quality = null,
    Object? attribution = null,
    Object? connectivity = null,
  }) {
    return _then(
      PredictionCoverage(
        areaId: null == areaId
            ? _self.areaId
            : areaId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        bounds: null == bounds
            ? _self.bounds
            : bounds // ignore: cast_nullable_to_non_nullable
                  as PredictionBounds,
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        walkingNetwork: null == walkingNetwork
            ? _self.walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as List<List<GeoCoordinate>>,
        accessPoints: null == accessPoints
            ? _self.accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<PredictionAccessPoint>,
        maximumSnappingDistanceMeters: null == maximumSnappingDistanceMeters
            ? _self.maximumSnappingDistanceMeters
            : maximumSnappingDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        predictionDataVersion: null == predictionDataVersion
            ? _self.predictionDataVersion
            : predictionDataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        quality: null == quality
            ? _self.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
        connectivity: null == connectivity
            ? _self.connectivity
            : connectivity // ignore: cast_nullable_to_non_nullable
                  as PredictionConnectivity,
      ),
    );
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionBoundsCopyWith<$Res> get bounds {
    return $PredictionBoundsCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get center {
    return $GeoCoordinateCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionConnectivityCopyWith<$Res> get connectivity {
    return $PredictionConnectivityCopyWith<$Res>(_self.connectivity, (value) {
      return _then(_self.copyWith(connectivity: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionCoverage].
extension PredictionCoveragePatterns on PredictionCoverage {
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
    TResult Function(_PredictionCoverage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage() when $default != null:
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
    TResult Function(_PredictionCoverage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage():
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
    TResult? Function(_PredictionCoverage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage() when $default != null:
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
      String areaId,
      String name,
      PredictionBounds bounds,
      GeoCoordinate center,
      List<List<GeoCoordinate>> walkingNetwork,
      List<PredictionAccessPoint> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivity connectivity,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage() when $default != null:
        return $default(
          _that.areaId,
          _that.name,
          _that.bounds,
          _that.center,
          _that.walkingNetwork,
          _that.accessPoints,
          _that.maximumSnappingDistanceMeters,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.quality,
          _that.attribution,
          _that.connectivity,
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
      String areaId,
      String name,
      PredictionBounds bounds,
      GeoCoordinate center,
      List<List<GeoCoordinate>> walkingNetwork,
      List<PredictionAccessPoint> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivity connectivity,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage():
        return $default(
          _that.areaId,
          _that.name,
          _that.bounds,
          _that.center,
          _that.walkingNetwork,
          _that.accessPoints,
          _that.maximumSnappingDistanceMeters,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.quality,
          _that.attribution,
          _that.connectivity,
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
      String areaId,
      String name,
      PredictionBounds bounds,
      GeoCoordinate center,
      List<List<GeoCoordinate>> walkingNetwork,
      List<PredictionAccessPoint> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivity connectivity,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverage() when $default != null:
        return $default(
          _that.areaId,
          _that.name,
          _that.bounds,
          _that.center,
          _that.walkingNetwork,
          _that.accessPoints,
          _that.maximumSnappingDistanceMeters,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.quality,
          _that.attribution,
          _that.connectivity,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionCoverage implements PredictionCoverage {
  const _PredictionCoverage({
    required this.areaId,
    required this.name,
    required this.bounds,
    required this.center,
    required List<List<GeoCoordinate>> walkingNetwork,
    required List<PredictionAccessPoint> accessPoints,
    required this.maximumSnappingDistanceMeters,
    required this.dataVersion,
    required this.predictionDataVersion,
    required this.quality,
    required this.attribution,
    required this.connectivity,
  }) : _walkingNetwork = walkingNetwork,
       _accessPoints = accessPoints;

  @override
  final String areaId;
  @override
  final String name;
  @override
  final PredictionBounds bounds;
  @override
  final GeoCoordinate center;
  final List<List<GeoCoordinate>> _walkingNetwork;
  @override
  List<List<GeoCoordinate>> get walkingNetwork {
    if (_walkingNetwork is EqualUnmodifiableListView) return _walkingNetwork;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walkingNetwork);
  }

  final List<PredictionAccessPoint> _accessPoints;
  @override
  List<PredictionAccessPoint> get accessPoints {
    if (_accessPoints is EqualUnmodifiableListView) return _accessPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessPoints);
  }

  @override
  final double maximumSnappingDistanceMeters;
  @override
  final String dataVersion;
  @override
  final String predictionDataVersion;
  @override
  final String quality;
  @override
  final String attribution;
  @override
  final PredictionConnectivity connectivity;

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionCoverageCopyWith<_PredictionCoverage> get copyWith =>
      __$PredictionCoverageCopyWithImpl<_PredictionCoverage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionCoverage &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.center, center) || other.center == center) &&
            const DeepCollectionEquality().equals(
              other.walkingNetwork,
              _walkingNetwork,
            ) &&
            const DeepCollectionEquality().equals(
              other.accessPoints,
              _accessPoints,
            ) &&
            (identical(
                  other.maximumSnappingDistanceMeters,
                  maximumSnappingDistanceMeters,
                ) ||
                other.maximumSnappingDistanceMeters ==
                    maximumSnappingDistanceMeters) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.predictionDataVersion, predictionDataVersion) ||
                other.predictionDataVersion == predictionDataVersion) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution) &&
            (identical(other.connectivity, connectivity) ||
                other.connectivity == connectivity));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      areaId,
      name,
      bounds,
      center,
      const DeepCollectionEquality().hash(_walkingNetwork),
      const DeepCollectionEquality().hash(_accessPoints),
      maximumSnappingDistanceMeters,
      dataVersion,
      predictionDataVersion,
      quality,
      attribution,
      connectivity,
    );
  }

  @override
  String toString() {
    return 'PredictionCoverage(areaId: $areaId, name: $name, bounds: $bounds, center: $center, walkingNetwork: $walkingNetwork, accessPoints: $accessPoints, maximumSnappingDistanceMeters: $maximumSnappingDistanceMeters, dataVersion: $dataVersion, predictionDataVersion: $predictionDataVersion, quality: $quality, attribution: $attribution, connectivity: $connectivity)';
  }
}

/// @nodoc
abstract mixin class _$PredictionCoverageCopyWith<$Res>
    implements $PredictionCoverageCopyWith<$Res> {
  factory _$PredictionCoverageCopyWith(
    _PredictionCoverage value,
    $Res Function(_PredictionCoverage) _then,
  ) = __$PredictionCoverageCopyWithImpl;
  @override
  @useResult
  $Res call({
    String areaId,
    String name,
    PredictionBounds bounds,
    GeoCoordinate center,
    List<List<GeoCoordinate>> walkingNetwork,
    List<PredictionAccessPoint> accessPoints,
    double maximumSnappingDistanceMeters,
    String dataVersion,
    String predictionDataVersion,
    String quality,
    String attribution,
    PredictionConnectivity connectivity,
  });

  @override
  $PredictionBoundsCopyWith<$Res> get bounds;
  @override
  $GeoCoordinateCopyWith<$Res> get center;
  @override
  $PredictionConnectivityCopyWith<$Res> get connectivity;
}

/// @nodoc
class __$PredictionCoverageCopyWithImpl<$Res>
    implements _$PredictionCoverageCopyWith<$Res> {
  __$PredictionCoverageCopyWithImpl(this._self, this._then);

  final _PredictionCoverage _self;
  final $Res Function(_PredictionCoverage) _then;

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? areaId = null,
    Object? name = null,
    Object? bounds = null,
    Object? center = null,
    Object? walkingNetwork = null,
    Object? accessPoints = null,
    Object? maximumSnappingDistanceMeters = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? quality = null,
    Object? attribution = null,
    Object? connectivity = null,
  }) {
    return _then(
      _PredictionCoverage(
        areaId: null == areaId
            ? _self.areaId
            : areaId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        bounds: null == bounds
            ? _self.bounds
            : bounds // ignore: cast_nullable_to_non_nullable
                  as PredictionBounds,
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        walkingNetwork: null == walkingNetwork
            ? _self._walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as List<List<GeoCoordinate>>,
        accessPoints: null == accessPoints
            ? _self._accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<PredictionAccessPoint>,
        maximumSnappingDistanceMeters: null == maximumSnappingDistanceMeters
            ? _self.maximumSnappingDistanceMeters
            : maximumSnappingDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        predictionDataVersion: null == predictionDataVersion
            ? _self.predictionDataVersion
            : predictionDataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        quality: null == quality
            ? _self.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
        connectivity: null == connectivity
            ? _self.connectivity
            : connectivity // ignore: cast_nullable_to_non_nullable
                  as PredictionConnectivity,
      ),
    );
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionBoundsCopyWith<$Res> get bounds {
    return $PredictionBoundsCopyWith<$Res>(_self.bounds, (value) {
      return _then(_self.copyWith(bounds: value));
    });
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get center {
    return $GeoCoordinateCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of PredictionCoverage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionConnectivityCopyWith<$Res> get connectivity {
    return $PredictionConnectivityCopyWith<$Res>(_self.connectivity, (value) {
      return _then(_self.copyWith(connectivity: value));
    });
  }
}

/// @nodoc
mixin _$PredictionBounds {
  double get west;
  double get south;
  double get east;
  double get north;

  /// Create a copy of PredictionBounds
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionBoundsCopyWith<PredictionBounds> get copyWith =>
      _$PredictionBoundsCopyWithImpl<PredictionBounds>(
        this as PredictionBounds,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionBounds;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionBounds &&
            (identical(other.west, _this.west) || other.west == _this.west) &&
            (identical(other.south, _this.south) ||
                other.south == _this.south) &&
            (identical(other.east, _this.east) || other.east == _this.east) &&
            (identical(other.north, _this.north) ||
                other.north == _this.north));
  }

  @override
  int get hashCode {
    final _this = this as PredictionBounds;
    return Object.hash(
      runtimeType,
      _this.west,
      _this.south,
      _this.east,
      _this.north,
    );
  }

  @override
  String toString() {
    final _this = this as PredictionBounds;
    return 'PredictionBounds(west: ${_this.west}, south: ${_this.south}, east: ${_this.east}, north: ${_this.north})';
  }
}

/// @nodoc
abstract mixin class $PredictionBoundsCopyWith<$Res> {
  factory $PredictionBoundsCopyWith(
    PredictionBounds value,
    $Res Function(PredictionBounds) _then,
  ) = _$PredictionBoundsCopyWithImpl;
  @useResult
  $Res call({double west, double south, double east, double north});
}

/// @nodoc
class _$PredictionBoundsCopyWithImpl<$Res>
    implements $PredictionBoundsCopyWith<$Res> {
  _$PredictionBoundsCopyWithImpl(this._self, this._then);

  final PredictionBounds _self;
  final $Res Function(PredictionBounds) _then;

  /// Create a copy of PredictionBounds
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? west = null,
    Object? south = null,
    Object? east = null,
    Object? north = null,
  }) {
    return _then(
      PredictionBounds(
        west: null == west
            ? _self.west
            : west // ignore: cast_nullable_to_non_nullable
                  as double,
        south: null == south
            ? _self.south
            : south // ignore: cast_nullable_to_non_nullable
                  as double,
        east: null == east
            ? _self.east
            : east // ignore: cast_nullable_to_non_nullable
                  as double,
        north: null == north
            ? _self.north
            : north // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PredictionBounds].
extension PredictionBoundsPatterns on PredictionBounds {
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
    TResult Function(_PredictionBounds value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds() when $default != null:
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
    TResult Function(_PredictionBounds value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds():
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
    TResult? Function(_PredictionBounds value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds() when $default != null:
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
    TResult Function(double west, double south, double east, double north)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds() when $default != null:
        return $default(_that.west, _that.south, _that.east, _that.north);
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
    TResult Function(double west, double south, double east, double north)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds():
        return $default(_that.west, _that.south, _that.east, _that.north);
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
    TResult? Function(double west, double south, double east, double north)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionBounds() when $default != null:
        return $default(_that.west, _that.south, _that.east, _that.north);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionBounds extends PredictionBounds {
  const _PredictionBounds({
    required this.west,
    required this.south,
    required this.east,
    required this.north,
  }) : super._();

  @override
  final double west;
  @override
  final double south;
  @override
  final double east;
  @override
  final double north;

  /// Create a copy of PredictionBounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionBoundsCopyWith<_PredictionBounds> get copyWith =>
      __$PredictionBoundsCopyWithImpl<_PredictionBounds>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionBounds &&
            (identical(other.west, west) || other.west == west) &&
            (identical(other.south, south) || other.south == south) &&
            (identical(other.east, east) || other.east == east) &&
            (identical(other.north, north) || other.north == north));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, west, south, east, north);
  }

  @override
  String toString() {
    return 'PredictionBounds(west: $west, south: $south, east: $east, north: $north)';
  }
}

/// @nodoc
abstract mixin class _$PredictionBoundsCopyWith<$Res>
    implements $PredictionBoundsCopyWith<$Res> {
  factory _$PredictionBoundsCopyWith(
    _PredictionBounds value,
    $Res Function(_PredictionBounds) _then,
  ) = __$PredictionBoundsCopyWithImpl;
  @override
  @useResult
  $Res call({double west, double south, double east, double north});
}

/// @nodoc
class __$PredictionBoundsCopyWithImpl<$Res>
    implements _$PredictionBoundsCopyWith<$Res> {
  __$PredictionBoundsCopyWithImpl(this._self, this._then);

  final _PredictionBounds _self;
  final $Res Function(_PredictionBounds) _then;

  /// Create a copy of PredictionBounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? west = null,
    Object? south = null,
    Object? east = null,
    Object? north = null,
  }) {
    return _then(
      _PredictionBounds(
        west: null == west
            ? _self.west
            : west // ignore: cast_nullable_to_non_nullable
                  as double,
        south: null == south
            ? _self.south
            : south // ignore: cast_nullable_to_non_nullable
                  as double,
        east: null == east
            ? _self.east
            : east // ignore: cast_nullable_to_non_nullable
                  as double,
        north: null == north
            ? _self.north
            : north // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
mixin _$PredictionAccessPoint {
  String get id;
  String get name;
  GeoCoordinate get coordinate;

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionAccessPointCopyWith<PredictionAccessPoint> get copyWith =>
      _$PredictionAccessPointCopyWithImpl<PredictionAccessPoint>(
        this as PredictionAccessPoint,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionAccessPoint;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionAccessPoint &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate));
  }

  @override
  int get hashCode {
    final _this = this as PredictionAccessPoint;
    return Object.hash(runtimeType, _this.id, _this.name, _this.coordinate);
  }

  @override
  String toString() {
    final _this = this as PredictionAccessPoint;
    return 'PredictionAccessPoint(id: ${_this.id}, name: ${_this.name}, coordinate: ${_this.coordinate})';
  }
}

/// @nodoc
abstract mixin class $PredictionAccessPointCopyWith<$Res> {
  factory $PredictionAccessPointCopyWith(
    PredictionAccessPoint value,
    $Res Function(PredictionAccessPoint) _then,
  ) = _$PredictionAccessPointCopyWithImpl;
  @useResult
  $Res call({String id, String name, GeoCoordinate coordinate});

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PredictionAccessPointCopyWithImpl<$Res>
    implements $PredictionAccessPointCopyWith<$Res> {
  _$PredictionAccessPointCopyWithImpl(this._self, this._then);

  final PredictionAccessPoint _self;
  final $Res Function(PredictionAccessPoint) _then;

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      PredictionAccessPoint(
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

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionAccessPoint].
extension PredictionAccessPointPatterns on PredictionAccessPoint {
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
    TResult Function(_PredictionAccessPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPoint() when $default != null:
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
    TResult Function(_PredictionAccessPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPoint():
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
    TResult? Function(_PredictionAccessPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPoint() when $default != null:
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
      case _PredictionAccessPoint() when $default != null:
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
      case _PredictionAccessPoint():
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
      case _PredictionAccessPoint() when $default != null:
        return $default(_that.id, _that.name, _that.coordinate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionAccessPoint implements PredictionAccessPoint {
  const _PredictionAccessPoint({
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

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionAccessPointCopyWith<_PredictionAccessPoint> get copyWith =>
      __$PredictionAccessPointCopyWithImpl<_PredictionAccessPoint>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionAccessPoint &&
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
    return 'PredictionAccessPoint(id: $id, name: $name, coordinate: $coordinate)';
  }
}

/// @nodoc
abstract mixin class _$PredictionAccessPointCopyWith<$Res>
    implements $PredictionAccessPointCopyWith<$Res> {
  factory _$PredictionAccessPointCopyWith(
    _PredictionAccessPoint value,
    $Res Function(_PredictionAccessPoint) _then,
  ) = __$PredictionAccessPointCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, GeoCoordinate coordinate});

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PredictionAccessPointCopyWithImpl<$Res>
    implements _$PredictionAccessPointCopyWith<$Res> {
  __$PredictionAccessPointCopyWithImpl(this._self, this._then);

  final _PredictionAccessPoint _self;
  final $Res Function(_PredictionAccessPoint) _then;

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      _PredictionAccessPoint(
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

  /// Create a copy of PredictionAccessPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
mixin _$PredictionConnectivity {
  int get nodeCount;
  int get edgeCount;
  int get weakComponentCount;
  int get largestComponentNodeCount;
  String get componentPolicy;
  int get sourceWeakComponentCount;
  int get excludedDisconnectedNodeCount;

  /// Create a copy of PredictionConnectivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionConnectivityCopyWith<PredictionConnectivity> get copyWith =>
      _$PredictionConnectivityCopyWithImpl<PredictionConnectivity>(
        this as PredictionConnectivity,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionConnectivity;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionConnectivity &&
            (identical(other.nodeCount, _this.nodeCount) ||
                other.nodeCount == _this.nodeCount) &&
            (identical(other.edgeCount, _this.edgeCount) ||
                other.edgeCount == _this.edgeCount) &&
            (identical(other.weakComponentCount, _this.weakComponentCount) ||
                other.weakComponentCount == _this.weakComponentCount) &&
            (identical(
                  other.largestComponentNodeCount,
                  _this.largestComponentNodeCount,
                ) ||
                other.largestComponentNodeCount ==
                    _this.largestComponentNodeCount) &&
            (identical(other.componentPolicy, _this.componentPolicy) ||
                other.componentPolicy == _this.componentPolicy) &&
            (identical(
                  other.sourceWeakComponentCount,
                  _this.sourceWeakComponentCount,
                ) ||
                other.sourceWeakComponentCount ==
                    _this.sourceWeakComponentCount) &&
            (identical(
                  other.excludedDisconnectedNodeCount,
                  _this.excludedDisconnectedNodeCount,
                ) ||
                other.excludedDisconnectedNodeCount ==
                    _this.excludedDisconnectedNodeCount));
  }

  @override
  int get hashCode {
    final _this = this as PredictionConnectivity;
    return Object.hash(
      runtimeType,
      _this.nodeCount,
      _this.edgeCount,
      _this.weakComponentCount,
      _this.largestComponentNodeCount,
      _this.componentPolicy,
      _this.sourceWeakComponentCount,
      _this.excludedDisconnectedNodeCount,
    );
  }

  @override
  String toString() {
    final _this = this as PredictionConnectivity;
    return 'PredictionConnectivity(nodeCount: ${_this.nodeCount}, edgeCount: ${_this.edgeCount}, weakComponentCount: ${_this.weakComponentCount}, largestComponentNodeCount: ${_this.largestComponentNodeCount}, componentPolicy: ${_this.componentPolicy}, sourceWeakComponentCount: ${_this.sourceWeakComponentCount}, excludedDisconnectedNodeCount: ${_this.excludedDisconnectedNodeCount})';
  }
}

/// @nodoc
abstract mixin class $PredictionConnectivityCopyWith<$Res> {
  factory $PredictionConnectivityCopyWith(
    PredictionConnectivity value,
    $Res Function(PredictionConnectivity) _then,
  ) = _$PredictionConnectivityCopyWithImpl;
  @useResult
  $Res call({
    int nodeCount,
    int edgeCount,
    int weakComponentCount,
    int largestComponentNodeCount,
    String componentPolicy,
    int sourceWeakComponentCount,
    int excludedDisconnectedNodeCount,
  });
}

/// @nodoc
class _$PredictionConnectivityCopyWithImpl<$Res>
    implements $PredictionConnectivityCopyWith<$Res> {
  _$PredictionConnectivityCopyWithImpl(this._self, this._then);

  final PredictionConnectivity _self;
  final $Res Function(PredictionConnectivity) _then;

  /// Create a copy of PredictionConnectivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeCount = null,
    Object? edgeCount = null,
    Object? weakComponentCount = null,
    Object? largestComponentNodeCount = null,
    Object? componentPolicy = null,
    Object? sourceWeakComponentCount = null,
    Object? excludedDisconnectedNodeCount = null,
  }) {
    return _then(
      PredictionConnectivity(
        nodeCount: null == nodeCount
            ? _self.nodeCount
            : nodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        edgeCount: null == edgeCount
            ? _self.edgeCount
            : edgeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        weakComponentCount: null == weakComponentCount
            ? _self.weakComponentCount
            : weakComponentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        largestComponentNodeCount: null == largestComponentNodeCount
            ? _self.largestComponentNodeCount
            : largestComponentNodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        componentPolicy: null == componentPolicy
            ? _self.componentPolicy
            : componentPolicy // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceWeakComponentCount: null == sourceWeakComponentCount
            ? _self.sourceWeakComponentCount
            : sourceWeakComponentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        excludedDisconnectedNodeCount: null == excludedDisconnectedNodeCount
            ? _self.excludedDisconnectedNodeCount
            : excludedDisconnectedNodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PredictionConnectivity].
extension PredictionConnectivityPatterns on PredictionConnectivity {
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
    TResult Function(_PredictionConnectivity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity() when $default != null:
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
    TResult Function(_PredictionConnectivity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity():
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
    TResult? Function(_PredictionConnectivity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity() when $default != null:
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
      int nodeCount,
      int edgeCount,
      int weakComponentCount,
      int largestComponentNodeCount,
      String componentPolicy,
      int sourceWeakComponentCount,
      int excludedDisconnectedNodeCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity() when $default != null:
        return $default(
          _that.nodeCount,
          _that.edgeCount,
          _that.weakComponentCount,
          _that.largestComponentNodeCount,
          _that.componentPolicy,
          _that.sourceWeakComponentCount,
          _that.excludedDisconnectedNodeCount,
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
      int nodeCount,
      int edgeCount,
      int weakComponentCount,
      int largestComponentNodeCount,
      String componentPolicy,
      int sourceWeakComponentCount,
      int excludedDisconnectedNodeCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity():
        return $default(
          _that.nodeCount,
          _that.edgeCount,
          _that.weakComponentCount,
          _that.largestComponentNodeCount,
          _that.componentPolicy,
          _that.sourceWeakComponentCount,
          _that.excludedDisconnectedNodeCount,
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
      int nodeCount,
      int edgeCount,
      int weakComponentCount,
      int largestComponentNodeCount,
      String componentPolicy,
      int sourceWeakComponentCount,
      int excludedDisconnectedNodeCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivity() when $default != null:
        return $default(
          _that.nodeCount,
          _that.edgeCount,
          _that.weakComponentCount,
          _that.largestComponentNodeCount,
          _that.componentPolicy,
          _that.sourceWeakComponentCount,
          _that.excludedDisconnectedNodeCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionConnectivity implements PredictionConnectivity {
  const _PredictionConnectivity({
    required this.nodeCount,
    required this.edgeCount,
    required this.weakComponentCount,
    required this.largestComponentNodeCount,
    required this.componentPolicy,
    required this.sourceWeakComponentCount,
    required this.excludedDisconnectedNodeCount,
  });

  @override
  final int nodeCount;
  @override
  final int edgeCount;
  @override
  final int weakComponentCount;
  @override
  final int largestComponentNodeCount;
  @override
  final String componentPolicy;
  @override
  final int sourceWeakComponentCount;
  @override
  final int excludedDisconnectedNodeCount;

  /// Create a copy of PredictionConnectivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionConnectivityCopyWith<_PredictionConnectivity> get copyWith =>
      __$PredictionConnectivityCopyWithImpl<_PredictionConnectivity>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionConnectivity &&
            (identical(other.nodeCount, nodeCount) ||
                other.nodeCount == nodeCount) &&
            (identical(other.edgeCount, edgeCount) ||
                other.edgeCount == edgeCount) &&
            (identical(other.weakComponentCount, weakComponentCount) ||
                other.weakComponentCount == weakComponentCount) &&
            (identical(
                  other.largestComponentNodeCount,
                  largestComponentNodeCount,
                ) ||
                other.largestComponentNodeCount == largestComponentNodeCount) &&
            (identical(other.componentPolicy, componentPolicy) ||
                other.componentPolicy == componentPolicy) &&
            (identical(
                  other.sourceWeakComponentCount,
                  sourceWeakComponentCount,
                ) ||
                other.sourceWeakComponentCount == sourceWeakComponentCount) &&
            (identical(
                  other.excludedDisconnectedNodeCount,
                  excludedDisconnectedNodeCount,
                ) ||
                other.excludedDisconnectedNodeCount ==
                    excludedDisconnectedNodeCount));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      nodeCount,
      edgeCount,
      weakComponentCount,
      largestComponentNodeCount,
      componentPolicy,
      sourceWeakComponentCount,
      excludedDisconnectedNodeCount,
    );
  }

  @override
  String toString() {
    return 'PredictionConnectivity(nodeCount: $nodeCount, edgeCount: $edgeCount, weakComponentCount: $weakComponentCount, largestComponentNodeCount: $largestComponentNodeCount, componentPolicy: $componentPolicy, sourceWeakComponentCount: $sourceWeakComponentCount, excludedDisconnectedNodeCount: $excludedDisconnectedNodeCount)';
  }
}

/// @nodoc
abstract mixin class _$PredictionConnectivityCopyWith<$Res>
    implements $PredictionConnectivityCopyWith<$Res> {
  factory _$PredictionConnectivityCopyWith(
    _PredictionConnectivity value,
    $Res Function(_PredictionConnectivity) _then,
  ) = __$PredictionConnectivityCopyWithImpl;
  @override
  @useResult
  $Res call({
    int nodeCount,
    int edgeCount,
    int weakComponentCount,
    int largestComponentNodeCount,
    String componentPolicy,
    int sourceWeakComponentCount,
    int excludedDisconnectedNodeCount,
  });
}

/// @nodoc
class __$PredictionConnectivityCopyWithImpl<$Res>
    implements _$PredictionConnectivityCopyWith<$Res> {
  __$PredictionConnectivityCopyWithImpl(this._self, this._then);

  final _PredictionConnectivity _self;
  final $Res Function(_PredictionConnectivity) _then;

  /// Create a copy of PredictionConnectivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nodeCount = null,
    Object? edgeCount = null,
    Object? weakComponentCount = null,
    Object? largestComponentNodeCount = null,
    Object? componentPolicy = null,
    Object? sourceWeakComponentCount = null,
    Object? excludedDisconnectedNodeCount = null,
  }) {
    return _then(
      _PredictionConnectivity(
        nodeCount: null == nodeCount
            ? _self.nodeCount
            : nodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        edgeCount: null == edgeCount
            ? _self.edgeCount
            : edgeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        weakComponentCount: null == weakComponentCount
            ? _self.weakComponentCount
            : weakComponentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        largestComponentNodeCount: null == largestComponentNodeCount
            ? _self.largestComponentNodeCount
            : largestComponentNodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        componentPolicy: null == componentPolicy
            ? _self.componentPolicy
            : componentPolicy // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceWeakComponentCount: null == sourceWeakComponentCount
            ? _self.sourceWeakComponentCount
            : sourceWeakComponentCount // ignore: cast_nullable_to_non_nullable
                  as int,
        excludedDisconnectedNodeCount: null == excludedDisconnectedNodeCount
            ? _self.excludedDisconnectedNodeCount
            : excludedDisconnectedNodeCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
