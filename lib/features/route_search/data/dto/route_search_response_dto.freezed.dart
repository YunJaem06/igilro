// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteSearchResponseDto {
  List<RouteCandidateDto> get routes;
  String get evaluatedAt;
  String get dataVersion;
  String get timeModelVersion;
  String get routingModelVersion;
  @JsonKey(fromJson: _readWholeNumber)
  int get baselineDurationSeconds;
  RouteSnappingDto get snapping;
  String get attribution;

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSearchResponseDtoCopyWith<RouteSearchResponseDto> get copyWith =>
      _$RouteSearchResponseDtoCopyWithImpl<RouteSearchResponseDto>(
        this as RouteSearchResponseDto,
        _$identity,
      );

  /// Serializes this RouteSearchResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSearchResponseDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSearchResponseDto &&
            const DeepCollectionEquality().equals(other.routes, _this.routes) &&
            (identical(other.evaluatedAt, _this.evaluatedAt) ||
                other.evaluatedAt == _this.evaluatedAt) &&
            (identical(other.dataVersion, _this.dataVersion) ||
                other.dataVersion == _this.dataVersion) &&
            (identical(other.timeModelVersion, _this.timeModelVersion) ||
                other.timeModelVersion == _this.timeModelVersion) &&
            (identical(other.routingModelVersion, _this.routingModelVersion) ||
                other.routingModelVersion == _this.routingModelVersion) &&
            (identical(
                  other.baselineDurationSeconds,
                  _this.baselineDurationSeconds,
                ) ||
                other.baselineDurationSeconds ==
                    _this.baselineDurationSeconds) &&
            (identical(other.snapping, _this.snapping) ||
                other.snapping == _this.snapping) &&
            (identical(other.attribution, _this.attribution) ||
                other.attribution == _this.attribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteSearchResponseDto;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.routes),
      _this.evaluatedAt,
      _this.dataVersion,
      _this.timeModelVersion,
      _this.routingModelVersion,
      _this.baselineDurationSeconds,
      _this.snapping,
      _this.attribution,
    );
  }

  @override
  String toString() {
    final _this = this as RouteSearchResponseDto;
    return 'RouteSearchResponseDto(routes: ${_this.routes}, evaluatedAt: ${_this.evaluatedAt}, dataVersion: ${_this.dataVersion}, timeModelVersion: ${_this.timeModelVersion}, routingModelVersion: ${_this.routingModelVersion}, baselineDurationSeconds: ${_this.baselineDurationSeconds}, snapping: ${_this.snapping}, attribution: ${_this.attribution})';
  }
}

/// @nodoc
abstract mixin class $RouteSearchResponseDtoCopyWith<$Res> {
  factory $RouteSearchResponseDtoCopyWith(
    RouteSearchResponseDto value,
    $Res Function(RouteSearchResponseDto) _then,
  ) = _$RouteSearchResponseDtoCopyWithImpl;
  @useResult
  $Res call({
    List<RouteCandidateDto> routes,
    String evaluatedAt,
    String dataVersion,
    String timeModelVersion,
    String routingModelVersion,
    @JsonKey(fromJson: _readWholeNumber) int baselineDurationSeconds,
    RouteSnappingDto snapping,
    String attribution,
  });

  $RouteSnappingDtoCopyWith<$Res> get snapping;
}

/// @nodoc
class _$RouteSearchResponseDtoCopyWithImpl<$Res>
    implements $RouteSearchResponseDtoCopyWith<$Res> {
  _$RouteSearchResponseDtoCopyWithImpl(this._self, this._then);

  final RouteSearchResponseDto _self;
  final $Res Function(RouteSearchResponseDto) _then;

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? timeModelVersion = null,
    Object? routingModelVersion = null,
    Object? baselineDurationSeconds = null,
    Object? snapping = null,
    Object? attribution = null,
  }) {
    return _then(
      RouteSearchResponseDto(
        routes: null == routes
            ? _self.routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<RouteCandidateDto>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        timeModelVersion: null == timeModelVersion
            ? _self.timeModelVersion
            : timeModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        routingModelVersion: null == routingModelVersion
            ? _self.routingModelVersion
            : routingModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        baselineDurationSeconds: null == baselineDurationSeconds
            ? _self.baselineDurationSeconds
            : baselineDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as RouteSnappingDto,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnappingDtoCopyWith<$Res> get snapping {
    return $RouteSnappingDtoCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSearchResponseDto].
extension RouteSearchResponseDtoPatterns on RouteSearchResponseDto {
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
    TResult Function(_RouteSearchResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto() when $default != null:
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
    TResult Function(_RouteSearchResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto():
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
    TResult? Function(_RouteSearchResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto() when $default != null:
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
      List<RouteCandidateDto> routes,
      String evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      @JsonKey(fromJson: _readWholeNumber) int baselineDurationSeconds,
      RouteSnappingDto snapping,
      String attribution,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto() when $default != null:
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.attribution,
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
      List<RouteCandidateDto> routes,
      String evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      @JsonKey(fromJson: _readWholeNumber) int baselineDurationSeconds,
      RouteSnappingDto snapping,
      String attribution,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto():
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.attribution,
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
      List<RouteCandidateDto> routes,
      String evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      @JsonKey(fromJson: _readWholeNumber) int baselineDurationSeconds,
      RouteSnappingDto snapping,
      String attribution,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResponseDto() when $default != null:
        return $default(
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDurationSeconds,
          _that.snapping,
          _that.attribution,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteSearchResponseDto implements RouteSearchResponseDto {
  const _RouteSearchResponseDto({
    required List<RouteCandidateDto> routes,
    required this.evaluatedAt,
    required this.dataVersion,
    required this.timeModelVersion,
    required this.routingModelVersion,
    @JsonKey(fromJson: _readWholeNumber) required this.baselineDurationSeconds,
    required this.snapping,
    required this.attribution,
  }) : _routes = routes;
  factory _RouteSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSearchResponseDtoFromJson(json);

  final List<RouteCandidateDto> _routes;
  @override
  List<RouteCandidateDto> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  final String evaluatedAt;
  @override
  final String dataVersion;
  @override
  final String timeModelVersion;
  @override
  final String routingModelVersion;
  @override
  @JsonKey(fromJson: _readWholeNumber)
  final int baselineDurationSeconds;
  @override
  final RouteSnappingDto snapping;
  @override
  final String attribution;

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSearchResponseDtoCopyWith<_RouteSearchResponseDto> get copyWith =>
      __$RouteSearchResponseDtoCopyWithImpl<_RouteSearchResponseDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$RouteSearchResponseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSearchResponseDto &&
            const DeepCollectionEquality().equals(other.routes, _routes) &&
            (identical(other.evaluatedAt, evaluatedAt) ||
                other.evaluatedAt == evaluatedAt) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.timeModelVersion, timeModelVersion) ||
                other.timeModelVersion == timeModelVersion) &&
            (identical(other.routingModelVersion, routingModelVersion) ||
                other.routingModelVersion == routingModelVersion) &&
            (identical(
                  other.baselineDurationSeconds,
                  baselineDurationSeconds,
                ) ||
                other.baselineDurationSeconds == baselineDurationSeconds) &&
            (identical(other.snapping, snapping) ||
                other.snapping == snapping) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routes),
      evaluatedAt,
      dataVersion,
      timeModelVersion,
      routingModelVersion,
      baselineDurationSeconds,
      snapping,
      attribution,
    );
  }

  @override
  String toString() {
    return 'RouteSearchResponseDto(routes: $routes, evaluatedAt: $evaluatedAt, dataVersion: $dataVersion, timeModelVersion: $timeModelVersion, routingModelVersion: $routingModelVersion, baselineDurationSeconds: $baselineDurationSeconds, snapping: $snapping, attribution: $attribution)';
  }
}

/// @nodoc
abstract mixin class _$RouteSearchResponseDtoCopyWith<$Res>
    implements $RouteSearchResponseDtoCopyWith<$Res> {
  factory _$RouteSearchResponseDtoCopyWith(
    _RouteSearchResponseDto value,
    $Res Function(_RouteSearchResponseDto) _then,
  ) = __$RouteSearchResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<RouteCandidateDto> routes,
    String evaluatedAt,
    String dataVersion,
    String timeModelVersion,
    String routingModelVersion,
    @JsonKey(fromJson: _readWholeNumber) int baselineDurationSeconds,
    RouteSnappingDto snapping,
    String attribution,
  });

  @override
  $RouteSnappingDtoCopyWith<$Res> get snapping;
}

/// @nodoc
class __$RouteSearchResponseDtoCopyWithImpl<$Res>
    implements _$RouteSearchResponseDtoCopyWith<$Res> {
  __$RouteSearchResponseDtoCopyWithImpl(this._self, this._then);

  final _RouteSearchResponseDto _self;
  final $Res Function(_RouteSearchResponseDto) _then;

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? timeModelVersion = null,
    Object? routingModelVersion = null,
    Object? baselineDurationSeconds = null,
    Object? snapping = null,
    Object? attribution = null,
  }) {
    return _then(
      _RouteSearchResponseDto(
        routes: null == routes
            ? _self._routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<RouteCandidateDto>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        dataVersion: null == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        timeModelVersion: null == timeModelVersion
            ? _self.timeModelVersion
            : timeModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        routingModelVersion: null == routingModelVersion
            ? _self.routingModelVersion
            : routingModelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        baselineDurationSeconds: null == baselineDurationSeconds
            ? _self.baselineDurationSeconds
            : baselineDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as RouteSnappingDto,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnappingDtoCopyWith<$Res> get snapping {
    return $RouteSnappingDtoCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// @nodoc
mixin _$RouteCandidateDto {
  String get id;
  String get mode;
  RouteGeometryDto get geometry;
  double get distanceMeters;
  @JsonKey(fromJson: _readWholeNumber)
  int get durationSeconds;
  @JsonKey(fromJson: _readWholeNumber)
  int get additionalDurationSeconds;
  RouteMetricsDto get metrics;
  RouteShadeEvaluationDto? get shadeEvaluation;

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteCandidateDtoCopyWith<RouteCandidateDto> get copyWith =>
      _$RouteCandidateDtoCopyWithImpl<RouteCandidateDto>(
        this as RouteCandidateDto,
        _$identity,
      );

  /// Serializes this RouteCandidateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteCandidateDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteCandidateDto &&
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
            (identical(other.metrics, _this.metrics) ||
                other.metrics == _this.metrics) &&
            (identical(other.shadeEvaluation, _this.shadeEvaluation) ||
                other.shadeEvaluation == _this.shadeEvaluation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteCandidateDto;
    return Object.hash(
      runtimeType,
      _this.id,
      _this.mode,
      _this.geometry,
      _this.distanceMeters,
      _this.durationSeconds,
      _this.additionalDurationSeconds,
      _this.metrics,
      _this.shadeEvaluation,
    );
  }

  @override
  String toString() {
    final _this = this as RouteCandidateDto;
    return 'RouteCandidateDto(id: ${_this.id}, mode: ${_this.mode}, geometry: ${_this.geometry}, distanceMeters: ${_this.distanceMeters}, durationSeconds: ${_this.durationSeconds}, additionalDurationSeconds: ${_this.additionalDurationSeconds}, metrics: ${_this.metrics}, shadeEvaluation: ${_this.shadeEvaluation})';
  }
}

/// @nodoc
abstract mixin class $RouteCandidateDtoCopyWith<$Res> {
  factory $RouteCandidateDtoCopyWith(
    RouteCandidateDto value,
    $Res Function(RouteCandidateDto) _then,
  ) = _$RouteCandidateDtoCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String mode,
    RouteGeometryDto geometry,
    double distanceMeters,
    @JsonKey(fromJson: _readWholeNumber) int durationSeconds,
    @JsonKey(fromJson: _readWholeNumber) int additionalDurationSeconds,
    RouteMetricsDto metrics,
    RouteShadeEvaluationDto? shadeEvaluation,
  });

  $RouteGeometryDtoCopyWith<$Res> get geometry;
  $RouteMetricsDtoCopyWith<$Res> get metrics;
  $RouteShadeEvaluationDtoCopyWith<$Res>? get shadeEvaluation;
}

/// @nodoc
class _$RouteCandidateDtoCopyWithImpl<$Res>
    implements $RouteCandidateDtoCopyWith<$Res> {
  _$RouteCandidateDtoCopyWithImpl(this._self, this._then);

  final RouteCandidateDto _self;
  final $Res Function(RouteCandidateDto) _then;

  /// Create a copy of RouteCandidateDto
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
    Object? metrics = null,
    Object? shadeEvaluation = freezed,
  }) {
    return _then(
      RouteCandidateDto(
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
                  as RouteGeometryDto,
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
        metrics: null == metrics
            ? _self.metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as RouteMetricsDto,
        shadeEvaluation: freezed == shadeEvaluation
            ? _self.shadeEvaluation
            : shadeEvaluation // ignore: cast_nullable_to_non_nullable
                  as RouteShadeEvaluationDto?,
      ),
    );
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteGeometryDtoCopyWith<$Res> get geometry {
    return $RouteGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteMetricsDtoCopyWith<$Res> get metrics {
    return $RouteMetricsDtoCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationDtoCopyWith<$Res>? get shadeEvaluation {
    if (_self.shadeEvaluation == null) {
      return null;
    }

    return $RouteShadeEvaluationDtoCopyWith<$Res>(_self.shadeEvaluation!, (
      value,
    ) {
      return _then(_self.copyWith(shadeEvaluation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteCandidateDto].
extension RouteCandidateDtoPatterns on RouteCandidateDto {
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
    TResult Function(_RouteCandidateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto() when $default != null:
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
    TResult Function(_RouteCandidateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto():
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
    TResult? Function(_RouteCandidateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto() when $default != null:
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
      RouteGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _readWholeNumber) int durationSeconds,
      @JsonKey(fromJson: _readWholeNumber) int additionalDurationSeconds,
      RouteMetricsDto metrics,
      RouteShadeEvaluationDto? shadeEvaluation,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.metrics,
          _that.shadeEvaluation,
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
      RouteGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _readWholeNumber) int durationSeconds,
      @JsonKey(fromJson: _readWholeNumber) int additionalDurationSeconds,
      RouteMetricsDto metrics,
      RouteShadeEvaluationDto? shadeEvaluation,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto():
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.metrics,
          _that.shadeEvaluation,
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
      RouteGeometryDto geometry,
      double distanceMeters,
      @JsonKey(fromJson: _readWholeNumber) int durationSeconds,
      @JsonKey(fromJson: _readWholeNumber) int additionalDurationSeconds,
      RouteMetricsDto metrics,
      RouteShadeEvaluationDto? shadeEvaluation,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidateDto() when $default != null:
        return $default(
          _that.id,
          _that.mode,
          _that.geometry,
          _that.distanceMeters,
          _that.durationSeconds,
          _that.additionalDurationSeconds,
          _that.metrics,
          _that.shadeEvaluation,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteCandidateDto implements RouteCandidateDto {
  const _RouteCandidateDto({
    required this.id,
    required this.mode,
    required this.geometry,
    required this.distanceMeters,
    @JsonKey(fromJson: _readWholeNumber) required this.durationSeconds,
    @JsonKey(fromJson: _readWholeNumber)
    required this.additionalDurationSeconds,
    required this.metrics,
    this.shadeEvaluation,
  });
  factory _RouteCandidateDto.fromJson(Map<String, dynamic> json) =>
      _$RouteCandidateDtoFromJson(json);

  @override
  final String id;
  @override
  final String mode;
  @override
  final RouteGeometryDto geometry;
  @override
  final double distanceMeters;
  @override
  @JsonKey(fromJson: _readWholeNumber)
  final int durationSeconds;
  @override
  @JsonKey(fromJson: _readWholeNumber)
  final int additionalDurationSeconds;
  @override
  final RouteMetricsDto metrics;
  @override
  final RouteShadeEvaluationDto? shadeEvaluation;

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteCandidateDtoCopyWith<_RouteCandidateDto> get copyWith =>
      __$RouteCandidateDtoCopyWithImpl<_RouteCandidateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteCandidateDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteCandidateDto &&
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
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            (identical(other.shadeEvaluation, shadeEvaluation) ||
                other.shadeEvaluation == shadeEvaluation));
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
      metrics,
      shadeEvaluation,
    );
  }

  @override
  String toString() {
    return 'RouteCandidateDto(id: $id, mode: $mode, geometry: $geometry, distanceMeters: $distanceMeters, durationSeconds: $durationSeconds, additionalDurationSeconds: $additionalDurationSeconds, metrics: $metrics, shadeEvaluation: $shadeEvaluation)';
  }
}

/// @nodoc
abstract mixin class _$RouteCandidateDtoCopyWith<$Res>
    implements $RouteCandidateDtoCopyWith<$Res> {
  factory _$RouteCandidateDtoCopyWith(
    _RouteCandidateDto value,
    $Res Function(_RouteCandidateDto) _then,
  ) = __$RouteCandidateDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String mode,
    RouteGeometryDto geometry,
    double distanceMeters,
    @JsonKey(fromJson: _readWholeNumber) int durationSeconds,
    @JsonKey(fromJson: _readWholeNumber) int additionalDurationSeconds,
    RouteMetricsDto metrics,
    RouteShadeEvaluationDto? shadeEvaluation,
  });

  @override
  $RouteGeometryDtoCopyWith<$Res> get geometry;
  @override
  $RouteMetricsDtoCopyWith<$Res> get metrics;
  @override
  $RouteShadeEvaluationDtoCopyWith<$Res>? get shadeEvaluation;
}

/// @nodoc
class __$RouteCandidateDtoCopyWithImpl<$Res>
    implements _$RouteCandidateDtoCopyWith<$Res> {
  __$RouteCandidateDtoCopyWithImpl(this._self, this._then);

  final _RouteCandidateDto _self;
  final $Res Function(_RouteCandidateDto) _then;

  /// Create a copy of RouteCandidateDto
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
    Object? metrics = null,
    Object? shadeEvaluation = freezed,
  }) {
    return _then(
      _RouteCandidateDto(
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
                  as RouteGeometryDto,
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
        metrics: null == metrics
            ? _self.metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as RouteMetricsDto,
        shadeEvaluation: freezed == shadeEvaluation
            ? _self.shadeEvaluation
            : shadeEvaluation // ignore: cast_nullable_to_non_nullable
                  as RouteShadeEvaluationDto?,
      ),
    );
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteGeometryDtoCopyWith<$Res> get geometry {
    return $RouteGeometryDtoCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteMetricsDtoCopyWith<$Res> get metrics {
    return $RouteMetricsDtoCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }

  /// Create a copy of RouteCandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationDtoCopyWith<$Res>? get shadeEvaluation {
    if (_self.shadeEvaluation == null) {
      return null;
    }

    return $RouteShadeEvaluationDtoCopyWith<$Res>(_self.shadeEvaluation!, (
      value,
    ) {
      return _then(_self.copyWith(shadeEvaluation: value));
    });
  }
}

/// @nodoc
mixin _$RouteShadeEvaluationDto {
  String get status;
  String get modelVersion;
  double? get coverage;
  String? get dataVersion;
  String? get attribution;
  double? get solarAltitudeDegrees;

  /// Create a copy of RouteShadeEvaluationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationDtoCopyWith<RouteShadeEvaluationDto> get copyWith =>
      _$RouteShadeEvaluationDtoCopyWithImpl<RouteShadeEvaluationDto>(
        this as RouteShadeEvaluationDto,
        _$identity,
      );

  /// Serializes this RouteShadeEvaluationDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteShadeEvaluationDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteShadeEvaluationDto &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.modelVersion, _this.modelVersion) ||
                other.modelVersion == _this.modelVersion) &&
            (identical(other.coverage, _this.coverage) ||
                other.coverage == _this.coverage) &&
            (identical(other.dataVersion, _this.dataVersion) ||
                other.dataVersion == _this.dataVersion) &&
            (identical(other.attribution, _this.attribution) ||
                other.attribution == _this.attribution) &&
            (identical(
                  other.solarAltitudeDegrees,
                  _this.solarAltitudeDegrees,
                ) ||
                other.solarAltitudeDegrees == _this.solarAltitudeDegrees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteShadeEvaluationDto;
    return Object.hash(
      runtimeType,
      _this.status,
      _this.modelVersion,
      _this.coverage,
      _this.dataVersion,
      _this.attribution,
      _this.solarAltitudeDegrees,
    );
  }

  @override
  String toString() {
    final _this = this as RouteShadeEvaluationDto;
    return 'RouteShadeEvaluationDto(status: ${_this.status}, modelVersion: ${_this.modelVersion}, coverage: ${_this.coverage}, dataVersion: ${_this.dataVersion}, attribution: ${_this.attribution}, solarAltitudeDegrees: ${_this.solarAltitudeDegrees})';
  }
}

/// @nodoc
abstract mixin class $RouteShadeEvaluationDtoCopyWith<$Res> {
  factory $RouteShadeEvaluationDtoCopyWith(
    RouteShadeEvaluationDto value,
    $Res Function(RouteShadeEvaluationDto) _then,
  ) = _$RouteShadeEvaluationDtoCopyWithImpl;
  @useResult
  $Res call({
    String status,
    String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  });
}

/// @nodoc
class _$RouteShadeEvaluationDtoCopyWithImpl<$Res>
    implements $RouteShadeEvaluationDtoCopyWith<$Res> {
  _$RouteShadeEvaluationDtoCopyWithImpl(this._self, this._then);

  final RouteShadeEvaluationDto _self;
  final $Res Function(RouteShadeEvaluationDto) _then;

  /// Create a copy of RouteShadeEvaluationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? modelVersion = null,
    Object? coverage = freezed,
    Object? dataVersion = freezed,
    Object? attribution = freezed,
    Object? solarAltitudeDegrees = freezed,
  }) {
    return _then(
      RouteShadeEvaluationDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        coverage: freezed == coverage
            ? _self.coverage
            : coverage // ignore: cast_nullable_to_non_nullable
                  as double?,
        dataVersion: freezed == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        attribution: freezed == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String?,
        solarAltitudeDegrees: freezed == solarAltitudeDegrees
            ? _self.solarAltitudeDegrees
            : solarAltitudeDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RouteShadeEvaluationDto].
extension RouteShadeEvaluationDtoPatterns on RouteShadeEvaluationDto {
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
    TResult Function(_RouteShadeEvaluationDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto() when $default != null:
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
    TResult Function(_RouteShadeEvaluationDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto():
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
    TResult? Function(_RouteShadeEvaluationDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto() when $default != null:
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
      String modelVersion,
      double? coverage,
      String? dataVersion,
      String? attribution,
      double? solarAltitudeDegrees,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto() when $default != null:
        return $default(
          _that.status,
          _that.modelVersion,
          _that.coverage,
          _that.dataVersion,
          _that.attribution,
          _that.solarAltitudeDegrees,
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
      String modelVersion,
      double? coverage,
      String? dataVersion,
      String? attribution,
      double? solarAltitudeDegrees,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto():
        return $default(
          _that.status,
          _that.modelVersion,
          _that.coverage,
          _that.dataVersion,
          _that.attribution,
          _that.solarAltitudeDegrees,
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
      String modelVersion,
      double? coverage,
      String? dataVersion,
      String? attribution,
      double? solarAltitudeDegrees,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluationDto() when $default != null:
        return $default(
          _that.status,
          _that.modelVersion,
          _that.coverage,
          _that.dataVersion,
          _that.attribution,
          _that.solarAltitudeDegrees,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RouteShadeEvaluationDto implements RouteShadeEvaluationDto {
  const _RouteShadeEvaluationDto({
    required this.status,
    required this.modelVersion,
    this.coverage,
    this.dataVersion,
    this.attribution,
    this.solarAltitudeDegrees,
  });
  factory _RouteShadeEvaluationDto.fromJson(Map<String, dynamic> json) =>
      _$RouteShadeEvaluationDtoFromJson(json);

  @override
  final String status;
  @override
  final String modelVersion;
  @override
  final double? coverage;
  @override
  final String? dataVersion;
  @override
  final String? attribution;
  @override
  final double? solarAltitudeDegrees;

  /// Create a copy of RouteShadeEvaluationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteShadeEvaluationDtoCopyWith<_RouteShadeEvaluationDto> get copyWith =>
      __$RouteShadeEvaluationDtoCopyWithImpl<_RouteShadeEvaluationDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$RouteShadeEvaluationDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteShadeEvaluationDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.coverage, coverage) ||
                other.coverage == coverage) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution) &&
            (identical(other.solarAltitudeDegrees, solarAltitudeDegrees) ||
                other.solarAltitudeDegrees == solarAltitudeDegrees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      status,
      modelVersion,
      coverage,
      dataVersion,
      attribution,
      solarAltitudeDegrees,
    );
  }

  @override
  String toString() {
    return 'RouteShadeEvaluationDto(status: $status, modelVersion: $modelVersion, coverage: $coverage, dataVersion: $dataVersion, attribution: $attribution, solarAltitudeDegrees: $solarAltitudeDegrees)';
  }
}

/// @nodoc
abstract mixin class _$RouteShadeEvaluationDtoCopyWith<$Res>
    implements $RouteShadeEvaluationDtoCopyWith<$Res> {
  factory _$RouteShadeEvaluationDtoCopyWith(
    _RouteShadeEvaluationDto value,
    $Res Function(_RouteShadeEvaluationDto) _then,
  ) = __$RouteShadeEvaluationDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String status,
    String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  });
}

/// @nodoc
class __$RouteShadeEvaluationDtoCopyWithImpl<$Res>
    implements _$RouteShadeEvaluationDtoCopyWith<$Res> {
  __$RouteShadeEvaluationDtoCopyWithImpl(this._self, this._then);

  final _RouteShadeEvaluationDto _self;
  final $Res Function(_RouteShadeEvaluationDto) _then;

  /// Create a copy of RouteShadeEvaluationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? modelVersion = null,
    Object? coverage = freezed,
    Object? dataVersion = freezed,
    Object? attribution = freezed,
    Object? solarAltitudeDegrees = freezed,
  }) {
    return _then(
      _RouteShadeEvaluationDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        coverage: freezed == coverage
            ? _self.coverage
            : coverage // ignore: cast_nullable_to_non_nullable
                  as double?,
        dataVersion: freezed == dataVersion
            ? _self.dataVersion
            : dataVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        attribution: freezed == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String?,
        solarAltitudeDegrees: freezed == solarAltitudeDegrees
            ? _self.solarAltitudeDegrees
            : solarAltitudeDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
mixin _$RouteGeometryDto {
  String get type;
  List<List<double>> get coordinates;

  /// Create a copy of RouteGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteGeometryDtoCopyWith<RouteGeometryDto> get copyWith =>
      _$RouteGeometryDtoCopyWithImpl<RouteGeometryDto>(
        this as RouteGeometryDto,
        _$identity,
      );

  /// Serializes this RouteGeometryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteGeometryDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteGeometryDto &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            const DeepCollectionEquality().equals(
              other.coordinates,
              _this.coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteGeometryDto;
    return Object.hash(
      runtimeType,
      _this.type,
      const DeepCollectionEquality().hash(_this.coordinates),
    );
  }

  @override
  String toString() {
    final _this = this as RouteGeometryDto;
    return 'RouteGeometryDto(type: ${_this.type}, coordinates: ${_this.coordinates})';
  }
}

/// @nodoc
abstract mixin class $RouteGeometryDtoCopyWith<$Res> {
  factory $RouteGeometryDtoCopyWith(
    RouteGeometryDto value,
    $Res Function(RouteGeometryDto) _then,
  ) = _$RouteGeometryDtoCopyWithImpl;
  @useResult
  $Res call({String type, List<List<double>> coordinates});
}

/// @nodoc
class _$RouteGeometryDtoCopyWithImpl<$Res>
    implements $RouteGeometryDtoCopyWith<$Res> {
  _$RouteGeometryDtoCopyWithImpl(this._self, this._then);

  final RouteGeometryDto _self;
  final $Res Function(RouteGeometryDto) _then;

  /// Create a copy of RouteGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      RouteGeometryDto(
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

/// Adds pattern-matching-related methods to [RouteGeometryDto].
extension RouteGeometryDtoPatterns on RouteGeometryDto {
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
    TResult Function(_RouteGeometryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGeometryDto() when $default != null:
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
    TResult Function(_RouteGeometryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGeometryDto():
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
    TResult? Function(_RouteGeometryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGeometryDto() when $default != null:
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
      case _RouteGeometryDto() when $default != null:
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
      case _RouteGeometryDto():
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
      case _RouteGeometryDto() when $default != null:
        return $default(_that.type, _that.coordinates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RouteGeometryDto implements RouteGeometryDto {
  const _RouteGeometryDto({
    required this.type,
    required List<List<double>> coordinates,
  }) : _coordinates = coordinates;
  factory _RouteGeometryDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGeometryDtoFromJson(json);

  @override
  final String type;
  final List<List<double>> _coordinates;
  @override
  List<List<double>> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of RouteGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteGeometryDtoCopyWith<_RouteGeometryDto> get copyWith =>
      __$RouteGeometryDtoCopyWithImpl<_RouteGeometryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteGeometryDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteGeometryDto &&
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
    return 'RouteGeometryDto(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$RouteGeometryDtoCopyWith<$Res>
    implements $RouteGeometryDtoCopyWith<$Res> {
  factory _$RouteGeometryDtoCopyWith(
    _RouteGeometryDto value,
    $Res Function(_RouteGeometryDto) _then,
  ) = __$RouteGeometryDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<List<double>> coordinates});
}

/// @nodoc
class __$RouteGeometryDtoCopyWithImpl<$Res>
    implements _$RouteGeometryDtoCopyWith<$Res> {
  __$RouteGeometryDtoCopyWithImpl(this._self, this._then);

  final _RouteGeometryDto _self;
  final $Res Function(_RouteGeometryDto) _then;

  /// Create a copy of RouteGeometryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? type = null, Object? coordinates = null}) {
    return _then(
      _RouteGeometryDto(
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
mixin _$RouteMetricsDto {
  double? get shadeRatio;
  double? get quietScore;
  double? get lightingScore;
  @JsonKey(fromJson: _readOptionalWholeNumber)
  int? get trafficSignalCount;

  /// Create a copy of RouteMetricsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteMetricsDtoCopyWith<RouteMetricsDto> get copyWith =>
      _$RouteMetricsDtoCopyWithImpl<RouteMetricsDto>(
        this as RouteMetricsDto,
        _$identity,
      );

  /// Serializes this RouteMetricsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteMetricsDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteMetricsDto &&
            (identical(other.shadeRatio, _this.shadeRatio) ||
                other.shadeRatio == _this.shadeRatio) &&
            (identical(other.quietScore, _this.quietScore) ||
                other.quietScore == _this.quietScore) &&
            (identical(other.lightingScore, _this.lightingScore) ||
                other.lightingScore == _this.lightingScore) &&
            (identical(other.trafficSignalCount, _this.trafficSignalCount) ||
                other.trafficSignalCount == _this.trafficSignalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteMetricsDto;
    return Object.hash(
      runtimeType,
      _this.shadeRatio,
      _this.quietScore,
      _this.lightingScore,
      _this.trafficSignalCount,
    );
  }

  @override
  String toString() {
    final _this = this as RouteMetricsDto;
    return 'RouteMetricsDto(shadeRatio: ${_this.shadeRatio}, quietScore: ${_this.quietScore}, lightingScore: ${_this.lightingScore}, trafficSignalCount: ${_this.trafficSignalCount})';
  }
}

/// @nodoc
abstract mixin class $RouteMetricsDtoCopyWith<$Res> {
  factory $RouteMetricsDtoCopyWith(
    RouteMetricsDto value,
    $Res Function(RouteMetricsDto) _then,
  ) = _$RouteMetricsDtoCopyWithImpl;
  @useResult
  $Res call({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
  });
}

/// @nodoc
class _$RouteMetricsDtoCopyWithImpl<$Res>
    implements $RouteMetricsDtoCopyWith<$Res> {
  _$RouteMetricsDtoCopyWithImpl(this._self, this._then);

  final RouteMetricsDto _self;
  final $Res Function(RouteMetricsDto) _then;

  /// Create a copy of RouteMetricsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shadeRatio = freezed,
    Object? quietScore = freezed,
    Object? lightingScore = freezed,
    Object? trafficSignalCount = freezed,
  }) {
    return _then(
      RouteMetricsDto(
        shadeRatio: freezed == shadeRatio
            ? _self.shadeRatio
            : shadeRatio // ignore: cast_nullable_to_non_nullable
                  as double?,
        quietScore: freezed == quietScore
            ? _self.quietScore
            : quietScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        lightingScore: freezed == lightingScore
            ? _self.lightingScore
            : lightingScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        trafficSignalCount: freezed == trafficSignalCount
            ? _self.trafficSignalCount
            : trafficSignalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RouteMetricsDto].
extension RouteMetricsDtoPatterns on RouteMetricsDto {
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
    TResult Function(_RouteMetricsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto() when $default != null:
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
    TResult Function(_RouteMetricsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto():
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
    TResult? Function(_RouteMetricsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto() when $default != null:
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
      double? shadeRatio,
      double? quietScore,
      double? lightingScore,
      @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto() when $default != null:
        return $default(
          _that.shadeRatio,
          _that.quietScore,
          _that.lightingScore,
          _that.trafficSignalCount,
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
      double? shadeRatio,
      double? quietScore,
      double? lightingScore,
      @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto():
        return $default(
          _that.shadeRatio,
          _that.quietScore,
          _that.lightingScore,
          _that.trafficSignalCount,
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
      double? shadeRatio,
      double? quietScore,
      double? lightingScore,
      @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetricsDto() when $default != null:
        return $default(
          _that.shadeRatio,
          _that.quietScore,
          _that.lightingScore,
          _that.trafficSignalCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RouteMetricsDto implements RouteMetricsDto {
  const _RouteMetricsDto({
    this.shadeRatio,
    this.quietScore,
    this.lightingScore,
    @JsonKey(fromJson: _readOptionalWholeNumber) this.trafficSignalCount,
  });
  factory _RouteMetricsDto.fromJson(Map<String, dynamic> json) =>
      _$RouteMetricsDtoFromJson(json);

  @override
  final double? shadeRatio;
  @override
  final double? quietScore;
  @override
  final double? lightingScore;
  @override
  @JsonKey(fromJson: _readOptionalWholeNumber)
  final int? trafficSignalCount;

  /// Create a copy of RouteMetricsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteMetricsDtoCopyWith<_RouteMetricsDto> get copyWith =>
      __$RouteMetricsDtoCopyWithImpl<_RouteMetricsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteMetricsDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteMetricsDto &&
            (identical(other.shadeRatio, shadeRatio) ||
                other.shadeRatio == shadeRatio) &&
            (identical(other.quietScore, quietScore) ||
                other.quietScore == quietScore) &&
            (identical(other.lightingScore, lightingScore) ||
                other.lightingScore == lightingScore) &&
            (identical(other.trafficSignalCount, trafficSignalCount) ||
                other.trafficSignalCount == trafficSignalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      shadeRatio,
      quietScore,
      lightingScore,
      trafficSignalCount,
    );
  }

  @override
  String toString() {
    return 'RouteMetricsDto(shadeRatio: $shadeRatio, quietScore: $quietScore, lightingScore: $lightingScore, trafficSignalCount: $trafficSignalCount)';
  }
}

/// @nodoc
abstract mixin class _$RouteMetricsDtoCopyWith<$Res>
    implements $RouteMetricsDtoCopyWith<$Res> {
  factory _$RouteMetricsDtoCopyWith(
    _RouteMetricsDto value,
    $Res Function(_RouteMetricsDto) _then,
  ) = __$RouteMetricsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    @JsonKey(fromJson: _readOptionalWholeNumber) int? trafficSignalCount,
  });
}

/// @nodoc
class __$RouteMetricsDtoCopyWithImpl<$Res>
    implements _$RouteMetricsDtoCopyWith<$Res> {
  __$RouteMetricsDtoCopyWithImpl(this._self, this._then);

  final _RouteMetricsDto _self;
  final $Res Function(_RouteMetricsDto) _then;

  /// Create a copy of RouteMetricsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shadeRatio = freezed,
    Object? quietScore = freezed,
    Object? lightingScore = freezed,
    Object? trafficSignalCount = freezed,
  }) {
    return _then(
      _RouteMetricsDto(
        shadeRatio: freezed == shadeRatio
            ? _self.shadeRatio
            : shadeRatio // ignore: cast_nullable_to_non_nullable
                  as double?,
        quietScore: freezed == quietScore
            ? _self.quietScore
            : quietScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        lightingScore: freezed == lightingScore
            ? _self.lightingScore
            : lightingScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        trafficSignalCount: freezed == trafficSignalCount
            ? _self.trafficSignalCount
            : trafficSignalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$RouteSnappingDto {
  RouteSnapDto get origin;
  RouteSnapDto get destination;

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSnappingDtoCopyWith<RouteSnappingDto> get copyWith =>
      _$RouteSnappingDtoCopyWithImpl<RouteSnappingDto>(
        this as RouteSnappingDto,
        _$identity,
      );

  /// Serializes this RouteSnappingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSnappingDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSnappingDto &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteSnappingDto;
    return Object.hash(runtimeType, _this.origin, _this.destination);
  }

  @override
  String toString() {
    final _this = this as RouteSnappingDto;
    return 'RouteSnappingDto(origin: ${_this.origin}, destination: ${_this.destination})';
  }
}

/// @nodoc
abstract mixin class $RouteSnappingDtoCopyWith<$Res> {
  factory $RouteSnappingDtoCopyWith(
    RouteSnappingDto value,
    $Res Function(RouteSnappingDto) _then,
  ) = _$RouteSnappingDtoCopyWithImpl;
  @useResult
  $Res call({RouteSnapDto origin, RouteSnapDto destination});

  $RouteSnapDtoCopyWith<$Res> get origin;
  $RouteSnapDtoCopyWith<$Res> get destination;
}

/// @nodoc
class _$RouteSnappingDtoCopyWithImpl<$Res>
    implements $RouteSnappingDtoCopyWith<$Res> {
  _$RouteSnappingDtoCopyWithImpl(this._self, this._then);

  final RouteSnappingDto _self;
  final $Res Function(RouteSnappingDto) _then;

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      RouteSnappingDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteSnapDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteSnapDto,
      ),
    );
  }

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapDtoCopyWith<$Res> get origin {
    return $RouteSnapDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapDtoCopyWith<$Res> get destination {
    return $RouteSnapDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSnappingDto].
extension RouteSnappingDtoPatterns on RouteSnappingDto {
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
    TResult Function(_RouteSnappingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto() when $default != null:
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
    TResult Function(_RouteSnappingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto():
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
    TResult? Function(_RouteSnappingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto() when $default != null:
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
    TResult Function(RouteSnapDto origin, RouteSnapDto destination)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto() when $default != null:
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
    TResult Function(RouteSnapDto origin, RouteSnapDto destination) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto():
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
    TResult? Function(RouteSnapDto origin, RouteSnapDto destination)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnappingDto() when $default != null:
        return $default(_that.origin, _that.destination);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteSnappingDto implements RouteSnappingDto {
  const _RouteSnappingDto({required this.origin, required this.destination});
  factory _RouteSnappingDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSnappingDtoFromJson(json);

  @override
  final RouteSnapDto origin;
  @override
  final RouteSnapDto destination;

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSnappingDtoCopyWith<_RouteSnappingDto> get copyWith =>
      __$RouteSnappingDtoCopyWithImpl<_RouteSnappingDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteSnappingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSnappingDto &&
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
    return 'RouteSnappingDto(origin: $origin, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class _$RouteSnappingDtoCopyWith<$Res>
    implements $RouteSnappingDtoCopyWith<$Res> {
  factory _$RouteSnappingDtoCopyWith(
    _RouteSnappingDto value,
    $Res Function(_RouteSnappingDto) _then,
  ) = __$RouteSnappingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({RouteSnapDto origin, RouteSnapDto destination});

  @override
  $RouteSnapDtoCopyWith<$Res> get origin;
  @override
  $RouteSnapDtoCopyWith<$Res> get destination;
}

/// @nodoc
class __$RouteSnappingDtoCopyWithImpl<$Res>
    implements _$RouteSnappingDtoCopyWith<$Res> {
  __$RouteSnappingDtoCopyWithImpl(this._self, this._then);

  final _RouteSnappingDto _self;
  final $Res Function(_RouteSnappingDto) _then;

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      _RouteSnappingDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteSnapDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteSnapDto,
      ),
    );
  }

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapDtoCopyWith<$Res> get origin {
    return $RouteSnapDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSnappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapDtoCopyWith<$Res> get destination {
    return $RouteSnapDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$RouteSnapDto {
  RouteCoordinateDto get coordinate;
  double get distanceMeters;

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSnapDtoCopyWith<RouteSnapDto> get copyWith =>
      _$RouteSnapDtoCopyWithImpl<RouteSnapDto>(
        this as RouteSnapDto,
        _$identity,
      );

  /// Serializes this RouteSnapDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSnapDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSnapDto &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteSnapDto;
    return Object.hash(runtimeType, _this.coordinate, _this.distanceMeters);
  }

  @override
  String toString() {
    final _this = this as RouteSnapDto;
    return 'RouteSnapDto(coordinate: ${_this.coordinate}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $RouteSnapDtoCopyWith<$Res> {
  factory $RouteSnapDtoCopyWith(
    RouteSnapDto value,
    $Res Function(RouteSnapDto) _then,
  ) = _$RouteSnapDtoCopyWithImpl;
  @useResult
  $Res call({RouteCoordinateDto coordinate, double distanceMeters});

  $RouteCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$RouteSnapDtoCopyWithImpl<$Res> implements $RouteSnapDtoCopyWith<$Res> {
  _$RouteSnapDtoCopyWithImpl(this._self, this._then);

  final RouteSnapDto _self;
  final $Res Function(RouteSnapDto) _then;

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      RouteSnapDto(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get coordinate {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSnapDto].
extension RouteSnapDtoPatterns on RouteSnapDto {
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
    TResult Function(_RouteSnapDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto() when $default != null:
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
    TResult Function(_RouteSnapDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto():
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
    TResult? Function(_RouteSnapDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto() when $default != null:
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
    TResult Function(RouteCoordinateDto coordinate, double distanceMeters)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto() when $default != null:
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
    TResult Function(RouteCoordinateDto coordinate, double distanceMeters)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto():
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
    TResult? Function(RouteCoordinateDto coordinate, double distanceMeters)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapDto() when $default != null:
        return $default(_that.coordinate, _that.distanceMeters);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteSnapDto implements RouteSnapDto {
  const _RouteSnapDto({required this.coordinate, required this.distanceMeters});
  factory _RouteSnapDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSnapDtoFromJson(json);

  @override
  final RouteCoordinateDto coordinate;
  @override
  final double distanceMeters;

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSnapDtoCopyWith<_RouteSnapDto> get copyWith =>
      __$RouteSnapDtoCopyWithImpl<_RouteSnapDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteSnapDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSnapDto &&
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
    return 'RouteSnapDto(coordinate: $coordinate, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$RouteSnapDtoCopyWith<$Res>
    implements $RouteSnapDtoCopyWith<$Res> {
  factory _$RouteSnapDtoCopyWith(
    _RouteSnapDto value,
    $Res Function(_RouteSnapDto) _then,
  ) = __$RouteSnapDtoCopyWithImpl;
  @override
  @useResult
  $Res call({RouteCoordinateDto coordinate, double distanceMeters});

  @override
  $RouteCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$RouteSnapDtoCopyWithImpl<$Res>
    implements _$RouteSnapDtoCopyWith<$Res> {
  __$RouteSnapDtoCopyWithImpl(this._self, this._then);

  final _RouteSnapDto _self;
  final $Res Function(_RouteSnapDto) _then;

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      _RouteSnapDto(
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        distanceMeters: null == distanceMeters
            ? _self.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }

  /// Create a copy of RouteSnapDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get coordinate {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
