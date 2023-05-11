// To parse this JSON data, do
//
//     final campaignData = campaignDataFromJson(jsonString);

import 'dart:convert';

CampaignData campaignDataFromJson(String str) => CampaignData.fromJson(json.decode(str));

String campaignDataToJson(CampaignData data) => json.encode(data.toJson());

class CampaignData {
  CampaignData({
    this.message,
    this.campaignData,
    this.totalCampaignsRunning,
  });

  String? message;
  List<Campaigns>? campaignData;
  int? totalCampaignsRunning;

  factory CampaignData.fromJson(Map<String, dynamic> json) => CampaignData(
    message: json["message"],
    campaignData: List<Campaigns>.from(json["campaign_data"].map((x) => Campaigns.fromJson(x))),
    totalCampaignsRunning: json["total_campaigns_running"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "campaign_data": List<dynamic>.from(campaignData!.map((x) => x.toJson())),
    "total_campaigns_running": totalCampaignsRunning,
  };
}

class Campaigns {
  Campaigns({
    required this.id,
    required this.purposeName,
    required this.campaignName,
    required this.industryWorkType,
    required this.customerAcceptedId,
    required this.startDate,
    required this.endDate,
    required this.isAccepted,
    required this.isBroadcast,
    required this.isCompletedByCustomer,
    required this.isCompletedByManager,
    required this.createdAt,
    required this.updatedAt,
    required this.kpiData,
  });

  int id;
  String purposeName;
  String campaignName;
  int industryWorkType;
  dynamic customerAcceptedId;
  DateTime startDate;
  DateTime endDate;
  int isAccepted;
  int isBroadcast;
  int isCompletedByCustomer;
  int isCompletedByManager;
  DateTime createdAt;
  DateTime updatedAt;
  List<KpiDetails> kpiData;

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
    id: json["id"],
    purposeName: json["purpose_name"],
    campaignName: json["campaign_name"],
    industryWorkType: json["industry_work_type"],
    customerAcceptedId: json["customer_accepted_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    isAccepted: json["is_accepted"],
    isBroadcast: json["is_broadcast"],
    isCompletedByCustomer: json["is_completed_by_customer"],
    isCompletedByManager: json["is_completed_by_manager"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    kpiData: List<KpiDetails>.from(json["kpi_data"].map((x) => KpiDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "purpose_name": purposeName,
    "campaign_name": campaignName,
    "industry_work_type": industryWorkType,
    "customer_accepted_id": customerAcceptedId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "is_accepted": isAccepted,
    "is_broadcast": isBroadcast,
    "is_completed_by_customer": isCompletedByCustomer,
    "is_completed_by_manager": isCompletedByManager,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "kpi_data": List<dynamic>.from(kpiData.map((x) => x.toJson())),
  };
}

class KpiDetails {
  KpiDetails({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.kpiId,
    required this.rule,
    required this.point,
    required this.kpiName,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int kpiId;
  String rule;
  String point;
  String kpiName;

  factory KpiDetails.fromJson(Map<String, dynamic> json) => KpiDetails(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    kpiId: json["kpi_id"],
    rule: json["rule"],
    point: json["point"],
    kpiName: json["kpi_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "kpi_id": kpiId,
    "rule": rule,
    "point": point,
    "kpi_name": kpiName,
  };
}



