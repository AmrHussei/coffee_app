import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_model.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productslist = <ProductModel>[].obs;
  RxList<ProductModel> serchlist = <ProductModel>[].obs;
  RxList<ProductModel> favoriteProductslist = <ProductModel>[].obs;
  var isLoding = true.obs;
  RxBool isFav = false.obs;
  var getStorage = GetStorage();
  final TextEditingController serchController = TextEditingController();
  int indexOfCategory = 0;
  final List listOfCoffeeCategory = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Cortadito',
    'Black'
  ];

  final List rateList = [
    5.0,
    4.8,
    4.6,
    4.5,
    4.3,
    4.0,
    4.1,
    3.6,
    2.6,
    3.6,
    5.0,
    5.0,
    4.9,
    3.6,
    4.6,
    3.9,
    4.4,
    4.0,
    4.1,
    3.1,
  ];
  final List priceList = [
    5.5,
    6.6,
    2.2,
    9.8,
    5.1,
    6.0,
    5.0,
    6.0,
    2.5,
    5.3,
    5.6,
    2.9,
    5.8,
    4.7,
    2.5,
    2.7,
    5.1,
    5.6,
    5.8,
    4.5
  ];

  @override
  void onInit() {
    super.onInit();
    List? storedList = getStorage.read<List>('FavList');
    if (storedList != null) {
      favoriteProductslist = storedList
          .map((element) => ProductModel.fromJson(element))
          .toList()
          .obs;
    }
    getProducts();
  }

  void getProducts() async {
    var product = await ProductServices.getProduct();

    try {
      isLoding(true);
      if (product.isNotEmpty) {
        productslist.addAll(product);
      }
      print('product has succes=========================');
    } finally {
      isLoding(false);
    }
  }

  void manageFavoriteItems(int idItem) {
    var index =
        favoriteProductslist.indexWhere((element) => element.id == idItem);
    if (index >= 0) {
      favoriteProductslist.removeAt(index);
      getStorage.remove('FavList');
    } else {
      favoriteProductslist
          .add(productslist.firstWhere((element) => element.id == idItem));
      getStorage.write('FavList', favoriteProductslist);
    }
  }

  bool isFavItem(int idItem) {
    return favoriteProductslist.any((element) => element.id == idItem);
  }

  void addSerchItemToList(String serchName) {
    serchlist.value = productslist.where((serch) {
      var serchTitle = serch.title!.toLowerCase();
      var serchPrice = serch.title!.toLowerCase();
      return serchTitle.contains(serchName.toLowerCase()) ||
          serchPrice.toString().contains(serchName.toLowerCase());
    }).toList();
    update();
  }

  void clearSerch() {
    serchController.clear();
    addSerchItemToList('');
  }

  void indexOfCoffeeCategory(index) {
    indexOfCategory = index;
    update();
  }

  bool isindexOfCoffeeCategory(index) {
    return indexOfCategory == index;
  }

  ProductModel spcialCoffeeCategory(String serchName) {
    return productslist.firstWhere((serch) {
      var serchTitle = serch.title!.toLowerCase();
      return serchTitle.contains(serchName.toLowerCase());
    });
  }

  int findIndexOffavoritInProductList(int id) {
    return productslist.indexWhere((element) => element.id == id);
  }
}
