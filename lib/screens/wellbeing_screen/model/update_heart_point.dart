// To parse this JSON data, do
//
//     final updateHeartPoint = updateHeartPointFromJson(jsonString);

import 'dart:convert';

UpdateHeartPoint updateHeartPointFromJson(String str) => UpdateHeartPoint.fromJson(json.decode(str));

String updateHeartPointToJson(UpdateHeartPoint data) => json.encode(data.toJson());

class UpdateHeartPoint {
  UpdateHeartPoint({
    this.rewardPointsData,
    this.message,
    this.responseCode,
  });

  RewardPointsData? rewardPointsData;
  String? message;
  int? responseCode;

  factory UpdateHeartPoint.fromJson(Map<String, dynamic> json) => UpdateHeartPoint(
    rewardPointsData: json["reward_points_data"] == "" ? RewardPointsData(rewardMessage: "",rewardPoints: 0) : RewardPointsData.fromJson(json["reward_points_data"]),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "reward_points_data": rewardPointsData!.toJson(),
    "message": message,
    "response_code": responseCode,
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
