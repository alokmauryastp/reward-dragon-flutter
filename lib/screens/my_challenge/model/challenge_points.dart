// To parse this JSON data, do
//
//     final challengePoints = challengePointsFromJson(jsonString);

import 'dart:convert';

ChallengePoints challengePointsFromJson(String str) => ChallengePoints.fromJson(json.decode(str));

String challengePointsToJson(ChallengePoints data) => json.encode(data.toJson());

class ChallengePoints {
  ChallengePoints({
    this.challengeBonusPoint,
    this.challengesPlayedCount,
    this.challengesWonCount,
    this.responseCode,
    this.message,
  });

  int? challengeBonusPoint;
  int? challengesPlayedCount;
  int? challengesWonCount;
  int? responseCode;
  String? message;

  factory ChallengePoints.fromJson(Map<String, dynamic> json) => ChallengePoints(
    challengeBonusPoint: json["challenge_bonus_point"]??0,
    challengesPlayedCount: json["challenges_played_count"],
    challengesWonCount: json["challenges_won_count"],
    responseCode: json["response_code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "challenge_bonus_point": challengeBonusPoint,
    "challenges_played_count": challengesPlayedCount,
    "challenges_won_count": challengesWonCount,
    "response_code": responseCode,
    "message": message,
  };
}
