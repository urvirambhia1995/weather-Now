// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForecastDay {
  Weather get summary => throw _privateConstructorUsedError;
  List<Weather> get hourly => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastDayCopyWith<ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDayCopyWith<$Res> {
  factory $ForecastDayCopyWith(
          ForecastDay value, $Res Function(ForecastDay) then) =
      _$ForecastDayCopyWithImpl<$Res, ForecastDay>;
  @useResult
  $Res call({Weather summary, List<Weather> hourly});

  $WeatherCopyWith<$Res> get summary;
}

/// @nodoc
class _$ForecastDayCopyWithImpl<$Res, $Val extends ForecastDay>
    implements $ForecastDayCopyWith<$Res> {
  _$ForecastDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? hourly = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Weather,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res> get summary {
    return $WeatherCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastDayImplCopyWith<$Res>
    implements $ForecastDayCopyWith<$Res> {
  factory _$$ForecastDayImplCopyWith(
          _$ForecastDayImpl value, $Res Function(_$ForecastDayImpl) then) =
      __$$ForecastDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Weather summary, List<Weather> hourly});

  @override
  $WeatherCopyWith<$Res> get summary;
}

/// @nodoc
class __$$ForecastDayImplCopyWithImpl<$Res>
    extends _$ForecastDayCopyWithImpl<$Res, _$ForecastDayImpl>
    implements _$$ForecastDayImplCopyWith<$Res> {
  __$$ForecastDayImplCopyWithImpl(
      _$ForecastDayImpl _value, $Res Function(_$ForecastDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? hourly = null,
  }) {
    return _then(_$ForecastDayImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as Weather,
      hourly: null == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ));
  }
}

/// @nodoc

class _$ForecastDayImpl implements _ForecastDay {
  const _$ForecastDayImpl(
      {required this.summary, required final List<Weather> hourly})
      : _hourly = hourly;

  @override
  final Weather summary;
  final List<Weather> _hourly;
  @override
  List<Weather> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  @override
  String toString() {
    return 'ForecastDay(summary: $summary, hourly: $hourly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastDayImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._hourly, _hourly));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, summary, const DeepCollectionEquality().hash(_hourly));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastDayImplCopyWith<_$ForecastDayImpl> get copyWith =>
      __$$ForecastDayImplCopyWithImpl<_$ForecastDayImpl>(this, _$identity);
}

abstract class _ForecastDay implements ForecastDay {
  const factory _ForecastDay(
      {required final Weather summary,
      required final List<Weather> hourly}) = _$ForecastDayImpl;

  @override
  Weather get summary;
  @override
  List<Weather> get hourly;
  @override
  @JsonKey(ignore: true)
  _$$ForecastDayImplCopyWith<_$ForecastDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Forecast {
  String get cityName => throw _privateConstructorUsedError;
  List<ForecastDay> get days => throw _privateConstructorUsedError;
  DateTime get fetchedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res, Forecast>;
  @useResult
  $Res call({String cityName, List<ForecastDay> days, DateTime fetchedAt});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res, $Val extends Forecast>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? days = null,
    Object? fetchedAt = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ForecastDay>,
      fetchedAt: null == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastImplCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$$ForecastImplCopyWith(
          _$ForecastImpl value, $Res Function(_$ForecastImpl) then) =
      __$$ForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityName, List<ForecastDay> days, DateTime fetchedAt});
}

/// @nodoc
class __$$ForecastImplCopyWithImpl<$Res>
    extends _$ForecastCopyWithImpl<$Res, _$ForecastImpl>
    implements _$$ForecastImplCopyWith<$Res> {
  __$$ForecastImplCopyWithImpl(
      _$ForecastImpl _value, $Res Function(_$ForecastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? days = null,
    Object? fetchedAt = null,
  }) {
    return _then(_$ForecastImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ForecastDay>,
      fetchedAt: null == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ForecastImpl implements _Forecast {
  const _$ForecastImpl(
      {required this.cityName,
      required final List<ForecastDay> days,
      required this.fetchedAt})
      : _days = days;

  @override
  final String cityName;
  final List<ForecastDay> _days;
  @override
  List<ForecastDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final DateTime fetchedAt;

  @override
  String toString() {
    return 'Forecast(cityName: $cityName, days: $days, fetchedAt: $fetchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName,
      const DeepCollectionEquality().hash(_days), fetchedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      __$$ForecastImplCopyWithImpl<_$ForecastImpl>(this, _$identity);
}

abstract class _Forecast implements Forecast {
  const factory _Forecast(
      {required final String cityName,
      required final List<ForecastDay> days,
      required final DateTime fetchedAt}) = _$ForecastImpl;

  @override
  String get cityName;
  @override
  List<ForecastDay> get days;
  @override
  DateTime get fetchedAt;
  @override
  @JsonKey(ignore: true)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
