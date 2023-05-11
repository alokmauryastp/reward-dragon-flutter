// To parse this JSON data, do
//
//     final updateStepTaken = updateStepTakenFromJson(jsonString);

import 'dart:convert';

UpdateStepTaken updateStepTakenFromJson(String str) =>
    UpdateStepTaken.fromJson(json.decode(str));

String updateStepTakenToJson(UpdateStepTaken data) =>
    json.encode(data.toJson());

class UpdateStepTaken {
  UpdateStepTaken({
    this.rewardPointsData,
    this.message,
    this.responseCode,
  });

  RewardPointsData? rewardPointsData;
  String? message;
  int? responseCode;

  factory UpdateStepTaken.fromJson(Map<String, dynamic> json) =>
      UpdateStepTaken(
        rewardPointsData: json['reward_points_data'] == ""
            ? RewardPointsData(rewardPoints: 0, rewardMessage: '')
            : RewardPointsData.fromJson(json["reward_points_data"]),
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
