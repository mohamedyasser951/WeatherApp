// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/DataLayer/models/weather_model.dart';

class WeatherRepo {
  static String apiKey = "52f7211ae17a13c3fbd8543942d9d473";
  static String mainUrl =
      "https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric";

  static Future<WeatherModel> getWeather({String city = "egypt"}) async {
    final String GETWEATHER = "$mainUrl&q=$city";

    var response = await http.Client().get(Uri.parse(GETWEATHER));
    if (response.statusCode != 200) {
      print("Error${response.statusCode}");
    }
    var responsebody = jsonDecode(response.body);
    return WeatherModel.fromJson(responsebody);
  }


  static Future<WeatherModel> getWeatherByLocation(
      {required double lat, required double lon}) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";    

    var response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print("Error${response.statusCode}");
    }
    var responsebody = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(responsebody);
    return weatherModel;
  }
}
