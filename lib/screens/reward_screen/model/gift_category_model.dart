// To parse this JSON data, do
//
//     final giftCategoryModel = giftCategoryModelFromJson(jsonString);

import 'dart:convert';

GiftCategoryModel giftCategoryModelFromJson(String str) => GiftCategoryModel.fromJson(json.decode(str));

String giftCategoryModelToJson(GiftCategoryModel data) => json.encode(data.toJson());

class GiftCategoryModel {
  GiftCategoryModel({
    this.data,
  });

  List<GiftCategory>? data;

  factory GiftCategoryModel.fromJson(Map<String, dynamic> json) => GiftCategoryModel(
    data: List<GiftCategory>.from(json["data"].map((x) => GiftCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class GiftCategory {
  GiftCategory({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GiftCategory.fromJson(Map<String, dynamic> json) => GiftCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
