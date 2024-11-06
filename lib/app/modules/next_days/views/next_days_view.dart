import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether/app/core/constants/app_constants.dart';
import 'package:wether/app/core/constants/app_text_style.dart';
import 'package:wether/app/core/constants/asset_constants.dart';
import 'package:wether/app/core/wedgets/horizontal_padding.dart';

import '../../../core/constants/app_color.dart';
import '../controllers/next_days_controller.dart';

class NextDaysView extends GetView<NextDaysController> {
  const NextDaysView({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.paradfd.value);
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: AppColor.bgGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  gapH(30),
                  title(),
                  gapH(30),
                  tomorrowCard(),
                  gapH(10),
                  dayList(),
                  gapH(10),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget tomorrowCard() {
    final data = controller.nextDays.value;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          gapH(20),
          HorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tomorrow',
                  style: text16Style(),
                ),
                Image.asset(
                  weatherStatusImage(data.weathercode?[1] ?? 0),
                  height: 70,
                  width: 70,
                ),
              ],
            ),
          ),
          gapH(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconText(image: icon1, text: '${data.rainSum?[1] ?? 0}mm'),
              gapW(20),
              iconText(
                  image: icon2, text: '${data.windspeed10mMax?[1] ?? 0} km/h'),
              gapW(20),
              iconText(image: icon8, text: '${data.temperature2mMax?[1] ?? 0}°C'),
            ],
          ),
          gapH(20),
        ],
      ),
    );
  }

  Widget iconText({
    required String image,
    required String text,
  }) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        gapH(8),
        Text(
          text,
          style: text16Style(),
        ),
      ],
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
        ),
        Text(
          'Next 7 Days',
          style: text18Style(
              isWeight500: true,
              color: AppColor.secondaryColor.withOpacity(0.8)),
        ),
        Container(
          width: 20,
        ),
      ],
    );
  }

  Widget dayList() {
    return ListView.separated(
      itemCount: controller.nextDays.value.time?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final data = controller.nextDays.value.temperature2mMax?[index];
        final weatherCode = controller.nextDays.value.weathercode?[index];
        final day = controller.nextDays.value.time?[index];
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dayFormat(time: day ?? DateTime.now().toString()),
                style: text16Style(),
              ),
              Row(
                children: [
                  Text(
                    '${data} °C',
                    style: text16Style(),
                  ),
                  gapW(15),
                  Image.asset(
                    weatherStatusImage(weatherCode ?? 0),
                    height: 40,
                    width: 50,
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return gapH(10);
      },
    );
  }
}
