import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/repository/models/weather_model.dart';

class WeatherRepo {
  static String mainUrl =
      "https://api.openweathermap.org/data/2.5/weather?appid=52f7211ae17a13c3fbd8543942d9d473";
  static Future<WeatherModel> getWeather({ String city = "egypt"}) async {
    final String GETWEATHER = "$mainUrl&q=$city";
    
      var response = await http.Client().get(Uri.parse(GETWEATHER));
      if (response.statusCode != 200) {
        print("Error${response.statusCode}");
      } 
      var responsebody = jsonDecode(response.body);
      return WeatherModel.fromJson(responsebody);
    
  }
}
