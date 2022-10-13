import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../../screens/user_info_screen.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: ((controller) {
        return InkWell(
          splashColor: Colors.red[200],
          borderRadius: BorderRadius.circular(20),
          onTap: (() {
            Get.defaultDialog(
              backgroundColor: Colors.grey,
              title: 'Log out from the app',
              middleText: 'Are you sure you want to log out from asroo shop',
              barrierDismissible: false,
              buttonColor: Colors.white,
              textCancel: 'No',
              cancelTextColor: Colors.white,
              textConfirm: 'Yes',
              confirmTextColor: pinkClr,
              onCancel: () {
                Get.back();
                Get.to(const UserInfoScreen());
              },
              onConfirm: () {
                controller.logOutFromApp();
              },
            );
          }),
          child: Container(
            height: 55.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: pinkClr, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                  text: 'Logout',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
