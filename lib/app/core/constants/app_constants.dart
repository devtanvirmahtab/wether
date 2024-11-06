import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'asset_constants.dart';

Widget gapH(double height){
  return SizedBox(
    height: height,
  );
}

Widget gapW(double width){
  return SizedBox(
    width: width,
  );
}

EdgeInsetsGeometry mainPadding(
    double leftRight,
    double topBottom, {
      double? leftPadding,
      double? rightPadding,
      double? topPadding,
      double? bottomPadding,
    }) {
  return EdgeInsets.only(
    left: (leftPadding ?? leftRight),
    right: (rightPadding ?? leftRight),
    top: (topPadding ?? topBottom),
    bottom: (bottomPadding ?? topBottom),
  );
}

String formatDate({required String time}){
  DateTime gmtTime = DateTime.parse(time).toUtc();
  DateTime bangladeshTime = gmtTime.add(const Duration(hours: 6));
  DateTime localTime = bangladeshTime.toLocal();
  return DateFormat.yMMMEd().format(localTime);
}

String timeDate({required String time}){
  DateTime gmtTime = DateTime.parse(time).toUtc();
  DateTime bangladeshTime = gmtTime.add(const Duration(hours: 6));
  DateTime localTime = bangladeshTime.toLocal();
  return DateFormat.Hm().format(localTime);
}

bool isSelected({required String time}){
  DateTime gmtTime = DateTime.parse(time).toUtc();
  DateTime bangladeshTime = gmtTime.add(const Duration(hours: 6));
  DateTime localTime = bangladeshTime.toLocal();
  return localTime.hour == DateTime.now().hour;
}

String dayFormat({required String time}){
  DateTime gmtTime = DateTime.parse(time).toUtc();
  DateTime bangladeshTime = gmtTime.add(const Duration(hours: 6));
  DateTime localTime = bangladeshTime.toLocal();
  return DateFormat.EEEE().format(localTime);
}



String weatherStatus(int weatherCode) {
  String weatherCondition = '';
  switch (weatherCode) {
    case 0:
      weatherCondition = 'Sunny';
      break;
    case 1:
      weatherCondition = 'Mainly Clear';
      break;
    case 2:
      weatherCondition = 'Partly Cloudy';
      break;
    case 3:
      weatherCondition = 'Overcast';
      break;
    case 45:
      weatherCondition = 'Fog';
      break;
    case 51:
      weatherCondition = 'Drizzle';
      break;
    case 61:
      weatherCondition = 'Rain';
      break;
    case 71:
      weatherCondition = 'Snow';
      break;
    case 80:
      weatherCondition = 'Rain Showers';
      break;
    case 81:
      weatherCondition = 'Snow Showers';
      break;
    case 95:
      weatherCondition = 'Thunderstorms';
      break;
    default:
      weatherCondition = 'Unknown Weather Code';
  }

  return weatherCondition;
}

String weatherStatusImage(num weatherCode) {
  String weatherCondition = '';
  switch (weatherCode) {
    case 0:
      weatherCondition = icon4;
      break;
    case 1:
      weatherCondition = icon4;
      break;
    case 2:
      weatherCondition = icon5;
      break;
    case 3:
      weatherCondition = icon7;
      break;
    case 45:
      weatherCondition = icon6;
      break;
    case 51:
      weatherCondition = icon6;
      break;
    case 61:
      weatherCondition = cloudImage;
      break;
    case 63:
      weatherCondition = cloudImage;
      break;
    case 65:
      weatherCondition = cloudImage;
      break;
    case 71:
      weatherCondition = icon6;
      break;
    case 80:
      weatherCondition = cloudImage;
      break;
    case 81:
      weatherCondition = cloudImage;
      break;
    case 95:
      weatherCondition = cloudImage;
      break;
    default:
      weatherCondition = cloudImage;
  }

  return weatherCondition;
}

String greeting() {
  final hour = DateTime.now().hour;
  if (hour >= 0 && hour < 12) {
    return 'Good Morning';
  } else if (hour >= 12 && hour < 18) {
    return 'Good Afternoon';
  } else if (hour >= 18 && hour < 21) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}