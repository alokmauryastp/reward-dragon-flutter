// To parse this JSON data, do
//
//     final claimRewardModel = claimRewardModelFromJson(jsonString);

import 'dart:convert';

ClaimRewardModel claimRewardModelFromJson(String str) =>
    ClaimRewardModel.fromJson(json.decode(str));

String claimRewardModelToJson(ClaimRewardModel data) =>
    json.encode(data.toJson());

class ClaimRewardModel {
  ClaimRewardModel({
    this.message,
    this.rewardPointsData,
    this.responseCode,
  });

  String? message;
  RewardPointsData? rewardPointsData;
  int? responseCode;

  factory ClaimRewardModel.fromJson(Map<String, dynamic> json) =>
      ClaimRewardModel(
        message: json["message"],
        rewardPointsData: json['reward_points_data'] == null
            ? RewardPointsData(rewardPoints: 0, rewardMessage: "")
            : json['reward_points_data']['reward_points'] == null
                ? RewardPointsData(rewardPoints: 0, rewardMessage: "")
                : RewardPointsData.fromJson(json["reward_points_data"]),
        responseCode: json['reward_points_data'] == null
            ? 201
            : json['reward_points_data']['reward_points'] == null
                ? 201
                : json["response_code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "reward_points_data": rewardPointsData!.toJson(),
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

  factory RewardPointsData.fromJson(Map<String, dynamic> json) =>
      RewardPointsData(
        rewardPoints: json["reward_points"],
        rewardMessage: json["reward_message"],
      );

  Map<String, dynamic> toJson() => {
        "reward_points": rewardPoints,
        "reward_message": rewardMessage,
      };
}
