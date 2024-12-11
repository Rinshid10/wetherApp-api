class WeatherApp {
  num? lon;
  num? lat;
  num? dt;
  String? visibility;
  Wind? wind;
  Clouds? clouds;
  Sys? sys;
  num? timezone;
  String? name;
  Main? main;

  WeatherApp({
    required this.main,
    required this.name,
    required this.timezone,
    required this.sys,
    required this.dt,
    required this.clouds,
    required this.wind,
    required this.lat,
    required this.lon,
    required this.visibility,
  });

  factory WeatherApp.fromJson(Map<String, dynamic> json) {
    return WeatherApp(
      main: Main.fromJson(json['main']),
      dt: json['dt'],
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
      name: json['name'],
      sys: Sys.fromJson(json['sys']),
      clouds: Clouds.fromJson(json['clouds']),
      timezone: json['timezone'],
      visibility: json['visibility'].toString(),
      wind: Wind.fromJson(json['wind']),
    );
  }
}

class Wind {
  num? speed;
  num? deg;
  num? gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}

class Clouds {
  num? all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Sys {
  String? country;
  num? sunrise;
  num? sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Main {
  double? temp;
  num? feels_like;
  num? pressure;
  num? humidity;

  Main({
    required this.feels_like,
    required this.humidity,
    required this.pressure,
    required this.temp,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      feels_like: json['feels_like'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      temp: json['temp'],
    );
  }
}

class Weather {
  String? main;
  Weather({required this.main});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(main: json['main']);
  }
}
