import 'package:get/get.dart';

import '../controllers/next_days_controller.dart';

class NextDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NextDaysController>(
      () => NextDaysController(),
    );
  }
}
