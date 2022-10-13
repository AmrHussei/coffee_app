import 'package:coffee_app/logic/controller/cart_controller.dart';

import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../controller/payment_controller.dart';
import '../controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(CartController());
    Get.put(SettingController());
    Get.put(PayMentController(), permanent: true);
  }
}
