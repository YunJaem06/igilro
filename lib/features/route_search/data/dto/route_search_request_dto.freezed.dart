// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_search_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteSearchRequestDto {
  RouteCoordinateDto get origin;
  RouteCoordinateDto get destination;
  String get departureAt;
  String get travelMode;
  String get mode;

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteSearchRequestDtoCopyWith<RouteSearchRequestDto> get copyWith =>
      _$RouteSearchRequestDtoCopyWithImpl<RouteSearchRequestDto>(
        this as RouteSearchRequestDto,
        _$identity,
      );

  /// Serializes this RouteSearchRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteSearchRequestDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteSearchRequestDto &&
            (identical(other.origin, _this.origin) ||
                other.origin == _this.origin) &&
            (identical(other.destination, _this.destination) ||
                other.destination == _this.destination) &&
            (identical(other.departureAt, _this.departureAt) ||
                other.departureAt == _this.departureAt) &&
            (identical(other.travelMode, _this.travelMode) ||
                other.travelMode == _this.travelMode) &&
            (identical(other.mode, _this.mode) || other.mode == _this.mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteSearchRequestDto;
    return Object.hash(
      runtimeType,
      _this.origin,
      _this.destination,
      _this.departureAt,
      _this.travelMode,
      _this.mode,
    );
  }

  @override
  String toString() {
    final _this = this as RouteSearchRequestDto;
    return 'RouteSearchRequestDto(origin: ${_this.origin}, destination: ${_this.destination}, departureAt: ${_this.departureAt}, travelMode: ${_this.travelMode}, mode: ${_this.mode})';
  }
}

/// @nodoc
abstract mixin class $RouteSearchRequestDtoCopyWith<$Res> {
  factory $RouteSearchRequestDtoCopyWith(
    RouteSearchRequestDto value,
    $Res Function(RouteSearchRequestDto) _then,
  ) = _$RouteSearchRequestDtoCopyWithImpl;
  @useResult
  $Res call({
    RouteCoordinateDto origin,
    RouteCoordinateDto destination,
    String departureAt,
    String travelMode,
    String mode,
  });

  $RouteCoordinateDtoCopyWith<$Res> get origin;
  $RouteCoordinateDtoCopyWith<$Res> get destination;
}

/// @nodoc
class _$RouteSearchRequestDtoCopyWithImpl<$Res>
    implements $RouteSearchRequestDtoCopyWith<$Res> {
  _$RouteSearchRequestDtoCopyWithImpl(this._self, this._then);

  final RouteSearchRequestDto _self;
  final $Res Function(RouteSearchRequestDto) _then;

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? departureAt = null,
    Object? travelMode = null,
    Object? mode = null,
  }) {
    return _then(
      RouteSearchRequestDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        departureAt: null == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as String,
        travelMode: null == travelMode
            ? _self.travelMode
            : travelMode // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get origin {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get destination {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RouteSearchRequestDto].
extension RouteSearchRequestDtoPatterns on RouteSearchRequestDto {
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
    TResult Function(_RouteSearchRequestDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto() when $default != null:
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
    TResult Function(_RouteSearchRequestDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto():
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
    TResult? Function(_RouteSearchRequestDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto() when $default != null:
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
      RouteCoordinateDto origin,
      RouteCoordinateDto destination,
      String departureAt,
      String travelMode,
      String mode,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
          _that.departureAt,
          _that.travelMode,
          _that.mode,
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
      RouteCoordinateDto origin,
      RouteCoordinateDto destination,
      String departureAt,
      String travelMode,
      String mode,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto():
        return $default(
          _that.origin,
          _that.destination,
          _that.departureAt,
          _that.travelMode,
          _that.mode,
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
      RouteCoordinateDto origin,
      RouteCoordinateDto destination,
      String departureAt,
      String travelMode,
      String mode,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteSearchRequestDto() when $default != null:
        return $default(
          _that.origin,
          _that.destination,
          _that.departureAt,
          _that.travelMode,
          _that.mode,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RouteSearchRequestDto implements RouteSearchRequestDto {
  const _RouteSearchRequestDto({
    required this.origin,
    required this.destination,
    required this.departureAt,
    this.travelMode = 'walking',
    this.mode = 'fastest',
  });
  factory _RouteSearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RouteSearchRequestDtoFromJson(json);

  @override
  final RouteCoordinateDto origin;
  @override
  final RouteCoordinateDto destination;
  @override
  final String departureAt;
  @override
  @JsonKey()
  final String travelMode;
  @override
  @JsonKey()
  final String mode;

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteSearchRequestDtoCopyWith<_RouteSearchRequestDto> get copyWith =>
      __$RouteSearchRequestDtoCopyWithImpl<_RouteSearchRequestDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$RouteSearchRequestDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteSearchRequestDto &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.departureAt, departureAt) ||
                other.departureAt == departureAt) &&
            (identical(other.travelMode, travelMode) ||
                other.travelMode == travelMode) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      origin,
      destination,
      departureAt,
      travelMode,
      mode,
    );
  }

  @override
  String toString() {
    return 'RouteSearchRequestDto(origin: $origin, destination: $destination, departureAt: $departureAt, travelMode: $travelMode, mode: $mode)';
  }
}

/// @nodoc
abstract mixin class _$RouteSearchRequestDtoCopyWith<$Res>
    implements $RouteSearchRequestDtoCopyWith<$Res> {
  factory _$RouteSearchRequestDtoCopyWith(
    _RouteSearchRequestDto value,
    $Res Function(_RouteSearchRequestDto) _then,
  ) = __$RouteSearchRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    RouteCoordinateDto origin,
    RouteCoordinateDto destination,
    String departureAt,
    String travelMode,
    String mode,
  });

  @override
  $RouteCoordinateDtoCopyWith<$Res> get origin;
  @override
  $RouteCoordinateDtoCopyWith<$Res> get destination;
}

/// @nodoc
class __$RouteSearchRequestDtoCopyWithImpl<$Res>
    implements _$RouteSearchRequestDtoCopyWith<$Res> {
  __$RouteSearchRequestDtoCopyWithImpl(this._self, this._then);

  final _RouteSearchRequestDto _self;
  final $Res Function(_RouteSearchRequestDto) _then;

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? departureAt = null,
    Object? travelMode = null,
    Object? mode = null,
  }) {
    return _then(
      _RouteSearchRequestDto(
        origin: null == origin
            ? _self.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        destination: null == destination
            ? _self.destination
            : destination // ignore: cast_nullable_to_non_nullable
                  as RouteCoordinateDto,
        departureAt: null == departureAt
            ? _self.departureAt
            : departureAt // ignore: cast_nullable_to_non_nullable
                  as String,
        travelMode: null == travelMode
            ? _self.travelMode
            : travelMode // ignore: cast_nullable_to_non_nullable
                  as String,
        mode: null == mode
            ? _self.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get origin {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.origin, (value) {
      return _then(_self.copyWith(origin: value));
    });
  }

  /// Create a copy of RouteSearchRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<$Res> get destination {
    return $RouteCoordinateDtoCopyWith<$Res>(_self.destination, (value) {
      return _then(_self.copyWith(destination: value));
    });
  }
}

/// @nodoc
mixin _$RouteCoordinateDto {
  double get longitude;
  double get latitude;

  /// Create a copy of RouteCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RouteCoordinateDtoCopyWith<RouteCoordinateDto> get copyWith =>
      _$RouteCoordinateDtoCopyWithImpl<RouteCoordinateDto>(
        this as RouteCoordinateDto,
        _$identity,
      );

  /// Serializes this RouteCoordinateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as RouteCoordinateDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RouteCoordinateDto &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as RouteCoordinateDto;
    return Object.hash(runtimeType, _this.longitude, _this.latitude);
  }

  @override
  String toString() {
    final _this = this as RouteCoordinateDto;
    return 'RouteCoordinateDto(longitude: ${_this.longitude}, latitude: ${_this.latitude})';
  }
}

/// @nodoc
abstract mixin class $RouteCoordinateDtoCopyWith<$Res> {
  factory $RouteCoordinateDtoCopyWith(
    RouteCoordinateDto value,
    $Res Function(RouteCoordinateDto) _then,
  ) = _$RouteCoordinateDtoCopyWithImpl;
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$RouteCoordinateDtoCopyWithImpl<$Res>
    implements $RouteCoordinateDtoCopyWith<$Res> {
  _$RouteCoordinateDtoCopyWithImpl(this._self, this._then);

  final RouteCoordinateDto _self;
  final $Res Function(RouteCoordinateDto) _then;

  /// Create a copy of RouteCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      RouteCoordinateDto(
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

/// Adds pattern-matching-related methods to [RouteCoordinateDto].
extension RouteCoordinateDtoPatterns on RouteCoordinateDto {
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
    TResult Function(_RouteCoordinateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RouteCoordinateDto() when $default != null:
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
    TResult Function(_RouteCoordinateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCoordinateDto():
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
    TResult? Function(_RouteCoordinateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RouteCoordinateDto() when $default != null:
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
      case _RouteCoordinateDto() when $default != null:
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
      case _RouteCoordinateDto():
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
      case _RouteCoordinateDto() when $default != null:
        return $default(_that.longitude, _that.latitude);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RouteCoordinateDto implements RouteCoordinateDto {
  const _RouteCoordinateDto({required this.longitude, required this.latitude});
  factory _RouteCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$RouteCoordinateDtoFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;

  /// Create a copy of RouteCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RouteCoordinateDtoCopyWith<_RouteCoordinateDto> get copyWith =>
      __$RouteCoordinateDtoCopyWithImpl<_RouteCoordinateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RouteCoordinateDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouteCoordinateDto &&
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
    return 'RouteCoordinateDto(longitude: $longitude, latitude: $latitude)';
  }
}

/// @nodoc
abstract mixin class _$RouteCoordinateDtoCopyWith<$Res>
    implements $RouteCoordinateDtoCopyWith<$Res> {
  factory _$RouteCoordinateDtoCopyWith(
    _RouteCoordinateDto value,
    $Res Function(_RouteCoordinateDto) _then,
  ) = __$RouteCoordinateDtoCopyWithImpl;
  @override
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$RouteCoordinateDtoCopyWithImpl<$Res>
    implements _$RouteCoordinateDtoCopyWith<$Res> {
  __$RouteCoordinateDtoCopyWithImpl(this._self, this._then);

  final _RouteCoordinateDto _self;
  final $Res Function(_RouteCoordinateDto) _then;

  /// Create a copy of RouteCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      _RouteCoordinateDto(
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
