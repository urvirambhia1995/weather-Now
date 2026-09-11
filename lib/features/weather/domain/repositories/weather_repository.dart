import '../entities/weather.dart';
import '../entities/forecast.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String cityName, {String units = 'metric'});
  Future<Forecast> getForecast(String cityName, {String units = 'metric'});
}
