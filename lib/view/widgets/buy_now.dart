import 'package:coffee_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/theme.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({
    super.key,
    required this.price, required this.onPressed,
  });
  final double price;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.w),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                  text: 'Price',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              SizedBox(
                height: 4.h,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: mainColor),
              )
            ],
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
              child: MaterialButton(
            color: mainColor,
            height: 60.h,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed:onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                  text: 'Buy Now',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.h,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
