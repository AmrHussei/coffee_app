// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.title,
    this.description,
    this.ingredients,
    this.image,
    this.id,
  });

  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        description: json["description"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "image": image,
        "id": id,
      };
}
