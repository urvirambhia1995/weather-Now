import 'package:flutter/material.dart';

class WeatherThemeColors {
  final List<Color> gradientColors;
  final Color blob1;
  final Color blob2;
  final Color accentColor;

  const WeatherThemeColors({
    required this.gradientColors,
    required this.blob1,
    required this.blob2,
    required this.accentColor,
  });

  // ☀️ Sunny / Clear Day
  static const sunny = WeatherThemeColors(
    gradientColors: [
      Color(0xFF2980B9),
      Color(0xFF6DD5FA),
      Color(0xFFFFFFFF),
    ],
    blob1: Color(0x60F2C94C), // Warm Sun Glow
    blob2: Color(0x4056CCF2), // Sky Blue Accent
    accentColor: Color(0xFFF2994A),
  );

  // 🌧️ Rain / Drizzle
  static const rain = WeatherThemeColors(
    gradientColors: [
      Color(0xFF0B3D91), // Deep midnight blue
      Color(0xFF09374A), // Dark slate blue
      Color(0xFF1B2631), // Very dark teal-gray
    ],
    blob1: Color(0x40303080), // Subtle dark overlay
    blob2: Color(0x30202060), // Slightly lighter dark overlay
    accentColor: Color(0xFF5A9BD4), // Muted teal accent
  );

  // ☁️ Cloudy / Overcast / Mist
  static const cloudy = WeatherThemeColors(
    gradientColors: [
      Color(0xFF2C3E50),
      Color(0xFF4CA1AF),
      Color(0xFFC4E0E5),
    ],
    blob1: Color(0x40E0EAFC),
    blob2: Color(0x30CFDEF3),
    accentColor: Color(0xFF4CA1AF),
  );

  // ⛈️ Thunderstorm
  static const storm = WeatherThemeColors(
    gradientColors: [
      Color(0xFF0F2027),
      Color(0xFF203A43),
      Color(0xFF2C5364),
    ],
    blob1: Color(0x50FFD700), // Lightning Yellow Glow
    blob2: Color(0x407B1FA2), // Purple Storm Glow
    accentColor: Color(0xFFFFD700),
  );

  // ❄️ Snowy / Winter
  static const snowy = WeatherThemeColors(
    gradientColors: [
      Color(0xFF0A1F44), // Deep night blue
      Color(0xFF1E3A5F), // Dark icy blue
      Color(0xFF5C82A9), // Frosty blue-gray
    ],
    blob1: Color(0x40FFFFFF), // Soft white overlay
    blob2: Color(0x30C0D8FF), // Light icy glow
    accentColor: Color(0xFFB3E5FC), // Light icy accent
  );

  // 🌙 Night / Clear Night
  static const night = WeatherThemeColors(
    gradientColors: [
      Color(0xFF0B0E14),
      Color(0xFF1A1F36),
      Color(0xFF0D1B4B),
    ],
    blob1: Color(0x406C63FF), // Indigo Nebula
    blob2: Color(0x3000E5D6), // Cyan Glow
    accentColor: Color(0xFF9D97FF),
  );

  // Determine theme palette based on description/icon/time
  // Night theme is now applied only when the weather description explicitly
  // mentions night (e.g., "clear night", "night", "midnight"). This ensures
  // daytime conditions such as "clear", "sunny", or "few clouds" always use the
  // appropriate day palette regardless of the current clock time.
  static WeatherThemeColors fromCondition(
    String? condition, {
    DateTime? date,
    bool? isDay,
    String? iconUrl,
  }) {
    final cond = condition?.toLowerCase() ?? '';

    // Determine night state from isDay, iconUrl, condition text, or time
    bool isNight = false;
    if (isDay != null) {
      isNight = !isDay;
    } else if (iconUrl != null && iconUrl.isNotEmpty) {
      isNight = iconUrl.contains('n@');
    } else if (cond.contains('night') || cond.contains('midnight')) {
      isNight = true;
    } else if (date != null) {
      final hour = date.toLocal().hour;
      isNight = hour >= 19 || hour < 6;
    }

    if (isNight) {
      if (cond.contains('thunderstorm') || cond.contains('lightning') || cond.contains('storm')) {
        return storm;
      } else if (cond.contains('rain') || cond.contains('drizzle') || cond.contains('shower')) {
        return rain;
      } else if (cond.contains('snow') || cond.contains('sleet') || cond.contains('blizzard')) {
        return snowy;
      }
      // Clear, cloudy, or standard nighttime -> dark night theme
      return night;
    }

    // Daytime conditions
    if (cond.contains('snow') || cond.contains('sleet') || cond.contains('blizzard') || cond.contains('flurry')) {
      return snowy;
    }
    if (cond.contains('thunderstorm') || cond.contains('lightning') || cond.contains('storm')) {
      return storm;
    } else if (cond.contains('rain') || cond.contains('drizzle') || cond.contains('shower')) {
      return rain;
    } else if (cond.contains('cloud') || cond.contains('overcast') || cond.contains('mist') || cond.contains('fog')) {
      return cloudy;
    } else {
      return sunny;
    }
  }
}
