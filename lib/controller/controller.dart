import 'package:flutter/material.dart';
import 'package:weatherapp/modal/modal.dart';
import 'package:weatherapp/services/services.dart';

class ProviderForWeather extends ChangeNotifier {
  ServicesOfApi getservices = ServicesOfApi();
  bool flagLoading = false;

  List<WeatherApp> getDatasOfweatherapp = [];
  DateTime? gettime;

  Future<void> fetchWeatherInProivider(String place) async {
    flagLoading = true;
    notifyListeners();
    try {
      gettime = DateTime.now();
      WeatherApp data = await getservices.getFecth(place);
      getDatasOfweatherapp = [data];
    } catch (e) {
      throw Exception(e);
    } finally {
      flagLoading = false;
      notifyListeners();
    }
  }
}
