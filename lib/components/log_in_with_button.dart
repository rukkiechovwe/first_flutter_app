import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_color.dart';

class LoginWithButton extends StatelessWidget {
  final String text;
  const LoginWithButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          print('$text button');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.black,
          shadowColor: AppColor.transparent,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            side: BorderSide(color: AppColor.font2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$text.png',
              width: 22,
              height: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Login with $text',
            ),
          ],
        ),
      ),
    );
  }
}
