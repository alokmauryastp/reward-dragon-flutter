// To parse this JSON data, do
//
//     final teamRewardResource = teamRewardResourceFromJson(jsonString);

import 'dart:convert';

TeamRewardResource teamRewardResourceFromJson(String str) => TeamRewardResource.fromJson(json.decode(str));

String teamRewardResourceToJson(TeamRewardResource data) => json.encode(data.toJson());

class TeamRewardResource {
  TeamRewardResource({
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
    this.responseCode,
    this.message,
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
  int? responseCode;
  String? message;

  factory TeamRewardResource.fromJson(Map<String, dynamic> json) => TeamRewardResource(
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
    responseCode: json["response_code"],
    message: json["message"],
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
    "response_code": responseCode,
    "message": message,
  };
}
