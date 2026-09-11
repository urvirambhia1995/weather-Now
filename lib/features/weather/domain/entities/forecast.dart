import 'package:freezed_annotation/freezed_annotation.dart';
import 'weather.dart';

part 'forecast.freezed.dart';

@freezed
class ForecastDay with _$ForecastDay {
  const factory ForecastDay({
    required Weather summary,
    required List<Weather> hourly,
  }) = _ForecastDay;
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    required String cityName,
    required List<ForecastDay> days,
    required DateTime fetchedAt,
  }) = _Forecast;
}
