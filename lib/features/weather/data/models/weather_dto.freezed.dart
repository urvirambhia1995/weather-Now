// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) {
  return _WeatherDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherDto {
  String get name => throw _privateConstructorUsedError;
  MainDto get main => throw _privateConstructorUsedError;
  List<WeatherDescDto> get weather => throw _privateConstructorUsedError;
  WindDto get wind => throw _privateConstructorUsedError;
  int get dt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDtoCopyWith<WeatherDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDtoCopyWith<$Res> {
  factory $WeatherDtoCopyWith(
          WeatherDto value, $Res Function(WeatherDto) then) =
      _$WeatherDtoCopyWithImpl<$Res, WeatherDto>;
  @useResult
  $Res call(
      {String name,
      MainDto main,
      List<WeatherDescDto> weather,
      WindDto wind,
      int dt});

  $MainDtoCopyWith<$Res> get main;
  $WindDtoCopyWith<$Res> get wind;
}

/// @nodoc
class _$WeatherDtoCopyWithImpl<$Res, $Val extends WeatherDto>
    implements $WeatherDtoCopyWith<$Res> {
  _$WeatherDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainDto,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescDto>,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as WindDto,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainDtoCopyWith<$Res> get main {
    return $MainDtoCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindDtoCopyWith<$Res> get wind {
    return $WindDtoCopyWith<$Res>(_value.wind, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDtoImplCopyWith<$Res>
    implements $WeatherDtoCopyWith<$Res> {
  factory _$$WeatherDtoImplCopyWith(
          _$WeatherDtoImpl value, $Res Function(_$WeatherDtoImpl) then) =
      __$$WeatherDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MainDto main,
      List<WeatherDescDto> weather,
      WindDto wind,
      int dt});

  @override
  $MainDtoCopyWith<$Res> get main;
  @override
  $WindDtoCopyWith<$Res> get wind;
}

/// @nodoc
class __$$WeatherDtoImplCopyWithImpl<$Res>
    extends _$WeatherDtoCopyWithImpl<$Res, _$WeatherDtoImpl>
    implements _$$WeatherDtoImplCopyWith<$Res> {
  __$$WeatherDtoImplCopyWithImpl(
      _$WeatherDtoImpl _value, $Res Function(_$WeatherDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dt = null,
  }) {
    return _then(_$WeatherDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainDto,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescDto>,
      wind: null == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as WindDto,
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDtoImpl implements _WeatherDto {
  const _$WeatherDtoImpl(
      {required this.name,
      required this.main,
      required final List<WeatherDescDto> weather,
      required this.wind,
      required this.dt})
      : _weather = weather;

  factory _$WeatherDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDtoImplFromJson(json);

  @override
  final String name;
  @override
  final MainDto main;
  final List<WeatherDescDto> _weather;
  @override
  List<WeatherDescDto> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final WindDto wind;
  @override
  final int dt;

  @override
  String toString() {
    return 'WeatherDto(name: $name, main: $main, weather: $weather, wind: $wind, dt: $dt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.dt, dt) || other.dt == dt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, main,
      const DeepCollectionEquality().hash(_weather), wind, dt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDtoImplCopyWith<_$WeatherDtoImpl> get copyWith =>
      __$$WeatherDtoImplCopyWithImpl<_$WeatherDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDtoImplToJson(
      this,
    );
  }
}

abstract class _WeatherDto implements WeatherDto {
  const factory _WeatherDto(
      {required final String name,
      required final MainDto main,
      required final List<WeatherDescDto> weather,
      required final WindDto wind,
      required final int dt}) = _$WeatherDtoImpl;

  factory _WeatherDto.fromJson(Map<String, dynamic> json) =
      _$WeatherDtoImpl.fromJson;

  @override
  String get name;
  @override
  MainDto get main;
  @override
  List<WeatherDescDto> get weather;
  @override
  WindDto get wind;
  @override
  int get dt;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDtoImplCopyWith<_$WeatherDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainDto _$MainDtoFromJson(Map<String, dynamic> json) {
  return _MainDto.fromJson(json);
}

/// @nodoc
mixin _$MainDto {
  num get temp => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainDtoCopyWith<MainDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDtoCopyWith<$Res> {
  factory $MainDtoCopyWith(MainDto value, $Res Function(MainDto) then) =
      _$MainDtoCopyWithImpl<$Res, MainDto>;
  @useResult
  $Res call({num temp, int humidity});
}

/// @nodoc
class _$MainDtoCopyWithImpl<$Res, $Val extends MainDto>
    implements $MainDtoCopyWith<$Res> {
  _$MainDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainDtoImplCopyWith<$Res> implements $MainDtoCopyWith<$Res> {
  factory _$$MainDtoImplCopyWith(
          _$MainDtoImpl value, $Res Function(_$MainDtoImpl) then) =
      __$$MainDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num temp, int humidity});
}

/// @nodoc
class __$$MainDtoImplCopyWithImpl<$Res>
    extends _$MainDtoCopyWithImpl<$Res, _$MainDtoImpl>
    implements _$$MainDtoImplCopyWith<$Res> {
  __$$MainDtoImplCopyWithImpl(
      _$MainDtoImpl _value, $Res Function(_$MainDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? humidity = null,
  }) {
    return _then(_$MainDtoImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainDtoImpl implements _MainDto {
  const _$MainDtoImpl({required this.temp, required this.humidity});

  factory _$MainDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainDtoImplFromJson(json);

  @override
  final num temp;
  @override
  final int humidity;

  @override
  String toString() {
    return 'MainDto(temp: $temp, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDtoImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temp, humidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDtoImplCopyWith<_$MainDtoImpl> get copyWith =>
      __$$MainDtoImplCopyWithImpl<_$MainDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainDtoImplToJson(
      this,
    );
  }
}

abstract class _MainDto implements MainDto {
  const factory _MainDto(
      {required final num temp, required final int humidity}) = _$MainDtoImpl;

  factory _MainDto.fromJson(Map<String, dynamic> json) = _$MainDtoImpl.fromJson;

  @override
  num get temp;
  @override
  int get humidity;
  @override
  @JsonKey(ignore: true)
  _$$MainDtoImplCopyWith<_$MainDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherDescDto _$WeatherDescDtoFromJson(Map<String, dynamic> json) {
  return _WeatherDescDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherDescDto {
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDescDtoCopyWith<WeatherDescDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDescDtoCopyWith<$Res> {
  factory $WeatherDescDtoCopyWith(
          WeatherDescDto value, $Res Function(WeatherDescDto) then) =
      _$WeatherDescDtoCopyWithImpl<$Res, WeatherDescDto>;
  @useResult
  $Res call({String main, String description, String icon});
}

/// @nodoc
class _$WeatherDescDtoCopyWithImpl<$Res, $Val extends WeatherDescDto>
    implements $WeatherDescDtoCopyWith<$Res> {
  _$WeatherDescDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDescDtoImplCopyWith<$Res>
    implements $WeatherDescDtoCopyWith<$Res> {
  factory _$$WeatherDescDtoImplCopyWith(_$WeatherDescDtoImpl value,
          $Res Function(_$WeatherDescDtoImpl) then) =
      __$$WeatherDescDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String main, String description, String icon});
}

/// @nodoc
class __$$WeatherDescDtoImplCopyWithImpl<$Res>
    extends _$WeatherDescDtoCopyWithImpl<$Res, _$WeatherDescDtoImpl>
    implements _$$WeatherDescDtoImplCopyWith<$Res> {
  __$$WeatherDescDtoImplCopyWithImpl(
      _$WeatherDescDtoImpl _value, $Res Function(_$WeatherDescDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$WeatherDescDtoImpl(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDescDtoImpl implements _WeatherDescDto {
  const _$WeatherDescDtoImpl(
      {required this.main, required this.description, required this.icon});

  factory _$WeatherDescDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDescDtoImplFromJson(json);

  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherDescDto(main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDescDtoImpl &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, main, description, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDescDtoImplCopyWith<_$WeatherDescDtoImpl> get copyWith =>
      __$$WeatherDescDtoImplCopyWithImpl<_$WeatherDescDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDescDtoImplToJson(
      this,
    );
  }
}

abstract class _WeatherDescDto implements WeatherDescDto {
  const factory _WeatherDescDto(
      {required final String main,
      required final String description,
      required final String icon}) = _$WeatherDescDtoImpl;

  factory _WeatherDescDto.fromJson(Map<String, dynamic> json) =
      _$WeatherDescDtoImpl.fromJson;

  @override
  String get main;
  @override
  String get description;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDescDtoImplCopyWith<_$WeatherDescDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WindDto _$WindDtoFromJson(Map<String, dynamic> json) {
  return _WindDto.fromJson(json);
}

/// @nodoc
mixin _$WindDto {
  num get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WindDtoCopyWith<WindDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindDtoCopyWith<$Res> {
  factory $WindDtoCopyWith(WindDto value, $Res Function(WindDto) then) =
      _$WindDtoCopyWithImpl<$Res, WindDto>;
  @useResult
  $Res call({num speed});
}

/// @nodoc
class _$WindDtoCopyWithImpl<$Res, $Val extends WindDto>
    implements $WindDtoCopyWith<$Res> {
  _$WindDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WindDtoImplCopyWith<$Res> implements $WindDtoCopyWith<$Res> {
  factory _$$WindDtoImplCopyWith(
          _$WindDtoImpl value, $Res Function(_$WindDtoImpl) then) =
      __$$WindDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num speed});
}

/// @nodoc
class __$$WindDtoImplCopyWithImpl<$Res>
    extends _$WindDtoCopyWithImpl<$Res, _$WindDtoImpl>
    implements _$$WindDtoImplCopyWith<$Res> {
  __$$WindDtoImplCopyWithImpl(
      _$WindDtoImpl _value, $Res Function(_$WindDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
  }) {
    return _then(_$WindDtoImpl(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WindDtoImpl implements _WindDto {
  const _$WindDtoImpl({required this.speed});

  factory _$WindDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WindDtoImplFromJson(json);

  @override
  final num speed;

  @override
  String toString() {
    return 'WindDto(speed: $speed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WindDtoImpl &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, speed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WindDtoImplCopyWith<_$WindDtoImpl> get copyWith =>
      __$$WindDtoImplCopyWithImpl<_$WindDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WindDtoImplToJson(
      this,
    );
  }
}

abstract class _WindDto implements WindDto {
  const factory _WindDto({required final num speed}) = _$WindDtoImpl;

  factory _WindDto.fromJson(Map<String, dynamic> json) = _$WindDtoImpl.fromJson;

  @override
  num get speed;
  @override
  @JsonKey(ignore: true)
  _$$WindDtoImplCopyWith<_$WindDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
