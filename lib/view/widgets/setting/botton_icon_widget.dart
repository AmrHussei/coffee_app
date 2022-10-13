import 'package:coffee_app/utils/theme.dart';
import 'package:coffee_app/view/screens/cart_screen.dart';
import 'package:coffee_app/view/screens/favorites_screen.dart';
import 'package:coffee_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottonIconWidget extends StatelessWidget {
  const BottonIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            Get.to(FavorivesScreen());
          },
          child: Container(
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: Colors.black45,
                  width: 2.h,
                ),
                color: mainColor.withOpacity(0.3)),
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: pinkClr,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextUtils(
                      text: 'My Favorite',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(CartScreen());
          },
          child: Container(
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: Colors.black45,
                  width: 2.h,
                ),
                color: mainColor.withOpacity(0.3)),
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    color: pinkClr,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextUtils(
                      text: 'My cart',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
