// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteSearchResult {
  RouteQuery get query;
  List<RouteCandidate> get routes;
  DateTime get evaluatedAt;
  String get dataVersion;
  String get timeModelVersion;
  String get routingModelVersion;
  Duration get baselineDuration;
  RouteSnapping get snapping;
  String get attribution;

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSearchResultCopyWith<RouteSearchResult> get copyWith =>
      _$RouteSearchResultCopyWithImpl<RouteSearchResult>(
        this as RouteSearchResult,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSearchResult;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSearchResult &&
            (identical(other.query, _this.query) ||
                other.query == _this.query) &&
            const DeepCollectionEquality().equals(other.routes, _this.routes) &&
            (identical(other.evaluatedAt, _this.evaluatedAt) ||
                other.evaluatedAt == _this.evaluatedAt) &&
            (identical(other.dataVersion, _this.dataVersion) ||
                other.dataVersion == _this.dataVersion) &&
            (identical(other.timeModelVersion, _this.timeModelVersion) ||
                other.timeModelVersion == _this.timeModelVersion) &&
            (identical(other.routingModelVersion, _this.routingModelVersion) ||
                other.routingModelVersion == _this.routingModelVersion) &&
            (identical(other.baselineDuration, _this.baselineDuration) ||
                other.baselineDuration == _this.baselineDuration) &&
            (identical(other.snapping, _this.snapping) ||
                other.snapping == _this.snapping) &&
            (identical(other.attribution, _this.attribution) ||
                other.attribution == _this.attribution));
  }

  @override
  int get hashCode {
    final _this = this as RouteSearchResult;
    return Object.hash(
      runtimeType,
      _this.query,
      const DeepCollectionEquality().hash(_this.routes),
      _this.evaluatedAt,
      _this.dataVersion,
      _this.timeModelVersion,
      _this.routingModelVersion,
      _this.baselineDuration,
      _this.snapping,
      _this.attribution,
    );
  }

  @override
  String toString() {
    final _this = this as RouteSearchResult;
    return 'RouteSearchResult(query: ${_this.query}, routes: ${_this.routes}, evaluatedAt: ${_this.evaluatedAt}, dataVersion: ${_this.dataVersion}, timeModelVersion: ${_this.timeModelVersion}, routingModelVersion: ${_this.routingModelVersion}, baselineDuration: ${_this.baselineDuration}, snapping: ${_this.snapping}, attribution: ${_this.attribution})';
  }
}

/// @nodoc
abstract mixin class $RouteSearchResultCopyWith<$Res> {
  factory $RouteSearchResultCopyWith(
    RouteSearchResult value,
    $Res Function(RouteSearchResult) _then,
  ) = _$RouteSearchResultCopyWithImpl;
  @useResult
  $Res call({
    RouteQuery query,
    List<RouteCandidate> routes,
    DateTime evaluatedAt,
    String dataVersion,
    String timeModelVersion,
    String routingModelVersion,
    Duration baselineDuration,
    RouteSnapping snapping,
    String attribution,
  });

  $RouteQueryCopyWith<$Res> get query;
  $RouteSnappingCopyWith<$Res> get snapping;
}

/// @nodoc
class _$RouteSearchResultCopyWithImpl<$Res>
    implements $RouteSearchResultCopyWith<$Res> {
  _$RouteSearchResultCopyWithImpl(this._self, this._then);

  final RouteSearchResult _self;
  final $Res Function(RouteSearchResult) _then;

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? timeModelVersion = null,
    Object? routingModelVersion = null,
    Object? baselineDuration = null,
    Object? snapping = null,
    Object? attribution = null,
  }) {
    return _then(
      RouteSearchResult(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as RouteQuery,
        routes: null == routes
            ? _self.routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<RouteCandidate>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        baselineDuration: null == baselineDuration
            ? _self.baselineDuration
            : baselineDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as RouteSnapping,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteQueryCopyWith<$Res> get query {
    return $RouteQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnappingCopyWith<$Res> get snapping {
    return $RouteSnappingCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSearchResult].
extension RouteSearchResultPatterns on RouteSearchResult {
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
    TResult Function(_RouteSearchResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult() when $default != null:
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
    TResult Function(_RouteSearchResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult():
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
    TResult? Function(_RouteSearchResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult() when $default != null:
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
      RouteQuery query,
      List<RouteCandidate> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      Duration baselineDuration,
      RouteSnapping snapping,
      String attribution,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult() when $default != null:
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDuration,
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
      RouteQuery query,
      List<RouteCandidate> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      Duration baselineDuration,
      RouteSnapping snapping,
      String attribution,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult():
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDuration,
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
      RouteQuery query,
      List<RouteCandidate> routes,
      DateTime evaluatedAt,
      String dataVersion,
      String timeModelVersion,
      String routingModelVersion,
      Duration baselineDuration,
      RouteSnapping snapping,
      String attribution,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchResult() when $default != null:
        return $default(
          _that.query,
          _that.routes,
          _that.evaluatedAt,
          _that.dataVersion,
          _that.timeModelVersion,
          _that.routingModelVersion,
          _that.baselineDuration,
          _that.snapping,
          _that.attribution,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteSearchResult implements RouteSearchResult {
  const _RouteSearchResult({
    required this.query,
    required List<RouteCandidate> routes,
    required this.evaluatedAt,
    required this.dataVersion,
    required this.timeModelVersion,
    required this.routingModelVersion,
    required this.baselineDuration,
    required this.snapping,
    required this.attribution,
  }) : _routes = routes;

  @override
  final RouteQuery query;
  final List<RouteCandidate> _routes;
  @override
  List<RouteCandidate> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  final DateTime evaluatedAt;
  @override
  final String dataVersion;
  @override
  final String timeModelVersion;
  @override
  final String routingModelVersion;
  @override
  final Duration baselineDuration;
  @override
  final RouteSnapping snapping;
  @override
  final String attribution;

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSearchResultCopyWith<_RouteSearchResult> get copyWith =>
      __$RouteSearchResultCopyWithImpl<_RouteSearchResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSearchResult &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other.routes, _routes) &&
            (identical(other.evaluatedAt, evaluatedAt) ||
                other.evaluatedAt == evaluatedAt) &&
            (identical(other.dataVersion, dataVersion) ||
                other.dataVersion == dataVersion) &&
            (identical(other.timeModelVersion, timeModelVersion) ||
                other.timeModelVersion == timeModelVersion) &&
            (identical(other.routingModelVersion, routingModelVersion) ||
                other.routingModelVersion == routingModelVersion) &&
            (identical(other.baselineDuration, baselineDuration) ||
                other.baselineDuration == baselineDuration) &&
            (identical(other.snapping, snapping) ||
                other.snapping == snapping) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_routes),
      evaluatedAt,
      dataVersion,
      timeModelVersion,
      routingModelVersion,
      baselineDuration,
      snapping,
      attribution,
    );
  }

  @override
  String toString() {
    return 'RouteSearchResult(query: $query, routes: $routes, evaluatedAt: $evaluatedAt, dataVersion: $dataVersion, timeModelVersion: $timeModelVersion, routingModelVersion: $routingModelVersion, baselineDuration: $baselineDuration, snapping: $snapping, attribution: $attribution)';
  }
}

/// @nodoc
abstract mixin class _$RouteSearchResultCopyWith<$Res>
    implements $RouteSearchResultCopyWith<$Res> {
  factory _$RouteSearchResultCopyWith(
    _RouteSearchResult value,
    $Res Function(_RouteSearchResult) _then,
  ) = __$RouteSearchResultCopyWithImpl;
  @override
  @useResult
  $Res call({
    RouteQuery query,
    List<RouteCandidate> routes,
    DateTime evaluatedAt,
    String dataVersion,
    String timeModelVersion,
    String routingModelVersion,
    Duration baselineDuration,
    RouteSnapping snapping,
    String attribution,
  });

  @override
  $RouteQueryCopyWith<$Res> get query;
  @override
  $RouteSnappingCopyWith<$Res> get snapping;
}

/// @nodoc
class __$RouteSearchResultCopyWithImpl<$Res>
    implements _$RouteSearchResultCopyWith<$Res> {
  __$RouteSearchResultCopyWithImpl(this._self, this._then);

  final _RouteSearchResult _self;
  final $Res Function(_RouteSearchResult) _then;

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? routes = null,
    Object? evaluatedAt = null,
    Object? dataVersion = null,
    Object? timeModelVersion = null,
    Object? routingModelVersion = null,
    Object? baselineDuration = null,
    Object? snapping = null,
    Object? attribution = null,
  }) {
    return _then(
      _RouteSearchResult(
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as RouteQuery,
        routes: null == routes
            ? _self._routes
            : routes // ignore: cast_nullable_to_non_nullable
                  as List<RouteCandidate>,
        evaluatedAt: null == evaluatedAt
            ? _self.evaluatedAt
            : evaluatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        baselineDuration: null == baselineDuration
            ? _self.baselineDuration
            : baselineDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        snapping: null == snapping
            ? _self.snapping
            : snapping // ignore: cast_nullable_to_non_nullable
                  as RouteSnapping,
        attribution: null == attribution
            ? _self.attribution
            : attribution // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteQueryCopyWith<$Res> get query {
    return $RouteQueryCopyWith<$Res>(_self.query, (value) {
      return _then(_self.copyWith(query: value));
    });
  }

  /// Create a copy of RouteSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnappingCopyWith<$Res> get snapping {
    return $RouteSnappingCopyWith<$Res>(_self.snapping, (value) {
      return _then(_self.copyWith(snapping: value));
    });
  }
}

/// @nodoc
mixin _$RouteSnapping {
  RouteSnap get origin;
  RouteSnap get destination;

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSnappingCopyWith<RouteSnapping> get copyWith =>
      _$RouteSnappingCopyWithImpl<RouteSnapping>(
        this as RouteSnapping,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSnapping;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSnapping &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination));
  }

  @override
  int get hashCode {
    final _this = this as RouteSnapping;
    return Object.hash(runtimeType, _this.origin, _this.destination);
  }

  @override
  String toString() {
    final _this = this as RouteSnapping;
    return 'RouteSnapping(origin: ${_this.origin}, destination: ${_this.destination})';
  }
}

/// @nodoc
abstract mixin class $RouteSnappingCopyWith<$Res> {
  factory $RouteSnappingCopyWith(
    RouteSnapping value,
    $Res Function(RouteSnapping) _then,
  ) = _$RouteSnappingCopyWithImpl;
  @useResult
  $Res call({RouteSnap origin, RouteSnap destination});

  $RouteSnapCopyWith<$Res> get origin;
  $RouteSnapCopyWith<$Res> get destination;
}

/// @nodoc
class _$RouteSnappingCopyWithImpl<$Res>
    implements $RouteSnappingCopyWith<$Res> {
  _$RouteSnappingCopyWithImpl(this._self, this._then);

  final RouteSnapping _self;
  final $Res Function(RouteSnapping) _then;

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      RouteSnapping(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteSnap,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteSnap,
      ),
    );
  }

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapCopyWith<$Res> get origin {
    return $RouteSnapCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapCopyWith<$Res> get destination {
    return $RouteSnapCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSnapping].
extension RouteSnappingPatterns on RouteSnapping {
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
    TResult Function(_RouteSnapping value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping() when $default != null:
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
    TResult Function(_RouteSnapping value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping():
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
    TResult? Function(_RouteSnapping value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping() when $default != null:
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
    TResult Function(RouteSnap origin, RouteSnap destination)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping() when $default != null:
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
    TResult Function(RouteSnap origin, RouteSnap destination) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping():
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
    TResult? Function(RouteSnap origin, RouteSnap destination)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnapping() when $default != null:
        return $default(_that.origin, _that.destination);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteSnapping implements RouteSnapping {
  const _RouteSnapping({required this.origin, required this.destination});

  @override
  final RouteSnap origin;
  @override
  final RouteSnap destination;

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSnappingCopyWith<_RouteSnapping> get copyWith =>
      __$RouteSnappingCopyWithImpl<_RouteSnapping>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSnapping &&
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
    return 'RouteSnapping(origin: $origin, destination: $destination)';
  }
}

/// @nodoc
abstract mixin class _$RouteSnappingCopyWith<$Res>
    implements $RouteSnappingCopyWith<$Res> {
  factory _$RouteSnappingCopyWith(
    _RouteSnapping value,
    $Res Function(_RouteSnapping) _then,
  ) = __$RouteSnappingCopyWithImpl;
  @override
  @useResult
  $Res call({RouteSnap origin, RouteSnap destination});

  @override
  $RouteSnapCopyWith<$Res> get origin;
  @override
  $RouteSnapCopyWith<$Res> get destination;
}

/// @nodoc
class __$RouteSnappingCopyWithImpl<$Res>
    implements _$RouteSnappingCopyWith<$Res> {
  __$RouteSnappingCopyWithImpl(this._self, this._then);

  final _RouteSnapping _self;
  final $Res Function(_RouteSnapping) _then;

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? origin = null, Object? destination = null}) {
    return _then(
      _RouteSnapping(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteSnap,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteSnap,
      ),
    );
  }

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapCopyWith<$Res> get origin {
    return $RouteSnapCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSnapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteSnapCopyWith<$Res> get destination {
    return $RouteSnapCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$RouteSnap {
  GeoCoordinate get coordinate;
  double get distanceMeters;

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSnapCopyWith<RouteSnap> get copyWith =>
      _$RouteSnapCopyWithImpl<RouteSnap>(this as RouteSnap, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSnap;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSnap &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate) &&
            (identical(other.distanceMeters, _this.distanceMeters) ||
                other.distanceMeters == _this.distanceMeters));
  }

  @override
  int get hashCode {
    final _this = this as RouteSnap;
    return Object.hash(runtimeType, _this.coordinate, _this.distanceMeters);
  }

  @override
  String toString() {
    final _this = this as RouteSnap;
    return 'RouteSnap(coordinate: ${_this.coordinate}, distanceMeters: ${_this.distanceMeters})';
  }
}

/// @nodoc
abstract mixin class $RouteSnapCopyWith<$Res> {
  factory $RouteSnapCopyWith(RouteSnap value, $Res Function(RouteSnap) _then) =
      _$RouteSnapCopyWithImpl;
  @useResult
  $Res call({GeoCoordinate coordinate, double distanceMeters});

  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$RouteSnapCopyWithImpl<$Res> implements $RouteSnapCopyWith<$Res> {
  _$RouteSnapCopyWithImpl(this._self, this._then);

  final RouteSnap _self;
  final $Res Function(RouteSnap) _then;

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      RouteSnap(
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

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSnap].
extension RouteSnapPatterns on RouteSnap {
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
    TResult Function(_RouteSnap value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSnap() when $default != null:
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
    TResult Function(_RouteSnap value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnap():
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
    TResult? Function(_RouteSnap value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSnap() when $default != null:
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
      case _RouteSnap() when $default != null:
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
      case _RouteSnap():
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
      case _RouteSnap() when $default != null:
        return $default(_that.coordinate, _that.distanceMeters);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteSnap implements RouteSnap {
  const _RouteSnap({required this.coordinate, required this.distanceMeters});

  @override
  final GeoCoordinate coordinate;
  @override
  final double distanceMeters;

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSnapCopyWith<_RouteSnap> get copyWith =>
      __$RouteSnapCopyWithImpl<_RouteSnap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSnap &&
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
    return 'RouteSnap(coordinate: $coordinate, distanceMeters: $distanceMeters)';
  }
}

/// @nodoc
abstract mixin class _$RouteSnapCopyWith<$Res>
    implements $RouteSnapCopyWith<$Res> {
  factory _$RouteSnapCopyWith(
    _RouteSnap value,
    $Res Function(_RouteSnap) _then,
  ) = __$RouteSnapCopyWithImpl;
  @override
  @useResult
  $Res call({GeoCoordinate coordinate, double distanceMeters});

  @override
  $GeoCoordinateCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$RouteSnapCopyWithImpl<$Res> implements _$RouteSnapCopyWith<$Res> {
  __$RouteSnapCopyWithImpl(this._self, this._then);

  final _RouteSnap _self;
  final $Res Function(_RouteSnap) _then;

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? coordinate = null, Object? distanceMeters = null}) {
    return _then(
      _RouteSnap(
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

  /// Create a copy of RouteSnap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoCoordinateCopyWith<$Res> get coordinate {
    return $GeoCoordinateCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}
