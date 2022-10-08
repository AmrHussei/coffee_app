import 'package:get/get.dart';

import '../../view/screens/favorit_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/setting_screen.dart';
import '../../view/screens/user_info_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const FavorivesScreen(),
    const SettingsScreen(),
    const UserInfoScreen(),
  ].obs;
}
