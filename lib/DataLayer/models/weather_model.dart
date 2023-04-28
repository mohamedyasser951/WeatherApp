import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class WeatherModel {
  List<Weather>? weather;
  Main? main;
  @HiveField(4)
  int? visibility;
  Wind? wind;

  @HiveField(0)
  String? name;

  WeatherModel({
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.name,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;

    name = json['name'];
  }
}

class Weather {
  @HiveField(1)
  String? description;

  Weather({
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }
}

class Main {
  @HiveField(2)
  double? temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int? pressure;
  @HiveField(5)
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  double get getTemp => temp! - 272.5;
  double get getMaxTemp => tempMax! - 272.5;
  double get getMinTemp => tempMin! - 272.5;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }
}

class Wind {
  @HiveField(3)
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}
