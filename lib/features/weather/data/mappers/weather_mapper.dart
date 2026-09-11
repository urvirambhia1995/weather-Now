import '../../domain/entities/weather.dart';
import '../../domain/entities/forecast.dart';
import '../models/weather_dto.dart';
import '../models/forecast_dto.dart';
import '../../../../core/utils/constants.dart';

class WeatherMapper {
  static Weather toEntity(WeatherDto dto, {DateTime? fetchedAt, bool isOffline = false}) {
    final timestamp = fetchedAt ?? DateTime.now();
    return Weather(
      cityName: dto.name,
      temperature: dto.main.temp.toDouble(),
      condition: dto.weather.isNotEmpty ? dto.weather.first.main : 'Unknown',
      description: dto.weather.isNotEmpty ? dto.weather.first.description : 'Unknown',
      iconUrl: dto.weather.isNotEmpty ? '${AppConstants.iconBaseUrl}/${dto.weather.first.icon}@2x.png' : '',
      humidity: dto.main.humidity,
      windSpeed: dto.wind.speed.toDouble(),
      date: DateTime.now(),
      fetchedAt: timestamp,
      isOffline: isOffline,
    );
  }

  static Forecast toForecastEntity(ForecastResponseDto dto, {DateTime? fetchedAt}) {
    final timestamp = fetchedAt ?? DateTime.now();
    final Map<String, List<Weather>> groupedByDay = {};

    for (var item in dto.list) {
      final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000, isUtc: true).toLocal();
      final dateString = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      final weather = Weather(
        cityName: dto.city.name,
        temperature: item.main.temp.toDouble(),
        condition: item.weather.isNotEmpty ? item.weather.first.main : 'Unknown',
        description: item.weather.isNotEmpty ? item.weather.first.description : 'Unknown',
        iconUrl: item.weather.isNotEmpty ? '${AppConstants.iconBaseUrl}/${item.weather.first.icon}@2x.png' : '',
        humidity: item.main.humidity,
        windSpeed: item.wind.speed.toDouble(),
        date: date,
        fetchedAt: timestamp,
      );

      if (!groupedByDay.containsKey(dateString)) {
        groupedByDay[dateString] = [];
      }
      groupedByDay[dateString]!.add(weather);
    }
    
    final List<ForecastDay> forecastDays = [];
    
    groupedByDay.forEach((key, list) {
      Weather? selected;
      for (var w in list) {
        if (w.date.hour >= 11 && w.date.hour <= 14) {
          selected = w;
          break;
        }
      }
      selected ??= list.first;
      forecastDays.add(ForecastDay(summary: selected, hourly: list));
    });

    if (forecastDays.length > 5) {
      forecastDays.removeRange(5, forecastDays.length);
    }

    return Forecast(
      cityName: dto.city.name,
      days: forecastDays,
      fetchedAt: timestamp,
    );
  }
}
