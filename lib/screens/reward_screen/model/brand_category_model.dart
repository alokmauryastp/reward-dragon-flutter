// To parse this JSON data, do
//
//     final brandCategoryModel = brandCategoryModelFromJson(jsonString);

import 'dart:convert';

BrandCategoryModel brandCategoryModelFromJson(String str) => BrandCategoryModel.fromJson(json.decode(str));

String brandCategoryModelToJson(BrandCategoryModel data) => json.encode(data.toJson());

class BrandCategoryModel {
  BrandCategoryModel({
    this.data,
  });

  List<BrandCategory>? data;

  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) => BrandCategoryModel(
    data: List<BrandCategory>.from(json["data"].map((x) => BrandCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BrandCategory {
  BrandCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory BrandCategory.fromJson(Map<String, dynamic> json) => BrandCategory(
    id: json["id"],
    name: json["name"],
    description: json["description"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
