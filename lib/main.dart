import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/database/local_db.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");
  await LocalDb.init();

  runApp(
    const ProviderScope(
      child: WeatherNowApp(),
    ),
  );
}

class WeatherNowApp extends ConsumerWidget {
  const WeatherNowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'WeatherNow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
