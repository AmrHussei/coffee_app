import 'package:coffee_app/utils/theme.dart';
import 'package:coffee_app/view/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../logic/controller/product_controller.dart';
import '../widgets/text_utils.dart';

class FavorivesScreen extends StatelessWidget {
  FavorivesScreen({
    super.key,
  });
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Obx(() {
        if (productController.favoriteProductslist.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset('images/coffeeheart.png'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextUtils(
                    text: 'Please enter your favorites coffee',
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: ((context, index) {
              return buildFavItem(
                image: productController.favoriteProductslist[index].image,
                title: productController.favoriteProductslist[index].title,
                idItem: productController.favoriteProductslist[index].id,
                ingredientes: productController
                    .favoriteProductslist[index].ingredients![0],
                onTap: () {
                  Get.to(ProductDetalScreen(
                    productModel: productController.favoriteProductslist[index],
                    rating: productController.rateList[
                        productController.findIndexOffavoritInProductList(
                            productController.favoriteProductslist[index].id!)],
                    price: productController.priceList[
                        productController.findIndexOffavoritInProductList(
                            productController.favoriteProductslist[index].id!)],
                  ));
                },
              );
            }),
            separatorBuilder: ((context, index) {
              return SizedBox(
                height: 2.h,
              );
            }),
            itemCount: productController.favoriteProductslist.length,
          );
        }
      }),
    ));
  }

  Widget buildFavItem(
      {required String? image,
      required String? ingredientes,
      required String? title,
      required int? idItem,
      required Function() onTap}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 12.w, right: 12.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.sp)),
          width: double.infinity,
          height: 110.h,
          child: Row(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image!,
                  height: 100.h,
                  width: 100.h,
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
                      title!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'with $ingredientes',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    productController.manageFavoriteItems(idItem!);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
