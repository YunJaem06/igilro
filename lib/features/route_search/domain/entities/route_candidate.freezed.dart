// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteCandidate {
  String get id;
  List<GeoCoordinate> get path;
  double get distanceMeters;
  Duration get duration;
  Duration get additionalDuration;
  RouteMetrics get metrics;
  RouteShadeEvaluation? get shadeEvaluation;

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteCandidateCopyWith<RouteCandidate> get copyWith =>
      _$RouteCandidateCopyWithImpl<RouteCandidate>(
        this as RouteCandidate,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteCandidate;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteCandidate &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            const DeepCollectionEquality().equals(other.path, _this.path) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters) &&
            (identical(other.duration, _this.duration) ||
                other.duration == _this.duration) &&
            (identical(other.additionalDuration, _this.additionalDuration) ||
                other.additionalDuration == _this.additionalDuration) &&
            (identical(other.metrics, _this.metrics) ||
                other.metrics == _this.metrics) &&
            (identical(other.shadeEvaluation, _this.shadeEvaluation) ||
                other.shadeEvaluation == _this.shadeEvaluation));
  }

  @override
  int get hashCode {
    final _this = this as RouteCandidate;
    return Object.hash(
      runtimeType,
      _this.id,
      const DeepCollectionEquality().hash(_this.path),
      _this.distanceMeters,
      _this.duration,
      _this.additionalDuration,
      _this.metrics,
      _this.shadeEvaluation,
    );
  }

  @override
  String toString() {
    final _this = this as RouteCandidate;
    return 'RouteCandidate(id: ${_this.id}, path: ${_this.path}, distanceMeters: ${_this.distanceMeters}, duration: ${_this.duration}, additionalDuration: ${_this.additionalDuration}, metrics: ${_this.metrics}, shadeEvaluation: ${_this.shadeEvaluation})';
  }
}

/// @nodoc
abstract mixin class $RouteCandidateCopyWith<$Res> {
  factory $RouteCandidateCopyWith(
    RouteCandidate value,
    $Res Function(RouteCandidate) _then,
  ) = _$RouteCandidateCopyWithImpl;
  @useResult
  $Res call({
    String id,
    List<GeoCoordinate> path,
    double distanceMeters,
    Duration duration,
    Duration additionalDuration,
    RouteMetrics metrics,
    RouteShadeEvaluation? shadeEvaluation,
  });

  $RouteMetricsCopyWith<$Res> get metrics;
  $RouteShadeEvaluationCopyWith<$Res>? get shadeEvaluation;
}

/// @nodoc
class _$RouteCandidateCopyWithImpl<$Res>
    implements $RouteCandidateCopyWith<$Res> {
  _$RouteCandidateCopyWithImpl(this._self, this._then);

  final RouteCandidate _self;
  final $Res Function(RouteCandidate) _then;

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? distanceMeters = null,
    Object? duration = null,
    Object? additionalDuration = null,
    Object? metrics = null,
    Object? shadeEvaluation = freezed,
  }) {
    return _then(
      RouteCandidate(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        metrics: null == metrics
            ? _self.metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as RouteMetrics,
        shadeEvaluation: freezed == shadeEvaluation
            ? _self.shadeEvaluation
            : shadeEvaluation // ignore: cast_nullable_to_non_nullable
                  as RouteShadeEvaluation?,
      ),
    );
  }

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteMetricsCopyWith<$Res> get metrics {
    return $RouteMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationCopyWith<$Res>? get shadeEvaluation {
    if (_self.shadeEvaluation == null) {
      return null;
    }

    return $RouteShadeEvaluationCopyWith<$Res>(_self.shadeEvaluation!, (value) {
      return _then(_self.copyWith(shadeEvaluation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteCandidate].
extension RouteCandidatePatterns on RouteCandidate {
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
    TResult Function(_RouteCandidate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate() when $default != null:
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
    TResult Function(_RouteCandidate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate():
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
    TResult? Function(_RouteCandidate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate() when $default != null:
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
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      RouteMetrics metrics,
      RouteShadeEvaluation? shadeEvaluation,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate() when $default != null:
        return $default(
          _that.id,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
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
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      RouteMetrics metrics,
      RouteShadeEvaluation? shadeEvaluation,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate():
        return $default(
          _that.id,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
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
      List<GeoCoordinate> path,
      double distanceMeters,
      Duration duration,
      Duration additionalDuration,
      RouteMetrics metrics,
      RouteShadeEvaluation? shadeEvaluation,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCandidate() when $default != null:
        return $default(
          _that.id,
          _that.path,
          _that.distanceMeters,
          _that.duration,
          _that.additionalDuration,
          _that.metrics,
          _that.shadeEvaluation,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteCandidate implements RouteCandidate {
  const _RouteCandidate({
    required this.id,
    required List<GeoCoordinate> path,
    required this.distanceMeters,
    required this.duration,
    required this.additionalDuration,
    required this.metrics,
    this.shadeEvaluation,
  }) : _path = path;

  @override
  final String id;
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
  final RouteMetrics metrics;
  @override
  final RouteShadeEvaluation? shadeEvaluation;

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteCandidateCopyWith<_RouteCandidate> get copyWith =>
      __$RouteCandidateCopyWithImpl<_RouteCandidate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteCandidate &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.path, _path) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.additionalDuration, additionalDuration) ||
                other.additionalDuration == additionalDuration) &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            (identical(other.shadeEvaluation, shadeEvaluation) ||
                other.shadeEvaluation == shadeEvaluation));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_path),
      distanceMeters,
      duration,
      additionalDuration,
      metrics,
      shadeEvaluation,
    );
  }

  @override
  String toString() {
    return 'RouteCandidate(id: $id, path: $path, distanceMeters: $distanceMeters, duration: $duration, additionalDuration: $additionalDuration, metrics: $metrics, shadeEvaluation: $shadeEvaluation)';
  }
}

/// @nodoc
abstract mixin class _$RouteCandidateCopyWith<$Res>
    implements $RouteCandidateCopyWith<$Res> {
  factory _$RouteCandidateCopyWith(
    _RouteCandidate value,
    $Res Function(_RouteCandidate) _then,
  ) = __$RouteCandidateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    List<GeoCoordinate> path,
    double distanceMeters,
    Duration duration,
    Duration additionalDuration,
    RouteMetrics metrics,
    RouteShadeEvaluation? shadeEvaluation,
  });

  @override
  $RouteMetricsCopyWith<$Res> get metrics;
  @override
  $RouteShadeEvaluationCopyWith<$Res>? get shadeEvaluation;
}

/// @nodoc
class __$RouteCandidateCopyWithImpl<$Res>
    implements _$RouteCandidateCopyWith<$Res> {
  __$RouteCandidateCopyWithImpl(this._self, this._then);

  final _RouteCandidate _self;
  final $Res Function(_RouteCandidate) _then;

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? distanceMeters = null,
    Object? duration = null,
    Object? additionalDuration = null,
    Object? metrics = null,
    Object? shadeEvaluation = freezed,
  }) {
    return _then(
      _RouteCandidate(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        metrics: null == metrics
            ? _self.metrics
            : metrics // ignore: cast_nullable_to_non_nullable
                  as RouteMetrics,
        shadeEvaluation: freezed == shadeEvaluation
            ? _self.shadeEvaluation
            : shadeEvaluation // ignore: cast_nullable_to_non_nullable
                  as RouteShadeEvaluation?,
      ),
    );
  }

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteMetricsCopyWith<$Res> get metrics {
    return $RouteMetricsCopyWith<$Res>(_self.metrics, (value) {
      return _then(_self.copyWith(metrics: value));
    });
  }

  /// Create a copy of RouteCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationCopyWith<$Res>? get shadeEvaluation {
    if (_self.shadeEvaluation == null) {
      return null;
    }

    return $RouteShadeEvaluationCopyWith<$Res>(_self.shadeEvaluation!, (value) {
      return _then(_self.copyWith(shadeEvaluation: value));
    });
  }
}

/// @nodoc
mixin _$RouteShadeEvaluation {
  ShadeEvaluationStatus get status;
  String get modelVersion;
  double? get coverage;
  String? get dataVersion;
  String? get attribution;
  double? get solarAltitudeDegrees;

  /// Create a copy of RouteShadeEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteShadeEvaluationCopyWith<RouteShadeEvaluation> get copyWith =>
      _$RouteShadeEvaluationCopyWithImpl<RouteShadeEvaluation>(
        this as RouteShadeEvaluation,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteShadeEvaluation;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteShadeEvaluation &&
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

  @override
  int get hashCode {
    final _this = this as RouteShadeEvaluation;
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
    final _this = this as RouteShadeEvaluation;
    return 'RouteShadeEvaluation(status: ${_this.status}, modelVersion: ${_this.modelVersion}, coverage: ${_this.coverage}, dataVersion: ${_this.dataVersion}, attribution: ${_this.attribution}, solarAltitudeDegrees: ${_this.solarAltitudeDegrees})';
  }
}

/// @nodoc
abstract mixin class $RouteShadeEvaluationCopyWith<$Res> {
  factory $RouteShadeEvaluationCopyWith(
    RouteShadeEvaluation value,
    $Res Function(RouteShadeEvaluation) _then,
  ) = _$RouteShadeEvaluationCopyWithImpl;
  @useResult
  $Res call({
    ShadeEvaluationStatus status,
    String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  });
}

/// @nodoc
class _$RouteShadeEvaluationCopyWithImpl<$Res>
    implements $RouteShadeEvaluationCopyWith<$Res> {
  _$RouteShadeEvaluationCopyWithImpl(this._self, this._then);

  final RouteShadeEvaluation _self;
  final $Res Function(RouteShadeEvaluation) _then;

  /// Create a copy of RouteShadeEvaluation
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
      RouteShadeEvaluation(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ShadeEvaluationStatus,
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

/// Adds pattern-matching-related methods to [RouteShadeEvaluation].
extension RouteShadeEvaluationPatterns on RouteShadeEvaluation {
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
    TResult Function(_RouteShadeEvaluation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluation() when $default != null:
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
    TResult Function(_RouteShadeEvaluation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluation():
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
    TResult? Function(_RouteShadeEvaluation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteShadeEvaluation() when $default != null:
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
      ShadeEvaluationStatus status,
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
      case _RouteShadeEvaluation() when $default != null:
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
      ShadeEvaluationStatus status,
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
      case _RouteShadeEvaluation():
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
      ShadeEvaluationStatus status,
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
      case _RouteShadeEvaluation() when $default != null:
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

class _RouteShadeEvaluation implements RouteShadeEvaluation {
  const _RouteShadeEvaluation({
    required this.status,
    required this.modelVersion,
    this.coverage,
    this.dataVersion,
    this.attribution,
    this.solarAltitudeDegrees,
  });

  @override
  final ShadeEvaluationStatus status;
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

  /// Create a copy of RouteShadeEvaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteShadeEvaluationCopyWith<_RouteShadeEvaluation> get copyWith =>
      __$RouteShadeEvaluationCopyWithImpl<_RouteShadeEvaluation>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteShadeEvaluation &&
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
    return 'RouteShadeEvaluation(status: $status, modelVersion: $modelVersion, coverage: $coverage, dataVersion: $dataVersion, attribution: $attribution, solarAltitudeDegrees: $solarAltitudeDegrees)';
  }
}

/// @nodoc
abstract mixin class _$RouteShadeEvaluationCopyWith<$Res>
    implements $RouteShadeEvaluationCopyWith<$Res> {
  factory _$RouteShadeEvaluationCopyWith(
    _RouteShadeEvaluation value,
    $Res Function(_RouteShadeEvaluation) _then,
  ) = __$RouteShadeEvaluationCopyWithImpl;
  @override
  @useResult
  $Res call({
    ShadeEvaluationStatus status,
    String modelVersion,
    double? coverage,
    String? dataVersion,
    String? attribution,
    double? solarAltitudeDegrees,
  });
}

/// @nodoc
class __$RouteShadeEvaluationCopyWithImpl<$Res>
    implements _$RouteShadeEvaluationCopyWith<$Res> {
  __$RouteShadeEvaluationCopyWithImpl(this._self, this._then);

  final _RouteShadeEvaluation _self;
  final $Res Function(_RouteShadeEvaluation) _then;

  /// Create a copy of RouteShadeEvaluation
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
      _RouteShadeEvaluation(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ShadeEvaluationStatus,
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
mixin _$RouteMetrics {
  double? get shadeRatio;
  double? get quietScore;
  double? get lightingScore;
  int? get trafficSignalCount;

  /// Create a copy of RouteMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteMetricsCopyWith<RouteMetrics> get copyWith =>
      _$RouteMetricsCopyWithImpl<RouteMetrics>(
        this as RouteMetrics,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteMetrics;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteMetrics &&
            (identical(other.shadeRatio, _this.shadeRatio) ||
                other.shadeRatio == _this.shadeRatio) &&
            (identical(other.quietScore, _this.quietScore) ||
                other.quietScore == _this.quietScore) &&
            (identical(other.lightingScore, _this.lightingScore) ||
                other.lightingScore == _this.lightingScore) &&
            (identical(other.trafficSignalCount, _this.trafficSignalCount) ||
                other.trafficSignalCount == _this.trafficSignalCount));
  }

  @override
  int get hashCode {
    final _this = this as RouteMetrics;
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
    final _this = this as RouteMetrics;
    return 'RouteMetrics(shadeRatio: ${_this.shadeRatio}, quietScore: ${_this.quietScore}, lightingScore: ${_this.lightingScore}, trafficSignalCount: ${_this.trafficSignalCount})';
  }
}

/// @nodoc
abstract mixin class $RouteMetricsCopyWith<$Res> {
  factory $RouteMetricsCopyWith(
    RouteMetrics value,
    $Res Function(RouteMetrics) _then,
  ) = _$RouteMetricsCopyWithImpl;
  @useResult
  $Res call({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    int? trafficSignalCount,
  });
}

/// @nodoc
class _$RouteMetricsCopyWithImpl<$Res> implements $RouteMetricsCopyWith<$Res> {
  _$RouteMetricsCopyWithImpl(this._self, this._then);

  final RouteMetrics _self;
  final $Res Function(RouteMetrics) _then;

  /// Create a copy of RouteMetrics
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
      RouteMetrics(
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

/// Adds pattern-matching-related methods to [RouteMetrics].
extension RouteMetricsPatterns on RouteMetrics {
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
    TResult Function(_RouteMetrics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics() when $default != null:
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
    TResult Function(_RouteMetrics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics():
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
    TResult? Function(_RouteMetrics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics() when $default != null:
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
      int? trafficSignalCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics() when $default != null:
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
      int? trafficSignalCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics():
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
      int? trafficSignalCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteMetrics() when $default != null:
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

class _RouteMetrics implements RouteMetrics {
  const _RouteMetrics({
    this.shadeRatio,
    this.quietScore,
    this.lightingScore,
    this.trafficSignalCount,
  });

  @override
  final double? shadeRatio;
  @override
  final double? quietScore;
  @override
  final double? lightingScore;
  @override
  final int? trafficSignalCount;

  /// Create a copy of RouteMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteMetricsCopyWith<_RouteMetrics> get copyWith =>
      __$RouteMetricsCopyWithImpl<_RouteMetrics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteMetrics &&
            (identical(other.shadeRatio, shadeRatio) ||
                other.shadeRatio == shadeRatio) &&
            (identical(other.quietScore, quietScore) ||
                other.quietScore == quietScore) &&
            (identical(other.lightingScore, lightingScore) ||
                other.lightingScore == lightingScore) &&
            (identical(other.trafficSignalCount, trafficSignalCount) ||
                other.trafficSignalCount == trafficSignalCount));
  }

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
    return 'RouteMetrics(shadeRatio: $shadeRatio, quietScore: $quietScore, lightingScore: $lightingScore, trafficSignalCount: $trafficSignalCount)';
  }
}

/// @nodoc
abstract mixin class _$RouteMetricsCopyWith<$Res>
    implements $RouteMetricsCopyWith<$Res> {
  factory _$RouteMetricsCopyWith(
    _RouteMetrics value,
    $Res Function(_RouteMetrics) _then,
  ) = __$RouteMetricsCopyWithImpl;
  @override
  @useResult
  $Res call({
    double? shadeRatio,
    double? quietScore,
    double? lightingScore,
    int? trafficSignalCount,
  });
}

/// @nodoc
class __$RouteMetricsCopyWithImpl<$Res>
    implements _$RouteMetricsCopyWith<$Res> {
  __$RouteMetricsCopyWithImpl(this._self, this._then);

  final _RouteMetrics _self;
  final $Res Function(_RouteMetrics) _then;

  /// Create a copy of RouteMetrics
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
      _RouteMetrics(
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
