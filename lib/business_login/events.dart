import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final String city;
  GetWeatherEvent({required this.city});

  @override
  List<Object?> get props => [city];
}

class ResetWeather extends WeatherEvent {}