// To parse this JSON data, do
//
//     final inspireLivingTime = inspireLivingTimeFromJson(jsonString);

import 'dart:convert';

InspireLivingTime inspireLivingTimeFromJson(String str) => InspireLivingTime.fromJson(json.decode(str));

String inspireLivingTimeToJson(InspireLivingTime data) => json.encode(data.toJson());

class InspireLivingTime {
  InspireLivingTime({
    this.msg,
    this.rewardPointsData,
    this.data,
    this.responseCode,
  });

  String? msg;
  RewardPointsData? rewardPointsData;
  Data? data;
  int? responseCode;

  factory InspireLivingTime.fromJson(Map<String, dynamic> json) => InspireLivingTime(
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
    required this.bonusPoint,
    required this.userProfile,
    required this.financeAndArtVideo,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String spentTime;
  int spentTimeSeconds;
  int bonusPoint;
  int userProfile;
  int financeAndArtVideo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    spentTime: json["spent_time"],
    spentTimeSeconds: json["spent_time_seconds"],
    bonusPoint: json["bonus_point"],
    userProfile: json["user_profile"],
    financeAndArtVideo: json["finance_and_art_video"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "spent_time": spentTime,
    "spent_time_seconds": spentTimeSeconds,
    "bonus_point": bonusPoint,
    "user_profile": userProfile,
    "finance_and_art_video": financeAndArtVideo,
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
