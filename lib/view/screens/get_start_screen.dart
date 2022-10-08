import 'package:coffee_app/logic/bindings/auth_binding.dart';
import 'package:coffee_app/routes/routes.dart';
import 'package:coffee_app/utils/theme.dart';
import 'package:coffee_app/view/screens/auth/login_screen.dart';
import 'package:coffee_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/controller/auth_controller.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/getstart.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.sp),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Coffee so good,',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' your taste buds',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'will love it.',
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    TextUtils(
                        text:
                            'The best grain, the finest roast, the powerful flavor ',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    SizedBox(
                      height: 30.sp,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: mainColor,
                      minWidth: 315.sp,
                      height: 62.sp,
                      onPressed: () {
                        Get.toNamed(Routes.logInScreen);
                      },
                      child: TextUtils(
                          text: 'Get start',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
