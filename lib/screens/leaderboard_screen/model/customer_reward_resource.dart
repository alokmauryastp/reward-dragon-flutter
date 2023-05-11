// To parse this JSON data, do
//
//     final customerRewardResource = customerRewardResourceFromJson(jsonString);

import 'dart:convert';

CustomerRewardResource customerRewardResourceFromJson(String str) => CustomerRewardResource.fromJson(json.decode(str));

String customerRewardResourceToJson(CustomerRewardResource data) => json.encode(data.toJson());

class CustomerRewardResource {

  CustomerRewardResource({
    this.usageRewardsPoint,
    this.challengeAndCampaignRewardsPoint,
    this.gameRewardsPoint,
    this.moodRewardsPoint,
    this.wellbeingRewardsPoint,
    this.milestoneRewardsPoint,
    this.leaderboardRewardsPoint,
    this.kpiRewardsPoint,
    this.redemptionCashbackRewardsPoint,
    this.nonAppRewardsPoint,
    this.message,
    this.responseCode,
  });

  int? usageRewardsPoint;
  int? challengeAndCampaignRewardsPoint;
  int? gameRewardsPoint;
  int? moodRewardsPoint;
  int? wellbeingRewardsPoint;
  int? milestoneRewardsPoint;
  int? leaderboardRewardsPoint;
  int? kpiRewardsPoint;
  int? redemptionCashbackRewardsPoint;
  int? nonAppRewardsPoint;
  String? message;
  int? responseCode;

  factory CustomerRewardResource.fromJson(Map<String, dynamic> json) => CustomerRewardResource(
    usageRewardsPoint: json["usage_rewards_point"],
    challengeAndCampaignRewardsPoint: json["challenge_and_campaign_rewards_point"],
    gameRewardsPoint: json["game_rewards_point"],
    moodRewardsPoint: json["mood_rewards_point"],
    wellbeingRewardsPoint: json["wellbeing_rewards_point"],
    milestoneRewardsPoint: json["milestone_rewards_point"],
    leaderboardRewardsPoint: json["leaderboard_rewards_point"],
    kpiRewardsPoint: json["kpi_rewards_point"],
    redemptionCashbackRewardsPoint: json["redemption_cashback_rewards_point"],
    nonAppRewardsPoint: json["non_app_rewards_point"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "usage_rewards_point": usageRewardsPoint,
    "challenge_and_campaign_rewards_point": challengeAndCampaignRewardsPoint,
    "game_rewards_point": gameRewardsPoint,
    "mood_rewards_point": moodRewardsPoint,
    "wellbeing_rewards_point": wellbeingRewardsPoint,
    "milestone_rewards_point": milestoneRewardsPoint,
    "leaderboard_rewards_point": leaderboardRewardsPoint,
    "kpi_rewards_point": kpiRewardsPoint,
    "redemption_cashback_rewards_point": redemptionCashbackRewardsPoint,
    "non_app_rewards_point": nonAppRewardsPoint,
    "message": message,
    "response_code": responseCode,
  };
}
