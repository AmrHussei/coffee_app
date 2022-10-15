import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../logic/controller/setting_controller.dart';
import '../text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final settingController = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80.h,
          width: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${authController.usePhotoGetStorage.read('usePhotoGetStorage')}',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text:
                  '${authController.userNameGetStorage.read('userNameGetStorage')}',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8),
            ),
          ],
        )
      ],
    );
  }
}
