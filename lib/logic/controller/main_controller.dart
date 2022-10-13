import 'package:get/get.dart';
import '../../view/screens/favorites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/cart_screen.dart';
import '../../view/screens/user_info_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
     HomeScreen(),
    FavorivesScreen(),
    CartScreen(),
    const UserInfoScreen(),
  ].obs;
}
