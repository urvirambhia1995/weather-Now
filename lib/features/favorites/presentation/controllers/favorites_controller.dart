import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../data/repositories/favorites_repository_impl.dart'; // To expose provider
import '../../../weather/domain/repositories/weather_repository.dart';
import '../../../weather/data/repositories/weather_repository_impl.dart'; // To expose provider
import '../../../settings/presentation/controllers/settings_controller.dart';
import '../../../weather/domain/entities/weather.dart';

final favoritesControllerProvider = StateNotifierProvider<FavoritesController, AsyncValue<List<Weather>>>((ref) {
  final favRepo = ref.watch(favoritesRepositoryProvider);
  final weatherRepo = ref.watch(weatherRepositoryProvider);
  final isCelsius = ref.watch(settingsControllerProvider);
  return FavoritesController(favRepo, weatherRepo, isCelsius);
});

class FavoritesController extends StateNotifier<AsyncValue<List<Weather>>> {
  final FavoritesRepository favRepo;
  final WeatherRepository weatherRepo;
  final bool isCelsius;

  FavoritesController(this.favRepo, this.weatherRepo, this.isCelsius) : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();
    try {
      final units = isCelsius ? 'metric' : 'imperial';
      final cities = await favRepo.getFavorites();
      
      List<Weather> weathers = [];
      for (var city in cities) {
        try {
          final weather = await weatherRepo.getWeather(city, units: units);
          weathers.add(weather);
        } catch (_) {
          // Skip or handle error for individual city
        }
      }
      state = AsyncValue.data(weathers);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> toggleFavorite(String cityName) async {
    final isFav = await favRepo.isFavorite(cityName);
    if (isFav) {
      await favRepo.removeFavorite(cityName);
    } else {
      await favRepo.addFavorite(cityName);
    }
    await loadFavorites();
  }

  Future<bool> isFavorite(String cityName) async {
    return favRepo.isFavorite(cityName);
  }

  Future<void> removeFavorite(String cityName) async {
    await favRepo.removeFavorite(cityName);
    await loadFavorites();
  }
}
