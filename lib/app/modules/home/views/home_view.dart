import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wether/app/core/constants/app_text_style.dart';
import 'package:wether/app/core/wedgets/horizontal_padding.dart';
import 'package:wether/app/routes/app_pages.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_constants.dart';
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
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                gapH(40),
                searchAndMenu(),
                gapH(20),
                cityAndDate(),
                gapH(20),
                conditionAndTemperature(),
                gapH(20),
                statusCard(),
                gapH(20),
                hourlyTitle(),
                gapH(20),
                hourlyList(),
                gapH(20),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget searchAndMenu() {
    return HorizontalPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(searchIcon),
          Image.asset(menuIcon),
        ],
      ),
    );
  }

  Widget cityAndDate() {
    final data = controller.currentWeather.value.current;
    print(controller.currentWeather.value.toJson());
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.isDay == 0 ? 'Night' : 'Day',
            style: text18Style(fontSize: 20),
          ),
          Text(
            formatDate(time: data?.time ?? DateTime.now().toString()),
            style: text12Style(
              color: AppColor.textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget conditionAndTemperature() {
    final data = controller.currentWeather.value.current;
    return Row(
      children: [
        Image.asset(cloudImage),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${(data?.temperature2m ?? 0).floor()}',
                    style: text20Style(
                        fontSize: 60,
                        color: AppColor.textColor1
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '°C',
                      style: text16Style(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  weatherStatus(data?.weatherCode ?? 0),
                  style: text18Style(
                    isWeight500: true,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget statusCard() {
    final data = controller.currentWeather.value.current;
    return HorizontalPadding(
      child: Column(
        children: [
          itemCard(
            image: icon1,
            title: 'RainFall',
            value: '${data?.rain ?? 0}mm',
          ),
          gapH(10),
          itemCard(
            image: icon2,
            title: 'Wind',
            value: '${data?.windSpeed10m ?? 0}km/h',
          ),
          gapH(10),
          itemCard(
            image: icon3,
            title: 'Humidity',
            value: '${data?.relativeHumidity2m ?? 0}%',
          ),
        ],
      ),
    );
  }

  Widget itemCard({
    required String image,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.45),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
              gapW(15),
              Text(
                title,
                style: text14Style(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              value,
              style: text14Style(),
            ),
          ),
        ],
      ),
    );
  }

  Widget hourlyTitle() {
    return HorizontalPadding(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Today',
                    style: text16Style(
                      fontSize: 18,
                      isWeight600: true,
                    ),
                  ),
                  gapW(25),
                  Text(
                    'Tomorrow',
                    style: text16Style(
                      color: AppColor.textColor1.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.NEXT_DAYS,arguments: {
                    'daily':controller.currentWeather.value.daily,
                  });
                },
                child: Row(
                  children: [
                    Text(
                      'Next 7 Days',
                      style: text16Style(
                        color: AppColor.textColor1.withOpacity(0.6),
                      ),
                    ),
                    gapW(10),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.textColor1.withOpacity(0.6),
                    )
                  ],
                ),
              ),
            ],
          ),
          gapH(15),
          SizedBox(
            height: 10,
            width: double.infinity,
            child: Stack(
              children: [
                Divider(color: AppColor.textColor1.withOpacity(0.6),),
                Positioned(
                  left: 15,
                  child: Container(
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hourlyList() {
    final data = controller.currentWeather.value.hourly;
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: (data?.time?.length ?? 0) > 24 ? 24 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final temperature = data?.temperature2m?[index];
          final weatherCode = data?.weatherCode?[index];
          final time = controller.currentWeather.value.hourly?.time?[index];
          final selected = isSelected(time: time ?? DateTime.now().toString());
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: selected ? AppColor.white : AppColor.white.withOpacity(
                  0.30),
            ),
            child: Column(
              children: [
                Text(
                  selected ? 'Now': timeDate(time: time ?? DateTime.now().toString()),
                  style: text14Style(),
                ),
                Image.asset(weatherStatusImage(weatherCode ?? 0),height: 30,width: 30,),
                Text(
                  '${ temperature ?? 0 }',
                  style: text16Style(
                    isWeight600: true,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return gapW(15);
        },
      ),
    );
  }
}
