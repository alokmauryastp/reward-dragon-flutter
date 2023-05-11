// To parse this JSON data, do
//
//     final updateGameTime = updateGameTimeFromJson(jsonString);

import 'dart:convert';

UpdateGameTime updateGameTimeFromJson(String str) => UpdateGameTime.fromJson(json.decode(str));

String updateGameTimeToJson(UpdateGameTime data) => json.encode(data.toJson());

class UpdateGameTime {
  UpdateGameTime({
    this.msg,
    this.rewardPointsData,
    this.data,
    this.responseCode,
  });

  String? msg;
  RewardPointsData? rewardPointsData;
  Data? data;
  int? responseCode;

  factory UpdateGameTime.fromJson(Map<String, dynamic> json) => UpdateGameTime(
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
    required this.isEnd,
    required this.nextAvailabilityTime,
    required this.timeSpent,
    required this.userProfile,
    required this.gameName,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int isEnd;
  DateTime nextAvailabilityTime;
  int timeSpent;
  int userProfile;
  int gameName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isEnd: json["is_end"],
    nextAvailabilityTime: DateTime.parse(json["next_availability_time"]),
    timeSpent: json["time_spent"],
    userProfile: json["user_profile"],
    gameName: json["game_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_end": isEnd,
    "next_availability_time": nextAvailabilityTime.toIso8601String(),
    "time_spent": timeSpent,
    "user_profile": userProfile,
    "game_name": gameName,
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
