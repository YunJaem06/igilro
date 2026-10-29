// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_route_prediction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelRoutePredictionRequestDto {
  PredictionCoordinateDto get origin;
  PredictionCoordinateDto get destination;
  String get travelMode;
  String get mode;
  @JsonKey(includeIfNull: false)
  String? get departureAt;

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelRoutePredictionRequestDtoCopyWith<ModelRoutePredictionRequestDto>
  get copyWith =>
      _$ModelRoutePredictionRequestDtoCopyWithImpl<
        ModelRoutePredictionRequestDto
      >(this as ModelRoutePredictionRequestDto, _$identity);

  /// Serializes this ModelRoutePredictionRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as ModelRoutePredictionRequestDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelRoutePredictionRequestDto &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination) &&
            (identical(other.travelMode, _this.travelMode) ||
                other.travelMode == _this.travelMode) &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode) &&
            (identical(other.departureAt, _this.departureAt) ||
                other.departureAt == _this.departureAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as ModelRoutePredictionRequestDto;
    return Object.hash(
      runtimeType,
      _this.origin,
      _this.destination,
      _this.travelMode,
      _this.mode,
      _this.departureAt,
    );
  }

  @override
  String toString() {
    final _this = this as ModelRoutePredictionRequestDto;
    return 'ModelRoutePredictionRequestDto(origin: ${_this.origin}, destination: ${_this.destination}, travelMode: ${_this.travelMode}, mode: ${_this.mode}, departureAt: ${_this.departureAt})';
  }
}

/// @nodoc
abstract mixin class $ModelRoutePredictionRequestDtoCopyWith<$Res> {
  factory $ModelRoutePredictionRequestDtoCopyWith(
    ModelRoutePredictionRequestDto value,
    $Res Function(ModelRoutePredictionRequestDto) _then,
  ) = _$ModelRoutePredictionRequestDtoCopyWithImpl;
  @useResult
  $Res call({
    PredictionCoordinateDto origin,
    PredictionCoordinateDto destination,
    String travelMode,
    String mode,
    @JsonKey(includeIfNull: false) String? departureAt,
  });

  $PredictionCoordinateDtoCopyWith<$Res> get origin;
  $PredictionCoordinateDtoCopyWith<$Res> get destination;
}

/// @nodoc
class _$ModelRoutePredictionRequestDtoCopyWithImpl<$Res>
    implements $ModelRoutePredictionRequestDtoCopyWith<$Res> {
  _$ModelRoutePredictionRequestDtoCopyWithImpl(this._self, this._then);

  final ModelRoutePredictionRequestDto _self;
  final $Res Function(ModelRoutePredictionRequestDto) _then;

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? travelMode = null,
    Object? mode = null,
    Object? departureAt = freezed,
  }) {
    return _then(
      ModelRoutePredictionRequestDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        travelMode: null == travelMode
            ? _self.travelMode
            : travelMode // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get origin {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get destination {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ModelRoutePredictionRequestDto].
extension ModelRoutePredictionRequestDtoPatterns
    on ModelRoutePredictionRequestDto {
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
    TResult Function(_ModelRoutePredictionRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto() when $default != null:
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
    TResult Function(_ModelRoutePredictionRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto():
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
    TResult? Function(_ModelRoutePredictionRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto() when $default != null:
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
      PredictionCoordinateDto origin,
      PredictionCoordinateDto destination,
      String travelMode,
      String mode,
      @JsonKey(includeIfNull: false) String? departureAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
          _that.travelMode,
          _that.mode,
          _that.departureAt,
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
      PredictionCoordinateDto origin,
      PredictionCoordinateDto destination,
      String travelMode,
      String mode,
      @JsonKey(includeIfNull: false) String? departureAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto():
        return $default(
          _that.origin,
          _that.destination,
          _that.travelMode,
          _that.mode,
          _that.departureAt,
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
      PredictionCoordinateDto origin,
      PredictionCoordinateDto destination,
      String travelMode,
      String mode,
      @JsonKey(includeIfNull: false) String? departureAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionRequestDto() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
          _that.travelMode,
          _that.mode,
          _that.departureAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ModelRoutePredictionRequestDto
    implements ModelRoutePredictionRequestDto {
  const _ModelRoutePredictionRequestDto({
    required this.origin,
    required this.destination,
    this.travelMode = 'walking',
    this.mode = 'fastest',
    @JsonKey(includeIfNull: false) this.departureAt,
  });
  factory _ModelRoutePredictionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ModelRoutePredictionRequestDtoFromJson(json);

  @override
  final PredictionCoordinateDto origin;
  @override
  final PredictionCoordinateDto destination;
  @override
  @JsonKey()
  final String travelMode;
  @override
  @JsonKey()
  final String mode;
  @override
  @JsonKey(includeIfNull: false)
  final String? departureAt;

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelRoutePredictionRequestDtoCopyWith<_ModelRoutePredictionRequestDto>
  get copyWith =>
      __$ModelRoutePredictionRequestDtoCopyWithImpl<
        _ModelRoutePredictionRequestDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModelRoutePredictionRequestDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelRoutePredictionRequestDto &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.travelMode, travelMode) ||
                other.travelMode == travelMode) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.departureAt, departureAt) ||
                other.departureAt == departureAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      origin,
      destination,
      travelMode,
      mode,
      departureAt,
    );
  }

  @override
  String toString() {
    return 'ModelRoutePredictionRequestDto(origin: $origin, destination: $destination, travelMode: $travelMode, mode: $mode, departureAt: $departureAt)';
  }
}

/// @nodoc
abstract mixin class _$ModelRoutePredictionRequestDtoCopyWith<$Res>
    implements $ModelRoutePredictionRequestDtoCopyWith<$Res> {
  factory _$ModelRoutePredictionRequestDtoCopyWith(
    _ModelRoutePredictionRequestDto value,
    $Res Function(_ModelRoutePredictionRequestDto) _then,
  ) = __$ModelRoutePredictionRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    PredictionCoordinateDto origin,
    PredictionCoordinateDto destination,
    String travelMode,
    String mode,
    @JsonKey(includeIfNull: false) String? departureAt,
  });

  @override
  $PredictionCoordinateDtoCopyWith<$Res> get origin;
  @override
  $PredictionCoordinateDtoCopyWith<$Res> get destination;
}

/// @nodoc
class __$ModelRoutePredictionRequestDtoCopyWithImpl<$Res>
    implements _$ModelRoutePredictionRequestDtoCopyWith<$Res> {
  __$ModelRoutePredictionRequestDtoCopyWithImpl(this._self, this._then);

  final _ModelRoutePredictionRequestDto _self;
  final $Res Function(_ModelRoutePredictionRequestDto) _then;

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? travelMode = null,
    Object? mode = null,
    Object? departureAt = freezed,
  }) {
    return _then(
      _ModelRoutePredictionRequestDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        travelMode: null == travelMode
            ? _self.travelMode
            : travelMode // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get origin {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of ModelRoutePredictionRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get destination {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$ModelRoutePredictionResponseDto {
  List<PredictedRouteDto> get routes;
  String get evaluatedAt;
  String get dataVersion;
  String get predictionDataVersion;
  String get modelVersion;
  String get routingModelVersion;
  String get timeModelVersion;
  @JsonKey(fromJson: _wholeNumber)
  int get baselineDurationSeconds;
  PredictionSnappingDto get snapping;
  String get quality;
  String get attribution;
  List<String> get limitations;
  @JsonKey(fromJson: _wholeNumber)
  int get buildingModelCount;
  @JsonKey(fromJson: _wholeNumber)
  int get terrainTileCount;
  @JsonKey(fromJson: _wholeNumber)
  int get omittedBuildingModelCount;
  double get sampleStepMeters;
  double get projectionMaxErrorMeters;
  double get sceneBufferMetersApprox;

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelRoutePredictionResponseDtoCopyWith<ModelRoutePredictionResponseDto>
  get copyWith =>
      _$ModelRoutePredictionResponseDtoCopyWithImpl<
        ModelRoutePredictionResponseDto
      >(this as ModelRoutePredictionResponseDto, _$identity);

  /// Serializes this ModelRoutePredictionResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as ModelRoutePredictionResponseDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelRoutePredictionResponseDto &&
            const DeepCollectionEquality().equals(other.routes, _this.routes) &&
            (identical(other.evaluatedAt, _this.evaluatedAt) ||
                other.evaluatedAt == _this.evaluatedAt) &&
            (identical(other.dataVersion, _this.dataVersion) ||
                other.dataVersion == _this.dataVersion) &&
            (identical(
                  other.predictionDataVersion,
                  _this.predictionDataVersion,
                ) ||
                other.predictionDataVersion == _this.predictionDataVersion) &&
            (identical(other.modelVersion, _this.modelVersion) ||
                other.modelVersion == _this.modelVersion) &&
            (identical(other.routingModelVersion, _this.routingModelVersion) ||
                other.routingModelVersion == _this.routingModelVersion) &&
            (identical(other.timeModelVersion, _this.timeModelVersion) ||
                other.timeModelVersion == _this.timeModelVersion) &&
            (identical(
                  other.baselineDurationSeconds,
                  _this.baselineDurationSeconds,
                ) ||
                other.baselineDurationSeconds ==
                    _this.baselineDurationSeconds) &&
            (identical(other.snapping, _this.snapping) ||
                other.snapping == _this.snapping) &&
            (identical(other.quality, _this.quality) ||
                other.quality == _this.quality) &&
            (identical(other.attribution, _this.attribution) ||
                other.attribution == _this.attribution) &&
            const DeepCollectionEquality().equals(
              other.limitations,
              _this.limitations,
            ) &&
            (identical(other.buildingModelCount, _this.buildingModelCount) ||
                other.buildingModelCount == _this.buildingModelCount) &&
            (identical(other.terrainTileCount, _this.terrainTileCount) ||
                other.terrainTileCount == _this.terrainTileCount) &&
            (identical(
                  other.omittedBuildingModelCount,
                  _this.omittedBuildingModelCount,
                ) ||
                other.omittedBuildingModelCount ==
                    _this.omittedBuildingModelCount) &&
            (identical(other.sampleStepMeters, _this.sampleStepMeters) ||
                other.sampleStepMeters == _this.sampleStepMeters) &&
            (identical(
                  other.projectionMaxErrorMeters,
                  _this.projectionMaxErrorMeters,
                ) ||
                other.projectionMaxErrorMeters ==
                    _this.projectionMaxErrorMeters) &&
            (identical(
                  other.sceneBufferMetersApprox,
                  _this.sceneBufferMetersApprox,
                ) ||
                other.sceneBufferMetersApprox ==
                    _this.sceneBufferMetersApprox));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as ModelRoutePredictionResponseDto;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.routes),
      _this.evaluatedAt,
      _this.dataVersion,
      _this.predictionDataVersion,
      _this.modelVersion,
      _this.routingModelVersion,
      _this.timeModelVersion,
      _this.baselineDurationSeconds,
      _this.snapping,
      _this.quality,
      _this.attribution,
      const DeepCollectionEquality().hash(_this.limitations),
      _this.buildingModelCount,
      _this.terrainTileCount,
      _this.omittedBuildingModelCount,
      _this.sampleStepMeters,
      _this.projectionMaxErrorMeters,
      _this.sceneBufferMetersApprox,
    );
  }

  @override
  String toString() {
    final _this = this as ModelRoutePredictionResponseDto;
    return 'ModelRoutePredictionResponseDto(routes: ${_this.routes}, evaluatedAt: ${_this.evaluatedAt}, dataVersion: ${_this.dataVersion}, predictionDataVersion: ${_this.predictionDataVersion}, modelVersion: ${_this.modelVersion}, routingModelVersion: ${_this.routingModelVersion}, timeModelVersion: ${_this.timeModelVersion}, baselineDurationSeconds: ${_this.baselineDurationSeconds}, snapping: ${_this.snapping}, quality: ${_this.quality}, attribution: ${_this.attribution}, limitations: ${_this.limitations}, buildingModelCount: ${_this.buildingModelCount}, terrainTileCount: ${_this.terrainTileCount}, omittedBuildingModelCount: ${_this.omittedBuildingModelCount}, sampleStepMeters: ${_this.sampleStepMeters}, projectionMaxErrorMeters: ${_this.projectionMaxErrorMeters}, sceneBufferMetersApprox: ${_this.sceneBufferMetersApprox})';
  }
}

/// @nodoc
abstract mixin class $ModelRoutePredictionResponseDtoCopyWith<$Res> {
  factory $ModelRoutePredictionResponseDtoCopyWith(
    ModelRoutePredictionResponseDto value,
    $Res Function(ModelRoutePredictionResponseDto) _then,
  ) = _$ModelRoutePredictionResponseDtoCopyWithImpl;
  @useResult
  $Res call({
    List<PredictedRouteDto> routes,
    String evaluatedAt,
    String dataVersion,
    String predictionDataVersion,
    String modelVersion,
    String routingModelVersion,
    String timeModelVersion,
    @JsonKey(fromJson: _wholeNumber) int baselineDurationSeconds,
    PredictionSnappingDto snapping,
    String quality,
    String attribution,
    List<String> limitations,
    @JsonKey(fromJson: _wholeNumber) int buildingModelCount,
    @JsonKey(fromJson: _wholeNumber) int terrainTileCount,
    @JsonKey(fromJson: _wholeNumber) int omittedBuildingModelCount,
    double sampleStepMeters,
    double projectionMaxErrorMeters,
    double sceneBufferMetersApprox,
  });

  $PredictionSnappingDtoCopyWith<$Res> get snapping;
}

/// @nodoc
class _$ModelRoutePredictionResponseDtoCopyWithImpl<$Res>
    implements $ModelRoutePredictionResponseDtoCopyWith<$Res> {
  _$ModelRoutePredictionResponseDtoCopyWithImpl(this._self, this._then);

  final ModelRoutePredictionResponseDto _self;
  final $Res Function(ModelRoutePredictionResponseDto) _then;

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? modelVersion = null,
    Object? routingModelVersion = null,
    Object? timeModelVersion = null,
    Object? baselineDurationSeconds = null,
    Object? snapping = null,
    Object? quality = null,
    Object? attribution = null,
    Object? limitations = null,
    Object? buildingModelCount = null,
    Object? terrainTileCount = null,
    Object? omittedBuildingModelCount = null,
    Object? sampleStepMeters = null,
    Object? projectionMaxErrorMeters = null,
    Object? sceneBufferMetersApprox = null,
  }) {
    return _then(
      ModelRoutePredictionResponseDto(
        routes: null == routes
            ? _self.routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<PredictedRouteDto>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        predictionDataVersion: null == predictionDataVersion
            ? _self.predictionDataVersion
            : predictionDataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        routingModelVersion: null == routingModelVersion
            ? _self.routingModelVersion
            : routingModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        timeModelVersion: null == timeModelVersion
            ? _self.timeModelVersion
            : timeModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        baselineDurationSeconds: null == baselineDurationSeconds
            ? _self.baselineDurationSeconds
            : baselineDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as PredictionSnappingDto,
        quality: null == quality
            ? _self.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
        limitations: null == limitations
            ? _self.limitations
            : limitations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        buildingModelCount: null == buildingModelCount
            ? _self.buildingModelCount
            : buildingModelCount // ignore: cast_nullable_to_non_nullable
                  as int,
        terrainTileCount: null == terrainTileCount
            ? _self.terrainTileCount
            : terrainTileCount // ignore: cast_nullable_to_non_nullable
                  as int,
        omittedBuildingModelCount: null == omittedBuildingModelCount
            ? _self.omittedBuildingModelCount
            : omittedBuildingModelCount // ignore: cast_nullable_to_non_nullable
                  as int,
        sampleStepMeters: null == sampleStepMeters
            ? _self.sampleStepMeters
            : sampleStepMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        projectionMaxErrorMeters: null == projectionMaxErrorMeters
            ? _self.projectionMaxErrorMeters
            : projectionMaxErrorMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        sceneBufferMetersApprox: null == sceneBufferMetersApprox
            ? _self.sceneBufferMetersApprox
            : sceneBufferMetersApprox // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnappingDtoCopyWith<$Res> get snapping {
    return $PredictionSnappingDtoCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ModelRoutePredictionResponseDto].
extension ModelRoutePredictionResponseDtoPatterns
    on ModelRoutePredictionResponseDto {
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
    TResult Function(_ModelRoutePredictionResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto() when $default != null:
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
    TResult Function(_ModelRoutePredictionResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto():
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
    TResult? Function(_ModelRoutePredictionResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto() when $default != null:
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
      List<PredictedRouteDto> routes,
      String evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      @JsonKey(fromJson: _wholeNumber) int baselineDurationSeconds,
      PredictionSnappingDto snapping,
      String quality,
      String attribution,
      List<String> limitations,
      @JsonKey(fromJson: _wholeNumber) int buildingModelCount,
      @JsonKey(fromJson: _wholeNumber) int terrainTileCount,
      @JsonKey(fromJson: _wholeNumber) int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto() when $default != null:
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.quality,
          _that.attribution,
          _that.limitations,
          _that.buildingModelCount,
          _that.terrainTileCount,
          _that.omittedBuildingModelCount,
          _that.sampleStepMeters,
          _that.projectionMaxErrorMeters,
          _that.sceneBufferMetersApprox,
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
      List<PredictedRouteDto> routes,
      String evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      @JsonKey(fromJson: _wholeNumber) int baselineDurationSeconds,
      PredictionSnappingDto snapping,
      String quality,
      String attribution,
      List<String> limitations,
      @JsonKey(fromJson: _wholeNumber) int buildingModelCount,
      @JsonKey(fromJson: _wholeNumber) int terrainTileCount,
      @JsonKey(fromJson: _wholeNumber) int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto():
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.quality,
          _that.attribution,
          _that.limitations,
          _that.buildingModelCount,
          _that.terrainTileCount,
          _that.omittedBuildingModelCount,
          _that.sampleStepMeters,
          _that.projectionMaxErrorMeters,
          _that.sceneBufferMetersApprox,
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
      List<PredictedRouteDto> routes,
      String evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      @JsonKey(fromJson: _wholeNumber) int baselineDurationSeconds,
      PredictionSnappingDto snapping,
      String quality,
      String attribution,
      List<String> limitations,
      @JsonKey(fromJson: _wholeNumber) int buildingModelCount,
      @JsonKey(fromJson: _wholeNumber) int terrainTileCount,
      @JsonKey(fromJson: _wholeNumber) int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePredictionResponseDto() when $default != null:
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.quality,
          _that.attribution,
          _that.limitations,
          _that.buildingModelCount,
          _that.terrainTileCount,
          _that.omittedBuildingModelCount,
          _that.sampleStepMeters,
          _that.projectionMaxErrorMeters,
          _that.sceneBufferMetersApprox,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ModelRoutePredictionResponseDto
    implements ModelRoutePredictionResponseDto {
  const _ModelRoutePredictionResponseDto({
    required List<PredictedRouteDto> routes,
    required this.evaluatedAt,
    required this.dataVersion,
    required this.predictionDataVersion,
    required this.modelVersion,
    required this.routingModelVersion,
    required this.timeModelVersion,
    @JsonKey(fromJson: _wholeNumber) required this.baselineDurationSeconds,
    required this.snapping,
    required this.quality,
    required this.attribution,
    required List<String> limitations,
    @JsonKey(fromJson: _wholeNumber) required this.buildingModelCount,
    @JsonKey(fromJson: _wholeNumber) required this.terrainTileCount,
    @JsonKey(fromJson: _wholeNumber) required this.omittedBuildingModelCount,
    required this.sampleStepMeters,
    required this.projectionMaxErrorMeters,
    required this.sceneBufferMetersApprox,
  }) : _routes = routes,
       _limitations = limitations;
  factory _ModelRoutePredictionResponseDto.fromJson(
    Map<String, dynamic> json,
  ) => _$ModelRoutePredictionResponseDtoFromJson(json);

  final List<PredictedRouteDto> _routes;
  @override
  List<PredictedRouteDto> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  final String evaluatedAt;
  @override
  final String dataVersion;
  @override
  final String predictionDataVersion;
  @override
  final String modelVersion;
  @override
  final String routingModelVersion;
  @override
  final String timeModelVersion;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int baselineDurationSeconds;
  @override
  final PredictionSnappingDto snapping;
  @override
  final String quality;
  @override
  final String attribution;
  final List<String> _limitations;
  @override
  List<String> get limitations {
    if (_limitations is EqualUnmodifiableListView) return _limitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_limitations);
  }

  @override
  @JsonKey(fromJson: _wholeNumber)
  final int buildingModelCount;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int terrainTileCount;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int omittedBuildingModelCount;
  @override
  final double sampleStepMeters;
  @override
  final double projectionMaxErrorMeters;
  @override
  final double sceneBufferMetersApprox;

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelRoutePredictionResponseDtoCopyWith<_ModelRoutePredictionResponseDto>
  get copyWith =>
      __$ModelRoutePredictionResponseDtoCopyWithImpl<
        _ModelRoutePredictionResponseDto
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModelRoutePredictionResponseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelRoutePredictionResponseDto &&
            const DeepCollectionEquality().equals(other.routes, _routes) &&
            (identical(other.evaluatedAt, evaluatedAt) ||
                other.evaluatedAt == evaluatedAt) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.predictionDataVersion, predictionDataVersion) ||
                other.predictionDataVersion == predictionDataVersion) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.routingModelVersion, routingModelVersion) ||
                other.routingModelVersion == routingModelVersion) &&
            (identical(other.timeModelVersion, timeModelVersion) ||
                other.timeModelVersion == timeModelVersion) &&
            (identical(
                  other.baselineDurationSeconds,
                  baselineDurationSeconds,
                ) ||
                other.baselineDurationSeconds == baselineDurationSeconds) &&
            (identical(other.snapping, snapping) ||
                other.snapping == snapping) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution) &&
            const DeepCollectionEquality().equals(
              other.limitations,
              _limitations,
            ) &&
            (identical(other.buildingModelCount, buildingModelCount) ||
                other.buildingModelCount == buildingModelCount) &&
            (identical(other.terrainTileCount, terrainTileCount) ||
                other.terrainTileCount == terrainTileCount) &&
            (identical(
                  other.omittedBuildingModelCount,
                  omittedBuildingModelCount,
                ) ||
                other.omittedBuildingModelCount == omittedBuildingModelCount) &&
            (identical(other.sampleStepMeters, sampleStepMeters) ||
                other.sampleStepMeters == sampleStepMeters) &&
            (identical(
                  other.projectionMaxErrorMeters,
                  projectionMaxErrorMeters,
                ) ||
                other.projectionMaxErrorMeters == projectionMaxErrorMeters) &&
            (identical(
                  other.sceneBufferMetersApprox,
                  sceneBufferMetersApprox,
                ) ||
                other.sceneBufferMetersApprox == sceneBufferMetersApprox));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routes),
      evaluatedAt,
      dataVersion,
      predictionDataVersion,
      modelVersion,
      routingModelVersion,
      timeModelVersion,
      baselineDurationSeconds,
      snapping,
      quality,
      attribution,
      const DeepCollectionEquality().hash(_limitations),
      buildingModelCount,
      terrainTileCount,
      omittedBuildingModelCount,
      sampleStepMeters,
      projectionMaxErrorMeters,
      sceneBufferMetersApprox,
    );
  }

  @override
  String toString() {
    return 'ModelRoutePredictionResponseDto(routes: $routes, evaluatedAt: $evaluatedAt, dataVersion: $dataVersion, predictionDataVersion: $predictionDataVersion, modelVersion: $modelVersion, routingModelVersion: $routingModelVersion, timeModelVersion: $timeModelVersion, baselineDurationSeconds: $baselineDurationSeconds, snapping: $snapping, quality: $quality, attribution: $attribution, limitations: $limitations, buildingModelCount: $buildingModelCount, terrainTileCount: $terrainTileCount, omittedBuildingModelCount: $omittedBuildingModelCount, sampleStepMeters: $sampleStepMeters, projectionMaxErrorMeters: $projectionMaxErrorMeters, sceneBufferMetersApprox: $sceneBufferMetersApprox)';
  }
}

/// @nodoc
abstract mixin class _$ModelRoutePredictionResponseDtoCopyWith<$Res>
    implements $ModelRoutePredictionResponseDtoCopyWith<$Res> {
  factory _$ModelRoutePredictionResponseDtoCopyWith(
    _ModelRoutePredictionResponseDto value,
    $Res Function(_ModelRoutePredictionResponseDto) _then,
  ) = __$ModelRoutePredictionResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<PredictedRouteDto> routes,
    String evaluatedAt,
    String dataVersion,
    String predictionDataVersion,
    String modelVersion,
    String routingModelVersion,
    String timeModelVersion,
    @JsonKey(fromJson: _wholeNumber) int baselineDurationSeconds,
    PredictionSnappingDto snapping,
    String quality,
    String attribution,
    List<String> limitations,
    @JsonKey(fromJson: _wholeNumber) int buildingModelCount,
    @JsonKey(fromJson: _wholeNumber) int terrainTileCount,
    @JsonKey(fromJson: _wholeNumber) int omittedBuildingModelCount,
    double sampleStepMeters,
    double projectionMaxErrorMeters,
    double sceneBufferMetersApprox,
  });

  @override
  $PredictionSnappingDtoCopyWith<$Res> get snapping;
}

/// @nodoc
class __$ModelRoutePredictionResponseDtoCopyWithImpl<$Res>
    implements _$ModelRoutePredictionResponseDtoCopyWith<$Res> {
  __$ModelRoutePredictionResponseDtoCopyWithImpl(this._self, this._then);

  final _ModelRoutePredictionResponseDto _self;
  final $Res Function(_ModelRoutePredictionResponseDto) _then;

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? modelVersion = null,
    Object? routingModelVersion = null,
    Object? timeModelVersion = null,
    Object? baselineDurationSeconds = null,
    Object? snapping = null,
    Object? quality = null,
    Object? attribution = null,
    Object? limitations = null,
    Object? buildingModelCount = null,
    Object? terrainTileCount = null,
    Object? omittedBuildingModelCount = null,
    Object? sampleStepMeters = null,
    Object? projectionMaxErrorMeters = null,
    Object? sceneBufferMetersApprox = null,
  }) {
    return _then(
      _ModelRoutePredictionResponseDto(
        routes: null == routes
            ? _self._routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<PredictedRouteDto>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        predictionDataVersion: null == predictionDataVersion
            ? _self.predictionDataVersion
            : predictionDataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        routingModelVersion: null == routingModelVersion
            ? _self.routingModelVersion
            : routingModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        timeModelVersion: null == timeModelVersion
            ? _self.timeModelVersion
            : timeModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        baselineDurationSeconds: null == baselineDurationSeconds
            ? _self.baselineDurationSeconds
            : baselineDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as PredictionSnappingDto,
        quality: null == quality
            ? _self.quality
            : quality // ignore: cast_nullable_to_non_nullable
                  as String,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
        limitations: null == limitations
            ? _self._limitations
            : limitations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        buildingModelCount: null == buildingModelCount
            ? _self.buildingModelCount
            : buildingModelCount // ignore: cast_nullable_to_non_nullable
                  as int,
        terrainTileCount: null == terrainTileCount
            ? _self.terrainTileCount
            : terrainTileCount // ignore: cast_nullable_to_non_nullable
                  as int,
        omittedBuildingModelCount: null == omittedBuildingModelCount
            ? _self.omittedBuildingModelCount
            : omittedBuildingModelCount // ignore: cast_nullable_to_non_nullable
                  as int,
        sampleStepMeters: null == sampleStepMeters
            ? _self.sampleStepMeters
            : sampleStepMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        projectionMaxErrorMeters: null == projectionMaxErrorMeters
            ? _self.projectionMaxErrorMeters
            : projectionMaxErrorMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        sceneBufferMetersApprox: null == sceneBufferMetersApprox
            ? _self.sceneBufferMetersApprox
            : sceneBufferMetersApprox // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of ModelRoutePredictionResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnappingDtoCopyWith<$Res> get snapping {
    return $PredictionSnappingDtoCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// @nodoc
mixin _$PredictedRouteDto {
  String get id;
  String get mode;
  PredictionGeometryDto get geometry;
  double get distanceMeters;
  @JsonKey(fromJson: _wholeNumber)
  int get durationSeconds;
  @JsonKey(fromJson: _wholeNumber)
  int get additionalDurationSeconds;
  ModeledShadePredictionDto get prediction;
  List<PredictionShadeSegmentDto> get shadeSegments;

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictedRouteDtoCopyWith<PredictedRouteDto> get copyWith =>
      _$PredictedRouteDtoCopyWithImpl<PredictedRouteDto>(
        this as PredictedRouteDto,
        _$identity,
      );

  /// Serializes this PredictedRouteDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictedRouteDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictedRouteDto &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode) &&
            (identical(other.geometry, _this.geometry) ||
                other.geometry == _this.geometry) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters) &&
            (identical(other.durationSeconds, _this.durationSeconds) ||
                other.durationSeconds == _this.durationSeconds) &&
            (identical(
                  other.additionalDurationSeconds,
                  _this.additionalDurationSeconds,
                ) ||
                other.additionalDurationSeconds ==
                    _this.additionalDurationSeconds) &&
            (identical(other.prediction, _this.prediction) ||
                other.prediction == _this.prediction) &&
            const DeepCollectionEquality().equals(
              other.shadeSegments,
              _this.shadeSegments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictedRouteDto;
    return Object.hash(
      runtimeType,
      _this.id,
      _this.mode,
      _this.geometry,
      _this.distanceMeters,
      _this.durationSeconds,
      _this.additionalDurationSeconds,
      _this.prediction,
      const DeepCollectionEquality().hash(_this.shadeSegments),
    );
  }

  @override
  String toString() {
    final _this = this as PredictedRouteDto;
    return 'PredictedRouteDto(id: ${_this.id}, mode: ${_this.mode}, geometry: ${_this.geometry}, distanceMeters: ${_this.distanceMeters}, durationSeconds: ${_this.durationSeconds}, additionalDurationSeconds: ${_this.additionalDurationSeconds}, prediction: ${_this.prediction}, shadeSegments: ${_this.shadeSegments})';
  }
}

/// @nodoc
abstract mixin class $PredictedRouteDtoCopyWith<$Res> {
  factory $PredictedRouteDtoCopyWith(
    PredictedRouteDto value,
    $Res Function(PredictedRouteDto) _then,
  ) = _$PredictedRouteDtoCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String mode,
    PredictionGeometryDto geometry,
    double distanceMeters,
    @JsonKey(fromJson: _wholeNumber) int durationSeconds,
    @JsonKey(fromJson: _wholeNumber) int additionalDurationSeconds,
    ModeledShadePredictionDto prediction,
    List<PredictionShadeSegmentDto> shadeSegments,
  });

  $PredictionGeometryDtoCopyWith<$Res> get geometry;
  $ModeledShadePredictionDtoCopyWith<$Res> get prediction;
}

/// @nodoc
class _$PredictedRouteDtoCopyWithImpl<$Res>
    implements $PredictedRouteDtoCopyWith<$Res> {
  _$PredictedRouteDtoCopyWithImpl(this._self, this._then);

  final PredictedRouteDto _self;
  final $Res Function(PredictedRouteDto) _then;

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mode = null,
    Object? geometry = null,
    Object? distanceMeters = null,
    Object? durationSeconds = null,
    Object? additionalDurationSeconds = null,
    Object? prediction = null,
    Object? shadeSegments = null,
  }) {
    return _then(
      PredictedRouteDto(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        geometry: null == geometry
            ? _self.geometry
            : geometry // ignore: cast_nullable_to_non_nullable
                  as PredictionGeometryDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        durationSeconds: null == durationSeconds
            ? _self.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        additionalDurationSeconds: null == additionalDurationSeconds
            ? _self.additionalDurationSeconds
            : additionalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        prediction: null == prediction
            ? _self.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as ModeledShadePredictionDto,
        shadeSegments: null == shadeSegments
            ? _self.shadeSegments
            : shadeSegments // ignore: cast_nullable_to_non_nullable
                  as List<PredictionShadeSegmentDto>,
      ),
    );
  }

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionGeometryDtoCopyWith<$Res> get geometry {
    return $PredictionGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionDtoCopyWith<$Res> get prediction {
    return $ModeledShadePredictionDtoCopyWith<$Res>(_self.prediction, (value) {
      return _then(_self.copyWith(prediction: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictedRouteDto].
extension PredictedRouteDtoPatterns on PredictedRouteDto {
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
    TResult Function(_PredictedRouteDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto() when $default != null:
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
    TResult Function(_PredictedRouteDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto():
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
    TResult? Function(_PredictedRouteDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto() when $default != null:
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
      String mode,
      PredictionGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _wholeNumber) int durationSeconds,
      @JsonKey(fromJson: _wholeNumber) int additionalDurationSeconds,
      ModeledShadePredictionDto prediction,
      List<PredictionShadeSegmentDto> shadeSegments,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.prediction,
          _that.shadeSegments,
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
      String id,
      String mode,
      PredictionGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _wholeNumber) int durationSeconds,
      @JsonKey(fromJson: _wholeNumber) int additionalDurationSeconds,
      ModeledShadePredictionDto prediction,
      List<PredictionShadeSegmentDto> shadeSegments,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto():
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.prediction,
          _that.shadeSegments,
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
      String id,
      String mode,
      PredictionGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _wholeNumber) int durationSeconds,
      @JsonKey(fromJson: _wholeNumber) int additionalDurationSeconds,
      ModeledShadePredictionDto prediction,
      List<PredictionShadeSegmentDto> shadeSegments,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRouteDto() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.prediction,
          _that.shadeSegments,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PredictedRouteDto implements PredictedRouteDto {
  const _PredictedRouteDto({
    required this.id,
    required this.mode,
    required this.geometry,
    required this.distanceMeters,
    @JsonKey(fromJson: _wholeNumber) required this.durationSeconds,
    @JsonKey(fromJson: _wholeNumber) required this.additionalDurationSeconds,
    required this.prediction,
    List<PredictionShadeSegmentDto> shadeSegments = const [],
  }) : _shadeSegments = shadeSegments;
  factory _PredictedRouteDto.fromJson(Map<String, dynamic> json) =>
      _$PredictedRouteDtoFromJson(json);

  @override
  final String id;
  @override
  final String mode;
  @override
  final PredictionGeometryDto geometry;
  @override
  final double distanceMeters;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int durationSeconds;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int additionalDurationSeconds;
  @override
  final ModeledShadePredictionDto prediction;
  final List<PredictionShadeSegmentDto> _shadeSegments;
  @override
  @JsonKey()
  List<PredictionShadeSegmentDto> get shadeSegments {
    if (_shadeSegments is EqualUnmodifiableListView) return _shadeSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shadeSegments);
  }

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictedRouteDtoCopyWith<_PredictedRouteDto> get copyWith =>
      __$PredictedRouteDtoCopyWithImpl<_PredictedRouteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PredictedRouteDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictedRouteDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(
                  other.additionalDurationSeconds,
                  additionalDurationSeconds,
                ) ||
                other.additionalDurationSeconds == additionalDurationSeconds) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            const DeepCollectionEquality().equals(
              other.shadeSegments,
              _shadeSegments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      mode,
      geometry,
      distanceMeters,
      durationSeconds,
      additionalDurationSeconds,
      prediction,
      const DeepCollectionEquality().hash(_shadeSegments),
    );
  }

  @override
  String toString() {
    return 'PredictedRouteDto(id: $id, mode: $mode, geometry: $geometry, distanceMeters: $distanceMeters, durationSeconds: $durationSeconds, additionalDurationSeconds: $additionalDurationSeconds, prediction: $prediction, shadeSegments: $shadeSegments)';
  }
}

/// @nodoc
abstract mixin class _$PredictedRouteDtoCopyWith<$Res>
    implements $PredictedRouteDtoCopyWith<$Res> {
  factory _$PredictedRouteDtoCopyWith(
    _PredictedRouteDto value,
    $Res Function(_PredictedRouteDto) _then,
  ) = __$PredictedRouteDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String mode,
    PredictionGeometryDto geometry,
    double distanceMeters,
    @JsonKey(fromJson: _wholeNumber) int durationSeconds,
    @JsonKey(fromJson: _wholeNumber) int additionalDurationSeconds,
    ModeledShadePredictionDto prediction,
    List<PredictionShadeSegmentDto> shadeSegments,
  });

  @override
  $PredictionGeometryDtoCopyWith<$Res> get geometry;
  @override
  $ModeledShadePredictionDtoCopyWith<$Res> get prediction;
}

/// @nodoc
class __$PredictedRouteDtoCopyWithImpl<$Res>
    implements _$PredictedRouteDtoCopyWith<$Res> {
  __$PredictedRouteDtoCopyWithImpl(this._self, this._then);

  final _PredictedRouteDto _self;
  final $Res Function(_PredictedRouteDto) _then;

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? mode = null,
    Object? geometry = null,
    Object? distanceMeters = null,
    Object? durationSeconds = null,
    Object? additionalDurationSeconds = null,
    Object? prediction = null,
    Object? shadeSegments = null,
  }) {
    return _then(
      _PredictedRouteDto(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        geometry: null == geometry
            ? _self.geometry
            : geometry // ignore: cast_nullable_to_non_nullable
                  as PredictionGeometryDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        durationSeconds: null == durationSeconds
            ? _self.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        additionalDurationSeconds: null == additionalDurationSeconds
            ? _self.additionalDurationSeconds
            : additionalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        prediction: null == prediction
            ? _self.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as ModeledShadePredictionDto,
        shadeSegments: null == shadeSegments
            ? _self._shadeSegments
            : shadeSegments // ignore: cast_nullable_to_non_nullable
                  as List<PredictionShadeSegmentDto>,
      ),
    );
  }

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionGeometryDtoCopyWith<$Res> get geometry {
    return $PredictionGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of PredictedRouteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionDtoCopyWith<$Res> get prediction {
    return $ModeledShadePredictionDtoCopyWith<$Res>(_self.prediction, (value) {
      return _then(_self.copyWith(prediction: value));
    });
  }
}

/// @nodoc
mixin _$PredictionShadeSegmentDto {
  String get state;
  PredictionGeometryDto get geometry;
  double get fromDistanceMeters;
  double get toDistanceMeters;
  double get distanceMeters;

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionShadeSegmentDtoCopyWith<PredictionShadeSegmentDto> get copyWith =>
      _$PredictionShadeSegmentDtoCopyWithImpl<PredictionShadeSegmentDto>(
        this as PredictionShadeSegmentDto,
        _$identity,
      );

  /// Serializes this PredictionShadeSegmentDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionShadeSegmentDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionShadeSegmentDto &&
            (identical(other.state, _this.state) ||
                other.state == _this.state) &&
            (identical(other.geometry, _this.geometry) ||
                other.geometry == _this.geometry) &&
            (identical(other.fromDistanceMeters, _this.fromDistanceMeters) ||
                other.fromDistanceMeters == _this.fromDistanceMeters) &&
            (identical(other.toDistanceMeters, _this.toDistanceMeters) ||
                other.toDistanceMeters == _this.toDistanceMeters) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionShadeSegmentDto;
    return Object.hash(
      runtimeType,
      _this.state,
      _this.geometry,
      _this.fromDistanceMeters,
      _this.toDistanceMeters,
      _this.distanceMeters,
    );
  }

  @override
  String toString() {
    final _this = this as PredictionShadeSegmentDto;
    return 'PredictionShadeSegmentDto(state: ${_this.state}, geometry: ${_this.geometry}, fromDistanceMeters: ${_this.fromDistanceMeters}, toDistanceMeters: ${_this.toDistanceMeters}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $PredictionShadeSegmentDtoCopyWith<$Res> {
  factory $PredictionShadeSegmentDtoCopyWith(
    PredictionShadeSegmentDto value,
    $Res Function(PredictionShadeSegmentDto) _then,
  ) = _$PredictionShadeSegmentDtoCopyWithImpl;
  @useResult
  $Res call({
    String state,
    PredictionGeometryDto geometry,
    double fromDistanceMeters,
    double toDistanceMeters,
    double distanceMeters,
  });

  $PredictionGeometryDtoCopyWith<$Res> get geometry;
}

/// @nodoc
class _$PredictionShadeSegmentDtoCopyWithImpl<$Res>
    implements $PredictionShadeSegmentDtoCopyWith<$Res> {
  _$PredictionShadeSegmentDtoCopyWithImpl(this._self, this._then);

  final PredictionShadeSegmentDto _self;
  final $Res Function(PredictionShadeSegmentDto) _then;

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? geometry = null,
    Object? fromDistanceMeters = null,
    Object? toDistanceMeters = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      PredictionShadeSegmentDto(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        geometry: null == geometry
            ? _self.geometry
            : geometry // ignore: cast_nullable_to_non_nullable
                  as PredictionGeometryDto,
        fromDistanceMeters: null == fromDistanceMeters
            ? _self.fromDistanceMeters
            : fromDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        toDistanceMeters: null == toDistanceMeters
            ? _self.toDistanceMeters
            : toDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionGeometryDtoCopyWith<$Res> get geometry {
    return $PredictionGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionShadeSegmentDto].
extension PredictionShadeSegmentDtoPatterns on PredictionShadeSegmentDto {
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
    TResult Function(_PredictionShadeSegmentDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto() when $default != null:
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
    TResult Function(_PredictionShadeSegmentDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto():
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
    TResult? Function(_PredictionShadeSegmentDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto() when $default != null:
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
      String state,
      PredictionGeometryDto geometry,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto() when $default != null:
        return $default(
          _that.state,
          _that.geometry,
          _that.fromDistanceMeters,
          _that.toDistanceMeters,
          _that.distanceMeters,
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
      String state,
      PredictionGeometryDto geometry,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto():
        return $default(
          _that.state,
          _that.geometry,
          _that.fromDistanceMeters,
          _that.toDistanceMeters,
          _that.distanceMeters,
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
      String state,
      PredictionGeometryDto geometry,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionShadeSegmentDto() when $default != null:
        return $default(
          _that.state,
          _that.geometry,
          _that.fromDistanceMeters,
          _that.toDistanceMeters,
          _that.distanceMeters,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PredictionShadeSegmentDto implements PredictionShadeSegmentDto {
  const _PredictionShadeSegmentDto({
    required this.state,
    required this.geometry,
    required this.fromDistanceMeters,
    required this.toDistanceMeters,
    required this.distanceMeters,
  });
  factory _PredictionShadeSegmentDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionShadeSegmentDtoFromJson(json);

  @override
  final String state;
  @override
  final PredictionGeometryDto geometry;
  @override
  final double fromDistanceMeters;
  @override
  final double toDistanceMeters;
  @override
  final double distanceMeters;

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionShadeSegmentDtoCopyWith<_PredictionShadeSegmentDto>
  get copyWith =>
      __$PredictionShadeSegmentDtoCopyWithImpl<_PredictionShadeSegmentDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionShadeSegmentDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionShadeSegmentDto &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.fromDistanceMeters, fromDistanceMeters) ||
                other.fromDistanceMeters == fromDistanceMeters) &&
            (identical(other.toDistanceMeters, toDistanceMeters) ||
                other.toDistanceMeters == toDistanceMeters) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      state,
      geometry,
      fromDistanceMeters,
      toDistanceMeters,
      distanceMeters,
    );
  }

  @override
  String toString() {
    return 'PredictionShadeSegmentDto(state: $state, geometry: $geometry, fromDistanceMeters: $fromDistanceMeters, toDistanceMeters: $toDistanceMeters, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$PredictionShadeSegmentDtoCopyWith<$Res>
    implements $PredictionShadeSegmentDtoCopyWith<$Res> {
  factory _$PredictionShadeSegmentDtoCopyWith(
    _PredictionShadeSegmentDto value,
    $Res Function(_PredictionShadeSegmentDto) _then,
  ) = __$PredictionShadeSegmentDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String state,
    PredictionGeometryDto geometry,
    double fromDistanceMeters,
    double toDistanceMeters,
    double distanceMeters,
  });

  @override
  $PredictionGeometryDtoCopyWith<$Res> get geometry;
}

/// @nodoc
class __$PredictionShadeSegmentDtoCopyWithImpl<$Res>
    implements _$PredictionShadeSegmentDtoCopyWith<$Res> {
  __$PredictionShadeSegmentDtoCopyWithImpl(this._self, this._then);

  final _PredictionShadeSegmentDto _self;
  final $Res Function(_PredictionShadeSegmentDto) _then;

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
    Object? geometry = null,
    Object? fromDistanceMeters = null,
    Object? toDistanceMeters = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      _PredictionShadeSegmentDto(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        geometry: null == geometry
            ? _self.geometry
            : geometry // ignore: cast_nullable_to_non_nullable
                  as PredictionGeometryDto,
        fromDistanceMeters: null == fromDistanceMeters
            ? _self.fromDistanceMeters
            : fromDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        toDistanceMeters: null == toDistanceMeters
            ? _self.toDistanceMeters
            : toDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionShadeSegmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionGeometryDtoCopyWith<$Res> get geometry {
    return $PredictionGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// @nodoc
mixin _$ModeledShadePredictionDto {
  String get status;
  double get modeledShadeRatio;
  double get baselineModeledShadeRatio;
  double? get physicalShadeCoverage;

  /// Create a copy of ModeledShadePredictionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionDtoCopyWith<ModeledShadePredictionDto> get copyWith =>
      _$ModeledShadePredictionDtoCopyWithImpl<ModeledShadePredictionDto>(
        this as ModeledShadePredictionDto,
        _$identity,
      );

  /// Serializes this ModeledShadePredictionDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as ModeledShadePredictionDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModeledShadePredictionDto &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.modeledShadeRatio, _this.modeledShadeRatio) ||
                other.modeledShadeRatio == _this.modeledShadeRatio) &&
            (identical(
                  other.baselineModeledShadeRatio,
                  _this.baselineModeledShadeRatio,
                ) ||
                other.baselineModeledShadeRatio ==
                    _this.baselineModeledShadeRatio) &&
            (identical(
                  other.physicalShadeCoverage,
                  _this.physicalShadeCoverage,
                ) ||
                other.physicalShadeCoverage == _this.physicalShadeCoverage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as ModeledShadePredictionDto;
    return Object.hash(
      runtimeType,
      _this.status,
      _this.modeledShadeRatio,
      _this.baselineModeledShadeRatio,
      _this.physicalShadeCoverage,
    );
  }

  @override
  String toString() {
    final _this = this as ModeledShadePredictionDto;
    return 'ModeledShadePredictionDto(status: ${_this.status}, modeledShadeRatio: ${_this.modeledShadeRatio}, baselineModeledShadeRatio: ${_this.baselineModeledShadeRatio}, physicalShadeCoverage: ${_this.physicalShadeCoverage})';
  }
}

/// @nodoc
abstract mixin class $ModeledShadePredictionDtoCopyWith<$Res> {
  factory $ModeledShadePredictionDtoCopyWith(
    ModeledShadePredictionDto value,
    $Res Function(ModeledShadePredictionDto) _then,
  ) = _$ModeledShadePredictionDtoCopyWithImpl;
  @useResult
  $Res call({
    String status,
    double modeledShadeRatio,
    double baselineModeledShadeRatio,
    double? physicalShadeCoverage,
  });
}

/// @nodoc
class _$ModeledShadePredictionDtoCopyWithImpl<$Res>
    implements $ModeledShadePredictionDtoCopyWith<$Res> {
  _$ModeledShadePredictionDtoCopyWithImpl(this._self, this._then);

  final ModeledShadePredictionDto _self;
  final $Res Function(ModeledShadePredictionDto) _then;

  /// Create a copy of ModeledShadePredictionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? modeledShadeRatio = null,
    Object? baselineModeledShadeRatio = null,
    Object? physicalShadeCoverage = freezed,
  }) {
    return _then(
      ModeledShadePredictionDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        modeledShadeRatio: null == modeledShadeRatio
            ? _self.modeledShadeRatio
            : modeledShadeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        baselineModeledShadeRatio: null == baselineModeledShadeRatio
            ? _self.baselineModeledShadeRatio
            : baselineModeledShadeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        physicalShadeCoverage: freezed == physicalShadeCoverage
            ? _self.physicalShadeCoverage
            : physicalShadeCoverage // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ModeledShadePredictionDto].
extension ModeledShadePredictionDtoPatterns on ModeledShadePredictionDto {
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
    TResult Function(_ModeledShadePredictionDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto() when $default != null:
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
    TResult Function(_ModeledShadePredictionDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto():
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
    TResult? Function(_ModeledShadePredictionDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto() when $default != null:
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
      String status,
      double modeledShadeRatio,
      double baselineModeledShadeRatio,
      double? physicalShadeCoverage,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto() when $default != null:
        return $default(
          _that.status,
          _that.modeledShadeRatio,
          _that.baselineModeledShadeRatio,
          _that.physicalShadeCoverage,
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
      String status,
      double modeledShadeRatio,
      double baselineModeledShadeRatio,
      double? physicalShadeCoverage,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto():
        return $default(
          _that.status,
          _that.modeledShadeRatio,
          _that.baselineModeledShadeRatio,
          _that.physicalShadeCoverage,
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
      String status,
      double modeledShadeRatio,
      double baselineModeledShadeRatio,
      double? physicalShadeCoverage,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePredictionDto() when $default != null:
        return $default(
          _that.status,
          _that.modeledShadeRatio,
          _that.baselineModeledShadeRatio,
          _that.physicalShadeCoverage,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ModeledShadePredictionDto implements ModeledShadePredictionDto {
  const _ModeledShadePredictionDto({
    required this.status,
    required this.modeledShadeRatio,
    required this.baselineModeledShadeRatio,
    this.physicalShadeCoverage,
  });
  factory _ModeledShadePredictionDto.fromJson(Map<String, dynamic> json) =>
      _$ModeledShadePredictionDtoFromJson(json);

  @override
  final String status;
  @override
  final double modeledShadeRatio;
  @override
  final double baselineModeledShadeRatio;
  @override
  final double? physicalShadeCoverage;

  /// Create a copy of ModeledShadePredictionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModeledShadePredictionDtoCopyWith<_ModeledShadePredictionDto>
  get copyWith =>
      __$ModeledShadePredictionDtoCopyWithImpl<_ModeledShadePredictionDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ModeledShadePredictionDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModeledShadePredictionDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.modeledShadeRatio, modeledShadeRatio) ||
                other.modeledShadeRatio == modeledShadeRatio) &&
            (identical(
                  other.baselineModeledShadeRatio,
                  baselineModeledShadeRatio,
                ) ||
                other.baselineModeledShadeRatio == baselineModeledShadeRatio) &&
            (identical(other.physicalShadeCoverage, physicalShadeCoverage) ||
                other.physicalShadeCoverage == physicalShadeCoverage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      status,
      modeledShadeRatio,
      baselineModeledShadeRatio,
      physicalShadeCoverage,
    );
  }

  @override
  String toString() {
    return 'ModeledShadePredictionDto(status: $status, modeledShadeRatio: $modeledShadeRatio, baselineModeledShadeRatio: $baselineModeledShadeRatio, physicalShadeCoverage: $physicalShadeCoverage)';
  }
}

/// @nodoc
abstract mixin class _$ModeledShadePredictionDtoCopyWith<$Res>
    implements $ModeledShadePredictionDtoCopyWith<$Res> {
  factory _$ModeledShadePredictionDtoCopyWith(
    _ModeledShadePredictionDto value,
    $Res Function(_ModeledShadePredictionDto) _then,
  ) = __$ModeledShadePredictionDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String status,
    double modeledShadeRatio,
    double baselineModeledShadeRatio,
    double? physicalShadeCoverage,
  });
}

/// @nodoc
class __$ModeledShadePredictionDtoCopyWithImpl<$Res>
    implements _$ModeledShadePredictionDtoCopyWith<$Res> {
  __$ModeledShadePredictionDtoCopyWithImpl(this._self, this._then);

  final _ModeledShadePredictionDto _self;
  final $Res Function(_ModeledShadePredictionDto) _then;

  /// Create a copy of ModeledShadePredictionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? modeledShadeRatio = null,
    Object? baselineModeledShadeRatio = null,
    Object? physicalShadeCoverage = freezed,
  }) {
    return _then(
      _ModeledShadePredictionDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        modeledShadeRatio: null == modeledShadeRatio
            ? _self.modeledShadeRatio
            : modeledShadeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        baselineModeledShadeRatio: null == baselineModeledShadeRatio
            ? _self.baselineModeledShadeRatio
            : baselineModeledShadeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        physicalShadeCoverage: freezed == physicalShadeCoverage
            ? _self.physicalShadeCoverage
            : physicalShadeCoverage // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
mixin _$PredictionGeometryDto {
  String get type;
  List<List<double>> get coordinates;

  /// Create a copy of PredictionGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionGeometryDtoCopyWith<PredictionGeometryDto> get copyWith =>
      _$PredictionGeometryDtoCopyWithImpl<PredictionGeometryDto>(
        this as PredictionGeometryDto,
        _$identity,
      );

  /// Serializes this PredictionGeometryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionGeometryDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionGeometryDto &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            const DeepCollectionEquality().equals(
              other.coordinates,
              _this.coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionGeometryDto;
    return Object.hash(
      runtimeType,
      _this.type,
      const DeepCollectionEquality().hash(_this.coordinates),
    );
  }

  @override
  String toString() {
    final _this = this as PredictionGeometryDto;
    return 'PredictionGeometryDto(type: ${_this.type}, coordinates: ${_this.coordinates})';
  }
}

/// @nodoc
abstract mixin class $PredictionGeometryDtoCopyWith<$Res> {
  factory $PredictionGeometryDtoCopyWith(
    PredictionGeometryDto value,
    $Res Function(PredictionGeometryDto) _then,
  ) = _$PredictionGeometryDtoCopyWithImpl;
  @useResult
  $Res call({String type, List<List<double>> coordinates});
}

/// @nodoc
class _$PredictionGeometryDtoCopyWithImpl<$Res>
    implements $PredictionGeometryDtoCopyWith<$Res> {
  _$PredictionGeometryDtoCopyWithImpl(this._self, this._then);

  final PredictionGeometryDto _self;
  final $Res Function(PredictionGeometryDto) _then;

  /// Create a copy of PredictionGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      PredictionGeometryDto(
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinates: null == coordinates
            ? _self.coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<List<double>>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PredictionGeometryDto].
extension PredictionGeometryDtoPatterns on PredictionGeometryDto {
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
    TResult Function(_PredictionGeometryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto() when $default != null:
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
    TResult Function(_PredictionGeometryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto():
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
    TResult? Function(_PredictionGeometryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto() when $default != null:
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
    TResult Function(String type, List<List<double>> coordinates)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto() when $default != null:
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
    TResult Function(String type, List<List<double>> coordinates) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto():
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
    TResult? Function(String type, List<List<double>> coordinates)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionGeometryDto() when $default != null:
        return $default(_that.type, _that.coordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PredictionGeometryDto implements PredictionGeometryDto {
  const _PredictionGeometryDto({
    required this.type,
    required List<List<double>> coordinates,
  }) : _coordinates = coordinates;
  factory _PredictionGeometryDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionGeometryDtoFromJson(json);

  @override
  final String type;
  final List<List<double>> _coordinates;
  @override
  List<List<double>> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of PredictionGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionGeometryDtoCopyWith<_PredictionGeometryDto> get copyWith =>
      __$PredictionGeometryDtoCopyWithImpl<_PredictionGeometryDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionGeometryDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionGeometryDto &&
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
    return 'PredictionGeometryDto(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$PredictionGeometryDtoCopyWith<$Res>
    implements $PredictionGeometryDtoCopyWith<$Res> {
  factory _$PredictionGeometryDtoCopyWith(
    _PredictionGeometryDto value,
    $Res Function(_PredictionGeometryDto) _then,
  ) = __$PredictionGeometryDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<List<double>> coordinates});
}

/// @nodoc
class __$PredictionGeometryDtoCopyWithImpl<$Res>
    implements _$PredictionGeometryDtoCopyWith<$Res> {
  __$PredictionGeometryDtoCopyWithImpl(this._self, this._then);

  final _PredictionGeometryDto _self;
  final $Res Function(_PredictionGeometryDto) _then;

  /// Create a copy of PredictionGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      _PredictionGeometryDto(
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinates: null == coordinates
            ? _self._coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as List<List<double>>,
      ),
    );
  }
}

/// @nodoc
mixin _$PredictionCoordinateDto {
  double get longitude;
  double get latitude;

  /// Create a copy of PredictionCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<PredictionCoordinateDto> get copyWith =>
      _$PredictionCoordinateDtoCopyWithImpl<PredictionCoordinateDto>(
        this as PredictionCoordinateDto,
        _$identity,
      );

  /// Serializes this PredictionCoordinateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionCoordinateDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionCoordinateDto &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionCoordinateDto;
    return Object.hash(runtimeType, _this.longitude, _this.latitude);
  }

  @override
  String toString() {
    final _this = this as PredictionCoordinateDto;
    return 'PredictionCoordinateDto(longitude: ${_this.longitude}, latitude: ${_this.latitude})';
  }
}

/// @nodoc
abstract mixin class $PredictionCoordinateDtoCopyWith<$Res> {
  factory $PredictionCoordinateDtoCopyWith(
    PredictionCoordinateDto value,
    $Res Function(PredictionCoordinateDto) _then,
  ) = _$PredictionCoordinateDtoCopyWithImpl;
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$PredictionCoordinateDtoCopyWithImpl<$Res>
    implements $PredictionCoordinateDtoCopyWith<$Res> {
  _$PredictionCoordinateDtoCopyWithImpl(this._self, this._then);

  final PredictionCoordinateDto _self;
  final $Res Function(PredictionCoordinateDto) _then;

  /// Create a copy of PredictionCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      PredictionCoordinateDto(
        longitude: null == longitude
            ? _self.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _self.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PredictionCoordinateDto].
extension PredictionCoordinateDtoPatterns on PredictionCoordinateDto {
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
    TResult Function(_PredictionCoordinateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto() when $default != null:
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
    TResult Function(_PredictionCoordinateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto():
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
    TResult? Function(_PredictionCoordinateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto() when $default != null:
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
    TResult Function(double longitude, double latitude)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto() when $default != null:
        return $default(_that.longitude, _that.latitude);
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
    TResult Function(double longitude, double latitude) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto():
        return $default(_that.longitude, _that.latitude);
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
    TResult? Function(double longitude, double latitude)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionCoordinateDto() when $default != null:
        return $default(_that.longitude, _that.latitude);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PredictionCoordinateDto implements PredictionCoordinateDto {
  const _PredictionCoordinateDto({
    required this.longitude,
    required this.latitude,
  });
  factory _PredictionCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionCoordinateDtoFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;

  /// Create a copy of PredictionCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionCoordinateDtoCopyWith<_PredictionCoordinateDto> get copyWith =>
      __$PredictionCoordinateDtoCopyWithImpl<_PredictionCoordinateDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionCoordinateDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionCoordinateDto &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, longitude, latitude);
  }

  @override
  String toString() {
    return 'PredictionCoordinateDto(longitude: $longitude, latitude: $latitude)';
  }
}

/// @nodoc
abstract mixin class _$PredictionCoordinateDtoCopyWith<$Res>
    implements $PredictionCoordinateDtoCopyWith<$Res> {
  factory _$PredictionCoordinateDtoCopyWith(
    _PredictionCoordinateDto value,
    $Res Function(_PredictionCoordinateDto) _then,
  ) = __$PredictionCoordinateDtoCopyWithImpl;
  @override
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$PredictionCoordinateDtoCopyWithImpl<$Res>
    implements _$PredictionCoordinateDtoCopyWith<$Res> {
  __$PredictionCoordinateDtoCopyWithImpl(this._self, this._then);

  final _PredictionCoordinateDto _self;
  final $Res Function(_PredictionCoordinateDto) _then;

  /// Create a copy of PredictionCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      _PredictionCoordinateDto(
        longitude: null == longitude
            ? _self.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        latitude: null == latitude
            ? _self.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
mixin _$PredictionSnappingDto {
  PredictionSnapDto get origin;
  PredictionSnapDto get destination;

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionSnappingDtoCopyWith<PredictionSnappingDto> get copyWith =>
      _$PredictionSnappingDtoCopyWithImpl<PredictionSnappingDto>(
        this as PredictionSnappingDto,
        _$identity,
      );

  /// Serializes this PredictionSnappingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionSnappingDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionSnappingDto &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionSnappingDto;
    return Object.hash(runtimeType, _this.origin, _this.destination);
  }

  @override
  String toString() {
    final _this = this as PredictionSnappingDto;
    return 'PredictionSnappingDto(origin: ${_this.origin}, destination: ${_this.destination})';
  }
}

/// @nodoc
abstract mixin class $PredictionSnappingDtoCopyWith<$Res> {
  factory $PredictionSnappingDtoCopyWith(
    PredictionSnappingDto value,
    $Res Function(PredictionSnappingDto) _then,
  ) = _$PredictionSnappingDtoCopyWithImpl;
  @useResult
  $Res call({PredictionSnapDto origin, PredictionSnapDto destination});

  $PredictionSnapDtoCopyWith<$Res> get origin;
  $PredictionSnapDtoCopyWith<$Res> get destination;
}

/// @nodoc
class _$PredictionSnappingDtoCopyWithImpl<$Res>
    implements $PredictionSnappingDtoCopyWith<$Res> {
  _$PredictionSnappingDtoCopyWithImpl(this._self, this._then);

  final PredictionSnappingDto _self;
  final $Res Function(PredictionSnappingDto) _then;

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      PredictionSnappingDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapDto,
      ),
    );
  }

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapDtoCopyWith<$Res> get origin {
    return $PredictionSnapDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapDtoCopyWith<$Res> get destination {
    return $PredictionSnapDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionSnappingDto].
extension PredictionSnappingDtoPatterns on PredictionSnappingDto {
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
    TResult Function(_PredictionSnappingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto() when $default != null:
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
    TResult Function(_PredictionSnappingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto():
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
    TResult? Function(_PredictionSnappingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto() when $default != null:
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
    TResult Function(PredictionSnapDto origin, PredictionSnapDto destination)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto() when $default != null:
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
    TResult Function(PredictionSnapDto origin, PredictionSnapDto destination)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto():
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
    TResult? Function(PredictionSnapDto origin, PredictionSnapDto destination)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnappingDto() when $default != null:
        return $default(_that.origin, _that.destination);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PredictionSnappingDto implements PredictionSnappingDto {
  const _PredictionSnappingDto({
    required this.origin,
    required this.destination,
  });
  factory _PredictionSnappingDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionSnappingDtoFromJson(json);

  @override
  final PredictionSnapDto origin;
  @override
  final PredictionSnapDto destination;

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionSnappingDtoCopyWith<_PredictionSnappingDto> get copyWith =>
      __$PredictionSnappingDtoCopyWithImpl<_PredictionSnappingDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionSnappingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionSnappingDto &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, origin, destination);
  }

  @override
  String toString() {
    return 'PredictionSnappingDto(origin: $origin, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class _$PredictionSnappingDtoCopyWith<$Res>
    implements $PredictionSnappingDtoCopyWith<$Res> {
  factory _$PredictionSnappingDtoCopyWith(
    _PredictionSnappingDto value,
    $Res Function(_PredictionSnappingDto) _then,
  ) = __$PredictionSnappingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({PredictionSnapDto origin, PredictionSnapDto destination});

  @override
  $PredictionSnapDtoCopyWith<$Res> get origin;
  @override
  $PredictionSnapDtoCopyWith<$Res> get destination;
}

/// @nodoc
class __$PredictionSnappingDtoCopyWithImpl<$Res>
    implements _$PredictionSnappingDtoCopyWith<$Res> {
  __$PredictionSnappingDtoCopyWithImpl(this._self, this._then);

  final _PredictionSnappingDto _self;
  final $Res Function(_PredictionSnappingDto) _then;

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      _PredictionSnappingDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapDto,
      ),
    );
  }

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapDtoCopyWith<$Res> get origin {
    return $PredictionSnapDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of PredictionSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapDtoCopyWith<$Res> get destination {
    return $PredictionSnapDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$PredictionSnapDto {
  PredictionCoordinateDto get coordinate;
  double get distanceMeters;

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionSnapDtoCopyWith<PredictionSnapDto> get copyWith =>
      _$PredictionSnapDtoCopyWithImpl<PredictionSnapDto>(
        this as PredictionSnapDto,
        _$identity,
      );

  /// Serializes this PredictionSnapDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionSnapDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionSnapDto &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PredictionSnapDto;
    return Object.hash(runtimeType, _this.coordinate, _this.distanceMeters);
  }

  @override
  String toString() {
    final _this = this as PredictionSnapDto;
    return 'PredictionSnapDto(coordinate: ${_this.coordinate}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $PredictionSnapDtoCopyWith<$Res> {
  factory $PredictionSnapDtoCopyWith(
    PredictionSnapDto value,
    $Res Function(PredictionSnapDto) _then,
  ) = _$PredictionSnapDtoCopyWithImpl;
  @useResult
  $Res call({PredictionCoordinateDto coordinate, double distanceMeters});

  $PredictionCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PredictionSnapDtoCopyWithImpl<$Res>
    implements $PredictionSnapDtoCopyWith<$Res> {
  _$PredictionSnapDtoCopyWithImpl(this._self, this._then);

  final PredictionSnapDto _self;
  final $Res Function(PredictionSnapDto) _then;

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      PredictionSnapDto(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionSnapDto].
extension PredictionSnapDtoPatterns on PredictionSnapDto {
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
    TResult Function(_PredictionSnapDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto() when $default != null:
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
    TResult Function(_PredictionSnapDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto():
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
    TResult? Function(_PredictionSnapDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto() when $default != null:
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
    TResult Function(PredictionCoordinateDto coordinate, double distanceMeters)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto() when $default != null:
        return $default(_that.coordinate, _that.distanceMeters);
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
    TResult Function(PredictionCoordinateDto coordinate, double distanceMeters)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto():
        return $default(_that.coordinate, _that.distanceMeters);
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
      PredictionCoordinateDto coordinate,
      double distanceMeters,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapDto() when $default != null:
        return $default(_that.coordinate, _that.distanceMeters);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PredictionSnapDto implements PredictionSnapDto {
  const _PredictionSnapDto({
    required this.coordinate,
    required this.distanceMeters,
  });
  factory _PredictionSnapDto.fromJson(Map<String, dynamic> json) =>
      _$PredictionSnapDtoFromJson(json);

  @override
  final PredictionCoordinateDto coordinate;
  @override
  final double distanceMeters;

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionSnapDtoCopyWith<_PredictionSnapDto> get copyWith =>
      __$PredictionSnapDtoCopyWithImpl<_PredictionSnapDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionSnapDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionSnapDto &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, coordinate, distanceMeters);
  }

  @override
  String toString() {
    return 'PredictionSnapDto(coordinate: $coordinate, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$PredictionSnapDtoCopyWith<$Res>
    implements $PredictionSnapDtoCopyWith<$Res> {
  factory _$PredictionSnapDtoCopyWith(
    _PredictionSnapDto value,
    $Res Function(_PredictionSnapDto) _then,
  ) = __$PredictionSnapDtoCopyWithImpl;
  @override
  @useResult
  $Res call({PredictionCoordinateDto coordinate, double distanceMeters});

  @override
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PredictionSnapDtoCopyWithImpl<$Res>
    implements _$PredictionSnapDtoCopyWith<$Res> {
  __$PredictionSnapDtoCopyWithImpl(this._self, this._then);

  final _PredictionSnapDto _self;
  final $Res Function(_PredictionSnapDto) _then;

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      _PredictionSnapDto(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as PredictionCoordinateDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionCoordinateDtoCopyWith<$Res> get coordinate {
    return $PredictionCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
