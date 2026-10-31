// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_guidance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteGuidance {
  RouteGuidanceStatus get status;
  GuidanceMetadataStatus get metadataStatus;
  String get modelVersion;
  String get language;
  List<RouteGuidanceStep> get steps;

  /// Create a copy of RouteGuidance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteGuidanceCopyWith<RouteGuidance> get copyWith =>
      _$RouteGuidanceCopyWithImpl<RouteGuidance>(
        this as RouteGuidance,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteGuidance;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteGuidance &&
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

  @override
  int get hashCode {
    final _this = this as RouteGuidance;
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
    final _this = this as RouteGuidance;
    return 'RouteGuidance(status: ${_this.status}, metadataStatus: ${_this.metadataStatus}, modelVersion: ${_this.modelVersion}, language: ${_this.language}, steps: ${_this.steps})';
  }
}

/// @nodoc
abstract mixin class $RouteGuidanceCopyWith<$Res> {
  factory $RouteGuidanceCopyWith(
    RouteGuidance value,
    $Res Function(RouteGuidance) _then,
  ) = _$RouteGuidanceCopyWithImpl;
  @useResult
  $Res call({
    RouteGuidanceStatus status,
    GuidanceMetadataStatus metadataStatus,
    String modelVersion,
    String language,
    List<RouteGuidanceStep> steps,
  });
}

/// @nodoc
class _$RouteGuidanceCopyWithImpl<$Res>
    implements $RouteGuidanceCopyWith<$Res> {
  _$RouteGuidanceCopyWithImpl(this._self, this._then);

  final RouteGuidance _self;
  final $Res Function(RouteGuidance) _then;

  /// Create a copy of RouteGuidance
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
      RouteGuidance(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RouteGuidanceStatus,
        metadataStatus: null == metadataStatus
            ? _self.metadataStatus
            : metadataStatus // ignore: cast_nullable_to_non_nullable
                  as GuidanceMetadataStatus,
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
                  as List<RouteGuidanceStep>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RouteGuidance].
extension RouteGuidancePatterns on RouteGuidance {
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
    TResult Function(_RouteGuidance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance() when $default != null:
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
    TResult Function(_RouteGuidance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance():
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
    TResult? Function(_RouteGuidance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance() when $default != null:
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
      RouteGuidanceStatus status,
      GuidanceMetadataStatus metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStep> steps,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance() when $default != null:
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
      RouteGuidanceStatus status,
      GuidanceMetadataStatus metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStep> steps,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance():
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
      RouteGuidanceStatus status,
      GuidanceMetadataStatus metadataStatus,
      String modelVersion,
      String language,
      List<RouteGuidanceStep> steps,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidance() when $default != null:
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

class _RouteGuidance implements RouteGuidance {
  const _RouteGuidance({
    required this.status,
    required this.metadataStatus,
    required this.modelVersion,
    required this.language,
    required List<RouteGuidanceStep> steps,
  }) : _steps = steps;

  @override
  final RouteGuidanceStatus status;
  @override
  final GuidanceMetadataStatus metadataStatus;
  @override
  final String modelVersion;
  @override
  final String language;
  final List<RouteGuidanceStep> _steps;
  @override
  List<RouteGuidanceStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  /// Create a copy of RouteGuidance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteGuidanceCopyWith<_RouteGuidance> get copyWith =>
      __$RouteGuidanceCopyWithImpl<_RouteGuidance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteGuidance &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.metadataStatus, metadataStatus) ||
                other.metadataStatus == metadataStatus) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other.steps, _steps));
  }

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
    return 'RouteGuidance(status: $status, metadataStatus: $metadataStatus, modelVersion: $modelVersion, language: $language, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class _$RouteGuidanceCopyWith<$Res>
    implements $RouteGuidanceCopyWith<$Res> {
  factory _$RouteGuidanceCopyWith(
    _RouteGuidance value,
    $Res Function(_RouteGuidance) _then,
  ) = __$RouteGuidanceCopyWithImpl;
  @override
  @useResult
  $Res call({
    RouteGuidanceStatus status,
    GuidanceMetadataStatus metadataStatus,
    String modelVersion,
    String language,
    List<RouteGuidanceStep> steps,
  });
}

/// @nodoc
class __$RouteGuidanceCopyWithImpl<$Res>
    implements _$RouteGuidanceCopyWith<$Res> {
  __$RouteGuidanceCopyWithImpl(this._self, this._then);

  final _RouteGuidance _self;
  final $Res Function(_RouteGuidance) _then;

  /// Create a copy of RouteGuidance
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
      _RouteGuidance(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RouteGuidanceStatus,
        metadataStatus: null == metadataStatus
            ? _self.metadataStatus
            : metadataStatus // ignore: cast_nullable_to_non_nullable
                  as GuidanceMetadataStatus,
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
                  as List<RouteGuidanceStep>,
      ),
    );
  }
}

/// @nodoc
mixin _$RouteGuidanceStep {
  int get index;
  ManeuverType get type;
  GeoCoordinate get coordinate;
  int get geometryIndex;
  double get distanceFromStartMeters;
  double get distanceToNextStepMeters;
  Duration get durationToNextStep;
  String get instruction;
  String? get streetName;
  double? get bearingBeforeDegrees;
  double? get bearingAfterDegrees;
  RouteCrossing? get crossing;

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteGuidanceStepCopyWith<RouteGuidanceStep> get copyWith =>
      _$RouteGuidanceStepCopyWithImpl<RouteGuidanceStep>(
        this as RouteGuidanceStep,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteGuidanceStep;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteGuidanceStep &&
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
            (identical(other.durationToNextStep, _this.durationToNextStep) ||
                other.durationToNextStep == _this.durationToNextStep) &&
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

  @override
  int get hashCode {
    final _this = this as RouteGuidanceStep;
    return Object.hash(
      runtimeType,
      _this.index,
      _this.type,
      _this.coordinate,
      _this.geometryIndex,
      _this.distanceFromStartMeters,
      _this.distanceToNextStepMeters,
      _this.durationToNextStep,
      _this.instruction,
      _this.streetName,
      _this.bearingBeforeDegrees,
      _this.bearingAfterDegrees,
      _this.crossing,
    );
  }

  @override
  String toString() {
    final _this = this as RouteGuidanceStep;
    return 'RouteGuidanceStep(index: ${_this.index}, type: ${_this.type}, coordinate: ${_this.coordinate}, geometryIndex: ${_this.geometryIndex}, distanceFromStartMeters: ${_this.distanceFromStartMeters}, distanceToNextStepMeters: ${_this.distanceToNextStepMeters}, durationToNextStep: ${_this.durationToNextStep}, instruction: ${_this.instruction}, streetName: ${_this.streetName}, bearingBeforeDegrees: ${_this.bearingBeforeDegrees}, bearingAfterDegrees: ${_this.bearingAfterDegrees}, crossing: ${_this.crossing})';
  }
}

/// @nodoc
abstract mixin class $RouteGuidanceStepCopyWith<$Res> {
  factory $RouteGuidanceStepCopyWith(
    RouteGuidanceStep value,
    $Res Function(RouteGuidanceStep) _then,
  ) = _$RouteGuidanceStepCopyWithImpl;
  @useResult
  $Res call({
    int index,
    ManeuverType type,
    GeoCoordinate coordinate,
    int geometryIndex,
    double distanceFromStartMeters,
    double distanceToNextStepMeters,
    Duration durationToNextStep,
    String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    RouteCrossing? crossing,
  });

  $GeoCoordinateCopyWith<$Res> get coordinate;
  $RouteCrossingCopyWith<$Res>? get crossing;
}

/// @nodoc
class _$RouteGuidanceStepCopyWithImpl<$Res>
    implements $RouteGuidanceStepCopyWith<$Res> {
  _$RouteGuidanceStepCopyWithImpl(this._self, this._then);

  final RouteGuidanceStep _self;
  final $Res Function(RouteGuidanceStep) _then;

  /// Create a copy of RouteGuidanceStep
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
    Object? durationToNextStep = null,
    Object? instruction = null,
    Object? streetName = freezed,
    Object? bearingBeforeDegrees = freezed,
    Object? bearingAfterDegrees = freezed,
    Object? crossing = freezed,
  }) {
    return _then(
      RouteGuidanceStep(
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ManeuverType,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
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
        durationToNextStep: null == durationToNextStep
            ? _self.durationToNextStep
            : durationToNextStep // ignore: cast_nullable_to_non_nullable
                  as Duration,
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
                  as RouteCrossing?,
      ),
    );
  }

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCrossingCopyWith<$Res>? get crossing {
    if (_self.crossing == null) {
      return null;
    }

    return $RouteCrossingCopyWith<$Res>(_self.crossing!, (value) {
      return _then(_self.copyWith(crossing: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteGuidanceStep].
extension RouteGuidanceStepPatterns on RouteGuidanceStep {
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
    TResult Function(_RouteGuidanceStep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep() when $default != null:
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
    TResult Function(_RouteGuidanceStep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep():
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
    TResult? Function(_RouteGuidanceStep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep() when $default != null:
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
      int index,
      ManeuverType type,
      GeoCoordinate coordinate,
      int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      Duration durationToNextStep,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      RouteCrossing? crossing,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep() when $default != null:
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStep,
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
      int index,
      ManeuverType type,
      GeoCoordinate coordinate,
      int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      Duration durationToNextStep,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      RouteCrossing? crossing,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep():
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStep,
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
      int index,
      ManeuverType type,
      GeoCoordinate coordinate,
      int geometryIndex,
      double distanceFromStartMeters,
      double distanceToNextStepMeters,
      Duration durationToNextStep,
      String instruction,
      String? streetName,
      double? bearingBeforeDegrees,
      double? bearingAfterDegrees,
      RouteCrossing? crossing,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteGuidanceStep() when $default != null:
        return $default(
          _that.index,
          _that.type,
          _that.coordinate,
          _that.geometryIndex,
          _that.distanceFromStartMeters,
          _that.distanceToNextStepMeters,
          _that.durationToNextStep,
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

class _RouteGuidanceStep implements RouteGuidanceStep {
  const _RouteGuidanceStep({
    required this.index,
    required this.type,
    required this.coordinate,
    required this.geometryIndex,
    required this.distanceFromStartMeters,
    required this.distanceToNextStepMeters,
    required this.durationToNextStep,
    required this.instruction,
    this.streetName,
    this.bearingBeforeDegrees,
    this.bearingAfterDegrees,
    this.crossing,
  });

  @override
  final int index;
  @override
  final ManeuverType type;
  @override
  final GeoCoordinate coordinate;
  @override
  final int geometryIndex;
  @override
  final double distanceFromStartMeters;
  @override
  final double distanceToNextStepMeters;
  @override
  final Duration durationToNextStep;
  @override
  final String instruction;
  @override
  final String? streetName;
  @override
  final double? bearingBeforeDegrees;
  @override
  final double? bearingAfterDegrees;
  @override
  final RouteCrossing? crossing;

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteGuidanceStepCopyWith<_RouteGuidanceStep> get copyWith =>
      __$RouteGuidanceStepCopyWithImpl<_RouteGuidanceStep>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteGuidanceStep &&
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
            (identical(other.durationToNextStep, durationToNextStep) ||
                other.durationToNextStep == durationToNextStep) &&
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
      durationToNextStep,
      instruction,
      streetName,
      bearingBeforeDegrees,
      bearingAfterDegrees,
      crossing,
    );
  }

  @override
  String toString() {
    return 'RouteGuidanceStep(index: $index, type: $type, coordinate: $coordinate, geometryIndex: $geometryIndex, distanceFromStartMeters: $distanceFromStartMeters, distanceToNextStepMeters: $distanceToNextStepMeters, durationToNextStep: $durationToNextStep, instruction: $instruction, streetName: $streetName, bearingBeforeDegrees: $bearingBeforeDegrees, bearingAfterDegrees: $bearingAfterDegrees, crossing: $crossing)';
  }
}

/// @nodoc
abstract mixin class _$RouteGuidanceStepCopyWith<$Res>
    implements $RouteGuidanceStepCopyWith<$Res> {
  factory _$RouteGuidanceStepCopyWith(
    _RouteGuidanceStep value,
    $Res Function(_RouteGuidanceStep) _then,
  ) = __$RouteGuidanceStepCopyWithImpl;
  @override
  @useResult
  $Res call({
    int index,
    ManeuverType type,
    GeoCoordinate coordinate,
    int geometryIndex,
    double distanceFromStartMeters,
    double distanceToNextStepMeters,
    Duration durationToNextStep,
    String instruction,
    String? streetName,
    double? bearingBeforeDegrees,
    double? bearingAfterDegrees,
    RouteCrossing? crossing,
  });

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
  @override
  $RouteCrossingCopyWith<$Res>? get crossing;
}

/// @nodoc
class __$RouteGuidanceStepCopyWithImpl<$Res>
    implements _$RouteGuidanceStepCopyWith<$Res> {
  __$RouteGuidanceStepCopyWithImpl(this._self, this._then);

  final _RouteGuidanceStep _self;
  final $Res Function(_RouteGuidanceStep) _then;

  /// Create a copy of RouteGuidanceStep
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
    Object? durationToNextStep = null,
    Object? instruction = null,
    Object? streetName = freezed,
    Object? bearingBeforeDegrees = freezed,
    Object? bearingAfterDegrees = freezed,
    Object? crossing = freezed,
  }) {
    return _then(
      _RouteGuidanceStep(
        index: null == index
            ? _self.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ManeuverType,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as GeoCoordinate,
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
        durationToNextStep: null == durationToNextStep
            ? _self.durationToNextStep
            : durationToNextStep // ignore: cast_nullable_to_non_nullable
                  as Duration,
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
                  as RouteCrossing?,
      ),
    );
  }

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }

  /// Create a copy of RouteGuidanceStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCrossingCopyWith<$Res>? get crossing {
    if (_self.crossing == null) {
      return null;
    }

    return $RouteCrossingCopyWith<$Res>(_self.crossing!, (value) {
      return _then(_self.copyWith(crossing: value));
    });
  }
}

/// @nodoc
mixin _$RouteCrossing {
  bool? get trafficSignals;

  /// Create a copy of RouteCrossing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteCrossingCopyWith<RouteCrossing> get copyWith =>
      _$RouteCrossingCopyWithImpl<RouteCrossing>(
        this as RouteCrossing,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteCrossing;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteCrossing &&
            (identical(other.trafficSignals, _this.trafficSignals) ||
                other.trafficSignals == _this.trafficSignals));
  }

  @override
  int get hashCode {
    final _this = this as RouteCrossing;
    return Object.hash(runtimeType, _this.trafficSignals);
  }

  @override
  String toString() {
    final _this = this as RouteCrossing;
    return 'RouteCrossing(trafficSignals: ${_this.trafficSignals})';
  }
}

/// @nodoc
abstract mixin class $RouteCrossingCopyWith<$Res> {
  factory $RouteCrossingCopyWith(
    RouteCrossing value,
    $Res Function(RouteCrossing) _then,
  ) = _$RouteCrossingCopyWithImpl;
  @useResult
  $Res call({bool? trafficSignals});
}

/// @nodoc
class _$RouteCrossingCopyWithImpl<$Res>
    implements $RouteCrossingCopyWith<$Res> {
  _$RouteCrossingCopyWithImpl(this._self, this._then);

  final RouteCrossing _self;
  final $Res Function(RouteCrossing) _then;

  /// Create a copy of RouteCrossing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? trafficSignals = freezed}) {
    return _then(
      RouteCrossing(
        trafficSignals: freezed == trafficSignals
            ? _self.trafficSignals
            : trafficSignals // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RouteCrossing].
extension RouteCrossingPatterns on RouteCrossing {
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
    TResult Function(_RouteCrossing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCrossing() when $default != null:
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
    TResult Function(_RouteCrossing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCrossing():
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
    TResult? Function(_RouteCrossing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCrossing() when $default != null:
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
      case _RouteCrossing() when $default != null:
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
      case _RouteCrossing():
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
      case _RouteCrossing() when $default != null:
        return $default(_that.trafficSignals);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteCrossing implements RouteCrossing {
  const _RouteCrossing({this.trafficSignals});

  @override
  final bool? trafficSignals;

  /// Create a copy of RouteCrossing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteCrossingCopyWith<_RouteCrossing> get copyWith =>
      __$RouteCrossingCopyWithImpl<_RouteCrossing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteCrossing &&
            (identical(other.trafficSignals, trafficSignals) ||
                other.trafficSignals == trafficSignals));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, trafficSignals);
  }

  @override
  String toString() {
    return 'RouteCrossing(trafficSignals: $trafficSignals)';
  }
}

/// @nodoc
abstract mixin class _$RouteCrossingCopyWith<$Res>
    implements $RouteCrossingCopyWith<$Res> {
  factory _$RouteCrossingCopyWith(
    _RouteCrossing value,
    $Res Function(_RouteCrossing) _then,
  ) = __$RouteCrossingCopyWithImpl;
  @override
  @useResult
  $Res call({bool? trafficSignals});
}

/// @nodoc
class __$RouteCrossingCopyWithImpl<$Res>
    implements _$RouteCrossingCopyWith<$Res> {
  __$RouteCrossingCopyWithImpl(this._self, this._then);

  final _RouteCrossing _self;
  final $Res Function(_RouteCrossing) _then;

  /// Create a copy of RouteCrossing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? trafficSignals = freezed}) {
    return _then(
      _RouteCrossing(
        trafficSignals: freezed == trafficSignals
            ? _self.trafficSignals
            : trafficSignals // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}
