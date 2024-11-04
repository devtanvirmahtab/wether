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
          child: Column(
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
          ),
        ),
      ),
    );
  }

  Widget searchAndMenu(){
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
  
  Widget cityAndDate(){
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }

  Widget conditionAndTemperature(){
    return  Row(
      children: [
        Image.asset(cloudImage),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '19',
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
                'Rainy',
                style: text18Style(
                  isWeight500: true,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget statusCard(){
    return HorizontalPadding(
      child: Column(
        children: [
          itemCard(
            image: icon1,
            title: 'RainFall',
            value: '3cm',
          ),
          gapH(10),
          itemCard(
            image: icon2,
            title: 'Wind',
            value: '19km/h',
          ),
          gapH(10),
          itemCard(
            image: icon3,
            title: 'Humidity',
            value: '64%',
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
      child: Row(
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
            onTap: (){
              Get.toNamed(Routes.NEXT_DAYS);
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
    );
  }

  Widget hourlyList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelected = index == 2;
          return Container(
            padding:const  EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? AppColor.white:AppColor.white.withOpacity(0.30),
            ),
            child: Column(
              children: [
                Text(
                  'Now',
                  style: text14Style(),
                ),
                Image.asset(icon4),
                Text(
                  '16',
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
        itemCount: 20,
      ),
    );
  }
}
