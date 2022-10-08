import 'package:coffee_app/logic/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GNav(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            tabBorderRadius: 20,
            iconSize: 24.h,
            color: Colors.grey,
            activeColor: mainColor,
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_rounded,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.shopping_bag_rounded,
                text: 'Orders',
              ),
              GButton(
                icon: Icons.person,
                text: 'Me',
              ),
            ],
            onTabChange: (value) {
              mainController.currentIndex.value = value;
            },
          ),
          body: IndexedStack(
              index: mainController.currentIndex.value,
              children: mainController.tabs),
        );
      },
    ));
  }
}
