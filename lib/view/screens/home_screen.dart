import 'package:coffee_app/view/widgets/home/card_item.dart';
import 'package:coffee_app/view/widgets/home/promo_widget.dart';
import 'package:coffee_app/view/widgets/home/serch_text_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/controller/payment_controller.dart';
import '../widgets/home/category_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final payMentcontroller = Get.find<PayMentController>();
//C35C2C
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: Colors.black87.withAlpha(240),
              height: 270.h,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                color: Colors.grey.withAlpha(50),
                width: double.infinity,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            children: [
              SizedBox(
                height: 390.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${payMentcontroller.addressHome}',
                                style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            height: 45.h,
                            width: 45.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://media-exp1.licdn.com/dms/image/C4D03AQG_gRF7HFQ4ww/profile-displayphoto-shrink_800_800/0/1662793286706?e=1670457600&v=beta&t=DJs-UNkx_RzjLA1h8eS5_jH3BdBfzwwgP3vcuLPiKLI'))),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SerchFormFiled(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'Search coffee',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const PromoWidget(),
                    SizedBox(
                      height: 15.h,
                    ),
                    CategoryWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CardItem()
            ],
          ),
        ),
      ],
    );
  }
}
