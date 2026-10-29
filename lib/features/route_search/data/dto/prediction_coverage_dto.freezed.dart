// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_coverage_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PredictionCoverageDto {
  String get areaId;
  String get name;
  List<double> get bounds;
  PredictionCoordinateDto get center;
  PredictionNetworkDto get walkingNetwork;
  List<PredictionAccessPointDto> get accessPoints;
  double get maximumSnappingDistanceMeters;
  String get dataVersion;
  String get predictionDataVersion;
  String get quality;
  String get attribution;
  PredictionConnectivityDto get connectivity;

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionCoverageDtoCopyWith<PredictionCoverageDto> get copyWith =>
      _$PredictionCoverageDtoCopyWithImpl<PredictionCoverageDto>(
        this as PredictionCoverageDto,
        _$identity,
      );

  /// Serializes this PredictionCoverageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionCoverageDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionCoverageDto &&
            (identical(other.areaId, _this.areaId) ||
                other.areaId == _this.areaId) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            const DeepCollectionEquality().equals(other.bounds, _this.bounds) &&
            (identical(other.center, _this.center) ||
                other.center == _this.center) &&
            (identical(other.walkingNetwork, _this.walkingNetwork) ||
                other.walkingNetwork == _this.walkingNetwork) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionCoverageDto;
    return Object.hash(
      runtimeType,
      _this.areaId,
      _this.name,
      const DeepCollectionEquality().hash(_this.bounds),
      _this.center,
      _this.walkingNetwork,
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
    final _this = this as PredictionCoverageDto;
    return 'PredictionCoverageDto(areaId: ${_this.areaId}, name: ${_this.name}, bounds: ${_this.bounds}, center: ${_this.center}, walkingNetwork: ${_this.walkingNetwork}, accessPoints: ${_this.accessPoints}, maximumSnappingDistanceMeters: ${_this.maximumSnappingDistanceMeters}, dataVersion: ${_this.dataVersion}, predictionDataVersion: ${_this.predictionDataVersion}, quality: ${_this.quality}, attribution: ${_this.attribution}, connectivity: ${_this.connectivity})';
  }
}

/// @nodoc
abstract mixin class $PredictionCoverageDtoCopyWith<$Res> {
  factory $PredictionCoverageDtoCopyWith(
    PredictionCoverageDto value,
    $Res Function(PredictionCoverageDto) _then,
  ) = _$PredictionCoverageDtoCopyWithImpl;
  @useResult
  $Res call({
    String areaId,
    String name,
    List<double> bounds,
    PredictionCoordinateDto center,
    PredictionNetworkDto walkingNetwork,
    List<PredictionAccessPointDto> accessPoints,
    double maximumSnappingDistanceMeters,
    String dataVersion,
    String predictionDataVersion,
    String quality,
    String attribution,
    PredictionConnectivityDto connectivity,
  });

  $PredictionCoordinateDtoCopyWith<$Res> get center;
  $PredictionNetworkDtoCopyWith<$Res> get walkingNetwork;
  $PredictionConnectivityDtoCopyWith<$Res> get connectivity;
}

/// @nodoc
class _$PredictionCoverageDtoCopyWithImpl<$Res>
    implements $PredictionCoverageDtoCopyWith<$Res> {
  _$PredictionCoverageDtoCopyWithImpl(this._self, this._then);

  final PredictionCoverageDto _self;
  final $Res Function(PredictionCoverageDto) _then;

  /// Create a copy of PredictionCoverageDto
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
      PredictionCoverageDto(
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
                  as List<double>,
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        walkingNetwork: null == walkingNetwork
            ? _self.walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as PredictionNetworkDto,
        accessPoints: null == accessPoints
            ? _self.accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<PredictionAccessPointDto>,
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
                  as PredictionConnectivityDto,
      ),
    );
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get center {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionNetworkDtoCopyWith<$Res> get walkingNetwork {
    return $PredictionNetworkDtoCopyWith<$Res>(_self.walkingNetwork, (value) {
      return _then(_self.copyWith(walkingNetwork: value));
    });
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionConnectivityDtoCopyWith<$Res> get connectivity {
    return $PredictionConnectivityDtoCopyWith<$Res>(_self.connectivity, (
      value,
    ) {
      return _then(_self.copyWith(connectivity: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionCoverageDto].
extension PredictionCoverageDtoPatterns on PredictionCoverageDto {
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
    TResult Function(_PredictionCoverageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto() when $default != null:
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
    TResult Function(_PredictionCoverageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto():
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
    TResult? Function(_PredictionCoverageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto() when $default != null:
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
      List<double> bounds,
      PredictionCoordinateDto center,
      PredictionNetworkDto walkingNetwork,
      List<PredictionAccessPointDto> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivityDto connectivity,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto() when $default != null:
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
      List<double> bounds,
      PredictionCoordinateDto center,
      PredictionNetworkDto walkingNetwork,
      List<PredictionAccessPointDto> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivityDto connectivity,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto():
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
      List<double> bounds,
      PredictionCoordinateDto center,
      PredictionNetworkDto walkingNetwork,
      List<PredictionAccessPointDto> accessPoints,
      double maximumSnappingDistanceMeters,
      String dataVersion,
      String predictionDataVersion,
      String quality,
      String attribution,
      PredictionConnectivityDto connectivity,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoverageDto() when $default != null:
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

@JsonSerializable(explicitToJson: true)
class _PredictionCoverageDto implements PredictionCoverageDto {
  const _PredictionCoverageDto({
    required this.areaId,
    required this.name,
    required List<double> bounds,
    required this.center,
    required this.walkingNetwork,
    required List<PredictionAccessPointDto> accessPoints,
    required this.maximumSnappingDistanceMeters,
    required this.dataVersion,
    required this.predictionDataVersion,
    required this.quality,
    required this.attribution,
    required this.connectivity,
  }) : _bounds = bounds,
       _accessPoints = accessPoints;
  factory _PredictionCoverageDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionCoverageDtoFromJson(json);

  @override
  final String areaId;
  @override
  final String name;
  final List<double> _bounds;
  @override
  List<double> get bounds {
    if (_bounds is EqualUnmodifiableListView) return _bounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bounds);
  }

  @override
  final PredictionCoordinateDto center;
  @override
  final PredictionNetworkDto walkingNetwork;
  final List<PredictionAccessPointDto> _accessPoints;
  @override
  List<PredictionAccessPointDto> get accessPoints {
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
  final PredictionConnectivityDto connectivity;

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionCoverageDtoCopyWith<_PredictionCoverageDto> get copyWith =>
      __$PredictionCoverageDtoCopyWithImpl<_PredictionCoverageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionCoverageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionCoverageDto &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.bounds, _bounds) &&
            (identical(other.center, center) || other.center == center) &&
            (identical(other.walkingNetwork, walkingNetwork) ||
                other.walkingNetwork == walkingNetwork) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      areaId,
      name,
      const DeepCollectionEquality().hash(_bounds),
      center,
      walkingNetwork,
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
    return 'PredictionCoverageDto(areaId: $areaId, name: $name, bounds: $bounds, center: $center, walkingNetwork: $walkingNetwork, accessPoints: $accessPoints, maximumSnappingDistanceMeters: $maximumSnappingDistanceMeters, dataVersion: $dataVersion, predictionDataVersion: $predictionDataVersion, quality: $quality, attribution: $attribution, connectivity: $connectivity)';
  }
}

/// @nodoc
abstract mixin class _$PredictionCoverageDtoCopyWith<$Res>
    implements $PredictionCoverageDtoCopyWith<$Res> {
  factory _$PredictionCoverageDtoCopyWith(
    _PredictionCoverageDto value,
    $Res Function(_PredictionCoverageDto) _then,
  ) = __$PredictionCoverageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String areaId,
    String name,
    List<double> bounds,
    PredictionCoordinateDto center,
    PredictionNetworkDto walkingNetwork,
    List<PredictionAccessPointDto> accessPoints,
    double maximumSnappingDistanceMeters,
    String dataVersion,
    String predictionDataVersion,
    String quality,
    String attribution,
    PredictionConnectivityDto connectivity,
  });

  @override
  $PredictionCoordinateDtoCopyWith<$Res> get center;
  @override
  $PredictionNetworkDtoCopyWith<$Res> get walkingNetwork;
  @override
  $PredictionConnectivityDtoCopyWith<$Res> get connectivity;
}

/// @nodoc
class __$PredictionCoverageDtoCopyWithImpl<$Res>
    implements _$PredictionCoverageDtoCopyWith<$Res> {
  __$PredictionCoverageDtoCopyWithImpl(this._self, this._then);

  final _PredictionCoverageDto _self;
  final $Res Function(_PredictionCoverageDto) _then;

  /// Create a copy of PredictionCoverageDto
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
      _PredictionCoverageDto(
        areaId: null == areaId
            ? _self.areaId
            : areaId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        bounds: null == bounds
            ? _self._bounds
            : bounds // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        center: null == center
            ? _self.center
            : center // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        walkingNetwork: null == walkingNetwork
            ? _self.walkingNetwork
            : walkingNetwork // ignore: cast_nullable_to_non_nullable
                  as PredictionNetworkDto,
        accessPoints: null == accessPoints
            ? _self._accessPoints
            : accessPoints // ignore: cast_nullable_to_non_nullable
                  as List<PredictionAccessPointDto>,
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
                  as PredictionConnectivityDto,
      ),
    );
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get center {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.center, (value) {
      return _then(_self.copyWith(center: value));
    });
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionNetworkDtoCopyWith<$Res> get walkingNetwork {
    return $PredictionNetworkDtoCopyWith<$Res>(_self.walkingNetwork, (value) {
      return _then(_self.copyWith(walkingNetwork: value));
    });
  }

  /// Create a copy of PredictionCoverageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionConnectivityDtoCopyWith<$Res> get connectivity {
    return $PredictionConnectivityDtoCopyWith<$Res>(_self.connectivity, (
      value,
    ) {
      return _then(_self.copyWith(connectivity: value));
    });
  }
}

/// @nodoc
mixin _$PredictionNetworkDto {
  String get type;
  List<List<List<double>>> get coordinates;

  /// Create a copy of PredictionNetworkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionNetworkDtoCopyWith<PredictionNetworkDto> get copyWith =>
      _$PredictionNetworkDtoCopyWithImpl<PredictionNetworkDto>(
        this as PredictionNetworkDto,
        _$identity,
      );

  /// Serializes this PredictionNetworkDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionNetworkDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionNetworkDto &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            const DeepCollectionEquality().equals(
              other.coordinates,
              _this.coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionNetworkDto;
    return Object.hash(
      runtimeType,
      _this.type,
      const DeepCollectionEquality().hash(_this.coordinates),
    );
  }

  @override
  String toString() {
    final _this = this as PredictionNetworkDto;
    return 'PredictionNetworkDto(type: ${_this.type}, coordinates: ${_this.coordinates})';
  }
}

/// @nodoc
abstract mixin class $PredictionNetworkDtoCopyWith<$Res> {
  factory $PredictionNetworkDtoCopyWith(
    PredictionNetworkDto value,
    $Res Function(PredictionNetworkDto) _then,
  ) = _$PredictionNetworkDtoCopyWithImpl;
  @useResult
  $Res call({String type, List<List<List<double>>> coordinates});
}

/// @nodoc
class _$PredictionNetworkDtoCopyWithImpl<$Res>
    implements $PredictionNetworkDtoCopyWith<$Res> {
  _$PredictionNetworkDtoCopyWithImpl(this._self, this._then);

  final PredictionNetworkDto _self;
  final $Res Function(PredictionNetworkDto) _then;

  /// Create a copy of PredictionNetworkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      PredictionNetworkDto(
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinates: null == coordinates
            ? _self.coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<List<List<double>>>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PredictionNetworkDto].
extension PredictionNetworkDtoPatterns on PredictionNetworkDto {
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
    TResult Function(_PredictionNetworkDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto() when $default != null:
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
    TResult Function(_PredictionNetworkDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto():
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
    TResult? Function(_PredictionNetworkDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto() when $default != null:
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
    TResult Function(String type, List<List<List<double>>> coordinates)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto() when $default != null:
        return $default(_that.type, _that.coordinates);
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
    TResult Function(String type, List<List<List<double>>> coordinates)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto():
        return $default(_that.type, _that.coordinates);
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
    TResult? Function(String type, List<List<List<double>>> coordinates)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionNetworkDto() when $default != null:
        return $default(_that.type, _that.coordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PredictionNetworkDto implements PredictionNetworkDto {
  const _PredictionNetworkDto({
    required this.type,
    required List<List<List<double>>> coordinates,
  }) : _coordinates = coordinates;
  factory _PredictionNetworkDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionNetworkDtoFromJson(json);

  @override
  final String type;
  final List<List<List<double>>> _coordinates;
  @override
  List<List<List<double>>> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of PredictionNetworkDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionNetworkDtoCopyWith<_PredictionNetworkDto> get copyWith =>
      __$PredictionNetworkDtoCopyWithImpl<_PredictionNetworkDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionNetworkDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionNetworkDto &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other.coordinates,
              _coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_coordinates),
    );
  }

  @override
  String toString() {
    return 'PredictionNetworkDto(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$PredictionNetworkDtoCopyWith<$Res>
    implements $PredictionNetworkDtoCopyWith<$Res> {
  factory _$PredictionNetworkDtoCopyWith(
    _PredictionNetworkDto value,
    $Res Function(_PredictionNetworkDto) _then,
  ) = __$PredictionNetworkDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<List<List<double>>> coordinates});
}

/// @nodoc
class __$PredictionNetworkDtoCopyWithImpl<$Res>
    implements _$PredictionNetworkDtoCopyWith<$Res> {
  __$PredictionNetworkDtoCopyWithImpl(this._self, this._then);

  final _PredictionNetworkDto _self;
  final $Res Function(_PredictionNetworkDto) _then;

  /// Create a copy of PredictionNetworkDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      _PredictionNetworkDto(
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinates: null == coordinates
            ? _self._coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<List<List<double>>>,
      ),
    );
  }
}

/// @nodoc
mixin _$PredictionAccessPointDto {
  String get id;
  String get name;
  PredictionCoordinateDto get coordinate;

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionAccessPointDtoCopyWith<PredictionAccessPointDto> get copyWith =>
      _$PredictionAccessPointDtoCopyWithImpl<PredictionAccessPointDto>(
        this as PredictionAccessPointDto,
        _$identity,
      );

  /// Serializes this PredictionAccessPointDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionAccessPointDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionAccessPointDto &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionAccessPointDto;
    return Object.hash(runtimeType, _this.id, _this.name, _this.coordinate);
  }

  @override
  String toString() {
    final _this = this as PredictionAccessPointDto;
    return 'PredictionAccessPointDto(id: ${_this.id}, name: ${_this.name}, coordinate: ${_this.coordinate})';
  }
}

/// @nodoc
abstract mixin class $PredictionAccessPointDtoCopyWith<$Res> {
  factory $PredictionAccessPointDtoCopyWith(
    PredictionAccessPointDto value,
    $Res Function(PredictionAccessPointDto) _then,
  ) = _$PredictionAccessPointDtoCopyWithImpl;
  @useResult
  $Res call({String id, String name, PredictionCoordinateDto coordinate});

  $PredictionCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PredictionAccessPointDtoCopyWithImpl<$Res>
    implements $PredictionAccessPointDtoCopyWith<$Res> {
  _$PredictionAccessPointDtoCopyWithImpl(this._self, this._then);

  final PredictionAccessPointDto _self;
  final $Res Function(PredictionAccessPointDto) _then;

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      PredictionAccessPointDto(
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
                  as PredictionCoordinateDto,
      ),
    );
  }

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionAccessPointDto].
extension PredictionAccessPointDtoPatterns on PredictionAccessPointDto {
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
    TResult Function(_PredictionAccessPointDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto() when $default != null:
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
    TResult Function(_PredictionAccessPointDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto():
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
    TResult? Function(_PredictionAccessPointDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto() when $default != null:
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
      String id,
      String name,
      PredictionCoordinateDto coordinate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto() when $default != null:
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
    TResult Function(String id, String name, PredictionCoordinateDto coordinate)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto():
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
    TResult? Function(
      String id,
      String name,
      PredictionCoordinateDto coordinate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionAccessPointDto() when $default != null:
        return $default(_that.id, _that.name, _that.coordinate);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PredictionAccessPointDto implements PredictionAccessPointDto {
  const _PredictionAccessPointDto({
    required this.id,
    required this.name,
    required this.coordinate,
  });
  factory _PredictionAccessPointDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionAccessPointDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final PredictionCoordinateDto coordinate;

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionAccessPointDtoCopyWith<_PredictionAccessPointDto> get copyWith =>
      __$PredictionAccessPointDtoCopyWithImpl<_PredictionAccessPointDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionAccessPointDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionAccessPointDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, coordinate);
  }

  @override
  String toString() {
    return 'PredictionAccessPointDto(id: $id, name: $name, coordinate: $coordinate)';
  }
}

/// @nodoc
abstract mixin class _$PredictionAccessPointDtoCopyWith<$Res>
    implements $PredictionAccessPointDtoCopyWith<$Res> {
  factory _$PredictionAccessPointDtoCopyWith(
    _PredictionAccessPointDto value,
    $Res Function(_PredictionAccessPointDto) _then,
  ) = __$PredictionAccessPointDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, PredictionCoordinateDto coordinate});

  @override
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PredictionAccessPointDtoCopyWithImpl<$Res>
    implements _$PredictionAccessPointDtoCopyWith<$Res> {
  __$PredictionAccessPointDtoCopyWithImpl(this._self, this._then);

  final _PredictionAccessPointDto _self;
  final $Res Function(_PredictionAccessPointDto) _then;

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinate = null,
  }) {
    return _then(
      _PredictionAccessPointDto(
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
                  as PredictionCoordinateDto,
      ),
    );
  }

  /// Create a copy of PredictionAccessPointDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
mixin _$PredictionConnectivityDto {
  @JsonKey(fromJson: _count)
  int get nodeCount;
  @JsonKey(fromJson: _count)
  int get edgeCount;
  @JsonKey(fromJson: _count)
  int get weakComponentCount;
  @JsonKey(fromJson: _count)
  int get largestComponentNodeCount;
  String get componentPolicy;
  @JsonKey(fromJson: _count)
  int get sourceWeakComponentCount;
  @JsonKey(fromJson: _count)
  int get excludedDisconnectedNodeCount;

  /// Create a copy of PredictionConnectivityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionConnectivityDtoCopyWith<PredictionConnectivityDto> get copyWith =>
      _$PredictionConnectivityDtoCopyWithImpl<PredictionConnectivityDto>(
        this as PredictionConnectivityDto,
        _$identity,
      );

  /// Serializes this PredictionConnectivityDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionConnectivityDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionConnectivityDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionConnectivityDto;
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
    final _this = this as PredictionConnectivityDto;
    return 'PredictionConnectivityDto(nodeCount: ${_this.nodeCount}, edgeCount: ${_this.edgeCount}, weakComponentCount: ${_this.weakComponentCount}, largestComponentNodeCount: ${_this.largestComponentNodeCount}, componentPolicy: ${_this.componentPolicy}, sourceWeakComponentCount: ${_this.sourceWeakComponentCount}, excludedDisconnectedNodeCount: ${_this.excludedDisconnectedNodeCount})';
  }
}

/// @nodoc
abstract mixin class $PredictionConnectivityDtoCopyWith<$Res> {
  factory $PredictionConnectivityDtoCopyWith(
    PredictionConnectivityDto value,
    $Res Function(PredictionConnectivityDto) _then,
  ) = _$PredictionConnectivityDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(fromJson: _count) int nodeCount,
    @JsonKey(fromJson: _count) int edgeCount,
    @JsonKey(fromJson: _count) int weakComponentCount,
    @JsonKey(fromJson: _count) int largestComponentNodeCount,
    String componentPolicy,
    @JsonKey(fromJson: _count) int sourceWeakComponentCount,
    @JsonKey(fromJson: _count) int excludedDisconnectedNodeCount,
  });
}

/// @nodoc
class _$PredictionConnectivityDtoCopyWithImpl<$Res>
    implements $PredictionConnectivityDtoCopyWith<$Res> {
  _$PredictionConnectivityDtoCopyWithImpl(this._self, this._then);

  final PredictionConnectivityDto _self;
  final $Res Function(PredictionConnectivityDto) _then;

  /// Create a copy of PredictionConnectivityDto
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
      PredictionConnectivityDto(
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

/// Adds pattern-matching-related methods to [PredictionConnectivityDto].
extension PredictionConnectivityDtoPatterns on PredictionConnectivityDto {
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
    TResult Function(_PredictionConnectivityDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto() when $default != null:
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
    TResult Function(_PredictionConnectivityDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto():
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
    TResult? Function(_PredictionConnectivityDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto() when $default != null:
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
      @JsonKey(fromJson: _count) int nodeCount,
      @JsonKey(fromJson: _count) int edgeCount,
      @JsonKey(fromJson: _count) int weakComponentCount,
      @JsonKey(fromJson: _count) int largestComponentNodeCount,
      String componentPolicy,
      @JsonKey(fromJson: _count) int sourceWeakComponentCount,
      @JsonKey(fromJson: _count) int excludedDisconnectedNodeCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto() when $default != null:
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
      @JsonKey(fromJson: _count) int nodeCount,
      @JsonKey(fromJson: _count) int edgeCount,
      @JsonKey(fromJson: _count) int weakComponentCount,
      @JsonKey(fromJson: _count) int largestComponentNodeCount,
      String componentPolicy,
      @JsonKey(fromJson: _count) int sourceWeakComponentCount,
      @JsonKey(fromJson: _count) int excludedDisconnectedNodeCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto():
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
      @JsonKey(fromJson: _count) int nodeCount,
      @JsonKey(fromJson: _count) int edgeCount,
      @JsonKey(fromJson: _count) int weakComponentCount,
      @JsonKey(fromJson: _count) int largestComponentNodeCount,
      String componentPolicy,
      @JsonKey(fromJson: _count) int sourceWeakComponentCount,
      @JsonKey(fromJson: _count) int excludedDisconnectedNodeCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionConnectivityDto() when $default != null:
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
@JsonSerializable()
class _PredictionConnectivityDto implements PredictionConnectivityDto {
  const _PredictionConnectivityDto({
    @JsonKey(fromJson: _count) required this.nodeCount,
    @JsonKey(fromJson: _count) required this.edgeCount,
    @JsonKey(fromJson: _count) required this.weakComponentCount,
    @JsonKey(fromJson: _count) required this.largestComponentNodeCount,
    required this.componentPolicy,
    @JsonKey(fromJson: _count) required this.sourceWeakComponentCount,
    @JsonKey(fromJson: _count) required this.excludedDisconnectedNodeCount,
  });
  factory _PredictionConnectivityDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionConnectivityDtoFromJson(json);

  @override
  @JsonKey(fromJson: _count)
  final int nodeCount;
  @override
  @JsonKey(fromJson: _count)
  final int edgeCount;
  @override
  @JsonKey(fromJson: _count)
  final int weakComponentCount;
  @override
  @JsonKey(fromJson: _count)
  final int largestComponentNodeCount;
  @override
  final String componentPolicy;
  @override
  @JsonKey(fromJson: _count)
  final int sourceWeakComponentCount;
  @override
  @JsonKey(fromJson: _count)
  final int excludedDisconnectedNodeCount;

  /// Create a copy of PredictionConnectivityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionConnectivityDtoCopyWith<_PredictionConnectivityDto>
  get copyWith =>
      __$PredictionConnectivityDtoCopyWithImpl<_PredictionConnectivityDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionConnectivityDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionConnectivityDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'PredictionConnectivityDto(nodeCount: $nodeCount, edgeCount: $edgeCount, weakComponentCount: $weakComponentCount, largestComponentNodeCount: $largestComponentNodeCount, componentPolicy: $componentPolicy, sourceWeakComponentCount: $sourceWeakComponentCount, excludedDisconnectedNodeCount: $excludedDisconnectedNodeCount)';
  }
}

/// @nodoc
abstract mixin class _$PredictionConnectivityDtoCopyWith<$Res>
    implements $PredictionConnectivityDtoCopyWith<$Res> {
  factory _$PredictionConnectivityDtoCopyWith(
    _PredictionConnectivityDto value,
    $Res Function(_PredictionConnectivityDto) _then,
  ) = __$PredictionConnectivityDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _count) int nodeCount,
    @JsonKey(fromJson: _count) int edgeCount,
    @JsonKey(fromJson: _count) int weakComponentCount,
    @JsonKey(fromJson: _count) int largestComponentNodeCount,
    String componentPolicy,
    @JsonKey(fromJson: _count) int sourceWeakComponentCount,
    @JsonKey(fromJson: _count) int excludedDisconnectedNodeCount,
  });
}

/// @nodoc
class __$PredictionConnectivityDtoCopyWithImpl<$Res>
    implements _$PredictionConnectivityDtoCopyWith<$Res> {
  __$PredictionConnectivityDtoCopyWithImpl(this._self, this._then);

  final _PredictionConnectivityDto _self;
  final $Res Function(_PredictionConnectivityDto) _then;

  /// Create a copy of PredictionConnectivityDto
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
      _PredictionConnectivityDto(
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
