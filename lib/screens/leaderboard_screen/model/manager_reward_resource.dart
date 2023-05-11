// To parse this JSON data, do
//
//     final managerRewardResource = managerRewardResourceFromJson(jsonString);

import 'dart:convert';

ManagerRewardResource managerRewardResourceFromJson(String str) => ManagerRewardResource.fromJson(json.decode(str));

String managerRewardResourceToJson(ManagerRewardResource data) => json.encode(data.toJson());

class ManagerRewardResource {
  ManagerRewardResource({
    this.usageRewardsPoint,
    this.gameRewardsPoint,
    this.moodRewardsPoint,
    this.wellbeingRewardsPoint,
    this.kpiRewardsPoint,
    this.milestoneRewardsPoint,
    this.redemptionCashbackRewardsPoint,
    this.nonAppRewardsPoint,
    this.message,
    this.responseCode,
  });

  int? usageRewardsPoint;
  int? gameRewardsPoint;
  int? moodRewardsPoint;
  int? wellbeingRewardsPoint;
  int? kpiRewardsPoint;
  int? milestoneRewardsPoint;
  int? redemptionCashbackRewardsPoint;
  int? nonAppRewardsPoint;
  String? message;
  int? responseCode;

  factory ManagerRewardResource.fromJson(Map<String, dynamic> json) => ManagerRewardResource(
    usageRewardsPoint: json["usage_rewards_point"],
    gameRewardsPoint: json["game_rewards_point"],
    moodRewardsPoint: json["mood_rewards_point"],
    wellbeingRewardsPoint: json["wellbeing_rewards_point"],
    kpiRewardsPoint: json["kpi_rewards_point"]??0,
    milestoneRewardsPoint: json["milestone_rewards_point"],
    redemptionCashbackRewardsPoint: json["redemption_cashback_rewards_point"],
    nonAppRewardsPoint: json["non_app_rewards_point"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "usage_rewards_point": usageRewardsPoint,
    "game_rewards_point": gameRewardsPoint,
    "mood_rewards_point": moodRewardsPoint,
    "wellbeing_rewards_point": wellbeingRewardsPoint,
    "kpi_rewards_point": kpiRewardsPoint,
    "milestone_rewards_point": milestoneRewardsPoint,
    "redemption_cashback_rewards_point": redemptionCashbackRewardsPoint,
    "non_app_rewards_point": nonAppRewardsPoint,
    "message": message,
    "response_code": responseCode,
  };
}
