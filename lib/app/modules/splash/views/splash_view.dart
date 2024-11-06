import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:wether/app/core/constants/app_text_style.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/asset_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.bgGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                cloudImage, // Replace with your logo path
                width: 150,
                height: 150,
              ).animate(onPlay: (controller) => controller.repeat()) // Loop animation
                  .slideY(begin: -0.1, end: 0.1, duration: 1000.ms, curve: Curves.easeInOut), // Move up and down
            ),
            Center(
              child: Text(
                controller.name,
                style: text20Style(
                  fontSize: 32,
                  letterSpacing: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
