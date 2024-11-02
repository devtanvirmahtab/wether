import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether/app/core/constants/app_text_style.dart';

import '../../../core/constants/app_color.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.bgGradient),
        child: Center(
          child: Text(
            controller.name,
            style: text20Style(
              fontSize: 32,
              letterSpacing: 5,
            ),
          ),
        ),
      ),
    );
  }
}
