import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/error/exceptions.dart';
import '../models/weather_dto.dart';
import '../models/forecast_dto.dart';

final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  return WeatherRemoteDataSourceImpl(ref.watch(dioProvider));
});

abstract class WeatherRemoteDataSource {
  Future<WeatherDto> getCurrentWeather(String cityName, {String units = 'metric'});
  Future<ForecastResponseDto> getForecast(String cityName, {String units = 'metric'});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl(this.dio);

  @override
  Future<WeatherDto> getCurrentWeather(String cityName, {String units = 'metric'}) async {
    try {
      final response = await dio.get('/weather', queryParameters: {
        'q': cityName,
        'units': units,
      });

      if (response.statusCode == 200) {
        return WeatherDto.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      }
      // 401 = invalid API key
      if (e.response?.statusCode == 401) {
        throw ServerException('Invalid API key. Please check your configuration.');
      }
      // 404 = city not found
      if (e.response?.statusCode == 404) {
        throw ServerException('City not found. Please try a different city name.');
      }
      throw ServerException(e.message ?? 'Server Error');
    }
  }

  @override
  Future<ForecastResponseDto> getForecast(String cityName, {String units = 'metric'}) async {
    try {
      final response = await dio.get('/forecast', queryParameters: {
        'q': cityName,
        'units': units,
      });

      if (response.statusCode == 200) {
        return ForecastResponseDto.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      }
      if (e.response?.statusCode == 401) {
        throw ServerException('Invalid API key. Please check your configuration.');
      }
      if (e.response?.statusCode == 404) {
        throw ServerException('City not found. Please try a different city name.');
      }
      throw ServerException(e.message ?? 'Server Error');
    }
  }
}
