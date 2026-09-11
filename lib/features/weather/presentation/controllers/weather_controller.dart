import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/forecast.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../../settings/presentation/controllers/settings_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherState {
  final AsyncValue<Weather?> weather;
  final AsyncValue<Forecast?> forecast;
  final String lastSearchedCity;

  WeatherState({
    required this.weather,
    required this.forecast,
    required this.lastSearchedCity,
  });

  WeatherState copyWith({
    AsyncValue<Weather?>? weather,
    AsyncValue<Forecast?>? forecast,
    String? lastSearchedCity,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      forecast: forecast ?? this.forecast,
      lastSearchedCity: lastSearchedCity ?? this.lastSearchedCity,
    );
  }
}

final weatherControllerProvider = StateNotifierProvider<WeatherController, WeatherState>((ref) {
  final repo = ref.watch(weatherRepositoryProvider);
  final isCelsius = ref.watch(settingsControllerProvider);
  return WeatherController(repo, isCelsius);
});

class WeatherController extends StateNotifier<WeatherState> {
  final WeatherRepository repository;
  final bool isCelsius;
  bool _isDisposed = false;

  WeatherController(this.repository, this.isCelsius) 
      : super(WeatherState(
          weather: const AsyncValue.data(null), 
          forecast: const AsyncValue.data(null),
          lastSearchedCity: '',
        )) {
    _loadLastSearchedCity();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> _loadLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    final city = prefs.getString('last_searched_city') ?? '';
    if (city.isNotEmpty && !_isDisposed) {
      searchCity(city);
    }
  }

  Future<void> searchCity(String cityName) async {
    if (cityName.trim().isEmpty) return;
    if (_isDisposed) return;
    
    final units = isCelsius ? 'metric' : 'imperial';

    state = state.copyWith(
      weather: const AsyncValue.loading(),
      forecast: const AsyncValue.loading(),
      lastSearchedCity: cityName,
    );

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('last_searched_city', cityName);

      final weatherResult = await repository.getWeather(cityName, units: units);
      final forecastResult = await repository.getForecast(cityName, units: units);

      if (_isDisposed) return;

      state = state.copyWith(
        weather: AsyncValue.data(weatherResult),
        forecast: AsyncValue.data(forecastResult),
      );
    } catch (e, st) {
      if (_isDisposed) return;
      state = state.copyWith(
        weather: AsyncValue.error(e, st),
        forecast: AsyncValue.error(e, st),
      );
    }
  }
}
