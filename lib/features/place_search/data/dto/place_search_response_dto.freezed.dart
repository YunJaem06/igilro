// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceSearchResponseDto {
  List<PlaceDto> get places;
  List<PlaceAttributionDto> get attributions;

  /// Create a copy of PlaceSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceSearchResponseDtoCopyWith<PlaceSearchResponseDto> get copyWith =>
      _$PlaceSearchResponseDtoCopyWithImpl<PlaceSearchResponseDto>(
        this as PlaceSearchResponseDto,
        _$identity,
      );

  /// Serializes this PlaceSearchResponseDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PlaceSearchResponseDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceSearchResponseDto &&
            const DeepCollectionEquality().equals(other.places, _this.places) &&
            const DeepCollectionEquality().equals(
              other.attributions,
              _this.attributions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PlaceSearchResponseDto;
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_this.places),
      const DeepCollectionEquality().hash(_this.attributions),
    );
  }

  @override
  String toString() {
    final _this = this as PlaceSearchResponseDto;
    return 'PlaceSearchResponseDto(places: ${_this.places}, attributions: ${_this.attributions})';
  }
}

/// @nodoc
abstract mixin class $PlaceSearchResponseDtoCopyWith<$Res> {
  factory $PlaceSearchResponseDtoCopyWith(
    PlaceSearchResponseDto value,
    $Res Function(PlaceSearchResponseDto) _then,
  ) = _$PlaceSearchResponseDtoCopyWithImpl;
  @useResult
  $Res call({List<PlaceDto> places, List<PlaceAttributionDto> attributions});
}

/// @nodoc
class _$PlaceSearchResponseDtoCopyWithImpl<$Res>
    implements $PlaceSearchResponseDtoCopyWith<$Res> {
  _$PlaceSearchResponseDtoCopyWithImpl(this._self, this._then);

  final PlaceSearchResponseDto _self;
  final $Res Function(PlaceSearchResponseDto) _then;

  /// Create a copy of PlaceSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = null, Object? attributions = null}) {
    return _then(
      PlaceSearchResponseDto(
        places: null == places
            ? _self.places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<PlaceDto>,
        attributions: null == attributions
            ? _self.attributions
            : attributions // ignore: cast_nullable_to_non_nullable
                  as List<PlaceAttributionDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PlaceSearchResponseDto].
extension PlaceSearchResponseDtoPatterns on PlaceSearchResponseDto {
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
    TResult Function(_PlaceSearchResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto() when $default != null:
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
    TResult Function(_PlaceSearchResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto():
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
    TResult? Function(_PlaceSearchResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto() when $default != null:
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
      List<PlaceDto> places,
      List<PlaceAttributionDto> attributions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto() when $default != null:
        return $default(_that.places, _that.attributions);
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
      List<PlaceDto> places,
      List<PlaceAttributionDto> attributions,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto():
        return $default(_that.places, _that.attributions);
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
      List<PlaceDto> places,
      List<PlaceAttributionDto> attributions,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceSearchResponseDto() when $default != null:
        return $default(_that.places, _that.attributions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceSearchResponseDto implements PlaceSearchResponseDto {
  const _PlaceSearchResponseDto({
    required List<PlaceDto> places,
    List<PlaceAttributionDto> attributions = const [],
  }) : _places = places,
       _attributions = attributions;
  factory _PlaceSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceSearchResponseDtoFromJson(json);

  final List<PlaceDto> _places;
  @override
  List<PlaceDto> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  final List<PlaceAttributionDto> _attributions;
  @override
  @JsonKey()
  List<PlaceAttributionDto> get attributions {
    if (_attributions is EqualUnmodifiableListView) return _attributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributions);
  }

  /// Create a copy of PlaceSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceSearchResponseDtoCopyWith<_PlaceSearchResponseDto> get copyWith =>
      __$PlaceSearchResponseDtoCopyWithImpl<_PlaceSearchResponseDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceSearchResponseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceSearchResponseDto &&
            const DeepCollectionEquality().equals(other.places, _places) &&
            const DeepCollectionEquality().equals(
              other.attributions,
              _attributions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_places),
      const DeepCollectionEquality().hash(_attributions),
    );
  }

  @override
  String toString() {
    return 'PlaceSearchResponseDto(places: $places, attributions: $attributions)';
  }
}

/// @nodoc
abstract mixin class _$PlaceSearchResponseDtoCopyWith<$Res>
    implements $PlaceSearchResponseDtoCopyWith<$Res> {
  factory _$PlaceSearchResponseDtoCopyWith(
    _PlaceSearchResponseDto value,
    $Res Function(_PlaceSearchResponseDto) _then,
  ) = __$PlaceSearchResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({List<PlaceDto> places, List<PlaceAttributionDto> attributions});
}

/// @nodoc
class __$PlaceSearchResponseDtoCopyWithImpl<$Res>
    implements _$PlaceSearchResponseDtoCopyWith<$Res> {
  __$PlaceSearchResponseDtoCopyWithImpl(this._self, this._then);

  final _PlaceSearchResponseDto _self;
  final $Res Function(_PlaceSearchResponseDto) _then;

  /// Create a copy of PlaceSearchResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? places = null, Object? attributions = null}) {
    return _then(
      _PlaceSearchResponseDto(
        places: null == places
            ? _self._places
            : places // ignore: cast_nullable_to_non_nullable
                  as List<PlaceDto>,
        attributions: null == attributions
            ? _self._attributions
            : attributions // ignore: cast_nullable_to_non_nullable
                  as List<PlaceAttributionDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$PlaceAttributionDto {
  String get text;
  String? get url;

  /// Create a copy of PlaceAttributionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceAttributionDtoCopyWith<PlaceAttributionDto> get copyWith =>
      _$PlaceAttributionDtoCopyWithImpl<PlaceAttributionDto>(
        this as PlaceAttributionDto,
        _$identity,
      );

  /// Serializes this PlaceAttributionDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PlaceAttributionDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceAttributionDto &&
            (identical(other.text, _this.text) || other.text == _this.text) &&
            (identical(other.url, _this.url) || other.url == _this.url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PlaceAttributionDto;
    return Object.hash(runtimeType, _this.text, _this.url);
  }

  @override
  String toString() {
    final _this = this as PlaceAttributionDto;
    return 'PlaceAttributionDto(text: ${_this.text}, url: ${_this.url})';
  }
}

/// @nodoc
abstract mixin class $PlaceAttributionDtoCopyWith<$Res> {
  factory $PlaceAttributionDtoCopyWith(
    PlaceAttributionDto value,
    $Res Function(PlaceAttributionDto) _then,
  ) = _$PlaceAttributionDtoCopyWithImpl;
  @useResult
  $Res call({String text, String? url});
}

/// @nodoc
class _$PlaceAttributionDtoCopyWithImpl<$Res>
    implements $PlaceAttributionDtoCopyWith<$Res> {
  _$PlaceAttributionDtoCopyWithImpl(this._self, this._then);

  final PlaceAttributionDto _self;
  final $Res Function(PlaceAttributionDto) _then;

  /// Create a copy of PlaceAttributionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? url = freezed}) {
    return _then(
      PlaceAttributionDto(
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        url: freezed == url
            ? _self.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PlaceAttributionDto].
extension PlaceAttributionDtoPatterns on PlaceAttributionDto {
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
    TResult Function(_PlaceAttributionDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto() when $default != null:
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
    TResult Function(_PlaceAttributionDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto():
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
    TResult? Function(_PlaceAttributionDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto() when $default != null:
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
    TResult Function(String text, String? url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto() when $default != null:
        return $default(_that.text, _that.url);
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
    TResult Function(String text, String? url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto():
        return $default(_that.text, _that.url);
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
    TResult? Function(String text, String? url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceAttributionDto() when $default != null:
        return $default(_that.text, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceAttributionDto implements PlaceAttributionDto {
  const _PlaceAttributionDto({required this.text, this.url});
  factory _PlaceAttributionDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceAttributionDtoFromJson(json);

  @override
  final String text;
  @override
  final String? url;

  /// Create a copy of PlaceAttributionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceAttributionDtoCopyWith<_PlaceAttributionDto> get copyWith =>
      __$PlaceAttributionDtoCopyWithImpl<_PlaceAttributionDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceAttributionDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceAttributionDto &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, text, url);
  }

  @override
  String toString() {
    return 'PlaceAttributionDto(text: $text, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$PlaceAttributionDtoCopyWith<$Res>
    implements $PlaceAttributionDtoCopyWith<$Res> {
  factory _$PlaceAttributionDtoCopyWith(
    _PlaceAttributionDto value,
    $Res Function(_PlaceAttributionDto) _then,
  ) = __$PlaceAttributionDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String text, String? url});
}

/// @nodoc
class __$PlaceAttributionDtoCopyWithImpl<$Res>
    implements _$PlaceAttributionDtoCopyWith<$Res> {
  __$PlaceAttributionDtoCopyWithImpl(this._self, this._then);

  final _PlaceAttributionDto _self;
  final $Res Function(_PlaceAttributionDto) _then;

  /// Create a copy of PlaceAttributionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? text = null, Object? url = freezed}) {
    return _then(
      _PlaceAttributionDto(
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        url: freezed == url
            ? _self.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$PlaceDto {
  String get id;
  String get name;
  String get address;
  PlaceCoordinateDto get coordinate;

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceDtoCopyWith<PlaceDto> get copyWith =>
      _$PlaceDtoCopyWithImpl<PlaceDto>(this as PlaceDto, _$identity);

  /// Serializes this PlaceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PlaceDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceDto &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.address, _this.address) ||
                other.address == _this.address) &&
            (identical(other.coordinate, _this.coordinate) ||
                other.coordinate == _this.coordinate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PlaceDto;
    return Object.hash(
      runtimeType,
      _this.id,
      _this.name,
      _this.address,
      _this.coordinate,
    );
  }

  @override
  String toString() {
    final _this = this as PlaceDto;
    return 'PlaceDto(id: ${_this.id}, name: ${_this.name}, address: ${_this.address}, coordinate: ${_this.coordinate})';
  }
}

/// @nodoc
abstract mixin class $PlaceDtoCopyWith<$Res> {
  factory $PlaceDtoCopyWith(PlaceDto value, $Res Function(PlaceDto) _then) =
      _$PlaceDtoCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    PlaceCoordinateDto coordinate,
  });

  $PlaceCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class _$PlaceDtoCopyWithImpl<$Res> implements $PlaceDtoCopyWith<$Res> {
  _$PlaceDtoCopyWithImpl(this._self, this._then);

  final PlaceDto _self;
  final $Res Function(PlaceDto) _then;

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? coordinate = null,
  }) {
    return _then(
      PlaceDto(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as PlaceCoordinateDto,
      ),
    );
  }

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCoordinateDtoCopyWith<$Res> get coordinate {
    return $PlaceCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlaceDto].
extension PlaceDtoPatterns on PlaceDto {
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
    TResult Function(_PlaceDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDto() when $default != null:
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
    TResult Function(_PlaceDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDto():
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
    TResult? Function(_PlaceDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDto() when $default != null:
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
      String address,
      PlaceCoordinateDto coordinate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceDto() when $default != null:
        return $default(_that.id, _that.name, _that.address, _that.coordinate);
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
      String name,
      String address,
      PlaceCoordinateDto coordinate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDto():
        return $default(_that.id, _that.name, _that.address, _that.coordinate);
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
      String address,
      PlaceCoordinateDto coordinate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceDto() when $default != null:
        return $default(_that.id, _that.name, _that.address, _that.coordinate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceDto implements PlaceDto {
  const _PlaceDto({
    required this.id,
    required this.name,
    required this.address,
    required this.coordinate,
  });
  factory _PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final PlaceCoordinateDto coordinate;

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceDtoCopyWith<_PlaceDto> get copyWith =>
      __$PlaceDtoCopyWithImpl<_PlaceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, address, coordinate);
  }

  @override
  String toString() {
    return 'PlaceDto(id: $id, name: $name, address: $address, coordinate: $coordinate)';
  }
}

/// @nodoc
abstract mixin class _$PlaceDtoCopyWith<$Res>
    implements $PlaceDtoCopyWith<$Res> {
  factory _$PlaceDtoCopyWith(_PlaceDto value, $Res Function(_PlaceDto) _then) =
      __$PlaceDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    PlaceCoordinateDto coordinate,
  });

  @override
  $PlaceCoordinateDtoCopyWith<$Res> get coordinate;
}

/// @nodoc
class __$PlaceDtoCopyWithImpl<$Res> implements _$PlaceDtoCopyWith<$Res> {
  __$PlaceDtoCopyWithImpl(this._self, this._then);

  final _PlaceDto _self;
  final $Res Function(_PlaceDto) _then;

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? coordinate = null,
  }) {
    return _then(
      _PlaceDto(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        coordinate: null == coordinate
            ? _self.coordinate
            : coordinate // ignore: cast_nullable_to_non_nullable
                  as PlaceCoordinateDto,
      ),
    );
  }

  /// Create a copy of PlaceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCoordinateDtoCopyWith<$Res> get coordinate {
    return $PlaceCoordinateDtoCopyWith<$Res>(_self.coordinate, (value) {
      return _then(_self.copyWith(coordinate: value));
    });
  }
}

/// @nodoc
mixin _$PlaceCoordinateDto {
  double get longitude;
  double get latitude;

  /// Create a copy of PlaceCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceCoordinateDtoCopyWith<PlaceCoordinateDto> get copyWith =>
      _$PlaceCoordinateDtoCopyWithImpl<PlaceCoordinateDto>(
        this as PlaceCoordinateDto,
        _$identity,
      );

  /// Serializes this PlaceCoordinateDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as PlaceCoordinateDto;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceCoordinateDto &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as PlaceCoordinateDto;
    return Object.hash(runtimeType, _this.longitude, _this.latitude);
  }

  @override
  String toString() {
    final _this = this as PlaceCoordinateDto;
    return 'PlaceCoordinateDto(longitude: ${_this.longitude}, latitude: ${_this.latitude})';
  }
}

/// @nodoc
abstract mixin class $PlaceCoordinateDtoCopyWith<$Res> {
  factory $PlaceCoordinateDtoCopyWith(
    PlaceCoordinateDto value,
    $Res Function(PlaceCoordinateDto) _then,
  ) = _$PlaceCoordinateDtoCopyWithImpl;
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$PlaceCoordinateDtoCopyWithImpl<$Res>
    implements $PlaceCoordinateDtoCopyWith<$Res> {
  _$PlaceCoordinateDtoCopyWithImpl(this._self, this._then);

  final PlaceCoordinateDto _self;
  final $Res Function(PlaceCoordinateDto) _then;

  /// Create a copy of PlaceCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      PlaceCoordinateDto(
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

/// Adds pattern-matching-related methods to [PlaceCoordinateDto].
extension PlaceCoordinateDtoPatterns on PlaceCoordinateDto {
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
    TResult Function(_PlaceCoordinateDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaceCoordinateDto() when $default != null:
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
    TResult Function(_PlaceCoordinateDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceCoordinateDto():
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
    TResult? Function(_PlaceCoordinateDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaceCoordinateDto() when $default != null:
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
      case _PlaceCoordinateDto() when $default != null:
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
      case _PlaceCoordinateDto():
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
      case _PlaceCoordinateDto() when $default != null:
        return $default(_that.longitude, _that.latitude);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceCoordinateDto implements PlaceCoordinateDto {
  const _PlaceCoordinateDto({required this.longitude, required this.latitude});
  factory _PlaceCoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceCoordinateDtoFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;

  /// Create a copy of PlaceCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceCoordinateDtoCopyWith<_PlaceCoordinateDto> get copyWith =>
      __$PlaceCoordinateDtoCopyWithImpl<_PlaceCoordinateDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceCoordinateDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceCoordinateDto &&
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
    return 'PlaceCoordinateDto(longitude: $longitude, latitude: $latitude)';
  }
}

/// @nodoc
abstract mixin class _$PlaceCoordinateDtoCopyWith<$Res>
    implements $PlaceCoordinateDtoCopyWith<$Res> {
  factory _$PlaceCoordinateDtoCopyWith(
    _PlaceCoordinateDto value,
    $Res Function(_PlaceCoordinateDto) _then,
  ) = __$PlaceCoordinateDtoCopyWithImpl;
  @override
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$PlaceCoordinateDtoCopyWithImpl<$Res>
    implements _$PlaceCoordinateDtoCopyWith<$Res> {
  __$PlaceCoordinateDtoCopyWithImpl(this._self, this._then);

  final _PlaceCoordinateDto _self;
  final $Res Function(_PlaceCoordinateDto) _then;

  /// Create a copy of PlaceCoordinateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? longitude = null, Object? latitude = null}) {
    return _then(
      _PlaceCoordinateDto(
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
