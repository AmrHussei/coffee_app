import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/theme.dart';
import '../widgets/setting/botton_icon_widget.dart';
import '../widgets/setting/log_out_widget.dart';
import '../widgets/setting/profile_widget.dart';
import '../widgets/text_utils.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});
//C35C2C
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileWidget(),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.h,
            ),
            BottonIconWidget(),
            SizedBox(
              height: 15.h,
            ),
            LogOutWidget(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
