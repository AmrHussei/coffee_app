import 'package:get/get.dart';

import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    //  Get.put(CategoryController());
    // Get.lazyPut(() => CartController());
  }
}
