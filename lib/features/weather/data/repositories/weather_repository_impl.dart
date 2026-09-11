import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/forecast.dart';
import '../data_sources/weather_remote_data_source.dart';
import '../data_sources/weather_local_data_source.dart';
import '../mappers/weather_mapper.dart';
import '../../../../core/error/exceptions.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    remoteDataSource: ref.watch(weatherRemoteDataSourceProvider),
    localDataSource: ref.watch(weatherLocalDataSourceProvider),
  );
});

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Weather> getWeather(String cityName, {String units = 'metric'}) async {
    try {
      final remoteWeather = await remoteDataSource.getCurrentWeather(cityName, units: units);
      localDataSource.cacheWeather(cityName, remoteWeather);
      return WeatherMapper.toEntity(remoteWeather, fetchedAt: DateTime.now());
    } on NetworkException {
      try {
        final (localWeather, cachedAt) = await localDataSource.getLastWeather(cityName);
        return WeatherMapper.toEntity(localWeather, fetchedAt: cachedAt, isOffline: true);
      } on CacheException {
        throw Exception('No internet connection and no cached data available.');
      }
    } on ServerException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  @override
  Future<Forecast> getForecast(String cityName, {String units = 'metric'}) async {
    try {
      final remoteForecast = await remoteDataSource.getForecast(cityName, units: units);
      localDataSource.cacheForecast(cityName, remoteForecast);
      return WeatherMapper.toForecastEntity(remoteForecast, fetchedAt: DateTime.now());
    } on NetworkException {
      try {
        final (localForecast, cachedAt) = await localDataSource.getLastForecast(cityName);
        return WeatherMapper.toForecastEntity(localForecast, fetchedAt: cachedAt);
      } on CacheException {
        throw Exception('No internet connection and no cached data available.');
      }
    } on ServerException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
