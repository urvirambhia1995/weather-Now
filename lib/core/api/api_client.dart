import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/constants.dart';

// API key fallback: reads from .env but falls back to hardcoded key if not found
const _fallbackApiKey = 'aed5731054b4f4709de54b65a61823f3';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? _fallbackApiKey;
      options.queryParameters['appid'] = apiKey;
      return handler.next(options);
    },
  ));

  return dio;
});
