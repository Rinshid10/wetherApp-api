import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/modal/modal.dart';

class ServicesOfApi {
  Dio dio = Dio();
 
  Future<WeatherApp> getFecth(String place) async {
    try {
      final urlOfApi =
          'https://api.openweathermap.org/data/2.5/weather?q=$place&appid=218ebbb372884cecfd15fecc029d35cb&units=metric';
      final response = await dio.get(urlOfApi);
      if (response.statusCode == 200) {
        log(response.toString());

        return WeatherApp.fromJson(response.data);
      } else {
        throw Exception('not found data in responce');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
