import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String cityName,
    required double temperature,
    required String condition,
    required String description,
    required String iconUrl,
    required int humidity,
    required double windSpeed,
    required DateTime date,
    required DateTime fetchedAt,
    @Default(false) bool isOffline,
  }) = _Weather;
  
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
