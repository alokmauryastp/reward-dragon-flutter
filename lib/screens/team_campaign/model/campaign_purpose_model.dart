// To parse this JSON data, do
//
//     final campaignPurposeModel = campaignPurposeModelFromJson(jsonString);

import 'dart:convert';

CampaignPurposeModel campaignPurposeModelFromJson(String str) => CampaignPurposeModel.fromJson(json.decode(str));

String campaignPurposeModelToJson(CampaignPurposeModel data) => json.encode(data.toJson());

class CampaignPurposeModel {
  CampaignPurposeModel({
    this.campaignPurpose,
  });

  List<CampaignPurpose>? campaignPurpose;

  factory CampaignPurposeModel.fromJson(Map<String, dynamic> json) => CampaignPurposeModel(
    campaignPurpose: List<CampaignPurpose>.from(json["campaign_purpose"].map((x) => CampaignPurpose.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "campaign_purpose": List<dynamic>.from(campaignPurpose!.map((x) => x.toJson())),
  };
}

class CampaignPurpose {
  CampaignPurpose({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.purposeName,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String purposeName;
  int status;

  factory CampaignPurpose.fromJson(Map<String, dynamic> json) => CampaignPurpose(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    purposeName: json["purpose_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "purpose_name": purposeName,
    "status": status,
  };
}
