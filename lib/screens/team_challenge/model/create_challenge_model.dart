// To parse this JSON data, do
//
//     final createChallengeModel = createChallengeModelFromJson(jsonString);

import 'dart:convert';

CreateChallengeModel createChallengeModelFromJson(String str) => CreateChallengeModel.fromJson(json.decode(str));

String createChallengeModelToJson(CreateChallengeModel data) => json.encode(data.toJson());

class CreateChallengeModel {
  CreateChallengeModel({
    this.message,
    this.challengeId,
    this.responseCode,
  });

  String? message;
  int? challengeId;
  int? responseCode;

  factory CreateChallengeModel.fromJson(Map<String, dynamic> json) => CreateChallengeModel(
    message: json["message"],
    challengeId: json["challenge_id"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "challenge_id": challengeId,
    "response_code": responseCode,
  };
}
