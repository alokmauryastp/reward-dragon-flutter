// To parse this JSON data, do
//
//     final managerConcernModel = managerConcernModelFromJson(jsonString);

import 'dart:convert';

ManagerConcernModel managerConcernModelFromJson(String str) => ManagerConcernModel.fromJson(json.decode(str));

String managerConcernModelToJson(ManagerConcernModel data) => json.encode(data.toJson());

class ManagerConcernModel {
  ManagerConcernModel({
    this.managerConcernCategory,
  });

  List<ManagerConcerns>? managerConcernCategory;

  factory ManagerConcernModel.fromJson(Map<String, dynamic> json) => ManagerConcernModel(
    managerConcernCategory: List<ManagerConcerns>.from(json["manager_concern_category"].map((x) => ManagerConcerns.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "manager_concern_category": List<dynamic>.from(managerConcernCategory!.map((x) => x.toJson())),
  };
}

class ManagerConcerns {
  ManagerConcerns({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.concernCategoryId,
    required this.description,
    required this.userProfileId,
    required this.actionOwnerId,
    required this.comment,
    required this.status,
    required this.actionOwnerName,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int concernCategoryId;
  String description;
  int userProfileId;
  int actionOwnerId;
  String comment;
  int status;
  String actionOwnerName;

  factory ManagerConcerns.fromJson(Map<String, dynamic> json) => ManagerConcerns(
    id: json["ticket"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    concernCategoryId: json["concern_category_id"],
    description: json["description"],
    userProfileId: json["user_profile_id"],
    actionOwnerId: json["action_owner_id"],
    comment: json["comment"] ?? "",
    status: json["status"],
    actionOwnerName: json["action_owner_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "concern_category_id": concernCategoryId,
    "description": description,
    "user_profile_id": userProfileId,
    "action_owner_id": actionOwnerId,
    "comment": comment,
    "status": status,
    "action_owner_name": actionOwnerName,
  };
}
