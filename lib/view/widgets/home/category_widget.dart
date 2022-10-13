import 'package:coffee_app/logic/controller/product_controller.dart';
import 'package:coffee_app/model/product_model.dart';
import 'package:coffee_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../screens/product_detail_screen.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final productcontroler = Get.find<ProductController>();
  ProductModel productModel = ProductModel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: InkWell(
              onTap: () {
                productcontroler.indexOfCoffeeCategory(index);
                productModel = productcontroler.spcialCoffeeCategory(
                    productcontroler.listOfCoffeeCategory[index]);
                Get.to(ProductDetalScreen(
                  productModel: productModel,
                  price: productcontroler.priceList[productModel.id ?? 0],
                  rating: productcontroler.rateList[productModel.id ?? 0],
                ));
              },
              child: GetBuilder<ProductController>(
                builder: ((controller) {
                  return Container(
                    padding: EdgeInsets.all(10.w),
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: productcontroler.isindexOfCoffeeCategory(index)
                          ? mainColor
                          : Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: Center(
                      child: Text(
                        productcontroler.listOfCoffeeCategory[index],
                        style: TextStyle(
                            fontSize: 15.sp,
                            color:
                                productcontroler.isindexOfCoffeeCategory(index)
                                    ? Colors.white
                                    : Colors.black.withAlpha(150),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        }),
        itemCount: productcontroler.listOfCoffeeCategory.length,
      ),
    );
  }
}
