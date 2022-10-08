import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthController>(builder: (_) {
          return InkWell(
            onTap: () {
              authController.checkBox();
            },
            child: Container(
              height: 32.h,
              width: 32.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: authController.isCheckBox
                  ? Image.asset('images/check.png')
                  : Container(),
            ),
          );
        }),
        const SizedBox(
          width: 7,
        ),
        TextUtils(
          text: 'I accept ',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        InkWell(
          onTap: (() {}),
          child: TextUtils(
            text: ' terms & conditions',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: logOutSettings,
          ),
        )
      ],
    );
  }
}
