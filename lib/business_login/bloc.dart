import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/repository/api_helper/weather_repo.dart';
import 'package:weather_app/repository/models/weather_model.dart';

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

///////////////////////////////////////////////////////////////
@override
abstract class WeatherStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherIsNotSearchState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final weatherModel;

  WeatherSuccessState(  {required this.weatherModel});

  // WeatherModel get getWeatherModel => weatherModel;
  @override
  List<Object?> get props => [];
}

class WeatherErrorState extends WeatherStates {}

/////////////////////////

class WeatherBloc extends Bloc<WeatherEvent, WeatherStates> {
  WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearchState()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final weatherModel =
            await WeatherRepo.getWeather(city: event.city);
        print("succcccccee");
        emit(WeatherSuccessState(weatherModel: weatherModel));
      } catch (e) {
        print(e.toString());
        emit(WeatherErrorState());
      }
    });

    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearchState());
    });
  }
}
