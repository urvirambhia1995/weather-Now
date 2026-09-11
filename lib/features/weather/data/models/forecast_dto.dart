// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'weather_dto.dart';

part 'forecast_dto.freezed.dart';
part 'forecast_dto.g.dart';

@freezed
class ForecastResponseDto with _$ForecastResponseDto {
  const factory ForecastResponseDto({
    required List<ForecastItemDto> list,
    required CityDto city,
  }) = _ForecastResponseDto;

  factory ForecastResponseDto.fromJson(Map<String, dynamic> json) => _$ForecastResponseDtoFromJson(json);
}

@freezed
class ForecastItemDto with _$ForecastItemDto {
  const factory ForecastItemDto({
    required int dt,
    required MainDto main,
    required List<WeatherDescDto> weather,
    required WindDto wind,
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _ForecastItemDto;

  factory ForecastItemDto.fromJson(Map<String, dynamic> json) => _$ForecastItemDtoFromJson(json);
}

@freezed
class CityDto with _$CityDto {
  const factory CityDto({
    required String name,
  }) = _CityDto;

  factory CityDto.fromJson(Map<String, dynamic> json) => _$CityDtoFromJson(json);
}
