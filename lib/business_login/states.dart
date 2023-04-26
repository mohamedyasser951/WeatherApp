import 'package:equatable/equatable.dart';
import 'package:weather_app/repository/models/weather_model.dart';

@override
abstract class WeatherStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherIsNotSearchState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
 final WeatherModel weatherModel;

  WeatherSuccessState(  {required this.weatherModel});

  // WeatherModel get getWeatherModel => weatherModel;
  @override
  List<Object?> get props => [];
}

class WeatherErrorState extends WeatherStates {}
