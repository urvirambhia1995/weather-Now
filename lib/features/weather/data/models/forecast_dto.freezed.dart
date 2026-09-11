// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForecastResponseDto _$ForecastResponseDtoFromJson(Map<String, dynamic> json) {
  return _ForecastResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ForecastResponseDto {
  List<ForecastItemDto> get list => throw _privateConstructorUsedError;
  CityDto get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastResponseDtoCopyWith<ForecastResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastResponseDtoCopyWith<$Res> {
  factory $ForecastResponseDtoCopyWith(
          ForecastResponseDto value, $Res Function(ForecastResponseDto) then) =
      _$ForecastResponseDtoCopyWithImpl<$Res, ForecastResponseDto>;
  @useResult
  $Res call({List<ForecastItemDto> list, CityDto city});

  $CityDtoCopyWith<$Res> get city;
}

/// @nodoc
class _$ForecastResponseDtoCopyWithImpl<$Res, $Val extends ForecastResponseDto>
    implements $ForecastResponseDtoCopyWith<$Res> {
  _$ForecastResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ForecastItemDto>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityDtoCopyWith<$Res> get city {
    return $CityDtoCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastResponseDtoImplCopyWith<$Res>
    implements $ForecastResponseDtoCopyWith<$Res> {
  factory _$$ForecastResponseDtoImplCopyWith(_$ForecastResponseDtoImpl value,
          $Res Function(_$ForecastResponseDtoImpl) then) =
      __$$ForecastResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForecastItemDto> list, CityDto city});

  @override
  $CityDtoCopyWith<$Res> get city;
}

/// @nodoc
class __$$ForecastResponseDtoImplCopyWithImpl<$Res>
    extends _$ForecastResponseDtoCopyWithImpl<$Res, _$ForecastResponseDtoImpl>
    implements _$$ForecastResponseDtoImplCopyWith<$Res> {
  __$$ForecastResponseDtoImplCopyWithImpl(_$ForecastResponseDtoImpl _value,
      $Res Function(_$ForecastResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? city = null,
  }) {
    return _then(_$ForecastResponseDtoImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ForecastItemDto>,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastResponseDtoImpl implements _ForecastResponseDto {
  const _$ForecastResponseDtoImpl(
      {required final List<ForecastItemDto> list, required this.city})
      : _list = list;

  factory _$ForecastResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastResponseDtoImplFromJson(json);

  final List<ForecastItemDto> _list;
  @override
  List<ForecastItemDto> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final CityDto city;

  @override
  String toString() {
    return 'ForecastResponseDto(list: $list, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastResponseDtoImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastResponseDtoImplCopyWith<_$ForecastResponseDtoImpl> get copyWith =>
      __$$ForecastResponseDtoImplCopyWithImpl<_$ForecastResponseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _ForecastResponseDto implements ForecastResponseDto {
  const factory _ForecastResponseDto(
      {required final List<ForecastItemDto> list,
      required final CityDto city}) = _$ForecastResponseDtoImpl;

  factory _ForecastResponseDto.fromJson(Map<String, dynamic> json) =
      _$ForecastResponseDtoImpl.fromJson;

  @override
  List<ForecastItemDto> get list;
  @override
  CityDto get city;
  @override
  @JsonKey(ignore: true)
  _$$ForecastResponseDtoImplCopyWith<_$ForecastResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastItemDto _$ForecastItemDtoFromJson(Map<String, dynamic> json) {
  return _ForecastItemDto.fromJson(json);
}

/// @nodoc
mixin _$ForecastItemDto {
  int get dt => throw _privateConstructorUsedError;
  MainDto get main => throw _privateConstructorUsedError;
  List<WeatherDescDto> get weather => throw _privateConstructorUsedError;
  WindDto get wind => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt_txt')
  String get dtTxt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastItemDtoCopyWith<ForecastItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastItemDtoCopyWith<$Res> {
  factory $ForecastItemDtoCopyWith(
          ForecastItemDto value, $Res Function(ForecastItemDto) then) =
      _$ForecastItemDtoCopyWithImpl<$Res, ForecastItemDto>;
  @useResult
  $Res call(
      {int dt,
      MainDto main,
      List<WeatherDescDto> weather,
      WindDto wind,
      @JsonKey(name: 'dt_txt') String dtTxt});

  $MainDtoCopyWith<$Res> get main;
  $WindDtoCopyWith<$Res> get wind;
}

/// @nodoc
class _$ForecastItemDtoCopyWithImpl<$Res, $Val extends ForecastItemDto>
    implements $ForecastItemDtoCopyWith<$Res> {
  _$ForecastItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dtTxt = null,
  }) {
    return _then(_value.copyWith(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
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
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$ForecastItemDtoImplCopyWith<$Res>
    implements $ForecastItemDtoCopyWith<$Res> {
  factory _$$ForecastItemDtoImplCopyWith(_$ForecastItemDtoImpl value,
          $Res Function(_$ForecastItemDtoImpl) then) =
      __$$ForecastItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dt,
      MainDto main,
      List<WeatherDescDto> weather,
      WindDto wind,
      @JsonKey(name: 'dt_txt') String dtTxt});

  @override
  $MainDtoCopyWith<$Res> get main;
  @override
  $WindDtoCopyWith<$Res> get wind;
}

/// @nodoc
class __$$ForecastItemDtoImplCopyWithImpl<$Res>
    extends _$ForecastItemDtoCopyWithImpl<$Res, _$ForecastItemDtoImpl>
    implements _$$ForecastItemDtoImplCopyWith<$Res> {
  __$$ForecastItemDtoImplCopyWithImpl(
      _$ForecastItemDtoImpl _value, $Res Function(_$ForecastItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
    Object? wind = null,
    Object? dtTxt = null,
  }) {
    return _then(_$ForecastItemDtoImpl(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
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
      dtTxt: null == dtTxt
          ? _value.dtTxt
          : dtTxt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastItemDtoImpl implements _ForecastItemDto {
  const _$ForecastItemDtoImpl(
      {required this.dt,
      required this.main,
      required final List<WeatherDescDto> weather,
      required this.wind,
      @JsonKey(name: 'dt_txt') required this.dtTxt})
      : _weather = weather;

  factory _$ForecastItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastItemDtoImplFromJson(json);

  @override
  final int dt;
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
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  @override
  String toString() {
    return 'ForecastItemDto(dt: $dt, main: $main, weather: $weather, wind: $wind, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastItemDtoImpl &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dt, main,
      const DeepCollectionEquality().hash(_weather), wind, dtTxt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastItemDtoImplCopyWith<_$ForecastItemDtoImpl> get copyWith =>
      __$$ForecastItemDtoImplCopyWithImpl<_$ForecastItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ForecastItemDto implements ForecastItemDto {
  const factory _ForecastItemDto(
          {required final int dt,
          required final MainDto main,
          required final List<WeatherDescDto> weather,
          required final WindDto wind,
          @JsonKey(name: 'dt_txt') required final String dtTxt}) =
      _$ForecastItemDtoImpl;

  factory _ForecastItemDto.fromJson(Map<String, dynamic> json) =
      _$ForecastItemDtoImpl.fromJson;

  @override
  int get dt;
  @override
  MainDto get main;
  @override
  List<WeatherDescDto> get weather;
  @override
  WindDto get wind;
  @override
  @JsonKey(name: 'dt_txt')
  String get dtTxt;
  @override
  @JsonKey(ignore: true)
  _$$ForecastItemDtoImplCopyWith<_$ForecastItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CityDto _$CityDtoFromJson(Map<String, dynamic> json) {
  return _CityDto.fromJson(json);
}

/// @nodoc
mixin _$CityDto {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityDtoCopyWith<CityDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityDtoCopyWith<$Res> {
  factory $CityDtoCopyWith(CityDto value, $Res Function(CityDto) then) =
      _$CityDtoCopyWithImpl<$Res, CityDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$CityDtoCopyWithImpl<$Res, $Val extends CityDto>
    implements $CityDtoCopyWith<$Res> {
  _$CityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityDtoImplCopyWith<$Res> implements $CityDtoCopyWith<$Res> {
  factory _$$CityDtoImplCopyWith(
          _$CityDtoImpl value, $Res Function(_$CityDtoImpl) then) =
      __$$CityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CityDtoImplCopyWithImpl<$Res>
    extends _$CityDtoCopyWithImpl<$Res, _$CityDtoImpl>
    implements _$$CityDtoImplCopyWith<$Res> {
  __$$CityDtoImplCopyWithImpl(
      _$CityDtoImpl _value, $Res Function(_$CityDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CityDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityDtoImpl implements _CityDto {
  const _$CityDtoImpl({required this.name});

  factory _$CityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityDtoImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'CityDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityDtoImplCopyWith<_$CityDtoImpl> get copyWith =>
      __$$CityDtoImplCopyWithImpl<_$CityDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityDtoImplToJson(
      this,
    );
  }
}

abstract class _CityDto implements CityDto {
  const factory _CityDto({required final String name}) = _$CityDtoImpl;

  factory _CityDto.fromJson(Map<String, dynamic> json) = _$CityDtoImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$CityDtoImplCopyWith<_$CityDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
