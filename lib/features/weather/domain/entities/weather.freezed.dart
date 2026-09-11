// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  String get cityName => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get fetchedAt => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {String cityName,
      double temperature,
      String condition,
      String description,
      String iconUrl,
      int humidity,
      double windSpeed,
      DateTime date,
      DateTime fetchedAt,
      bool isOffline});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? temperature = null,
    Object? condition = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? date = null,
    Object? fetchedAt = null,
    Object? isOffline = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fetchedAt: null == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cityName,
      double temperature,
      String condition,
      String description,
      String iconUrl,
      int humidity,
      double windSpeed,
      DateTime date,
      DateTime fetchedAt,
      bool isOffline});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? temperature = null,
    Object? condition = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? date = null,
    Object? fetchedAt = null,
    Object? isOffline = null,
  }) {
    return _then(_$WeatherImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fetchedAt: null == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.cityName,
      required this.temperature,
      required this.condition,
      required this.description,
      required this.iconUrl,
      required this.humidity,
      required this.windSpeed,
      required this.date,
      required this.fetchedAt,
      this.isOffline = false});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final String cityName;
  @override
  final double temperature;
  @override
  final String condition;
  @override
  final String description;
  @override
  final String iconUrl;
  @override
  final int humidity;
  @override
  final double windSpeed;
  @override
  final DateTime date;
  @override
  final DateTime fetchedAt;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'Weather(cityName: $cityName, temperature: $temperature, condition: $condition, description: $description, iconUrl: $iconUrl, humidity: $humidity, windSpeed: $windSpeed, date: $date, fetchedAt: $fetchedAt, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cityName, temperature, condition,
      description, iconUrl, humidity, windSpeed, date, fetchedAt, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String cityName,
      required final double temperature,
      required final String condition,
      required final String description,
      required final String iconUrl,
      required final int humidity,
      required final double windSpeed,
      required final DateTime date,
      required final DateTime fetchedAt,
      final bool isOffline}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  String get cityName;
  @override
  double get temperature;
  @override
  String get condition;
  @override
  String get description;
  @override
  String get iconUrl;
  @override
  int get humidity;
  @override
  double get windSpeed;
  @override
  DateTime get date;
  @override
  DateTime get fetchedAt;
  @override
  bool get isOffline;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
