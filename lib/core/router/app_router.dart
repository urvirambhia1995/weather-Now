import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_scaffold.dart';
import '../../presentation/splash_screen.dart';
import '../../features/weather/presentation/screens/home_screen.dart';
import '../../features/weather/presentation/screens/forecast_detail_screen.dart';
import '../../features/favorites/presentation/screens/favorites_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/weather/domain/entities/forecast.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavScaffold(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'forecast',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    final forecastDay = state.extra as ForecastDay;
                    return ForecastDetailScreen(forecastDay: forecastDay);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
