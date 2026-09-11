import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/weather_theme_colors.dart';
import '../../features/weather/presentation/controllers/weather_controller.dart';

class BottomNavScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherControllerProvider);
    final currentWeather = weatherState.weather.valueOrNull;

    final isDayAtCity = currentWeather?.iconUrl.contains('d@');

    final themeColors = WeatherThemeColors.fromCondition(
      currentWeather?.condition ?? currentWeather?.description,
      date: currentWeather?.date,
      isDay: isDayAtCity,
      iconUrl: currentWeather?.iconUrl,
    );

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Weather-adaptive animated background gradient
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
          // Dynamic weather glow blobs
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            top: -80,
            right: -60,
            child: _GlowBlob(color: themeColors.blob1, size: 260),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeInOut,
            bottom: 120,
            left: -80,
            child: _GlowBlob(color: themeColors.blob2, size: 220),
          ),
          // Main content
          navigationShell,
        ],
      ),
      bottomNavigationBar: _GlassNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowBlob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: color, blurRadius: 80, spreadRadius: 40)],
      ),
    );
  }
}

class _GlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _GlassNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: Icons.wb_sunny_rounded, label: 'Weather'),
      _NavItem(icon: Icons.favorite_rounded, label: 'Favorites'),
      _NavItem(icon: Icons.tune_rounded, label: 'Settings'),
    ];

    final colors = context.colors;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      height: 70,
      decoration: BoxDecoration(
        color: colors.navBarColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colors.glassBorder, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / items.length;
          return Stack(
            children: [
              // Animated Active Indicator Pill (Transparent position tracker for smooth icon motion)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                left: currentIndex * tabWidth + (tabWidth - 76) / 2,
                top: 8,
                width: 76,
                height: 54,
                child: const SizedBox.shrink(),
              ),
              // Tab Items
              Row(
                children: List.generate(items.length, (i) {
                  final selected = i == currentIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onTap(i),
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScale(
                            duration: const Duration(milliseconds: 250),
                            scale: selected ? 1.18 : 1.0,
                            curve: Curves.easeOutBack,
                            child: Icon(
                              items[i].icon,
                              color: selected
                                  ? colors.navBarIconSelected
                                  : colors.navBarIconUnselected,
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            items[i].label,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight:
                                  selected ? FontWeight.w700 : FontWeight.w500,
                              color: selected
                                  ? colors.navBarIconSelected
                                  : colors.navBarIconUnselected,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  _NavItem({required this.icon, required this.label});
}
