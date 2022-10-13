import 'package:coffee_app/model/product_model.dart';
import 'package:coffee_app/view/screens/deliver_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../logic/controller/product_controller.dart';
import '../../utils/theme.dart';
import '../widgets/buy_now.dart';
import '../widgets/sixzed_widget.dart';

class ProductDetalScreen extends StatelessWidget {
  ProductDetalScreen(
      {super.key,
      required this.productModel,
      required this.rating,
      required this.price});
  final ProductModel productModel;
  final double? rating;
  final double price;
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 25.sp,
                            ),
                          ),
                          Text(
                            'Detail',
                            style: TextStyle(
                              color: Colors.black.withAlpha(220),
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(
                            (() {
                              return IconButton(
                                onPressed: () {
                                  productController
                                      .manageFavoriteItems(productModel.id!);
                                },
                                icon: productController
                                        .isFavItem(productModel.id!)
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                        size: 27.sp,
                                      )
                                    : Icon(
                                        Icons.favorite_border_rounded,
                                        size: 27.sp,
                                      ),
                              );
                            }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Hero(
                        tag: '${productModel.id}',
                        child: Container(
                          height: 225.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(productModel.image!),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productModel.title!,
                                style: TextStyle(
                                    color: Colors.black.withAlpha(200),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'with ${productModel.ingredients![0]}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.orange,
                                    size: 25.sp,
                                  ),
                                  Text(
                                    '$rating',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 26.h,
                            width: 26.h,
                            child: Image.asset('images/coffeb.png'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.4),
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black.withAlpha(200),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ReadMoreText(
                        '${productModel.description}',
                        style: TextStyle(
                            fontSize: 16.sp, height: 1.7, color: Colors.grey),
                        textAlign: TextAlign.start,
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        trimMode: TrimMode.Line,
                        moreStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                        lessStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedList()
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            BuyNow(
              price: price,
              onPressed: () {
                Get.to(DeliverScreen(
                    productModel: productModel, rating: rating, price: price));
              },
            ),
          ],
        ),
      ),
    );
  }
}
