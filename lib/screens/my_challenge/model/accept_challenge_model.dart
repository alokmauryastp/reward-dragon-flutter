// To parse this JSON data, do
//
//     final acceptChallengeModel = acceptChallengeModelFromJson(jsonString);

import 'dart:convert';

AcceptChallengeModel acceptChallengeModelFromJson(String str) => AcceptChallengeModel.fromJson(json.decode(str));

String acceptChallengeModelToJson(AcceptChallengeModel data) => json.encode(data.toJson());

class AcceptChallengeModel {
  AcceptChallengeModel({
    this.rewardPointsData,
    this.message,
    this.responseCode,
  });

  RewardPointsData? rewardPointsData;
  String? message;
  int? responseCode;

  factory AcceptChallengeModel.fromJson(Map<String, dynamic> json) => AcceptChallengeModel(
    rewardPointsData: RewardPointsData.fromJson(json["reward_points_data"]),
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
