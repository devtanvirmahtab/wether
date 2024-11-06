import 'package:flutter/material.dart';
import 'package:wether/app/core/wedgets/shimmer/shimmer_base.dart';

import '../../constants/app_color.dart';
import '../../constants/app_constants.dart';

class ShimmerWidgets {
  Widget hourlyList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 24,
        padding: mainPadding(15, 0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 60,
            padding: mainPadding(3, 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.white.withOpacity(
                  0.30),
            ),
            child: ShimmerBase(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH(12),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                        gapH(10),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                        gapH(10),
                        Container(
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return gapW(12);
        },
      ),
    );
  }

}
