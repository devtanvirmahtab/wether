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
            child: Column(
              children: [
                gapH(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
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
                        color: AppColor.secondaryColor.withOpacity(0.8)
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                  ],
                ),
                gapH(30),
                header(),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                            'Thursday',
                            style: text16Style(),
                          ),
                          Row(
                            children: [
                              Text(
                                '21',
                                style: text16Style(),
                              ),
                              gapW(15),
                              Image.asset(icon4),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return gapH(10);
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
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
                Image.asset(icon5),
              ],
            ),
          ),
          gapH(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconText(image: icon1, text: '1cm'),
              gapW(20),
              iconText(image: icon2, text: '15 km/h'),
              gapW(20),
              iconText(image: icon3, text: '50%'),
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
}
