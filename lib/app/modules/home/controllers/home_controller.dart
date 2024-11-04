import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  var weatherInfo = 'Loading weather data...'.obs;
  final Location location = Location();
  final Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.granted) {
      try {
        final userLocation = await location.getLocation();
        final weatherData = await _fetchWeather(userLocation.latitude!, userLocation.longitude!);
        weatherInfo.value = 'Temperature: ${weatherData['temperature']}°C';
      } catch (e) {
        weatherInfo.value = 'Failed to fetch weather data.';
      }
    } else {
      weatherInfo.value = 'Location permission denied.';
    }
  }

  Future<Map<String, dynamic>> _fetchWeather(double latitude, double longitude) async {
    print('_fetchWeather');
    final response = await dio.get(
      'https://api.open-meteo.com/v1/forecast',
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'current_weather': true,
      },
    );
    print(response.toString());
    return response.data['current_weather'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
