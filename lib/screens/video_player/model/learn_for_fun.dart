// To parse this JSON data, do
//
//     final learnForFun = learnForFunFromJson(jsonString);

import 'dart:convert';

LearnForFun learnForFunFromJson(String str) => LearnForFun.fromJson(json.decode(str));

String learnForFunToJson(LearnForFun data) => json.encode(data.toJson());

class LearnForFun {
  LearnForFun({
    this.msg,
    this.rewardPointsData,
    this.data,
    this.responseCode,
  });

  String? msg;
  RewardPointsData? rewardPointsData;
  Data? data;
  int? responseCode;

  factory LearnForFun.fromJson(Map<String, dynamic> json) => LearnForFun(
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
    required this.skillAndHobby,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String spentTime;
  int spentTimeSeconds;
  int userProfile;
  int skillAndHobby;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    spentTime: json["spent_time"],
    spentTimeSeconds: json["spent_time_seconds"],
    userProfile: json["user_profile"],
    skillAndHobby: json["skill_and_hobby"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "spent_time": spentTime,
    "spent_time_seconds": spentTimeSeconds,
    "user_profile": userProfile,
    "skill_and_hobby": skillAndHobby,
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
