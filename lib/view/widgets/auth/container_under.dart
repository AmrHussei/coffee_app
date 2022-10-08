import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.text2});

  final String text;
  final String text2;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: text2,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: darkGreyClr,
            ),
          ),
        ],
      ),
    );
  }
}
