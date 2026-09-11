import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/forecast.dart';
import '../widgets/animated_weather_art.dart';
import '../../../settings/presentation/controllers/settings_controller.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/weather_theme_colors.dart';

class ForecastDetailScreen extends ConsumerWidget {
  final ForecastDay forecastDay;

  const ForecastDetailScreen({super.key, required this.forecastDay});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCelsius = ref.watch(settingsControllerProvider);
    final unit = isCelsius ? '°C' : '°F';
    final weather = forecastDay.summary;
    final dateStr = DateFormat('EEEE, d MMMM').format(weather.date);
    final colors = context.colors;

    final themeColors = WeatherThemeColors.fromCondition(
      weather.condition.isNotEmpty ? weather.condition : weather.description,
      date: weather.date,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Dynamic weather gradient background
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: themeColors.gradientColors,
              ),
            ),
          ),
          // Glow blobs
          Positioned(
            top: -60,
            right: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeColors.blob1,
                boxShadow: [
                  BoxShadow(
                      color: themeColors.blob1,
                      blurRadius: 80,
                      spreadRadius: 40)
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Custom back bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: colors.glassColor,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: colors.glassBorder),
                              ),
                              child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: colors.textPrimary,
                                  size: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('Forecast Detail',
                          style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: colors.textPrimary)),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main card
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                  color: colors.glassColor,
                                  borderRadius: BorderRadius.circular(32),
                                  border: Border.all(
                                      color: colors.glassBorder,
                                      width: 1.5),
                                ),
                              child: Column(
                                children: [
                                  Text(weather.cityName,
                                      style: GoogleFonts.outfit(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: colors.textPrimary)),
                                  const SizedBox(height: 4),
                                  Text(dateStr,
                                      style: GoogleFonts.outfit(
                                          fontSize: 14,
                                          color: colors.textSecondary)),
                                  const SizedBox(height: 12),
                                  AnimatedWeatherArt(
                                    condition: weather.description,
                                    size: 110,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${weather.temperature.toStringAsFixed(0)}$unit',
                                    style: GoogleFonts.outfit(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w200,
                                        color: colors.textPrimary,
                                        height: 1),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    weather.description.toUpperCase(),
                                    style: GoogleFonts.outfit(
                                        fontSize: 13,
                                        letterSpacing: 2,
                                        color: colors.teal,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Detail stats
                        Row(
                          children: [
                            Expanded(
                              child: _DetailStat(
                                icon: Icons.water_drop_rounded,
                                color: colors.teal,
                                label: 'Humidity',
                                value: '${weather.humidity}%',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _DetailStat(
                                icon: Icons.air_rounded,
                                color: colors.accentLight,
                                label: 'Wind Speed',
                                value:
                                    '${weather.windSpeed.toStringAsFixed(1)} m/s',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // 3-Hour Breakdown Header
                        Text(
                          '3-Hour Breakdown',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // 3-Hour Breakdown Horizontal List
                        SizedBox(
                          height: 135,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: forecastDay.hourly.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              final item = forecastDay.hourly[index];
                              final timeStr = DateFormat('h a').format(item.date);
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: colors.glassColor,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: colors.glassBorder),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          timeStr,
                                          style: GoogleFonts.outfit(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: colors.textPrimary,
                                          ),
                                        ),
                                        if (item.iconUrl.isNotEmpty)
                                          Image.network(
                                            item.iconUrl,
                                            width: 38,
                                            height: 38,
                                            errorBuilder: (_, __, ___) =>
                                                Icon(Icons.cloud, size: 30, color: colors.textSecondary),
                                          )
                                        else
                                          Icon(Icons.cloud, size: 30, color: colors.textSecondary),
                                        Text(
                                          '${item.temperature.toStringAsFixed(0)}$unit',
                                          style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: colors.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailStat extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _DetailStat({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colors.glassColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.glassBorder),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(label,
                  style: GoogleFonts.outfit(
                      fontSize: 12, color: colors.textSecondary)),
              const SizedBox(height: 4),
              Text(value,
                  style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary)),
            ],
          ),
        ),
      ),
    );
  }
}
