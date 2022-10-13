import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme.dart';

// ignore: must_be_immutable
class SizedList extends StatefulWidget {
  const SizedList({super.key});

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> listOfSize = ['S', 'M', 'L'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: (() {
              setState(() {
                currentIndex = index;
              });
            }),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              width: 100.w,
              decoration: BoxDecoration(
                  color: currentIndex == index
                      ? mainColor.withOpacity(0.4)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                  border: Border.all(
                      color: currentIndex == index
                          ? mainColor.withOpacity(0.4)
                          : Colors.grey.withOpacity(0.3),
                      width: 2)),
              child: Center(
                child: Text(
                  listOfSize[index],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: currentIndex == index
                        ? mainColor
                        : Colors.black.withAlpha(140),
                  ),
                ),
              ),
            ),
          );
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(width: 10);
        }),
        itemCount: listOfSize.length,
      ),
    );
  }
}
