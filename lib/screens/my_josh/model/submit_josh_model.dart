// To parse this JSON data, do
//
//     final submitJoshModel = submitJoshModelFromJson(jsonString);

import 'dart:convert';

SubmitJoshModel submitJoshModelFromJson(String str) => SubmitJoshModel.fromJson(json.decode(str));

String submitJoshModelToJson(SubmitJoshModel data) => json.encode(data.toJson());

class SubmitJoshModel {
  SubmitJoshModel({
    this.id,
    this.managerId,
    this.description,
    this.emojiPoint,
    this.userProfile,
    this.reasonType,
    this.rewardPointsData,
    this.responseCode,
  });

  int? id;
  int? managerId;
  String? description;
  int? emojiPoint;
  int? userProfile;
  int? reasonType;
  RewardPointsData? rewardPointsData;
  int? responseCode;

  factory SubmitJoshModel.fromJson(Map<String, dynamic> json) => SubmitJoshModel(
    id: json["id"],
    managerId: json["manager_id"],
    description: json["description"],
    emojiPoint: json["emoji_point"],
    userProfile: json["user_profile"],
    reasonType: json["reason_type"],
    rewardPointsData: RewardPointsData.fromJson(json["reward_points_data"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "manager_id": managerId,
    "description": description,
    "emoji_point": emojiPoint,
    "user_profile": userProfile,
    "reason_type": reasonType,
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

  factory RewardPointsData.fromJson(Map<String, dynamic> json) => RewardPointsData(
    rewardPoints: json["reward_points"],
    rewardMessage: json["reward_message"],
  );

  Map<String, dynamic> toJson() => {
    "reward_points": rewardPoints,
    "reward_message": rewardMessage,
  };
}
