import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../../../core/utils/constants.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl();
});

class FavoritesRepositoryImpl implements FavoritesRepository {
  final Box<String> box = Hive.box<String>(AppConstants.favoritesBox);

  @override
  Future<List<String>> getFavorites() async {
    return box.values.toList();
  }

  @override
  Future<void> addFavorite(String cityName) async {
    final lower = cityName.toLowerCase();
    if (!box.containsKey(lower)) {
      await box.put(lower, cityName);
    }
  }

  @override
  Future<void> removeFavorite(String cityName) async {
    final lower = cityName.toLowerCase();
    await box.delete(lower);
  }

  @override
  Future<bool> isFavorite(String cityName) async {
    final lower = cityName.toLowerCase();
    return box.containsKey(lower);
  }
}
