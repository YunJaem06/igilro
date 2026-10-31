// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_guidance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteGuidanceDto {
  String get status;
  String get metadataStatus;
  String get modelVersion;
  String get language;
  List<RouteGuidanceStepDto> get steps;

  /// Create a copy of RouteGuidanceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteGuidanceDtoCopyWith<RouteGuidanceDto> get copyWith =>
      _$RouteGuidanceDtoCopyWithImpl<RouteGuidanceDto>(
        this as RouteGuidanceDto,
        _$identity,
      );

  /// Serializes this RouteGuidanceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteGuidanceDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteGuidanceDto &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.metadataStatus, _this.metadataStatus) ||
                other.metadataStatus == _this.metadataStatus) &&
            (identical(other.modelVersion, _this.modelVersion) ||
                other.modelVersion == _this.modelVersion) &&
            (identical(other.language, _this.language) ||
                other.language == _this.language) &&
            const DeepCollectionEquality().equals(other.steps, _this.steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteGuidanceDto;
    return Object.hash(
      runtimeType,
      _this.status,
      _this.metadataStatus,
      _this.modelVersion,
      _this.language,
      const DeepCollectionEquality().hash(_this.steps),
    );
  }

  @override
  String toString() {
    final _this = this as RouteGuidanceDto;
    return 'RouteGuidanceDto(status: ${_this.status}, metadataStatus: ${_this.metadataStatus}, modelVersion: ${_this.modelVersion}, language: ${_this.language}, steps: ${_this.steps})';
  }
}

/// @nodoc
abstract mixin class $RouteGuidanceDtoCopyWith<$Res> {
  factory $RouteGuidanceDtoCopyWith(
    RouteGuidanceDto value,
    $Res Function(RouteGuidanceDto) _then,
  ) = _$RouteGuidanceDtoCopyWithImpl;
  @useResult
  $Res call({
    String status,
    String metadataStatus,
    String modelVersion,
    String language,
    List<RouteGuidanceStepDto> steps,
  });
}

/// @nodoc
class _$RouteGuidanceDtoCopyWithImpl<$Res>
    implements $RouteGuidanceDtoCopyWith<$Res> {
  _$RouteGuidanceDtoCopyWithImpl(this._self, this._then);

  final RouteGuidanceDto _self;
  final $Res Function(RouteGuidanceDto) _then;

  /// Create a copy of RouteGuidanceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? metadataStatus = null,
    Object? modelVersion = null,
    Object? language = null,
    Object? steps = null,
  }) {
    return _then(
      RouteGuidanceDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        metadataStatus: null == metadataStatus
            ? _self.metadataStatus
            : metadataStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _self.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        steps: null == steps
            ? _self.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<RouteGuidanceStepDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RouteGuidanceDto].
extension RouteGuidanceDtoPatterns on RouteGuidanceDto {
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
    TResult Function(_RouteGuidanceDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto() when $default != null:
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
    TResult Function(_RouteGuidanceDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto():
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
    TResult? Function(_RouteGuidanceDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto() when $default != null:
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
      String metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStepDto> steps,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto() when $default != null:
        return $default(
          _that.status,
          _that.metadataStatus,
          _that.modelVersion,
          _that.language,
          _that.steps,
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
      String metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStepDto> steps,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto():
        return $default(
          _that.status,
          _that.metadataStatus,
          _that.modelVersion,
          _that.language,
          _that.steps,
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
      String metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStepDto> steps,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceDto() when $default != null:
        return $default(
          _that.status,
          _that.metadataStatus,
          _that.modelVersion,
          _that.language,
          _that.steps,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteGuidanceDto implements RouteGuidanceDto {
  const _RouteGuidanceDto({
    required this.status,
    required this.metadataStatus,
    required this.modelVersion,
    required this.language,
    required List<RouteGuidanceStepDto> steps,
  }) : _steps = steps;
  factory _RouteGuidanceDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGuidanceDtoFromJson(json);

  @override
  final String status;
  @override
  final String metadataStatus;
  @override
  final String modelVersion;
  @override
  final String language;
  final List<RouteGuidanceStepDto> _steps;
  @override
  List<RouteGuidanceStepDto> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  /// Create a copy of RouteGuidanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteGuidanceDtoCopyWith<_RouteGuidanceDto> get copyWith =>
      __$RouteGuidanceDtoCopyWithImpl<_RouteGuidanceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteGuidanceDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteGuidanceDto &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.metadataStatus, metadataStatus) ||
                other.metadataStatus == metadataStatus) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other.steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      status,
      metadataStatus,
      modelVersion,
      language,
      const DeepCollectionEquality().hash(_steps),
    );
  }

  @override
  String toString() {
    return 'RouteGuidanceDto(status: $status, metadataStatus: $metadataStatus, modelVersion: $modelVersion, language: $language, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class _$RouteGuidanceDtoCopyWith<$Res>
    implements $RouteGuidanceDtoCopyWith<$Res> {
  factory _$RouteGuidanceDtoCopyWith(
    _RouteGuidanceDto value,
    $Res Function(_RouteGuidanceDto) _then,
  ) = __$RouteGuidanceDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String status,
    String metadataStatus,
    String modelVersion,
    String language,
    List<RouteGuidanceStepDto> steps,
  });
}

/// @nodoc
class __$RouteGuidanceDtoCopyWithImpl<$Res>
    implements _$RouteGuidanceDtoCopyWith<$Res> {
  __$RouteGuidanceDtoCopyWithImpl(this._self, this._then);

  final _RouteGuidanceDto _self;
  final $Res Function(_RouteGuidanceDto) _then;

  /// Create a copy of RouteGuidanceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? metadataStatus = null,
    Object? modelVersion = null,
    Object? language = null,
    Object? steps = null,
  }) {
    return _then(
      _RouteGuidanceDto(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        metadataStatus: null == metadataStatus
            ? _self.metadataStatus
            : metadataStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        modelVersion: null == modelVersion
            ? _self.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _self.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        steps: null == steps
            ? _self._steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<RouteGuidanceStepDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$RouteGuidanceStepDto {
  @JsonKey(fromJson: _wholeNumber)
  int get index;
  String get type;
  RouteCoordinateDto get coordinate;
  @JsonKey(fromJson: _wholeNumber)
  int get geometryIndex;
  double get distanceFromStartMeters;
  double get distanceToNextStepMeters;
  double get durationToNextStepSeconds;
  String get instruction;
  String? get streetName;
  double? get bearingBeforeDegrees;
  double? get bearingAfterDegrees;
  GuidanceCrossingDto? get crossing;

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteGuidanceStepDtoCopyWith<RouteGuidanceStepDto> get copyWith =>
      _$RouteGuidanceStepDtoCopyWithImpl<RouteGuidanceStepDto>(
        this as RouteGuidanceStepDto,
        _$identity,
      );

  /// Serializes this RouteGuidanceStepDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteGuidanceStepDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteGuidanceStepDto &&
            (identical(other.index, _this.index) ||
                other.index == _this.index) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.geometryIndex, _this.geometryIndex) ||
                other.geometryIndex == _this.geometryIndex) &&
            (identical(
                  other.distanceFromStartMeters,
                  _this.distanceFromStartMeters,
                ) ||
                other.distanceFromStartMeters ==
                    _this.distanceFromStartMeters) &&
            (identical(
                  other.distanceToNextStepMeters,
                  _this.distanceToNextStepMeters,
                ) ||
                other.distanceToNextStepMeters ==
                    _this.distanceToNextStepMeters) &&
            (identical(
                  other.durationToNextStepSeconds,
                  _this.durationToNextStepSeconds,
                ) ||
                other.durationToNextStepSeconds ==
                    _this.durationToNextStepSeconds) &&
            (identical(other.instruction, _this.instruction) ||
                other.instruction == _this.instruction) &&
            (identical(other.streetName, _this.streetName) ||
                other.streetName == _this.streetName) &&
            (identical(
                  other.bearingBeforeDegrees,
                  _this.bearingBeforeDegrees,
                ) ||
                other.bearingBeforeDegrees == _this.bearingBeforeDegrees) &&
            (identical(other.bearingAfterDegrees, _this.bearingAfterDegrees) ||
                other.bearingAfterDegrees == _this.bearingAfterDegrees) &&
            (identical(other.crossing, _this.crossing) ||
                other.crossing == _this.crossing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteGuidanceStepDto;
    return Object.hash(
      runtimeType,
      _this.index,
      _this.type,
      _this.coordinate,
      _this.geometryIndex,
      _this.distanceFromStartMeters,
      _this.distanceToNextStepMeters,
      _this.durationToNextStepSeconds,
      _this.instruction,
      _this.streetName,
      _this.bearingBeforeDegrees,
      _this.bearingAfterDegrees,
      _this.crossing,
    );
  }

  @override
  String toString() {
    final _this = this as RouteGuidanceStepDto;
    return 'RouteGuidanceStepDto(index: ${_this.index}, type: ${_this.type}, coordinate: ${_this.coordinate}, geometryIndex: ${_this.geometryIndex}, distanceFromStartMeters: ${_this.distanceFromStartMeters}, distanceToNextStepMeters: ${_this.distanceToNextStepMeters}, durationToNextStepSeconds: ${_this.durationToNextStepSeconds}, instruction: ${_this.instruction}, streetName: ${_this.streetName}, bearingBeforeDegrees: ${_this.bearingBeforeDegrees}, bearingAfterDegrees: ${_this.bearingAfterDegrees}, crossing: ${_this.crossing})';
  }
}

/// @nodoc
abstract mixin class $RouteGuidanceStepDtoCopyWith<$Res> {
  factory $RouteGuidanceStepDtoCopyWith(
    RouteGuidanceStepDto value,
    $Res Function(RouteGuidanceStepDto) _then,
  ) = _$RouteGuidanceStepDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(fromJson: _wholeNumber) int index,
    String type,
    RouteCoordinateDto coordinate,
    @JsonKey(fromJson: _wholeNumber) int geometryIndex,
    double distanceFromStartMeters,
    double distanceToNextStepMeters,
    double durationToNextStepSeconds,
    String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    GuidanceCrossingDto? crossing,
  });

  $RouteCoordinateDtoCopyWith<$Res> get coordinate;
  $GuidanceCrossingDtoCopyWith<$Res>? get crossing;
}

/// @nodoc
class _$RouteGuidanceStepDtoCopyWithImpl<$Res>
    implements $RouteGuidanceStepDtoCopyWith<$Res> {
  _$RouteGuidanceStepDtoCopyWithImpl(this._self, this._then);

  final RouteGuidanceStepDto _self;
  final $Res Function(RouteGuidanceStepDto) _then;

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? type = null,
    Object? coordinate = null,
    Object? geometryIndex = null,
    Object? distanceFromStartMeters = null,
    Object? distanceToNextStepMeters = null,
    Object? durationToNextStepSeconds = null,
    Object? instruction = null,
    Object? streetName = freezed,
    Object? bearingBeforeDegrees = freezed,
    Object? bearingAfterDegrees = freezed,
    Object? crossing = freezed,
  }) {
    return _then(
      RouteGuidanceStepDto(
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        geometryIndex: null == geometryIndex
            ? _self.geometryIndex
            : geometryIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        distanceFromStartMeters: null == distanceFromStartMeters
            ? _self.distanceFromStartMeters
            : distanceFromStartMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceToNextStepMeters: null == distanceToNextStepMeters
            ? _self.distanceToNextStepMeters
            : distanceToNextStepMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        durationToNextStepSeconds: null == durationToNextStepSeconds
            ? _self.durationToNextStepSeconds
            : durationToNextStepSeconds // ignore: cast_nullable_to_non_nullable
                  as double,
        instruction: null == instruction
            ? _self.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String,
        streetName: freezed == streetName
            ? _self.streetName
            : streetName // ignore: cast_nullable_to_non_nullable
                  as String?,
        bearingBeforeDegrees: freezed == bearingBeforeDegrees
            ? _self.bearingBeforeDegrees
            : bearingBeforeDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
        bearingAfterDegrees: freezed == bearingAfterDegrees
            ? _self.bearingAfterDegrees
            : bearingAfterDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
        crossing: freezed == crossing
            ? _self.crossing
            : crossing // ignore: cast_nullable_to_non_nullable
                  as GuidanceCrossingDto?,
      ),
    );
  }

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get coordinate {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuidanceCrossingDtoCopyWith<$Res>? get crossing {
    if (_self.crossing == null) {
      return null;
    }

    return $GuidanceCrossingDtoCopyWith<$Res>(_self.crossing!, (value) {
      return _then(_self.copyWith(crossing: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteGuidanceStepDto].
extension RouteGuidanceStepDtoPatterns on RouteGuidanceStepDto {
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
    TResult Function(_RouteGuidanceStepDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto() when $default != null:
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
    TResult Function(_RouteGuidanceStepDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto():
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
    TResult? Function(_RouteGuidanceStepDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto() when $default != null:
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
      @JsonKey(fromJson: _wholeNumber) int index,
      String type,
      RouteCoordinateDto coordinate,
      @JsonKey(fromJson: _wholeNumber) int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      double durationToNextStepSeconds,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      GuidanceCrossingDto? crossing,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto() when $default != null:
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStepSeconds,
          _that.instruction,
          _that.streetName,
          _that.bearingBeforeDegrees,
          _that.bearingAfterDegrees,
          _that.crossing,
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
      @JsonKey(fromJson: _wholeNumber) int index,
      String type,
      RouteCoordinateDto coordinate,
      @JsonKey(fromJson: _wholeNumber) int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      double durationToNextStepSeconds,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      GuidanceCrossingDto? crossing,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto():
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStepSeconds,
          _that.instruction,
          _that.streetName,
          _that.bearingBeforeDegrees,
          _that.bearingAfterDegrees,
          _that.crossing,
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
      @JsonKey(fromJson: _wholeNumber) int index,
      String type,
      RouteCoordinateDto coordinate,
      @JsonKey(fromJson: _wholeNumber) int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      double durationToNextStepSeconds,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      GuidanceCrossingDto? crossing,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStepDto() when $default != null:
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStepSeconds,
          _that.instruction,
          _that.streetName,
          _that.bearingBeforeDegrees,
          _that.bearingAfterDegrees,
          _that.crossing,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteGuidanceStepDto implements RouteGuidanceStepDto {
  const _RouteGuidanceStepDto({
    @JsonKey(fromJson: _wholeNumber) required this.index,
    required this.type,
    required this.coordinate,
    @JsonKey(fromJson: _wholeNumber) required this.geometryIndex,
    required this.distanceFromStartMeters,
    required this.distanceToNextStepMeters,
    required this.durationToNextStepSeconds,
    required this.instruction,
    this.streetName,
    this.bearingBeforeDegrees,
    this.bearingAfterDegrees,
    this.crossing,
  });
  factory _RouteGuidanceStepDto.fromJson(Map<String, dynamic> json) =>
      _$RouteGuidanceStepDtoFromJson(json);

  @override
  @JsonKey(fromJson: _wholeNumber)
  final int index;
  @override
  final String type;
  @override
  final RouteCoordinateDto coordinate;
  @override
  @JsonKey(fromJson: _wholeNumber)
  final int geometryIndex;
  @override
  final double distanceFromStartMeters;
  @override
  final double distanceToNextStepMeters;
  @override
  final double durationToNextStepSeconds;
  @override
  final String instruction;
  @override
  final String? streetName;
  @override
  final double? bearingBeforeDegrees;
  @override
  final double? bearingAfterDegrees;
  @override
  final GuidanceCrossingDto? crossing;

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteGuidanceStepDtoCopyWith<_RouteGuidanceStepDto> get copyWith =>
      __$RouteGuidanceStepDtoCopyWithImpl<_RouteGuidanceStepDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$RouteGuidanceStepDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteGuidanceStepDto &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.geometryIndex, geometryIndex) ||
                other.geometryIndex == geometryIndex) &&
            (identical(
                  other.distanceFromStartMeters,
                  distanceFromStartMeters,
                ) ||
                other.distanceFromStartMeters == distanceFromStartMeters) &&
            (identical(
                  other.distanceToNextStepMeters,
                  distanceToNextStepMeters,
                ) ||
                other.distanceToNextStepMeters == distanceToNextStepMeters) &&
            (identical(
                  other.durationToNextStepSeconds,
                  durationToNextStepSeconds,
                ) ||
                other.durationToNextStepSeconds == durationToNextStepSeconds) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.bearingBeforeDegrees, bearingBeforeDegrees) ||
                other.bearingBeforeDegrees == bearingBeforeDegrees) &&
            (identical(other.bearingAfterDegrees, bearingAfterDegrees) ||
                other.bearingAfterDegrees == bearingAfterDegrees) &&
            (identical(other.crossing, crossing) ||
                other.crossing == crossing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      index,
      type,
      coordinate,
      geometryIndex,
      distanceFromStartMeters,
      distanceToNextStepMeters,
      durationToNextStepSeconds,
      instruction,
      streetName,
      bearingBeforeDegrees,
      bearingAfterDegrees,
      crossing,
    );
  }

  @override
  String toString() {
    return 'RouteGuidanceStepDto(index: $index, type: $type, coordinate: $coordinate, geometryIndex: $geometryIndex, distanceFromStartMeters: $distanceFromStartMeters, distanceToNextStepMeters: $distanceToNextStepMeters, durationToNextStepSeconds: $durationToNextStepSeconds, instruction: $instruction, streetName: $streetName, bearingBeforeDegrees: $bearingBeforeDegrees, bearingAfterDegrees: $bearingAfterDegrees, crossing: $crossing)';
  }
}

/// @nodoc
abstract mixin class _$RouteGuidanceStepDtoCopyWith<$Res>
    implements $RouteGuidanceStepDtoCopyWith<$Res> {
  factory _$RouteGuidanceStepDtoCopyWith(
    _RouteGuidanceStepDto value,
    $Res Function(_RouteGuidanceStepDto) _then,
  ) = __$RouteGuidanceStepDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _wholeNumber) int index,
    String type,
    RouteCoordinateDto coordinate,
    @JsonKey(fromJson: _wholeNumber) int geometryIndex,
    double distanceFromStartMeters,
    double distanceToNextStepMeters,
    double durationToNextStepSeconds,
    String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    GuidanceCrossingDto? crossing,
  });

  @override
  $RouteCoordinateDtoCopyWith<$Res> get coordinate;
  @override
  $GuidanceCrossingDtoCopyWith<$Res>? get crossing;
}

/// @nodoc
class __$RouteGuidanceStepDtoCopyWithImpl<$Res>
    implements _$RouteGuidanceStepDtoCopyWith<$Res> {
  __$RouteGuidanceStepDtoCopyWithImpl(this._self, this._then);

  final _RouteGuidanceStepDto _self;
  final $Res Function(_RouteGuidanceStepDto) _then;

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? type = null,
    Object? coordinate = null,
    Object? geometryIndex = null,
    Object? distanceFromStartMeters = null,
    Object? distanceToNextStepMeters = null,
    Object? durationToNextStepSeconds = null,
    Object? instruction = null,
    Object? streetName = freezed,
    Object? bearingBeforeDegrees = freezed,
    Object? bearingAfterDegrees = freezed,
    Object? crossing = freezed,
  }) {
    return _then(
      _RouteGuidanceStepDto(
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        geometryIndex: null == geometryIndex
            ? _self.geometryIndex
            : geometryIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        distanceFromStartMeters: null == distanceFromStartMeters
            ? _self.distanceFromStartMeters
            : distanceFromStartMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceToNextStepMeters: null == distanceToNextStepMeters
            ? _self.distanceToNextStepMeters
            : distanceToNextStepMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        durationToNextStepSeconds: null == durationToNextStepSeconds
            ? _self.durationToNextStepSeconds
            : durationToNextStepSeconds // ignore: cast_nullable_to_non_nullable
                  as double,
        instruction: null == instruction
            ? _self.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String,
        streetName: freezed == streetName
            ? _self.streetName
            : streetName // ignore: cast_nullable_to_non_nullable
                  as String?,
        bearingBeforeDegrees: freezed == bearingBeforeDegrees
            ? _self.bearingBeforeDegrees
            : bearingBeforeDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
        bearingAfterDegrees: freezed == bearingAfterDegrees
            ? _self.bearingAfterDegrees
            : bearingAfterDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
        crossing: freezed == crossing
            ? _self.crossing
            : crossing // ignore: cast_nullable_to_non_nullable
                  as GuidanceCrossingDto?,
      ),
    );
  }

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get coordinate {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }

  /// Create a copy of RouteGuidanceStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuidanceCrossingDtoCopyWith<$Res>? get crossing {
    if (_self.crossing == null) {
      return null;
    }

    return $GuidanceCrossingDtoCopyWith<$Res>(_self.crossing!, (value) {
      return _then(_self.copyWith(crossing: value));
    });
  }
}

/// @nodoc
mixin _$GuidanceCrossingDto {
  bool? get trafficSignals;

  /// Create a copy of GuidanceCrossingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GuidanceCrossingDtoCopyWith<GuidanceCrossingDto> get copyWith =>
      _$GuidanceCrossingDtoCopyWithImpl<GuidanceCrossingDto>(
        this as GuidanceCrossingDto,
        _$identity,
      );

  /// Serializes this GuidanceCrossingDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as GuidanceCrossingDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GuidanceCrossingDto &&
            (identical(other.trafficSignals, _this.trafficSignals) ||
                other.trafficSignals == _this.trafficSignals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as GuidanceCrossingDto;
    return Object.hash(runtimeType, _this.trafficSignals);
  }

  @override
  String toString() {
    final _this = this as GuidanceCrossingDto;
    return 'GuidanceCrossingDto(trafficSignals: ${_this.trafficSignals})';
  }
}

/// @nodoc
abstract mixin class $GuidanceCrossingDtoCopyWith<$Res> {
  factory $GuidanceCrossingDtoCopyWith(
    GuidanceCrossingDto value,
    $Res Function(GuidanceCrossingDto) _then,
  ) = _$GuidanceCrossingDtoCopyWithImpl;
  @useResult
  $Res call({bool? trafficSignals});
}

/// @nodoc
class _$GuidanceCrossingDtoCopyWithImpl<$Res>
    implements $GuidanceCrossingDtoCopyWith<$Res> {
  _$GuidanceCrossingDtoCopyWithImpl(this._self, this._then);

  final GuidanceCrossingDto _self;
  final $Res Function(GuidanceCrossingDto) _then;

  /// Create a copy of GuidanceCrossingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? trafficSignals = freezed}) {
    return _then(
      GuidanceCrossingDto(
        trafficSignals: freezed == trafficSignals
            ? _self.trafficSignals
            : trafficSignals // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [GuidanceCrossingDto].
extension GuidanceCrossingDtoPatterns on GuidanceCrossingDto {
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
    TResult Function(_GuidanceCrossingDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto() when $default != null:
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
    TResult Function(_GuidanceCrossingDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto():
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
    TResult? Function(_GuidanceCrossingDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto() when $default != null:
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
    TResult Function(bool? trafficSignals)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto() when $default != null:
        return $default(_that.trafficSignals);
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
    TResult Function(bool? trafficSignals) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto():
        return $default(_that.trafficSignals);
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
    TResult? Function(bool? trafficSignals)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GuidanceCrossingDto() when $default != null:
        return $default(_that.trafficSignals);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GuidanceCrossingDto implements GuidanceCrossingDto {
  const _GuidanceCrossingDto({this.trafficSignals});
  factory _GuidanceCrossingDto.fromJson(Map<String, dynamic> json) =>
      _$GuidanceCrossingDtoFromJson(json);

  @override
  final bool? trafficSignals;

  /// Create a copy of GuidanceCrossingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GuidanceCrossingDtoCopyWith<_GuidanceCrossingDto> get copyWith =>
      __$GuidanceCrossingDtoCopyWithImpl<_GuidanceCrossingDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$GuidanceCrossingDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GuidanceCrossingDto &&
            (identical(other.trafficSignals, trafficSignals) ||
                other.trafficSignals == trafficSignals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, trafficSignals);
  }

  @override
  String toString() {
    return 'GuidanceCrossingDto(trafficSignals: $trafficSignals)';
  }
}

/// @nodoc
abstract mixin class _$GuidanceCrossingDtoCopyWith<$Res>
    implements $GuidanceCrossingDtoCopyWith<$Res> {
  factory _$GuidanceCrossingDtoCopyWith(
    _GuidanceCrossingDto value,
    $Res Function(_GuidanceCrossingDto) _then,
  ) = __$GuidanceCrossingDtoCopyWithImpl;
  @override
  @useResult
  $Res call({bool? trafficSignals});
}

/// @nodoc
class __$GuidanceCrossingDtoCopyWithImpl<$Res>
    implements _$GuidanceCrossingDtoCopyWith<$Res> {
  __$GuidanceCrossingDtoCopyWithImpl(this._self, this._then);

  final _GuidanceCrossingDto _self;
  final $Res Function(_GuidanceCrossingDto) _then;

  /// Create a copy of GuidanceCrossingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? trafficSignals = freezed}) {
    return _then(
      _GuidanceCrossingDto(
        trafficSignals: freezed == trafficSignals
            ? _self.trafficSignals
            : trafficSignals // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
