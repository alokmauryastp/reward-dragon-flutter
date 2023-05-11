// To parse this JSON data, do
//
  //     final concernListModel = concernListModelFromJson(jsonString);

import 'dart:convert';

ConcernListModel concernListModelFromJson(String str) => ConcernListModel.fromJson(json.decode(str));

String concernListModelToJson(ConcernListModel data) => json.encode(data.toJson());

class ConcernListModel {
  ConcernListModel({
    this.count,
    this.msg,
    this.data,
  });

  int? count;
  String? msg;
  List<Concerns>? data;

  factory ConcernListModel.fromJson(Map<String, dynamic> json) => ConcernListModel(
    count: json["count"],
    msg: json["msg"],
    data: List<Concerns>.from(json["data"].map((x) => Concerns.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "msg": msg,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Concerns {
  Concerns({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.actionOwnerId,
    required this.comment,
    required this.status,
    required this.concernCategory,
    required this.userProfile,
    required this.actionOwnerName,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  int actionOwnerId;
  String comment;
  int status;
  int concernCategory;
  int userProfile;
  String actionOwnerName;

  factory Concerns.fromJson(Map<String, dynamic> json) => Concerns(
    id: json["ticket"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    actionOwnerId: json["action_owner_id"],
    comment: json["comment"]??"",
    status: json["status"],
    concernCategory: json["concern_category"],
    userProfile: json["user_profile"],
    actionOwnerName: json["action_owner_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "description": description,
    "action_owner_id": actionOwnerId,
    "comment": comment,
    "status": status,
    "concern_category": concernCategory,
    "user_profile": userProfile,
    "action_owner_name": actionOwnerName,
  };
}
