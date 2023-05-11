// To parse this JSON data, do
//
//     final rewardPoints = rewardPointsFromJson(jsonString);

import 'dart:convert';

RewardPoints rewardPointsFromJson(String str) => RewardPoints.fromJson(json.decode(str));

String rewardPointsToJson(RewardPoints data) => json.encode(data.toJson());

class RewardPoints {
  RewardPoints({
    this.earnedPoint,
    this.pointUsed,
    this.message,
    this.responseCode,
  });

  int? earnedPoint;
  int? pointUsed;
  String? message;
  int? responseCode;

  factory RewardPoints.fromJson(Map<String, dynamic> json) => RewardPoints(
    earnedPoint: json["earned_point"],
    pointUsed: json["point_used"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "earned_point": earnedPoint,
    "point_used": pointUsed,
    "message": message,
    "response_code": responseCode,
  };
}
