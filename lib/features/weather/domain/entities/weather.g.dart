// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      cityName: json['cityName'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      condition: json['condition'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      fetchedAt: DateTime.parse(json['fetchedAt'] as String),
      isOffline: json['isOffline'] as bool? ?? false,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'date': instance.date.toIso8601String(),
      'fetchedAt': instance.fetchedAt.toIso8601String(),
      'isOffline': instance.isOffline,
    };
