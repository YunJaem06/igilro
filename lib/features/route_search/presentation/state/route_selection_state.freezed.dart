// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteSelectionState {
  RouteEndpoints get endpoints;
  RouteEndpoint? get selecting;
  RoutePoint? get candidate;

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSelectionStateCopyWith<RouteSelectionState> get copyWith =>
      _$RouteSelectionStateCopyWithImpl<RouteSelectionState>(
        this as RouteSelectionState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSelectionState;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSelectionState &&
            (identical(other.endpoints, _this.endpoints) ||
                other.endpoints == _this.endpoints) &&
            (identical(other.selecting, _this.selecting) ||
                other.selecting == _this.selecting) &&
            (identical(other.candidate, _this.candidate) ||
                other.candidate == _this.candidate));
  }

  @override
  int get hashCode {
    final _this = this as RouteSelectionState;
    return Object.hash(
      runtimeType,
      _this.endpoints,
      _this.selecting,
      _this.candidate,
    );
  }

  @override
  String toString() {
    final _this = this as RouteSelectionState;
    return 'RouteSelectionState(endpoints: ${_this.endpoints}, selecting: ${_this.selecting}, candidate: ${_this.candidate})';
  }
}

/// @nodoc
abstract mixin class $RouteSelectionStateCopyWith<$Res> {
  factory $RouteSelectionStateCopyWith(
    RouteSelectionState value,
    $Res Function(RouteSelectionState) _then,
  ) = _$RouteSelectionStateCopyWithImpl;
  @useResult
  $Res call({
    RouteEndpoints endpoints,
    RouteEndpoint? selecting,
    RoutePoint? candidate,
  });

  $RouteEndpointsCopyWith<$Res> get endpoints;
  $RoutePointCopyWith<$Res>? get candidate;
}

/// @nodoc
class _$RouteSelectionStateCopyWithImpl<$Res>
    implements $RouteSelectionStateCopyWith<$Res> {
  _$RouteSelectionStateCopyWithImpl(this._self, this._then);

  final RouteSelectionState _self;
  final $Res Function(RouteSelectionState) _then;

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endpoints = null,
    Object? selecting = freezed,
    Object? candidate = freezed,
  }) {
    return _then(
      RouteSelectionState(
        endpoints: null == endpoints
            ? _self.endpoints
            : endpoints // ignore: cast_nullable_to_non_nullable
                  as RouteEndpoints,
        selecting: freezed == selecting
            ? _self.selecting
            : selecting // ignore: cast_nullable_to_non_nullable
                  as RouteEndpoint?,
        candidate: freezed == candidate
            ? _self.candidate
            : candidate // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
      ),
    );
  }

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteEndpointsCopyWith<$Res> get endpoints {
    return $RouteEndpointsCopyWith<$Res>(_self.endpoints, (value) {
      return _then(_self.copyWith(endpoints: value));
    });
  }

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get candidate {
    if (_self.candidate == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.candidate!, (value) {
      return _then(_self.copyWith(candidate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSelectionState].
extension RouteSelectionStatePatterns on RouteSelectionState {
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
    TResult Function(_RouteSelectionState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState() when $default != null:
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
    TResult Function(_RouteSelectionState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState():
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
    TResult? Function(_RouteSelectionState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState() when $default != null:
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
      RouteEndpoints endpoints,
      RouteEndpoint? selecting,
      RoutePoint? candidate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState() when $default != null:
        return $default(_that.endpoints, _that.selecting, _that.candidate);
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
      RouteEndpoints endpoints,
      RouteEndpoint? selecting,
      RoutePoint? candidate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState():
        return $default(_that.endpoints, _that.selecting, _that.candidate);
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
      RouteEndpoints endpoints,
      RouteEndpoint? selecting,
      RoutePoint? candidate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSelectionState() when $default != null:
        return $default(_that.endpoints, _that.selecting, _that.candidate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RouteSelectionState implements RouteSelectionState {
  const _RouteSelectionState({
    this.endpoints = const RouteEndpoints(),
    this.selecting,
    this.candidate,
  });

  @override
  @JsonKey()
  final RouteEndpoints endpoints;
  @override
  final RouteEndpoint? selecting;
  @override
  final RoutePoint? candidate;

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSelectionStateCopyWith<_RouteSelectionState> get copyWith =>
      __$RouteSelectionStateCopyWithImpl<_RouteSelectionState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSelectionState &&
            (identical(other.endpoints, endpoints) ||
                other.endpoints == endpoints) &&
            (identical(other.selecting, selecting) ||
                other.selecting == selecting) &&
            (identical(other.candidate, candidate) ||
                other.candidate == candidate));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, endpoints, selecting, candidate);
  }

  @override
  String toString() {
    return 'RouteSelectionState(endpoints: $endpoints, selecting: $selecting, candidate: $candidate)';
  }
}

/// @nodoc
abstract mixin class _$RouteSelectionStateCopyWith<$Res>
    implements $RouteSelectionStateCopyWith<$Res> {
  factory _$RouteSelectionStateCopyWith(
    _RouteSelectionState value,
    $Res Function(_RouteSelectionState) _then,
  ) = __$RouteSelectionStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    RouteEndpoints endpoints,
    RouteEndpoint? selecting,
    RoutePoint? candidate,
  });

  @override
  $RouteEndpointsCopyWith<$Res> get endpoints;
  @override
  $RoutePointCopyWith<$Res>? get candidate;
}

/// @nodoc
class __$RouteSelectionStateCopyWithImpl<$Res>
    implements _$RouteSelectionStateCopyWith<$Res> {
  __$RouteSelectionStateCopyWithImpl(this._self, this._then);

  final _RouteSelectionState _self;
  final $Res Function(_RouteSelectionState) _then;

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? endpoints = null,
    Object? selecting = freezed,
    Object? candidate = freezed,
  }) {
    return _then(
      _RouteSelectionState(
        endpoints: null == endpoints
            ? _self.endpoints
            : endpoints // ignore: cast_nullable_to_non_nullable
                  as RouteEndpoints,
        selecting: freezed == selecting
            ? _self.selecting
            : selecting // ignore: cast_nullable_to_non_nullable
                  as RouteEndpoint?,
        candidate: freezed == candidate
            ? _self.candidate
            : candidate // ignore: cast_nullable_to_non_nullable
                  as RoutePoint?,
      ),
    );
  }

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteEndpointsCopyWith<$Res> get endpoints {
    return $RouteEndpointsCopyWith<$Res>(_self.endpoints, (value) {
      return _then(_self.copyWith(endpoints: value));
    });
  }

  /// Create a copy of RouteSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoutePointCopyWith<$Res>? get candidate {
    if (_self.candidate == null) {
      return null;
    }

    return $RoutePointCopyWith<$Res>(_self.candidate!, (value) {
      return _then(_self.copyWith(candidate: value));
    });
  }
}
