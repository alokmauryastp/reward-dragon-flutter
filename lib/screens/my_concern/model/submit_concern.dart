// To parse this JSON data, do
//
//     final submitConcern = submitConcernFromJson(jsonString);

import 'dart:convert';

SubmitConcern submitConcernFromJson(String str) => SubmitConcern.fromJson(json.decode(str));

String submitConcernToJson(SubmitConcern data) => json.encode(data.toJson());

class SubmitConcern {
  SubmitConcern({
    this.msg,
    this.data,
    this.responseCode,
  });

  String? msg;
  Data? data;
  int? responseCode;

  factory SubmitConcern.fromJson(Map<String, dynamic> json) => SubmitConcern(
    msg: json["msg"],
    data: Data.fromJson(json["Data"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "Data": data!.toJson(),
    "response_code": responseCode,
  };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.actionOwnerId,
    required this.comment,
    required this.status,
    required this.concernCategory,
    required this.userProfile,
    required this.ticket,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  int actionOwnerId;
  dynamic comment;
  int status;
  int concernCategory;
  int userProfile;
  String ticket;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    actionOwnerId: json["action_owner_id"],
    comment: json["comment"],
    status: json["status"],
    concernCategory: json["concern_category"],
    userProfile: json["user_profile"],
    ticket: json["ticket"],
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
    "ticket": ticket,
  };
}
