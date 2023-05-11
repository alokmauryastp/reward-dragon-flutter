// To parse this JSON data, do
//
//     final learningMaterial = learningMaterialFromJson(jsonString);

import 'dart:convert';

LearningMaterial learningMaterialFromJson(String str) => LearningMaterial.fromJson(json.decode(str));

String learningMaterialToJson(LearningMaterial data) => json.encode(data.toJson());

class LearningMaterial {
  LearningMaterial({
    this.msg,
    this.rewardPointsData,
    this.data,
    this.responseCode,
  });

  String? msg;
  RewardPointsData? rewardPointsData;
  Data? data;
  int? responseCode;

  factory LearningMaterial.fromJson(Map<String, dynamic> json) => LearningMaterial(
    msg: json["msg"],
    rewardPointsData: RewardPointsData.fromJson(json["reward_points_data"]),
    data: Data.fromJson(json["Data"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "reward_points_data": rewardPointsData!.toJson(),
    "Data": data!.toJson(),
    "response_code": responseCode,
  };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.spentTime,
    required this.spentTimeSeconds,
    required this.userProfile,
    required this.learningMaterial,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String spentTime;
  int spentTimeSeconds;
  int userProfile;
  int learningMaterial;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    spentTime: json["spent_time"],
    spentTimeSeconds: json["spent_time_seconds"],
    userProfile: json["user_profile"],
    learningMaterial: json["learning_material"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "spent_time": spentTime,
    "spent_time_seconds": spentTimeSeconds,
    "user_profile": userProfile,
    "learning_material": learningMaterial,
  };
}

class RewardPointsData {
  RewardPointsData({
    required this.rewardPoints,
    required this.rewardMessage,
  });

  int rewardPoints;
  String rewardMessage;

  factory RewardPointsData.fromJson(Map<String, dynamic> json) => RewardPointsData(
    rewardPoints: json["reward_points"],
    rewardMessage: json["reward_message"],
  );

  Map<String, dynamic> toJson() => {
    "reward_points": rewardPoints,
    "reward_message": rewardMessage,
  };
}
