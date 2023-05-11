// To parse this JSON data, do
//
//     final createCampaignModel = createCampaignModelFromJson(jsonString);

import 'dart:convert';

CreateCampaignModel createCampaignModelFromJson(String str) => CreateCampaignModel.fromJson(json.decode(str));

String createCampaignModelToJson(CreateCampaignModel data) => json.encode(data.toJson());

class CreateCampaignModel {
  CreateCampaignModel({
    this.message,
    this.campaignId,
    this.responseCode,
  });

  String? message;
  int? campaignId;
  int? responseCode;

  factory CreateCampaignModel.fromJson(Map<String, dynamic> json) => CreateCampaignModel(
    message: json["message"],
    campaignId: json["campaign_id"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "campaign_id": campaignId,
    "response_code": responseCode,
  };
}
