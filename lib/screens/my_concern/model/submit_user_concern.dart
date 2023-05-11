// To parse this JSON data, do
//
//     final submitUserConcern = submitUserConcernFromJson(jsonString);

import 'dart:convert';

SubmitUserConcern submitUserConcernFromJson(String str) => SubmitUserConcern.fromJson(json.decode(str));

String submitUserConcernToJson(SubmitUserConcern data) => json.encode(data.toJson());

class SubmitUserConcern {
  SubmitUserConcern({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.actionOwnerId,
    this.comment,
    this.status,
    this.concernCategory,
    this.userProfile,
    this.responseCode,
    this.ticket,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? description;
  int? actionOwnerId;
  String? comment;
  int? status;
  int? concernCategory;
  int? userProfile;
  int? responseCode;
  String? ticket;

  factory SubmitUserConcern.fromJson(Map<String, dynamic> json) => SubmitUserConcern(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    actionOwnerId: json["action_owner_id"],
    comment: json["comment"]??"",
    status: json["status"],
    concernCategory: json["concern_category"],
    userProfile: json["user_profile"],
    responseCode: json["response_code"],
    ticket: json["ticket"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "description": description,
    "action_owner_id": actionOwnerId,
    "comment": comment,
    "status": status,
    "concern_category": concernCategory,
    "user_profile": userProfile,
    "response_code": responseCode,
    "ticket": ticket,
  };
}
