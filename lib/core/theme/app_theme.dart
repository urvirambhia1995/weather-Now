import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─────────────────────────────────────────────
//  Color Scheme (runtime, not const)
// ─────────────────────────────────────────────
class AppColorScheme {
  final Color gradientTop;
  final Color gradientMid;
  final Color gradientBottom;
  final Color accent;
  final Color accentLight;
  final Color gold;
  final Color teal;
  final Color glassColor;
  final Color glassBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color blob1;
  final Color blob2;
  final Color navBarColor;
  final Color navBarIconSelected;
  final Color navBarIconUnselected;

  const AppColorScheme({
    required this.gradientTop,
    required this.gradientMid,
    required this.gradientBottom,
    required this.accent,
    required this.accentLight,
    required this.gold,
    required this.teal,
    required this.glassColor,
    required this.glassBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.blob1,
    required this.blob2,
    required this.navBarColor,
    required this.navBarIconSelected,
    required this.navBarIconUnselected,
  });

  static const dark = AppColorScheme(
    gradientTop:    Color(0xFF0A0E21),
    gradientMid:    Color(0xFF1B1F3B),
    gradientBottom: Color(0xFF0D1B4B),
    accent:         Color(0xFF6C63FF),
    accentLight:    Color(0xFF9D97FF),
    gold:           Color(0xFFFFD700),
    teal:           Color(0xFF00E5D6),
    glassColor:     Color(0x44FFFFFF),
    glassBorder:    Color(0x44FFFFFF),
    textPrimary:    Color(0xFFFFFFFF),
    textSecondary:  Color(0xAAFFFFFF),
    textHint:       Color(0x66FFFFFF),
    blob1:          Color(0x406C63FF),
    blob2:          Color(0x2600E5D6),
    navBarColor:    Color(0xEE0A0E21),
    navBarIconSelected:   Color(0xFF9D97FF), // accentLight
    navBarIconUnselected: Color(0x66FFFFFF), // textHint
  );

  static const light = AppColorScheme(
    gradientTop:    Color(0xFFEEF2FF),
    gradientMid:    Color(0xFFF8F9FF),
    gradientBottom: Color(0xFFE3E9FF),
    accent:         Color(0xFF6C63FF),
    accentLight:    Color(0xFF8880FF),
    gold:           Color(0xFFFFA000),
    teal:           Color(0xFF00ACC1),
    glassColor:     Color(0xCCFFFFFF),
    glassBorder:    Color(0x88C5CAFF),
    textPrimary:    Color(0xFF1A1A2E),
    textSecondary:  Color(0xFF4A5280),
    textHint:       Color(0xFF9AA3C0),
    blob1:          Color(0x1A6C63FF),
    blob2:          Color(0x1200ACC1),
    navBarColor:    Color(0xCC90CAF9), // Light pastel blue for day mode
    navBarIconSelected:   Color(0xFFFFFFFF), // White when selected
    navBarIconUnselected: Color(0xAAFFFFFF), // Slightly transparent white when unselected
  );
}

// Extension for easy access in any widget
extension AppColorsExtension on BuildContext {
  AppColorScheme get colors => Theme.of(this).brightness == Brightness.dark
      ? AppColorScheme.dark
      : AppColorScheme.light;
}

// ─────────────────────────────────────────────
//  ThemeData
// ─────────────────────────────────────────────
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0A0E21),
      useMaterial3: true,
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF6C63FF),
        secondary: Color(0xFF00E5D6),
        surface: Color(0xFF1B1F3B),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFEEF2FF),
      useMaterial3: true,
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6C63FF),
        secondary: Color(0xFF00ACC1),
        surface: Color(0xFFF8F9FF),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Color(0xFF1A1A2E),
      ),
    );
  }
}
