import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../logic/controller/product_controller.dart';
import '../../../utils/theme.dart';

class SerchFormFiled extends StatelessWidget {
  SerchFormFiled({
    super.key,
    required this.prefixIcon,
    required this.hintText,
  });

  final Widget prefixIcon;

  final String hintText;
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: ((_) => TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
            controller: productController.serchController,
            onChanged: ((serchName) {
              productController.addSerchItemToList(serchName);
            }),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade900,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: productController.serchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() {
                        productController.clearSerch();
                      }),
                      icon: const Icon(
                        Icons.close,
                        color: mainColor,
                      ),
                    ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade900),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: pinkClr),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade900),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
