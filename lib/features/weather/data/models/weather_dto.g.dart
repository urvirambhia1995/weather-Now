// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDtoImpl _$$WeatherDtoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDtoImpl(
      name: json['name'] as String,
      main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDescDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
    );

Map<String, dynamic> _$$WeatherDtoImplToJson(_$WeatherDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'dt': instance.dt,
    };

_$MainDtoImpl _$$MainDtoImplFromJson(Map<String, dynamic> json) =>
    _$MainDtoImpl(
      temp: json['temp'] as num,
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$$MainDtoImplToJson(_$MainDtoImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'humidity': instance.humidity,
    };

_$WeatherDescDtoImpl _$$WeatherDescDtoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDescDtoImpl(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherDescDtoImplToJson(
        _$WeatherDescDtoImpl instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$WindDtoImpl _$$WindDtoImplFromJson(Map<String, dynamic> json) =>
    _$WindDtoImpl(
      speed: json['speed'] as num,
    );

Map<String, dynamic> _$$WindDtoImplToJson(_$WindDtoImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
    };
