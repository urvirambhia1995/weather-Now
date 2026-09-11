// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastResponseDtoImpl _$$ForecastResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ForecastResponseDtoImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => ForecastItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityDto.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForecastResponseDtoImplToJson(
        _$ForecastResponseDtoImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };

_$ForecastItemDtoImpl _$$ForecastItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ForecastItemDtoImpl(
      dt: (json['dt'] as num).toInt(),
      main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDescDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$$ForecastItemDtoImplToJson(
        _$ForecastItemDtoImpl instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'dt_txt': instance.dtTxt,
    };

_$CityDtoImpl _$$CityDtoImplFromJson(Map<String, dynamic> json) =>
    _$CityDtoImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CityDtoImplToJson(_$CityDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
