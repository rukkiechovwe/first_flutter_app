import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_color.dart';

class AppText {
  static const header1 = TextStyle(
    color: AppColor.primary,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static const header2 = TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  static const header3 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

  static const subTitle1 = TextStyle(color: AppColor.font2, fontSize: 18);
  static const subTitle2 = TextStyle(
    color: AppColor.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const subTitle3 = TextStyle(
    color: AppColor.primary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const subTitle4 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  static const body1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const body2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
