// To parse this JSON data, do
//
//     final skillHobbyModel = skillHobbyModelFromJson(jsonString);

import 'dart:convert';

SkillHobbyModel skillHobbyModelFromJson(String str) => SkillHobbyModel.fromJson(json.decode(str));

String skillHobbyModelToJson(SkillHobbyModel data) => json.encode(data.toJson());

class SkillHobbyModel {
  SkillHobbyModel({
    this.responseCode,
    this.message,
    this.skillAndHobbyData,
  });

  int? responseCode;
  String? message;
  List<SkillAndHobbyData>? skillAndHobbyData;

  factory SkillHobbyModel.fromJson(Map<String, dynamic> json) => SkillHobbyModel(
    responseCode: json["response_code"],
    message: json["message"],
    skillAndHobbyData: List<SkillAndHobbyData>.from(json["skill_and_hobby_data"].map((x) => SkillAndHobbyData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "skill_and_hobby_data": List<dynamic>.from(skillAndHobbyData!.map((x) => x.toJson())),
  };
}

class SkillAndHobbyData {
  SkillAndHobbyData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.imageData,
    required this.siteUrl,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String imageData;
  String siteUrl;
  int status;

  factory SkillAndHobbyData.fromJson(Map<String, dynamic> json) => SkillAndHobbyData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    imageData: json["image_data"],
    siteUrl: json["site_url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "image_data": imageData,
    "site_url": siteUrl,
    "status": status,
  };
}
