import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_color.dart';

enum SnackBarType { success, error, info }

class AppSnackbar extends StatelessWidget {
  final String message;
  final SnackBarType type;
  const AppSnackbar({super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      // content:  Text(message),
      content: const Text('Hi, I am a SnackBar!'),
      duration: const Duration(seconds: 3),
      backgroundColor: type == SnackBarType.success
          ? AppColor.success
          : type == SnackBarType.error
              ? AppColor.error
              : type == SnackBarType.info
                  ? AppColor.info
                  : AppColor.normal,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: AppColor.white,
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {},
      // ),
    );
  }
}
