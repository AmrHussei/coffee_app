import 'package:coffee_app/logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../model/product_model.dart';
import '../../../utils/theme.dart';

class CartItems extends StatelessWidget {
  CartItems(
      {super.key,
      required this.productModel,
      required this.index,
      required this.quantity});
  var cartController = Get.find<CartController>();
  var productcontroller = Get.find<ProductController>();
  final ProductModel productModel;
  final int index;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 15.h),
      height: 110.h,
      decoration: BoxDecoration(
        border: Border.all(color: mainColor.withOpacity(0.7), width: 2.sp),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Card(
            margin: const EdgeInsets.all(7),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              productModel.image!,
              height: 150.h,
              width: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'with ${productcontroller.productslist[productModel.id!].ingredients![0]}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '\$${productcontroller.priceList[productModel.id!]}',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.removeOneProduct(productModel);
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModel);
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartController.deletProduct(productModel);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
