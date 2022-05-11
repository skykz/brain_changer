import 'package:flutter/material.dart';

/// все цвета которые мы юзаем в приложений
class AppColors {
  static const appPrimaryColor = Color(0xff434648);

  static const appPassedGradientColor = [
    Color.fromRGBO(78, 194, 79, 1),
    Color.fromRGBO(130, 217, 131, 1),
  ];
  static const appNotPassedGradientColor = [
    Color.fromRGBO(140, 89, 240, 1),
    Color.fromRGBO(179, 141, 252, 1),
  ];

  static const appAskDoubtTitleDarkColor = Color(0xFF171138);
  static const appAskDoubtAppBarBgColor = Color(0xFFF3F5F9);
  static const appAskDoubtTextFieldBgColor = Color(0xFFE2E3E9);
  static const appTextFieldContainerColor = Color.fromRGBO(139, 136, 155, 0.1);
  static const appUstudyAddColor = Color(0xFF2E2369);
  static const appDarkModeBgColor = Color(0xFF211F2D);
  static const appDarkCanvasColor = Color(0xFF383545);
  static const appDarkDividerColor = Color(0xFF474455);
  static const appVariantsDartBorderColor = Color(0xFF5C5B64);
}

/// все SVG формате картинки для приложения
class AppSvgImages {}

/// все картинки в формате PNG
class AppPngImages {
  static const String brainLogo = "assets/images/other/brain_logo.png";
}
