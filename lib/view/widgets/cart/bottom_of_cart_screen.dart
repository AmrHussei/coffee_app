import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../logic/controller/cart_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class BottomOfCartScreen extends StatelessWidget {
  BottomOfCartScreen({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Builder(builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              height: 55.h,
              color: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: (() {
                cartController.clearAllProduct();
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      text: 'Clear All',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 23.sp,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: MaterialButton(
                height: 55.h,
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: (() {
                  //TODO : go to deliverd screen
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        text: 'Buy Now',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
