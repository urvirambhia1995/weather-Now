import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/weather_dto.dart';
import '../models/forecast_dto.dart';

final weatherLocalDataSourceProvider = Provider<WeatherLocalDataSource>((ref) {
  return WeatherLocalDataSourceImpl();
});

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(String cityName, WeatherDto weatherToCache);
  Future<(WeatherDto, DateTime)> getLastWeather(String cityName);
  
  Future<void> cacheForecast(String cityName, ForecastResponseDto forecastToCache);
  Future<(ForecastResponseDto, DateTime)> getLastForecast(String cityName);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final Box box = Hive.box(AppConstants.weatherBox);

  @override
  Future<void> cacheWeather(String cityName, WeatherDto weatherToCache) async {
    final key = 'weather_${cityName.toLowerCase()}';
    final payload = json.encode({
      'cachedAt': DateTime.now().toIso8601String(),
      'data': weatherToCache.toJson(),
    });
    await box.put(key, payload);
  }

  @override
  Future<(WeatherDto, DateTime)> getLastWeather(String cityName) async {
    final key = 'weather_${cityName.toLowerCase()}';
    final jsonString = box.get(key);
    if (jsonString != null) {
      final decoded = json.decode(jsonString);
      if (decoded is Map<String, dynamic> && decoded.containsKey('cachedAt')) {
        final cachedAt = DateTime.parse(decoded['cachedAt'] as String);
        final dto = WeatherDto.fromJson(decoded['data'] as Map<String, dynamic>);
        return (dto, cachedAt);
      } else {
        // Fallback for older legacy cached format
        final dto = WeatherDto.fromJson(decoded as Map<String, dynamic>);
        return (dto, DateTime.now());
      }
    } else {
      throw CacheException('No cached weather found for $cityName');
    }
  }

  @override
  Future<void> cacheForecast(String cityName, ForecastResponseDto forecastToCache) async {
    final key = 'forecast_${cityName.toLowerCase()}';
    final payload = json.encode({
      'cachedAt': DateTime.now().toIso8601String(),
      'data': forecastToCache.toJson(),
    });
    await box.put(key, payload);
  }

  @override
  Future<(ForecastResponseDto, DateTime)> getLastForecast(String cityName) async {
    final key = 'forecast_${cityName.toLowerCase()}';
    final jsonString = box.get(key);
    if (jsonString != null) {
      final decoded = json.decode(jsonString);
      if (decoded is Map<String, dynamic> && decoded.containsKey('cachedAt')) {
        final cachedAt = DateTime.parse(decoded['cachedAt'] as String);
        final dto = ForecastResponseDto.fromJson(decoded['data'] as Map<String, dynamic>);
        return (dto, cachedAt);
      } else {
        final dto = ForecastResponseDto.fromJson(decoded as Map<String, dynamic>);
        return (dto, DateTime.now());
      }
    } else {
      throw CacheException('No cached forecast found for $cityName');
    }
  }
}
