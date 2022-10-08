import 'package:coffee_app/view/widgets/home/serch_text_form.dart';
import 'package:coffee_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//C35C2C
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black87.withAlpha(240),
          height: 300.h,
          width: double.infinity,
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
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
                          'Sinbillawin, Mansoura',
                          style: TextStyle(
                              color: Colors.white,
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
              Container(
                height: ,
              )
            ],
          ),
        )
      ],
    );
  }
}
