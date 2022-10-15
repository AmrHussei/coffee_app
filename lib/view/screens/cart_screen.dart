import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../../utils/theme.dart';
import '../widgets/cart/bottom_of_cart_screen.dart';
import '../widgets/cart/empty_cart.dart';
import '../widgets/cart/cart_items.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        title: const Text('cart'),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (cartController.cartMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 620.h,
                    child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return CartItems(
                            index: index,
                            productModel:
                                cartController.cartMap.keys.toList()[index],
                            quantity:
                                cartController.cartMap.values.toList()[index]);
                      }),
                      separatorBuilder: ((context, index) =>
                          const SizedBox(height: 1)),
                      itemCount: cartController.cartMap.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 10.h),
                    child: BottomOfCartScreen(),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
