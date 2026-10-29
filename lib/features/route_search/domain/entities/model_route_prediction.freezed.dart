// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_route_prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutePredictionQuery {
  GeoCoordinate get origin;
  GeoCoordinate get destination;
  RoutePredictionMode get mode;
  DateTime? get departureAt;

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutePredictionQueryCopyWith<RoutePredictionQuery> get copyWith =>
      _$RoutePredictionQueryCopyWithImpl<RoutePredictionQuery>(
        this as RoutePredictionQuery,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RoutePredictionQuery;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoutePredictionQuery &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination) &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode) &&
            (identical(other.departureAt, _this.departureAt) ||
                other.departureAt == _this.departureAt));
  }

  @override
  int get hashCode {
    final _this = this as RoutePredictionQuery;
    return Object.hash(
      runtimeType,
      _this.origin,
      _this.destination,
      _this.mode,
      _this.departureAt,
    );
  }

  @override
  String toString() {
    final _this = this as RoutePredictionQuery;
    return 'RoutePredictionQuery(origin: ${_this.origin}, destination: ${_this.destination}, mode: ${_this.mode}, departureAt: ${_this.departureAt})';
  }
}

/// @nodoc
abstract mixin class $RoutePredictionQueryCopyWith<$Res> {
  factory $RoutePredictionQueryCopyWith(
    RoutePredictionQuery value,
    $Res Function(RoutePredictionQuery) _then,
  ) = _$RoutePredictionQueryCopyWithImpl;
  @useResult
  $Res call({
    GeoCoordinate origin,
    GeoCoordinate destination,
    RoutePredictionMode mode,
    DateTime? departureAt,
  });

  $GeoCoordinateCopyWith<$Res> get origin;
  $GeoCoordinateCopyWith<$Res> get destination;
}

/// @nodoc
class _$RoutePredictionQueryCopyWithImpl<$Res>
    implements $RoutePredictionQueryCopyWith<$Res> {
  _$RoutePredictionQueryCopyWithImpl(this._self, this._then);

  final RoutePredictionQuery _self;
  final $Res Function(RoutePredictionQuery) _then;

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? mode = null,
    Object? departureAt = freezed,
  }) {
    return _then(
      RoutePredictionQuery(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get origin {
    return $GeoCoordinateCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get destination {
    return $GeoCoordinateCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RoutePredictionQuery].
extension RoutePredictionQueryPatterns on RoutePredictionQuery {
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
    TResult Function(_RoutePredictionQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery() when $default != null:
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
    TResult Function(_RoutePredictionQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery():
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
    TResult? Function(_RoutePredictionQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery() when $default != null:
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
      RoutePredictionMode mode,
      DateTime? departureAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
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
      GeoCoordinate origin,
      GeoCoordinate destination,
      RoutePredictionMode mode,
      DateTime? departureAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery():
        return $default(
          _that.origin,
          _that.destination,
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
      GeoCoordinate origin,
      GeoCoordinate destination,
      RoutePredictionMode mode,
      DateTime? departureAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePredictionQuery() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
          _that.mode,
          _that.departureAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RoutePredictionQuery implements RoutePredictionQuery {
  const _RoutePredictionQuery({
    required this.origin,
    required this.destination,
    required this.mode,
    this.departureAt,
  });

  @override
  final GeoCoordinate origin;
  @override
  final GeoCoordinate destination;
  @override
  final RoutePredictionMode mode;
  @override
  final DateTime? departureAt;

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutePredictionQueryCopyWith<_RoutePredictionQuery> get copyWith =>
      __$RoutePredictionQueryCopyWithImpl<_RoutePredictionQuery>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutePredictionQuery &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.departureAt, departureAt) ||
                other.departureAt == departureAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, origin, destination, mode, departureAt);
  }

  @override
  String toString() {
    return 'RoutePredictionQuery(origin: $origin, destination: $destination, mode: $mode, departureAt: $departureAt)';
  }
}

/// @nodoc
abstract mixin class _$RoutePredictionQueryCopyWith<$Res>
    implements $RoutePredictionQueryCopyWith<$Res> {
  factory _$RoutePredictionQueryCopyWith(
    _RoutePredictionQuery value,
    $Res Function(_RoutePredictionQuery) _then,
  ) = __$RoutePredictionQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeoCoordinate origin,
    GeoCoordinate destination,
    RoutePredictionMode mode,
    DateTime? departureAt,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get origin;
  @override
  $GeoCoordinateCopyWith<$Res> get destination;
}

/// @nodoc
class __$RoutePredictionQueryCopyWithImpl<$Res>
    implements _$RoutePredictionQueryCopyWith<$Res> {
  __$RoutePredictionQueryCopyWithImpl(this._self, this._then);

  final _RoutePredictionQuery _self;
  final $Res Function(_RoutePredictionQuery) _then;

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? mode = null,
    Object? departureAt = freezed,
  }) {
    return _then(
      _RoutePredictionQuery(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        departureAt: freezed == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get origin {
    return $GeoCoordinateCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RoutePredictionQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get destination {
    return $GeoCoordinateCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$ModelRoutePrediction {
  RoutePredictionQuery get query;
  List<PredictedRoute> get routes;
  DateTime get evaluatedAt;
  String get dataVersion;
  String get predictionDataVersion;
  String get modelVersion;
  String get routingModelVersion;
  String get timeModelVersion;
  Duration get baselineDuration;
  PredictionSnapping get snapping;
  String get quality;
  String get attribution;
  List<String> get limitations;
  int get buildingModelCount;
  int get terrainTileCount;
  int get omittedBuildingModelCount;
  double get sampleStepMeters;
  double get projectionMaxErrorMeters;
  double get sceneBufferMetersApprox;

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelRoutePredictionCopyWith<ModelRoutePrediction> get copyWith =>
      _$ModelRoutePredictionCopyWithImpl<ModelRoutePrediction>(
        this as ModelRoutePrediction,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as ModelRoutePrediction;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelRoutePrediction &&
            (identical(other.query, _this.query) ||
                other.query == _this.query) &&
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
            (identical(other.baselineDuration, _this.baselineDuration) ||
                other.baselineDuration == _this.baselineDuration) &&
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

  @override
  int get hashCode {
    final _this = this as ModelRoutePrediction;
    return Object.hashAll([
      runtimeType,
      _this.query,
      const DeepCollectionEquality().hash(_this.routes),
      _this.evaluatedAt,
      _this.dataVersion,
      _this.predictionDataVersion,
      _this.modelVersion,
      _this.routingModelVersion,
      _this.timeModelVersion,
      _this.baselineDuration,
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
    ]);
  }

  @override
  String toString() {
    final _this = this as ModelRoutePrediction;
    return 'ModelRoutePrediction(query: ${_this.query}, routes: ${_this.routes}, evaluatedAt: ${_this.evaluatedAt}, dataVersion: ${_this.dataVersion}, predictionDataVersion: ${_this.predictionDataVersion}, modelVersion: ${_this.modelVersion}, routingModelVersion: ${_this.routingModelVersion}, timeModelVersion: ${_this.timeModelVersion}, baselineDuration: ${_this.baselineDuration}, snapping: ${_this.snapping}, quality: ${_this.quality}, attribution: ${_this.attribution}, limitations: ${_this.limitations}, buildingModelCount: ${_this.buildingModelCount}, terrainTileCount: ${_this.terrainTileCount}, omittedBuildingModelCount: ${_this.omittedBuildingModelCount}, sampleStepMeters: ${_this.sampleStepMeters}, projectionMaxErrorMeters: ${_this.projectionMaxErrorMeters}, sceneBufferMetersApprox: ${_this.sceneBufferMetersApprox})';
  }
}

/// @nodoc
abstract mixin class $ModelRoutePredictionCopyWith<$Res> {
  factory $ModelRoutePredictionCopyWith(
    ModelRoutePrediction value,
    $Res Function(ModelRoutePrediction) _then,
  ) = _$ModelRoutePredictionCopyWithImpl;
  @useResult
  $Res call({
    RoutePredictionQuery query,
    List<PredictedRoute> routes,
    DateTime evaluatedAt,
    String dataVersion,
    String predictionDataVersion,
    String modelVersion,
    String routingModelVersion,
    String timeModelVersion,
    Duration baselineDuration,
    PredictionSnapping snapping,
    String quality,
    String attribution,
    List<String> limitations,
    int buildingModelCount,
    int terrainTileCount,
    int omittedBuildingModelCount,
    double sampleStepMeters,
    double projectionMaxErrorMeters,
    double sceneBufferMetersApprox,
  });

  $RoutePredictionQueryCopyWith<$Res> get query;
  $PredictionSnappingCopyWith<$Res> get snapping;
}

/// @nodoc
class _$ModelRoutePredictionCopyWithImpl<$Res>
    implements $ModelRoutePredictionCopyWith<$Res> {
  _$ModelRoutePredictionCopyWithImpl(this._self, this._then);

  final ModelRoutePrediction _self;
  final $Res Function(ModelRoutePrediction) _then;

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? modelVersion = null,
    Object? routingModelVersion = null,
    Object? timeModelVersion = null,
    Object? baselineDuration = null,
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
      ModelRoutePrediction(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionQuery,
        routes: null == routes
            ? _self.routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<PredictedRoute>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        baselineDuration: null == baselineDuration
            ? _self.baselineDuration
            : baselineDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapping,
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

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePredictionQueryCopyWith<$Res> get query {
    return $RoutePredictionQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnappingCopyWith<$Res> get snapping {
    return $PredictionSnappingCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ModelRoutePrediction].
extension ModelRoutePredictionPatterns on ModelRoutePrediction {
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
    TResult Function(_ModelRoutePrediction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction() when $default != null:
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
    TResult Function(_ModelRoutePrediction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction():
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
    TResult? Function(_ModelRoutePrediction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction() when $default != null:
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
      RoutePredictionQuery query,
      List<PredictedRoute> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      Duration baselineDuration,
      PredictionSnapping snapping,
      String quality,
      String attribution,
      List<String> limitations,
      int buildingModelCount,
      int terrainTileCount,
      int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction() when $default != null:
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDuration,
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
      RoutePredictionQuery query,
      List<PredictedRoute> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      Duration baselineDuration,
      PredictionSnapping snapping,
      String quality,
      String attribution,
      List<String> limitations,
      int buildingModelCount,
      int terrainTileCount,
      int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction():
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDuration,
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
      RoutePredictionQuery query,
      List<PredictedRoute> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String predictionDataVersion,
      String modelVersion,
      String routingModelVersion,
      String timeModelVersion,
      Duration baselineDuration,
      PredictionSnapping snapping,
      String quality,
      String attribution,
      List<String> limitations,
      int buildingModelCount,
      int terrainTileCount,
      int omittedBuildingModelCount,
      double sampleStepMeters,
      double projectionMaxErrorMeters,
      double sceneBufferMetersApprox,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelRoutePrediction() when $default != null:
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.predictionDataVersion,
          _that.modelVersion,
          _that.routingModelVersion,
          _that.timeModelVersion,
          _that.baselineDuration,
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

class _ModelRoutePrediction implements ModelRoutePrediction {
  const _ModelRoutePrediction({
    required this.query,
    required List<PredictedRoute> routes,
    required this.evaluatedAt,
    required this.dataVersion,
    required this.predictionDataVersion,
    required this.modelVersion,
    required this.routingModelVersion,
    required this.timeModelVersion,
    required this.baselineDuration,
    required this.snapping,
    required this.quality,
    required this.attribution,
    required List<String> limitations,
    required this.buildingModelCount,
    required this.terrainTileCount,
    required this.omittedBuildingModelCount,
    required this.sampleStepMeters,
    required this.projectionMaxErrorMeters,
    required this.sceneBufferMetersApprox,
  }) : _routes = routes,
       _limitations = limitations;

  @override
  final RoutePredictionQuery query;
  final List<PredictedRoute> _routes;
  @override
  List<PredictedRoute> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  final DateTime evaluatedAt;
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
  final Duration baselineDuration;
  @override
  final PredictionSnapping snapping;
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
  final int buildingModelCount;
  @override
  final int terrainTileCount;
  @override
  final int omittedBuildingModelCount;
  @override
  final double sampleStepMeters;
  @override
  final double projectionMaxErrorMeters;
  @override
  final double sceneBufferMetersApprox;

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelRoutePredictionCopyWith<_ModelRoutePrediction> get copyWith =>
      __$ModelRoutePredictionCopyWithImpl<_ModelRoutePrediction>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelRoutePrediction &&
            (identical(other.query, query) || other.query == query) &&
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
            (identical(other.baselineDuration, baselineDuration) ||
                other.baselineDuration == baselineDuration) &&
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

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_routes),
      evaluatedAt,
      dataVersion,
      predictionDataVersion,
      modelVersion,
      routingModelVersion,
      timeModelVersion,
      baselineDuration,
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
    ]);
  }

  @override
  String toString() {
    return 'ModelRoutePrediction(query: $query, routes: $routes, evaluatedAt: $evaluatedAt, dataVersion: $dataVersion, predictionDataVersion: $predictionDataVersion, modelVersion: $modelVersion, routingModelVersion: $routingModelVersion, timeModelVersion: $timeModelVersion, baselineDuration: $baselineDuration, snapping: $snapping, quality: $quality, attribution: $attribution, limitations: $limitations, buildingModelCount: $buildingModelCount, terrainTileCount: $terrainTileCount, omittedBuildingModelCount: $omittedBuildingModelCount, sampleStepMeters: $sampleStepMeters, projectionMaxErrorMeters: $projectionMaxErrorMeters, sceneBufferMetersApprox: $sceneBufferMetersApprox)';
  }
}

/// @nodoc
abstract mixin class _$ModelRoutePredictionCopyWith<$Res>
    implements $ModelRoutePredictionCopyWith<$Res> {
  factory _$ModelRoutePredictionCopyWith(
    _ModelRoutePrediction value,
    $Res Function(_ModelRoutePrediction) _then,
  ) = __$ModelRoutePredictionCopyWithImpl;
  @override
  @useResult
  $Res call({
    RoutePredictionQuery query,
    List<PredictedRoute> routes,
    DateTime evaluatedAt,
    String dataVersion,
    String predictionDataVersion,
    String modelVersion,
    String routingModelVersion,
    String timeModelVersion,
    Duration baselineDuration,
    PredictionSnapping snapping,
    String quality,
    String attribution,
    List<String> limitations,
    int buildingModelCount,
    int terrainTileCount,
    int omittedBuildingModelCount,
    double sampleStepMeters,
    double projectionMaxErrorMeters,
    double sceneBufferMetersApprox,
  });

  @override
  $RoutePredictionQueryCopyWith<$Res> get query;
  @override
  $PredictionSnappingCopyWith<$Res> get snapping;
}

/// @nodoc
class __$ModelRoutePredictionCopyWithImpl<$Res>
    implements _$ModelRoutePredictionCopyWith<$Res> {
  __$ModelRoutePredictionCopyWithImpl(this._self, this._then);

  final _ModelRoutePrediction _self;
  final $Res Function(_ModelRoutePrediction) _then;

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? predictionDataVersion = null,
    Object? modelVersion = null,
    Object? routingModelVersion = null,
    Object? timeModelVersion = null,
    Object? baselineDuration = null,
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
      _ModelRoutePrediction(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionQuery,
        routes: null == routes
            ? _self._routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<PredictedRoute>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        baselineDuration: null == baselineDuration
            ? _self.baselineDuration
            : baselineDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as PredictionSnapping,
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

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePredictionQueryCopyWith<$Res> get query {
    return $RoutePredictionQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }

  /// Create a copy of ModelRoutePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnappingCopyWith<$Res> get snapping {
    return $PredictionSnappingCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// @nodoc
mixin _$PredictedRoute {
  String get id;
  RoutePredictionMode get mode;
  List<GeoCoordinate> get path;
  double get distanceMeters;
  Duration get duration;
  Duration get additionalDuration;
  ModeledShadePrediction get prediction;
  List<PredictedShadeSegment> get shadeSegments;

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictedRouteCopyWith<PredictedRoute> get copyWith =>
      _$PredictedRouteCopyWithImpl<PredictedRoute>(
        this as PredictedRoute,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictedRoute;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictedRoute &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode) &&
            const DeepCollectionEquality().equals(other.path, _this.path) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters) &&
            (identical(other.duration, _this.duration) ||
                other.duration == _this.duration) &&
            (identical(other.additionalDuration, _this.additionalDuration) ||
                other.additionalDuration == _this.additionalDuration) &&
            (identical(other.prediction, _this.prediction) ||
                other.prediction == _this.prediction) &&
            const DeepCollectionEquality().equals(
              other.shadeSegments,
              _this.shadeSegments,
            ));
  }

  @override
  int get hashCode {
    final _this = this as PredictedRoute;
    return Object.hash(
      runtimeType,
      _this.id,
      _this.mode,
      const DeepCollectionEquality().hash(_this.path),
      _this.distanceMeters,
      _this.duration,
      _this.additionalDuration,
      _this.prediction,
      const DeepCollectionEquality().hash(_this.shadeSegments),
    );
  }

  @override
  String toString() {
    final _this = this as PredictedRoute;
    return 'PredictedRoute(id: ${_this.id}, mode: ${_this.mode}, path: ${_this.path}, distanceMeters: ${_this.distanceMeters}, duration: ${_this.duration}, additionalDuration: ${_this.additionalDuration}, prediction: ${_this.prediction}, shadeSegments: ${_this.shadeSegments})';
  }
}

/// @nodoc
abstract mixin class $PredictedRouteCopyWith<$Res> {
  factory $PredictedRouteCopyWith(
    PredictedRoute value,
    $Res Function(PredictedRoute) _then,
  ) = _$PredictedRouteCopyWithImpl;
  @useResult
  $Res call({
    String id,
    RoutePredictionMode mode,
    List<GeoCoordinate> path,
    double distanceMeters,
    Duration duration,
    Duration additionalDuration,
    ModeledShadePrediction prediction,
    List<PredictedShadeSegment> shadeSegments,
  });

  $ModeledShadePredictionCopyWith<$Res> get prediction;
}

/// @nodoc
class _$PredictedRouteCopyWithImpl<$Res>
    implements $PredictedRouteCopyWith<$Res> {
  _$PredictedRouteCopyWithImpl(this._self, this._then);

  final PredictedRoute _self;
  final $Res Function(PredictedRoute) _then;

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mode = null,
    Object? path = null,
    Object? distanceMeters = null,
    Object? duration = null,
    Object? additionalDuration = null,
    Object? prediction = null,
    Object? shadeSegments = null,
  }) {
    return _then(
      PredictedRoute(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        additionalDuration: null == additionalDuration
            ? _self.additionalDuration
            : additionalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        prediction: null == prediction
            ? _self.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as ModeledShadePrediction,
        shadeSegments: null == shadeSegments
            ? _self.shadeSegments
            : shadeSegments // ignore: cast_nullable_to_non_nullable
                  as List<PredictedShadeSegment>,
      ),
    );
  }

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionCopyWith<$Res> get prediction {
    return $ModeledShadePredictionCopyWith<$Res>(_self.prediction, (value) {
      return _then(_self.copyWith(prediction: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictedRoute].
extension PredictedRoutePatterns on PredictedRoute {
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
    TResult Function(_PredictedRoute value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute() when $default != null:
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
    TResult Function(_PredictedRoute value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute():
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
    TResult? Function(_PredictedRoute value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute() when $default != null:
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
      RoutePredictionMode mode,
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      ModeledShadePrediction prediction,
      List<PredictedShadeSegment> shadeSegments,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
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
      RoutePredictionMode mode,
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      ModeledShadePrediction prediction,
      List<PredictedShadeSegment> shadeSegments,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute():
        return $default(
          _that.id,
          _that.mode,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
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
      RoutePredictionMode mode,
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      ModeledShadePrediction prediction,
      List<PredictedShadeSegment> shadeSegments,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedRoute() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
          _that.prediction,
          _that.shadeSegments,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictedRoute implements PredictedRoute {
  const _PredictedRoute({
    required this.id,
    required this.mode,
    required List<GeoCoordinate> path,
    required this.distanceMeters,
    required this.duration,
    required this.additionalDuration,
    required this.prediction,
    List<PredictedShadeSegment> shadeSegments = const [],
  }) : _path = path,
       _shadeSegments = shadeSegments;

  @override
  final String id;
  @override
  final RoutePredictionMode mode;
  final List<GeoCoordinate> _path;
  @override
  List<GeoCoordinate> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  final double distanceMeters;
  @override
  final Duration duration;
  @override
  final Duration additionalDuration;
  @override
  final ModeledShadePrediction prediction;
  final List<PredictedShadeSegment> _shadeSegments;
  @override
  @JsonKey()
  List<PredictedShadeSegment> get shadeSegments {
    if (_shadeSegments is EqualUnmodifiableListView) return _shadeSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shadeSegments);
  }

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictedRouteCopyWith<_PredictedRoute> get copyWith =>
      __$PredictedRouteCopyWithImpl<_PredictedRoute>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictedRoute &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(other.path, _path) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.additionalDuration, additionalDuration) ||
                other.additionalDuration == additionalDuration) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            const DeepCollectionEquality().equals(
              other.shadeSegments,
              _shadeSegments,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      mode,
      const DeepCollectionEquality().hash(_path),
      distanceMeters,
      duration,
      additionalDuration,
      prediction,
      const DeepCollectionEquality().hash(_shadeSegments),
    );
  }

  @override
  String toString() {
    return 'PredictedRoute(id: $id, mode: $mode, path: $path, distanceMeters: $distanceMeters, duration: $duration, additionalDuration: $additionalDuration, prediction: $prediction, shadeSegments: $shadeSegments)';
  }
}

/// @nodoc
abstract mixin class _$PredictedRouteCopyWith<$Res>
    implements $PredictedRouteCopyWith<$Res> {
  factory _$PredictedRouteCopyWith(
    _PredictedRoute value,
    $Res Function(_PredictedRoute) _then,
  ) = __$PredictedRouteCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    RoutePredictionMode mode,
    List<GeoCoordinate> path,
    double distanceMeters,
    Duration duration,
    Duration additionalDuration,
    ModeledShadePrediction prediction,
    List<PredictedShadeSegment> shadeSegments,
  });

  @override
  $ModeledShadePredictionCopyWith<$Res> get prediction;
}

/// @nodoc
class __$PredictedRouteCopyWithImpl<$Res>
    implements _$PredictedRouteCopyWith<$Res> {
  __$PredictedRouteCopyWithImpl(this._self, this._then);

  final _PredictedRoute _self;
  final $Res Function(_PredictedRoute) _then;

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? mode = null,
    Object? path = null,
    Object? distanceMeters = null,
    Object? duration = null,
    Object? additionalDuration = null,
    Object? prediction = null,
    Object? shadeSegments = null,
  }) {
    return _then(
      _PredictedRoute(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as RoutePredictionMode,
        path: null == path
            ? _self._path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        duration: null == duration
            ? _self.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        additionalDuration: null == additionalDuration
            ? _self.additionalDuration
            : additionalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        prediction: null == prediction
            ? _self.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as ModeledShadePrediction,
        shadeSegments: null == shadeSegments
            ? _self._shadeSegments
            : shadeSegments // ignore: cast_nullable_to_non_nullable
                  as List<PredictedShadeSegment>,
      ),
    );
  }

  /// Create a copy of PredictedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionCopyWith<$Res> get prediction {
    return $ModeledShadePredictionCopyWith<$Res>(_self.prediction, (value) {
      return _then(_self.copyWith(prediction: value));
    });
  }
}

/// @nodoc
mixin _$PredictedShadeSegment {
  PredictedShadeState get state;
  List<GeoCoordinate> get path;
  double get fromDistanceMeters;
  double get toDistanceMeters;
  double get distanceMeters;

  /// Create a copy of PredictedShadeSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictedShadeSegmentCopyWith<PredictedShadeSegment> get copyWith =>
      _$PredictedShadeSegmentCopyWithImpl<PredictedShadeSegment>(
        this as PredictedShadeSegment,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictedShadeSegment;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictedShadeSegment &&
            (identical(other.state, _this.state) ||
                other.state == _this.state) &&
            const DeepCollectionEquality().equals(other.path, _this.path) &&
            (identical(other.fromDistanceMeters, _this.fromDistanceMeters) ||
                other.fromDistanceMeters == _this.fromDistanceMeters) &&
            (identical(other.toDistanceMeters, _this.toDistanceMeters) ||
                other.toDistanceMeters == _this.toDistanceMeters) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @override
  int get hashCode {
    final _this = this as PredictedShadeSegment;
    return Object.hash(
      runtimeType,
      _this.state,
      const DeepCollectionEquality().hash(_this.path),
      _this.fromDistanceMeters,
      _this.toDistanceMeters,
      _this.distanceMeters,
    );
  }

  @override
  String toString() {
    final _this = this as PredictedShadeSegment;
    return 'PredictedShadeSegment(state: ${_this.state}, path: ${_this.path}, fromDistanceMeters: ${_this.fromDistanceMeters}, toDistanceMeters: ${_this.toDistanceMeters}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $PredictedShadeSegmentCopyWith<$Res> {
  factory $PredictedShadeSegmentCopyWith(
    PredictedShadeSegment value,
    $Res Function(PredictedShadeSegment) _then,
  ) = _$PredictedShadeSegmentCopyWithImpl;
  @useResult
  $Res call({
    PredictedShadeState state,
    List<GeoCoordinate> path,
    double fromDistanceMeters,
    double toDistanceMeters,
    double distanceMeters,
  });
}

/// @nodoc
class _$PredictedShadeSegmentCopyWithImpl<$Res>
    implements $PredictedShadeSegmentCopyWith<$Res> {
  _$PredictedShadeSegmentCopyWithImpl(this._self, this._then);

  final PredictedShadeSegment _self;
  final $Res Function(PredictedShadeSegment) _then;

  /// Create a copy of PredictedShadeSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? path = null,
    Object? fromDistanceMeters = null,
    Object? toDistanceMeters = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      PredictedShadeSegment(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as PredictedShadeState,
        path: null == path
            ? _self.path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
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
}

/// Adds pattern-matching-related methods to [PredictedShadeSegment].
extension PredictedShadeSegmentPatterns on PredictedShadeSegment {
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
    TResult Function(_PredictedShadeSegment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment() when $default != null:
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
    TResult Function(_PredictedShadeSegment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment():
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
    TResult? Function(_PredictedShadeSegment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment() when $default != null:
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
      PredictedShadeState state,
      List<GeoCoordinate> path,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment() when $default != null:
        return $default(
          _that.state,
          _that.path,
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
      PredictedShadeState state,
      List<GeoCoordinate> path,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment():
        return $default(
          _that.state,
          _that.path,
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
      PredictedShadeState state,
      List<GeoCoordinate> path,
      double fromDistanceMeters,
      double toDistanceMeters,
      double distanceMeters,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictedShadeSegment() when $default != null:
        return $default(
          _that.state,
          _that.path,
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

class _PredictedShadeSegment implements PredictedShadeSegment {
  const _PredictedShadeSegment({
    required this.state,
    required List<GeoCoordinate> path,
    required this.fromDistanceMeters,
    required this.toDistanceMeters,
    required this.distanceMeters,
  }) : _path = path;

  @override
  final PredictedShadeState state;
  final List<GeoCoordinate> _path;
  @override
  List<GeoCoordinate> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  final double fromDistanceMeters;
  @override
  final double toDistanceMeters;
  @override
  final double distanceMeters;

  /// Create a copy of PredictedShadeSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictedShadeSegmentCopyWith<_PredictedShadeSegment> get copyWith =>
      __$PredictedShadeSegmentCopyWithImpl<_PredictedShadeSegment>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictedShadeSegment &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other.path, _path) &&
            (identical(other.fromDistanceMeters, fromDistanceMeters) ||
                other.fromDistanceMeters == fromDistanceMeters) &&
            (identical(other.toDistanceMeters, toDistanceMeters) ||
                other.toDistanceMeters == toDistanceMeters) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      state,
      const DeepCollectionEquality().hash(_path),
      fromDistanceMeters,
      toDistanceMeters,
      distanceMeters,
    );
  }

  @override
  String toString() {
    return 'PredictedShadeSegment(state: $state, path: $path, fromDistanceMeters: $fromDistanceMeters, toDistanceMeters: $toDistanceMeters, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$PredictedShadeSegmentCopyWith<$Res>
    implements $PredictedShadeSegmentCopyWith<$Res> {
  factory _$PredictedShadeSegmentCopyWith(
    _PredictedShadeSegment value,
    $Res Function(_PredictedShadeSegment) _then,
  ) = __$PredictedShadeSegmentCopyWithImpl;
  @override
  @useResult
  $Res call({
    PredictedShadeState state,
    List<GeoCoordinate> path,
    double fromDistanceMeters,
    double toDistanceMeters,
    double distanceMeters,
  });
}

/// @nodoc
class __$PredictedShadeSegmentCopyWithImpl<$Res>
    implements _$PredictedShadeSegmentCopyWith<$Res> {
  __$PredictedShadeSegmentCopyWithImpl(this._self, this._then);

  final _PredictedShadeSegment _self;
  final $Res Function(_PredictedShadeSegment) _then;

  /// Create a copy of PredictedShadeSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
    Object? path = null,
    Object? fromDistanceMeters = null,
    Object? toDistanceMeters = null,
    Object? distanceMeters = null,
  }) {
    return _then(
      _PredictedShadeSegment(
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as PredictedShadeState,
        path: null == path
            ? _self._path
            : path // ignore: cast_nullable_to_non_nullable
                  as List<GeoCoordinate>,
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
}

/// @nodoc
mixin _$ModeledShadePrediction {
  String get status;
  double get modeledShadeRatio;
  double get baselineModeledShadeRatio;
  double? get physicalShadeCoverage;

  /// Create a copy of ModeledShadePrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModeledShadePredictionCopyWith<ModeledShadePrediction> get copyWith =>
      _$ModeledShadePredictionCopyWithImpl<ModeledShadePrediction>(
        this as ModeledShadePrediction,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as ModeledShadePrediction;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModeledShadePrediction &&
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

  @override
  int get hashCode {
    final _this = this as ModeledShadePrediction;
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
    final _this = this as ModeledShadePrediction;
    return 'ModeledShadePrediction(status: ${_this.status}, modeledShadeRatio: ${_this.modeledShadeRatio}, baselineModeledShadeRatio: ${_this.baselineModeledShadeRatio}, physicalShadeCoverage: ${_this.physicalShadeCoverage})';
  }
}

/// @nodoc
abstract mixin class $ModeledShadePredictionCopyWith<$Res> {
  factory $ModeledShadePredictionCopyWith(
    ModeledShadePrediction value,
    $Res Function(ModeledShadePrediction) _then,
  ) = _$ModeledShadePredictionCopyWithImpl;
  @useResult
  $Res call({
    String status,
    double modeledShadeRatio,
    double baselineModeledShadeRatio,
    double? physicalShadeCoverage,
  });
}

/// @nodoc
class _$ModeledShadePredictionCopyWithImpl<$Res>
    implements $ModeledShadePredictionCopyWith<$Res> {
  _$ModeledShadePredictionCopyWithImpl(this._self, this._then);

  final ModeledShadePrediction _self;
  final $Res Function(ModeledShadePrediction) _then;

  /// Create a copy of ModeledShadePrediction
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
      ModeledShadePrediction(
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

/// Adds pattern-matching-related methods to [ModeledShadePrediction].
extension ModeledShadePredictionPatterns on ModeledShadePrediction {
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
    TResult Function(_ModeledShadePrediction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePrediction() when $default != null:
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
    TResult Function(_ModeledShadePrediction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePrediction():
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
    TResult? Function(_ModeledShadePrediction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModeledShadePrediction() when $default != null:
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
      case _ModeledShadePrediction() when $default != null:
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
      case _ModeledShadePrediction():
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
      case _ModeledShadePrediction() when $default != null:
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

class _ModeledShadePrediction implements ModeledShadePrediction {
  const _ModeledShadePrediction({
    required this.status,
    required this.modeledShadeRatio,
    required this.baselineModeledShadeRatio,
    this.physicalShadeCoverage,
  });

  @override
  final String status;
  @override
  final double modeledShadeRatio;
  @override
  final double baselineModeledShadeRatio;
  @override
  final double? physicalShadeCoverage;

  /// Create a copy of ModeledShadePrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModeledShadePredictionCopyWith<_ModeledShadePrediction> get copyWith =>
      __$ModeledShadePredictionCopyWithImpl<_ModeledShadePrediction>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModeledShadePrediction &&
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
    return 'ModeledShadePrediction(status: $status, modeledShadeRatio: $modeledShadeRatio, baselineModeledShadeRatio: $baselineModeledShadeRatio, physicalShadeCoverage: $physicalShadeCoverage)';
  }
}

/// @nodoc
abstract mixin class _$ModeledShadePredictionCopyWith<$Res>
    implements $ModeledShadePredictionCopyWith<$Res> {
  factory _$ModeledShadePredictionCopyWith(
    _ModeledShadePrediction value,
    $Res Function(_ModeledShadePrediction) _then,
  ) = __$ModeledShadePredictionCopyWithImpl;
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
class __$ModeledShadePredictionCopyWithImpl<$Res>
    implements _$ModeledShadePredictionCopyWith<$Res> {
  __$ModeledShadePredictionCopyWithImpl(this._self, this._then);

  final _ModeledShadePrediction _self;
  final $Res Function(_ModeledShadePrediction) _then;

  /// Create a copy of ModeledShadePrediction
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
      _ModeledShadePrediction(
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
mixin _$PredictionSnapping {
  PredictionSnap get origin;
  PredictionSnap get destination;

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionSnappingCopyWith<PredictionSnapping> get copyWith =>
      _$PredictionSnappingCopyWithImpl<PredictionSnapping>(
        this as PredictionSnapping,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionSnapping;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionSnapping &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination));
  }

  @override
  int get hashCode {
    final _this = this as PredictionSnapping;
    return Object.hash(runtimeType, _this.origin, _this.destination);
  }

  @override
  String toString() {
    final _this = this as PredictionSnapping;
    return 'PredictionSnapping(origin: ${_this.origin}, destination: ${_this.destination})';
  }
}

/// @nodoc
abstract mixin class $PredictionSnappingCopyWith<$Res> {
  factory $PredictionSnappingCopyWith(
    PredictionSnapping value,
    $Res Function(PredictionSnapping) _then,
  ) = _$PredictionSnappingCopyWithImpl;
  @useResult
  $Res call({PredictionSnap origin, PredictionSnap destination});

  $PredictionSnapCopyWith<$Res> get origin;
  $PredictionSnapCopyWith<$Res> get destination;
}

/// @nodoc
class _$PredictionSnappingCopyWithImpl<$Res>
    implements $PredictionSnappingCopyWith<$Res> {
  _$PredictionSnappingCopyWithImpl(this._self, this._then);

  final PredictionSnapping _self;
  final $Res Function(PredictionSnapping) _then;

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      PredictionSnapping(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionSnap,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionSnap,
      ),
    );
  }

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapCopyWith<$Res> get origin {
    return $PredictionSnapCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapCopyWith<$Res> get destination {
    return $PredictionSnapCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionSnapping].
extension PredictionSnappingPatterns on PredictionSnapping {
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
    TResult Function(_PredictionSnapping value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping() when $default != null:
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
    TResult Function(_PredictionSnapping value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping():
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
    TResult? Function(_PredictionSnapping value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping() when $default != null:
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
    TResult Function(PredictionSnap origin, PredictionSnap destination)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping() when $default != null:
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
    TResult Function(PredictionSnap origin, PredictionSnap destination)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping():
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
    TResult? Function(PredictionSnap origin, PredictionSnap destination)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnapping() when $default != null:
        return $default(_that.origin, _that.destination);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionSnapping implements PredictionSnapping {
  const _PredictionSnapping({required this.origin, required this.destination});

  @override
  final PredictionSnap origin;
  @override
  final PredictionSnap destination;

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionSnappingCopyWith<_PredictionSnapping> get copyWith =>
      __$PredictionSnappingCopyWithImpl<_PredictionSnapping>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionSnapping &&
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
    return 'PredictionSnapping(origin: $origin, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class _$PredictionSnappingCopyWith<$Res>
    implements $PredictionSnappingCopyWith<$Res> {
  factory _$PredictionSnappingCopyWith(
    _PredictionSnapping value,
    $Res Function(_PredictionSnapping) _then,
  ) = __$PredictionSnappingCopyWithImpl;
  @override
  @useResult
  $Res call({PredictionSnap origin, PredictionSnap destination});

  @override
  $PredictionSnapCopyWith<$Res> get origin;
  @override
  $PredictionSnapCopyWith<$Res> get destination;
}

/// @nodoc
class __$PredictionSnappingCopyWithImpl<$Res>
    implements _$PredictionSnappingCopyWith<$Res> {
  __$PredictionSnappingCopyWithImpl(this._self, this._then);

  final _PredictionSnapping _self;
  final $Res Function(_PredictionSnapping) _then;

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      _PredictionSnapping(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as PredictionSnap,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as PredictionSnap,
      ),
    );
  }

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapCopyWith<$Res> get origin {
    return $PredictionSnapCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of PredictionSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionSnapCopyWith<$Res> get destination {
    return $PredictionSnapCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$PredictionSnap {
  GeoCoordinate get coordinate;
  double get distanceMeters;

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionSnapCopyWith<PredictionSnap> get copyWith =>
      _$PredictionSnapCopyWithImpl<PredictionSnap>(
        this as PredictionSnap,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as PredictionSnap;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionSnap &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @override
  int get hashCode {
    final _this = this as PredictionSnap;
    return Object.hash(runtimeType, _this.coordinate, _this.distanceMeters);
  }

  @override
  String toString() {
    final _this = this as PredictionSnap;
    return 'PredictionSnap(coordinate: ${_this.coordinate}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $PredictionSnapCopyWith<$Res> {
  factory $PredictionSnapCopyWith(
    PredictionSnap value,
    $Res Function(PredictionSnap) _then,
  ) = _$PredictionSnapCopyWithImpl;
  @useResult
  $Res call({GeoCoordinate coordinate, double distanceMeters});

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PredictionSnapCopyWithImpl<$Res>
    implements $PredictionSnapCopyWith<$Res> {
  _$PredictionSnapCopyWithImpl(this._self, this._then);

  final PredictionSnap _self;
  final $Res Function(PredictionSnap) _then;

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      PredictionSnap(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PredictionSnap].
extension PredictionSnapPatterns on PredictionSnap {
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
    TResult Function(_PredictionSnap value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap() when $default != null:
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
    TResult Function(_PredictionSnap value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap():
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
    TResult? Function(_PredictionSnap value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap() when $default != null:
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
    TResult Function(GeoCoordinate coordinate, double distanceMeters)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap() when $default != null:
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
    TResult Function(GeoCoordinate coordinate, double distanceMeters) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap():
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
    TResult? Function(GeoCoordinate coordinate, double distanceMeters)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PredictionSnap() when $default != null:
        return $default(_that.coordinate, _that.distanceMeters);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PredictionSnap implements PredictionSnap {
  const _PredictionSnap({
    required this.coordinate,
    required this.distanceMeters,
  });

  @override
  final GeoCoordinate coordinate;
  @override
  final double distanceMeters;

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionSnapCopyWith<_PredictionSnap> get copyWith =>
      __$PredictionSnapCopyWithImpl<_PredictionSnap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionSnap &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, coordinate, distanceMeters);
  }

  @override
  String toString() {
    return 'PredictionSnap(coordinate: $coordinate, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$PredictionSnapCopyWith<$Res>
    implements $PredictionSnapCopyWith<$Res> {
  factory _$PredictionSnapCopyWith(
    _PredictionSnap value,
    $Res Function(_PredictionSnap) _then,
  ) = __$PredictionSnapCopyWithImpl;
  @override
  @useResult
  $Res call({GeoCoordinate coordinate, double distanceMeters});

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PredictionSnapCopyWithImpl<$Res>
    implements _$PredictionSnapCopyWith<$Res> {
  __$PredictionSnapCopyWithImpl(this._self, this._then);

  final _PredictionSnap _self;
  final $Res Function(_PredictionSnap) _then;

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      _PredictionSnap(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of PredictionSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
