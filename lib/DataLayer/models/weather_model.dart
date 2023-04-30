class WeatherModel {
  List<Weather>? weather;

  Main? main;

  int? visibility;

  Wind? wind;

  String? name;

  WeatherModel({
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.name,
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
  String? description;

  Weather(
    read, {
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }
}

class Main {
  double? temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int? pressure;
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
