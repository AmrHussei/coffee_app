import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.sp)),
        backgroundColor: mainColor,
        minimumSize: Size(250.w, 45.h),
      ),
      child: TextUtils(
          text: text,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
