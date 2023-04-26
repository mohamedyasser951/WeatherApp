import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/BusinessLogicLayer/events.dart';
import 'package:weather_app/BusinessLogicLayer/states.dart';
import 'package:weather_app/DataLayer/weather_repo/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherStates> {
  WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherIntialState()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final weatherModel = await WeatherRepo.getWeather(city: event.city);
        emit(WeatherSuccessState(weatherModel: weatherModel));
      } catch (e) {
        emit(WeatherErrorState());
      }
    });

    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearchState());
    });

    on<GetWeatherByLocationEvent>((event, emit) async {
      LocationPermission permission = await Geolocator.requestPermission();

      emit(WeatherLoadingState());

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      if (permission == LocationPermission.denied) {
        emit(WeatherIsNotSearchState());
     
      } else {
        final weatherModel = await WeatherRepo.getWeatherByLocation(
            lat: position.latitude, lon: position.longitude);
        emit(WeatherSuccessState(weatherModel: weatherModel));
      }
    });
  }
}
