import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/settings_controller.dart';
import '../controllers/theme_controller.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCelsius = ref.watch(settingsControllerProvider);
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = themeMode == ThemeMode.dark;
    final colors = context.colors;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text('Settings',
                  style: GoogleFonts.outfit(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: colors.textPrimary)),
              Text('Customize your experience',
                  style: GoogleFonts.outfit(
                      fontSize: 14, color: colors.textSecondary)),
              const SizedBox(height: 32),

              // Section label
              Text('  UNITS',
                  style: GoogleFonts.outfit(
                      fontSize: 11,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: colors.textHint)),
              const SizedBox(height: 8),

              // Temperature unit toggle card
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colors.glassColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colors.glassBorder),
                    ),
                    child: Row(
                      children: [
                        _ToggleOption(
                          label: '°C',
                          sublabel: 'Celsius',
                          isSelected: isCelsius,
                          colors: colors,
                          onTap: () {
                            if (!isCelsius) {
                              ref
                                  .read(settingsControllerProvider.notifier)
                                  .toggleUnit();
                            }
                          },
                        ),
                        _ToggleOption(
                          label: '°F',
                          sublabel: 'Fahrenheit',
                          isSelected: !isCelsius,
                          colors: colors,
                          onTap: () {
                            if (isCelsius) {
                              ref
                                  .read(settingsControllerProvider.notifier)
                                  .toggleUnit();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Theme section label
              Text('  APPEARANCE',
                  style: GoogleFonts.outfit(
                      fontSize: 11,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: colors.textHint)),
              const SizedBox(height: 8),

              // Theme toggle card
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: colors.glassColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colors.glassBorder),
                    ),
                    child: Row(
                      children: [
                        _ToggleOption(
                          icon: Icons.light_mode_rounded,
                          sublabel: 'Light',
                          isSelected: !isDark,
                          colors: colors,
                          onTap: () {
                            if (isDark) {
                              ref
                                  .read(themeControllerProvider.notifier)
                                  .toggleTheme();
                            }
                          },
                        ),
                        _ToggleOption(
                          icon: Icons.dark_mode_rounded,
                          sublabel: 'Dark',
                          isSelected: isDark,
                          colors: colors,
                          onTap: () {
                            if (!isDark) {
                              ref
                                  .read(themeControllerProvider.notifier)
                                  .toggleTheme();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // About section
              Text('  ABOUT',
                  style: GoogleFonts.outfit(
                      fontSize: 11,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: colors.textHint)),
              const SizedBox(height: 8),

              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.glassColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: colors.glassBorder),
                    ),
                    child: Column(
                      children: [
                        _AboutTile(
                          icon: Icons.cloud_outlined,
                          title: 'Data Source',
                          value: 'OpenWeatherMap',
                          colors: colors,
                        ),
                        Divider(
                            height: 1,
                            color: colors.glassBorder,
                            indent: 56),
                        _AboutTile(
                          icon: Icons.info_outline_rounded,
                          title: 'Version',
                          value: '1.0.0',
                          colors: colors,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final String sublabel;
  final bool isSelected;
  final VoidCallback onTap;
  final AppColorScheme colors;

  const _ToggleOption({
    this.label,
    this.icon,
    required this.sublabel,
    required this.isSelected,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(colors: [
                    const Color(0xFF81D4FA).withOpacity(0.55),
                    const Color(0xFF4FC3F7).withOpacity(0.40),
                  ])
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: isSelected
                ? Border.all(color: const Color(0xFFB3E5FC), width: 1.2)
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF81D4FA).withOpacity(0.25),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                : null,
          ),
          child: Column(
            children: [
              if (label != null)
                Text(
                  label!,
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : colors.textSecondary,
                  ),
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 28,
                  color: isSelected ? Colors.white : colors.textSecondary,
                ),
              Text(
                sublabel,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? Colors.white : colors.textHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final AppColorScheme colors;

  const _AboutTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: colors.accentLight, size: 20),
          const SizedBox(width: 16),
          Text(title,
              style: GoogleFonts.outfit(
                  fontSize: 15, color: colors.textSecondary)),
          const Spacer(),
          Text(value,
              style: GoogleFonts.outfit(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary)),
        ],
      ),
    );
  }
}
