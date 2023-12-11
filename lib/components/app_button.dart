import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/app_color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
   const AppButton({super.key, required this.text, required this.onPressed});
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: ()=> onPressed!(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
