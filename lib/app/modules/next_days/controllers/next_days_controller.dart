import 'package:get/get.dart';

import '../../../data/current_weather_model.dart';
import '../../home/controllers/home_controller.dart';


class NextDaysController extends GetxController {
  final nextDays = Daily().obs;
  final  paradfd = 0.obs;

  @override
  void onInit() {
    print('onInit');
    final argument = Get.arguments;
    if(argument != null){
      nextDays.value = argument['daily'];
    }
    // print(homeController.currentWeather.value.daily?.toJson().toString());
    super.onInit();
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
