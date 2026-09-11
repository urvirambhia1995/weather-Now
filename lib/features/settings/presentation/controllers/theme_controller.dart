import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  return ThemeController();
});

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.dark) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('is_dark_theme') ?? true;
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_dark_theme', mode == ThemeMode.dark);
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setTheme(newMode);
  }

  bool get isDark => state == ThemeMode.dark;
}
