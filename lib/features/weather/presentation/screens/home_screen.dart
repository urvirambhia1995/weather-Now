import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/weather_controller.dart';
import '../../../favorites/presentation/controllers/favorites_controller.dart';
import '../../../settings/presentation/controllers/settings_controller.dart';
import '../../domain/entities/weather.dart';
import '../../domain/entities/forecast.dart';
import '../widgets/animated_weather_art.dart';
import '../../../../core/theme/app_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onSearch() {
    FocusScope.of(context).unfocus();
    final city = _searchController.text.trim();
    if (city.isNotEmpty) {
      _fadeController.reset();
      ref.read(weatherControllerProvider.notifier).searchCity(city);
      _fadeController.forward();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('City cannot be empty'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherControllerProvider);
    final isCelsius = ref.watch(settingsControllerProvider);
    final unit = isCelsius ? '°C' : '°F';
    final colors = context.colors;

    final currentWeather = weatherState.weather.valueOrNull;
    final isNightView = (currentWeather != null && !currentWeather.iconUrl.contains('d@')) ||
        Theme.of(context).brightness == Brightness.dark;
    final headerTextColor = isNightView ? Colors.white : colors.textPrimary;
    final headerSubtitleColor = isNightView ? Colors.white70 : colors.textSecondary;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: FadeTransition(
          opacity: _fadeAnim,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('WeatherNow',
                                  style: GoogleFonts.outfit(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: headerTextColor)),
                              Text(
                                DateFormat('EEEE, d MMM').format(DateTime.now()),
                                style: GoogleFonts.outfit(
                                    fontSize: 14,
                                    color: headerSubtitleColor),
                              ),
                            ],
                          ),
                          if (weatherState.weather.hasValue &&
                              weatherState.weather.value != null)
                            _FavoriteButton(
                                cityName:
                                    weatherState.weather.value!.cityName),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Search bar
                      _GlassSearchBar(
                        controller: _searchController,
                        onSearch: _onSearch,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              // Weather content
              SliverFillRemaining(
                hasScrollBody: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: weatherState.weather.when(
                    data: (weather) {
                      if (weather == null) {
                        return const _EmptyState();
                      }
                      return _WeatherContent(
                          weather: weather,
                          forecast: weatherState.forecast,
                          unit: unit);
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(
                          color: colors.accentLight),
                    ),
                    error: (err, stack) => _ErrorState(
                      error: err,
                      onRetry: () {
                        if (weatherState.lastSearchedCity.isNotEmpty) {
                          ref
                              .read(weatherControllerProvider.notifier)
                              .searchCity(weatherState.lastSearchedCity);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Glass Search Bar ----------
class _GlassSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const _GlassSearchBar(
      {required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: colors.glassColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.glassBorder),
          ),
          child: TextField(
            controller: controller,
            onSubmitted: (_) => onSearch(),
            style: GoogleFonts.outfit(
                color: colors.textPrimary, fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Search city...',
              hintStyle: GoogleFonts.outfit(color: colors.textHint),
              prefixIcon: Icon(Icons.search_rounded,
                  color: colors.textHint),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Clear button
                  IconButton(
                    icon: Icon(Icons.clear_rounded, color: colors.textHint),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                  // Search/arrow button
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: colors.accentLight, size: 18),
                    onPressed: onSearch,
                  ),
                ],
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Main Weather Content ----------
class _WeatherContent extends StatelessWidget {
  final Weather weather;
  final AsyncValue<Forecast?> forecast;
  final String unit;

  const _WeatherContent(
      {required this.weather,
      required this.forecast,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Big weather hero card
          _HeroWeatherCard(weather: weather, unit: unit),
          const SizedBox(height: 20),
          // Stats row
          _StatsRow(weather: weather),
          const SizedBox(height: 20),
          // Forecast strip
          _ForecastSection(forecast: forecast, unit: unit),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}

// ---------- Hero Card ----------
class _HeroWeatherCard extends StatefulWidget {
  final Weather weather;
  final String unit;

  const _HeroWeatherCard({required this.weather, required this.unit});

  @override
  State<_HeroWeatherCard> createState() => _HeroWeatherCardState();
}

class _HeroWeatherCardState extends State<_HeroWeatherCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        final dy = (1.0 - CurvedAnimation(parent: _floatController, curve: Curves.easeInOut).value) * 6.0;
        return Transform.translate(
          offset: Offset(0, dy),
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors.accent.withOpacity(0.35),
                  colors.teal.withOpacity(0.18),
                ],
              ),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: colors.glassBorder, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: colors.accent.withOpacity(0.15),
                  blurRadius: 25,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.weather.cityName,
                            style: GoogleFonts.outfit(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: colors.teal.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.weather.description.toUpperCase(),
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                letterSpacing: 1.8,
                                color: colors.teal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Animated weather graphics
                    AnimatedWeatherArt(
                      condition: widget.weather.description,
                      size: 90,
                      isDay: widget.weather.iconUrl.contains('d@'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Temperature
                Text(
                  '${widget.weather.temperature.toStringAsFixed(0)}${widget.unit}',
                  style: GoogleFonts.outfit(
                    fontSize: 92,
                    fontWeight: FontWeight.w200,
                    color: colors.textPrimary,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      colors.glassBorder,
                      Colors.transparent,
                    ]),
                  ),
                ),
                _OfflineIndicator(weather: widget.weather),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Offline Indicator Banner ----------
class _OfflineIndicator extends StatelessWidget {
  final Weather weather;

  const _OfflineIndicator({required this.weather});

  String _formatTimeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inSeconds < 30) {
      return 'just now';
    } else if (diff.inSeconds < 60) {
      return '${diff.inSeconds}s ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!weather.isOffline) return const SizedBox.shrink();

    final timeAgo = _formatTimeAgo(weather.fetchedAt);
    const redColor = Color(0xFFFF5252);
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: redColor.withOpacity(0.18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: redColor.withOpacity(0.5), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi_off_rounded, color: redColor, size: 15),
          const SizedBox(width: 6),
          Text(
            'Offline Mode • Updated $timeAgo',
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: redColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Stats Row ----------
class _StatsRow extends StatelessWidget {
  final Weather weather;

  const _StatsRow({required this.weather});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.water_drop_rounded,
            iconColor: colors.teal,
            label: 'Humidity',
            value: '${weather.humidity}%',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.air_rounded,
            iconColor: colors.accentLight,
            label: 'Wind',
            value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.iconColor,
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
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colors.glassColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.glassBorder),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: GoogleFonts.outfit(
                          fontSize: 12, color: colors.textSecondary)),
                  Text(value,
                      style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Forecast Section ----------
class _ForecastSection extends ConsumerWidget {
  final AsyncValue<Forecast?> forecast;
  final String unit;

  const _ForecastSection({required this.forecast, required this.unit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('5-Day Forecast',
            style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary)),
        const SizedBox(height: 12),
        forecast.when(
          data: (data) {
            if (data == null) return const SizedBox.shrink();
            return SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: data.days.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final day = data.days[index];
                  return GestureDetector(
                    onTap: () => context.push('/forecast', extra: day),
                    child: _ForecastCard(forecastDay: day, unit: unit),
                  );
                },
              ),
            );
          },
          loading: () => Center(
              child: CircularProgressIndicator(color: colors.accentLight)),
          error: (e, _) => Text('Error: $e',
              style: TextStyle(color: colors.textSecondary)),
        ),
      ],
    );
  }
}

class _ForecastCard extends StatelessWidget {
  final ForecastDay forecastDay;
  final String unit;

  const _ForecastCard({required this.forecastDay, required this.unit});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final day = forecastDay.summary;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF87CEEB).withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(DateFormat('EEE').format(day.date),
                  style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary)),
              if (day.iconUrl.isNotEmpty)
                Image.network(day.iconUrl, width: 46, height: 46,
                    errorBuilder: (_, __, ___) => Icon(Icons.cloud, color: Colors.grey.shade700))
              else
                Icon(Icons.cloud, color: Colors.grey.shade700),
              Text('${day.temperature.toStringAsFixed(0)}$unit',
                  style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary)),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Favorite Button ----------
class _FavoriteButton extends ConsumerStatefulWidget {
  final String cityName;

  const _FavoriteButton({required this.cityName});

  @override
  ConsumerState<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<_FavoriteButton>
    with SingleTickerProviderStateMixin {
  bool _isFav = false;
  late AnimationController _scaleCtrl;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnim = Tween(begin: 1.0, end: 1.4)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_scaleCtrl);
    _loadFav();
  }

  Future<void> _loadFav() async {
    final fav = await ref
        .read(favoritesControllerProvider.notifier)
        .isFavorite(widget.cityName);
    if (mounted) setState(() => _isFav = fav);
  }

  Future<void> _toggle() async {
    await _scaleCtrl.forward(from: 0);
    await ref
        .read(favoritesControllerProvider.notifier)
        .toggleFavorite(widget.cityName);
    await _loadFav();
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: _toggle,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isFav
                ? colors.gold.withOpacity(0.2)
                : colors.glassColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isFav ? colors.gold.withOpacity(0.6) : colors.glassBorder,
            ),
          ),
          child: Icon(
            _isFav ? Icons.star_rounded : Icons.star_border_rounded,
            color: _isFav ? colors.gold : colors.textSecondary,
            size: 22,
          ),
        ),
      ),
    );
  }
}

// ---------- Empty & Error States ----------
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: colors.glassColor,
            shape: BoxShape.circle,
            border: Border.all(color: colors.glassBorder),
          ),
          child: Icon(Icons.travel_explore_rounded,
              size: 64, color: colors.accentLight),
        ),
        const SizedBox(height: 24),
        Text('Discover Weather',
            style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary)),
        const SizedBox(height: 8),
        Text('Search for any city to get\nreal-time weather updates',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
                fontSize: 14, color: colors.textSecondary)),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  (IconData, String, String) _getErrorDetails() {
    final errStr = error.toString().toLowerCase();

    if (errStr.contains('city not found')) {
      return (
        Icons.location_off_rounded,
        'City Not Found',
        'We couldn\'t find that city. Please double-check the spelling and try again.',
      );
    } else if (errStr.contains('timeout') || errStr.contains('connection')) {
      return (
        Icons.wifi_off_rounded,
        'Connection Timeout',
        'Unable to connect to the weather service. Please check your internet connection.',
      );
    } else {
      return (
        Icons.cloud_off_rounded,
        'Unable to Fetch Weather',
        'Something went wrong while retrieving data. Please tap try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (icon, title, subtitle) = _getErrorDetails();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.glassColor,
                shape: BoxShape.circle,
                border: Border.all(color: colors.glassBorder),
              ),
              child: Icon(icon, size: 54, color: colors.accentLight),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: colors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: onRetry,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colors.accent, colors.teal],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: colors.accent.withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.refresh_rounded, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Try Again',
                      style: GoogleFonts.outfit(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
