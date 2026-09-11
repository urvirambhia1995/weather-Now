import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/favorites_controller.dart';
import '../../../weather/presentation/controllers/weather_controller.dart';
import '../../../weather/domain/entities/weather.dart';
import '../../../../core/theme/app_theme.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesControllerProvider);
    final colors = context.colors;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Favorites',
                      style: GoogleFonts.outfit(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: colors.textPrimary)),
                  Text('Your saved cities',
                      style: GoogleFonts.outfit(
                          fontSize: 14, color: colors.textSecondary)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: favoritesState.when(
                data: (weathers) {
                  if (weathers.isEmpty) {
                    return const _EmptyFavorites();
                  }
                  return ListView.builder(
                    padding:
                        const EdgeInsets.fromLTRB(20, 0, 20, 120),
                    itemCount: weathers.length,
                    itemBuilder: (context, index) {
                      final weather = weathers[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _FavoriteCard(
                          weather: weather,
                          onDismiss: () => ref
                              .read(favoritesControllerProvider.notifier)
                              .removeFavorite(weather.cityName),
                          onTap: () {
                            ref
                                .read(weatherControllerProvider.notifier)
                                .searchCity(weather.cityName);
                            context.go('/');
                          },
                        ),
                      );
                    },
                  );
                },
                loading: () => Center(
                    child: CircularProgressIndicator(
                        color: colors.accentLight)),
                error: (err, _) => Center(
                    child: Text('Error: $err',
                        style: TextStyle(
                            color: colors.textSecondary))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final Weather weather;
  final VoidCallback onDismiss;
  final VoidCallback onTap;

  const _FavoriteCard({
    required this.weather,
    required this.onDismiss,
    required this.onTap,
  });

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.colors.gradientMid,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Remove Favorite?',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
        content: Text(
          'Do you want to remove ${weather.cityName} from your saved favorites?',
          style: GoogleFonts.outfit(color: context.colors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: GoogleFonts.outfit(color: context.colors.textHint)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onDismiss();
            },
            child: Text('Remove', style: GoogleFonts.outfit(color: Colors.redAccent, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Dismissible(
      key: Key(weather.cityName),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.25),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Swipe to Remove',
              style: GoogleFonts.outfit(
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.delete_outline_rounded,
                color: Colors.redAccent, size: 28),
          ],
        ),
      ),
      onDismissed: (_) => onDismiss(),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: () => _showDeleteDialog(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors.accent.withOpacity(0.2),
                    colors.teal.withOpacity(0.08),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: colors.glassBorder),
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: weather.iconUrl.isNotEmpty
                        ? Image.network(weather.iconUrl,
                            width: 40,
                            height: 40,
                            errorBuilder: (_, __, ___) => Icon(
                                Icons.location_city,
                                color: colors.accentLight))
                        : Icon(Icons.location_city,
                            color: colors.accentLight),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(weather.cityName,
                            style: GoogleFonts.outfit(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: colors.textPrimary)),
                        Text(weather.description,
                            style: GoogleFonts.outfit(
                                fontSize: 13,
                                color: colors.textSecondary)),
                      ],
                    ),
                  ),
                  // Temp & Chevron
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${weather.temperature.toStringAsFixed(0)}°',
                        style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.w200,
                            color: colors.textPrimary),
                      ),
                      Icon(Icons.chevron_right_rounded,
                          color: colors.textHint, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: colors.glassColor,
              shape: BoxShape.circle,
              border: Border.all(color: colors.glassBorder),
            ),
            child: Icon(Icons.favorite_border_rounded,
                size: 56, color: colors.accentLight),
          ),
          const SizedBox(height: 20),
          Text('No Favorites Yet',
              style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary)),
          const SizedBox(height: 8),
          Text('Tap the ★ on any city to save it here',
              style: GoogleFonts.outfit(
                  fontSize: 14, color: colors.textSecondary)),
        ],
      ),
    );
  }
}
