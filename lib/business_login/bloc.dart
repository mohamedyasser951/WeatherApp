import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/business_login/events.dart';
import 'package:weather_app/business_login/states.dart';
import 'package:weather_app/repository/weather_repo/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherStates> {
  WeatherRepo weatherRepo;

  getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (permission == LocationPermission.denied) {
      emit(WeatherIsNotSearchState());
    }

    if (position != null) {
      emit(WeatherLoadingState());

      final weatherModel = await WeatherRepo.getWeatherByLocation(
          lat: position.latitude, lon: position.longitude);
      emit(WeatherSuccessState(weatherModel: weatherModel));
    }
  }

  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearchState()) {
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
  }
}
