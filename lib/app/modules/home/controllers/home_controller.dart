import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:wether/app/core/constants/app_constants.dart';
import 'package:wether/app/core/constants/app_text_style.dart';
import 'package:wether/app/network/api_client.dart';

import '../../../core/constants/app_color.dart';
import '../../../data/current_weather_model.dart';
import '../../../network/api_endpoints.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var weatherInfo = 'Loading weather data...'.obs;
  final Location location = Location();
  final Dio dio = Dio();
  final currentWeather = CurrentWeatherModel().obs;
  final loading = true.obs;
  var tempCount = 0.obs;
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    loading.value = true;

    var permissionStatus = await ph.Permission.location.status;
    if (permissionStatus.isGranted) {
      await _fetchWeather();
    } else if (permissionStatus.isDenied) {
      if (Get.isDialogOpen ?? false) Get.back();
      permissionStatus = await ph.Permission.location.request();

      if (permissionStatus.isGranted) {
        await _fetchWeather();
      } else {
        weatherInfo.value = 'Location permission denied.';
        loading.value = false;
        showFullScreenDialog(Get.context!);
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      if (Get.isDialogOpen ?? false) Get.back();
      weatherInfo.value = 'Location permission is permanently denied. Please enable it in settings.';
      loading.value = false;
      showFullScreenDialog(Get.context!);
      await ph.openAppSettings();
    }
  }

  Future<void> _fetchWeather() async {
    final userLocation = await location.getLocation();
    final queryParameters = <String,dynamic>{
      'latitude': userLocation.latitude,
      'longitude': userLocation.longitude,
      'current':
      'temperature_2m,relative_humidity_2m,is_day,rain,showers,snowfall,cloud_cover,wind_speed_10m,weather_code',
      'hourly': 'temperature_2m,weather_code',
      'daily': 'temperature_2m_max,weathercode,windspeed_10m_max,rain_sum'
    };

    var response = await ApiClient().getAPI(
      forecastUrl,
      _fetchWeather,
      mQueryParameters: queryParameters,
    );

    loading.value = false;
    if (response != null) {
      currentWeather.value = currentWeatherModelFromJson(response.toString());
      tempCount.value =
          (currentWeather.value.current?.temperature2m ?? 0).floor();
      animation = IntTween(begin: 0, end: tempCount.value).animate(controller)
        ..addListener(() {
          tempCount.value =
              animation.value; // Update fetchedData during animation
        });

      controller.forward(from: 0.0);
    }
  }

  void showFullScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero, // Remove default padding
          backgroundColor: Colors.transparent, // Transparent background
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColor.bgGradient,
            ),
            padding: mainPadding(20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weatherInfo.value,
                  style: text20Style(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                gapH(20),
                Text(
                  "something went wrong, please try again.",
                  textAlign: TextAlign.center,
                  style: text18Style(),
                ),
                gapH(20),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    fetchWeatherData();
                  },
                  child: Text("Retry Again",style: text16Style(),),
                ),
              ],
            ),
          ),
        );
      },
    );
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
