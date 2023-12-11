import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_color.dart';

class AppBorder {
  static const focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.primary, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static final enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.border, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
}
