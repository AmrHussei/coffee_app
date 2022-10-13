import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    //  Get.put(CategoryController());
  }
}
