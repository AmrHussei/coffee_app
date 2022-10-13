import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage('images/home.jpg'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
              child: Row(
                children: [
                  Container(
                    height: 33.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Promo',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: 0.5,
                      child: Container(
                        width: 200.w,
                        height: 25.h,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Buy one get',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 0.5,
                      child: Container(
                        width: 200.w,
                        height: 25.h,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'One free',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
