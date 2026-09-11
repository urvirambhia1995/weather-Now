import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
class WeatherDto with _$WeatherDto {
  const factory WeatherDto({
    required String name,
    required MainDto main,
    required List<WeatherDescDto> weather,
    required WindDto wind,
    required int dt,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);
}

@freezed
class MainDto with _$MainDto {
  const factory MainDto({
    required num temp,
    required int humidity,
  }) = _MainDto;

  factory MainDto.fromJson(Map<String, dynamic> json) => _$MainDtoFromJson(json);
}

@freezed
class WeatherDescDto with _$WeatherDescDto {
  const factory WeatherDescDto({
    required String main,
    required String description,
    required String icon,
  }) = _WeatherDescDto;

  factory WeatherDescDto.fromJson(Map<String, dynamic> json) => _$WeatherDescDtoFromJson(json);
}

@freezed
class WindDto with _$WindDto {
  const factory WindDto({
    required num speed,
  }) = _WindDto;

  factory WindDto.fromJson(Map<String, dynamic> json) => _$WindDtoFromJson(json);
}
