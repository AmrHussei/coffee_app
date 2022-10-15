import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../logic/controller/product_controller.dart';
import '../../../model/product_model.dart';
import '../../../utils/theme.dart';
import '../../screens/product_detail_screen.dart';
import '../text_utils.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key});
  final productController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoding.value) {
        return const CircularProgressIndicator();
      } else {
        return Expanded(
          child: productController.serchlist.isEmpty &&
                  productController.serchController.text.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Image.asset(
                          'images/noserch.png',
                          height: 120.h,
                          width: 120.w,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextUtils(
                          text: 'No search results found',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey)
                    ],
                  ),
                )
              : GridView.builder(
                  itemCount: productController.serchlist.isEmpty
                      ? productController.productslist.length
                      : productController.serchlist.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.7.h,
                      mainAxisSpacing: 9.0.h,
                      maxCrossAxisExtent: 200.w,
                      crossAxisSpacing: 0.6.w),
                  itemBuilder: ((context, index) {
                    if (productController.serchlist.isEmpty) {
                      return buildCartItem(
                        image: productController.productslist[index].image,
                        ingredientes:
                            productController.productslist[index].ingredients,
                        price: productController.priceList[index],
                        title: productController.productslist[index].title,
                        rating: productController.rateList[index],
                        id: productController.productslist[index].id,
                        productModel: productController.productslist[index],
                        onTap: () {
                          Get.to(ProductDetalScreen(
                            productModel: productController.productslist[index],
                            rating: productController.rateList[index],
                            price: productController.priceList[index],
                          ));
                        },
                      );
                    } else {
                      return buildCartItem(
                        image: productController.serchlist[index].image,
                        price: productController.priceList[index],
                        ingredientes:
                            productController.productslist[index].ingredients,
                        rating: productController.rateList[index],
                        title: productController.productslist[index].title,
                        id: productController.serchlist[index].id,
                        productModel: productController.serchlist[index],
                        onTap: () {
                          Get.to(ProductDetalScreen(
                            productModel: productController.productslist[index],
                            rating: productController.rateList[index],
                            price: productController.priceList[index],
                          ));
                        },
                      );
                    }
                  }),
                ),
        );
      }
    });
  }

  Widget buildCartItem(
      {required String? image,
      required String? title,
      required List? ingredientes,
      required double? price,
      required double rating,
      required int? id,
      required ProductModel productModel,
      required Function() onTap}) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 230.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: '${productModel.id}',
                  child: Container(
                    height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      image: DecorationImage(
                          image: NetworkImage(
                            image!,
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.w),
                                bottomRight: Radius.circular(15.w)),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.orange,
                                  size: 20.sp,
                                ),
                                Text(
                                  '\$$rating',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black.withAlpha(200),
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'with ${ingredientes![0]}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$$price',
                            style: TextStyle(
                                color: Colors.black.withAlpha(200),
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              cartController.addProductToCart(productModel);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
