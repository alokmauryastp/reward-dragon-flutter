// To parse this JSON data, do
//
//     final managerConcernCategoryModel = managerConcernCategoryModelFromJson(jsonString);

import 'dart:convert';

ManagerConcernCategoryModel managerConcernCategoryModelFromJson(String str) => ManagerConcernCategoryModel.fromJson(json.decode(str));

String managerConcernCategoryModelToJson(ManagerConcernCategoryModel data) => json.encode(data.toJson());

class ManagerConcernCategoryModel {
  ManagerConcernCategoryModel({
    this.managerConcernCategory,
    this.message,
  });

  List<ManagerConcernCategory>? managerConcernCategory;
  String? message;

  factory ManagerConcernCategoryModel.fromJson(Map<String, dynamic> json) => ManagerConcernCategoryModel(
    managerConcernCategory: List<ManagerConcernCategory>.from(json["manager_concern_category"].map((x) => ManagerConcernCategory.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "manager_concern_category": List<dynamic>.from(managerConcernCategory!.map((x) => x.toJson())),
    "message": message,
  };
}

class ManagerConcernCategory {
  ManagerConcernCategory({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int status;

  factory ManagerConcernCategory.fromJson(Map<String, dynamic> json) => ManagerConcernCategory(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "status": status,
  };
}
