import 'package:flutter/material.dart';

class AppColor {
  static const int _primaryColorValue = 0xFF228BC8;
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE9F3FA),
      100: Color(0xFFBADBEE),
      200: Color(0xFF99CAE6),
      300: Color(0xFF6BB1DA),
      400: Color(0xFF4EA2D3),
      500: Color(_primaryColorValue),
      600: Color(0xFF1F7EB6),
      700: Color(0xFF18638E),
      800: Color(0xFF134C6E),
      900: Color(0xFF0E3A54),
    },
  );

  static const backgroundColor = Color(0xFFFFFFFF);
  static const bannerColor = Color(0xFFFFE5E5);

  static const primaryColor = Color(0xFFF39876);
  static const secondaryColor = Color(0xFF192126);
  static const liteGray = Color(0xFF8C9093);
  static const mainBg = Color(0xFFF7F6FA);

  static const gradientLeftColor = Color(0xFFFEE3BC);
  static const gradientRightColor = Color(0xFFF39876);
  static const textColor1 = Color(0xFF303345);
  static const textColor = Color(0xFF9A938C);
  static const textColor2 = Color(0xFFD6996B);

  static const secondaryColor2 = Color(0xFFD8EEFF);
  static const purpleColor = Color(0xFF9B4D9D);
  static const transparent = Color(0x00bd4efe);


  static const darkPurple = Color(0xFF12101F);
  static const purple = Color(0xFF5C3BFF);
  static const black = Color(0xFF1B1919);
  static const blackPure = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const gray = Color(0xFF52596E);
  static const inputColor = Color(0x8052596E); //alp

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);

  static const grey = Color(0xFF52596E);

  static const infoColor = Color(0xFF33b5e5);
  static const successColor = Color(0xFF00C851);
  static const errorColor = Color(0xFFff4444);


  static const bgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColor.gradientLeftColor,
      AppColor.gradientRightColor,
    ],
    stops: [0.3, 0.8],
  );

}
