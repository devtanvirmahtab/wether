import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether/app/core/constants/app_text_style.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/asset_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: AppColor.bgGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Stockholm, \nSweden',
                style: text18Style(fontSize: 20),
              ),
              Text(
                'Tue, Jun 30',
                style: text12Style(
                  color: AppColor.textColor,
                ),
              ),
              Row(
                children: [
                  Image.asset(cloudImage),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
