// To parse this JSON data, do
//
//     final myCampaignModel = myCampaignModelFromJson(jsonString);

import 'dart:convert';

MyCampaignModel myCampaignModelFromJson(String str) => MyCampaignModel.fromJson(json.decode(str));

String myCampaignModelToJson(MyCampaignModel data) => json.encode(data.toJson());

class MyCampaignModel {
  MyCampaignModel({
    this.teamCampaignLists,
    this.message,
    this.responseCode,
  });

  List<TeamCampaignList>? teamCampaignLists;
  String? message;
  int? responseCode;

  factory MyCampaignModel.fromJson(Map<String, dynamic> json) => MyCampaignModel(
    teamCampaignLists: List<TeamCampaignList>.from(json["team_campaign_lists"].map((x) => TeamCampaignList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "team_campaign_lists": List<dynamic>.from(teamCampaignLists!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class TeamCampaignList {
  TeamCampaignList({
    required this.id,
    required this.purposeName,
    required this.campaignName,
    required this.contactPerson,
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
  String contactPerson;
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
  List<KpiDatum> kpiData;

  factory TeamCampaignList.fromJson(Map<String, dynamic> json) => TeamCampaignList(
    id: json["id"],
    purposeName: json["purpose_name"],
    campaignName: json["campaign_name"],
    contactPerson: json["contact_person"],
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
    kpiData: List<KpiDatum>.from(json["kpi_data"].map((x) => KpiDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "purpose_name": purposeName,
    "campaign_name": campaignName,
    "contact_person": contactPerson,
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

class KpiDatum {
  KpiDatum({
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

  factory KpiDatum.fromJson(Map<String, dynamic> json) => KpiDatum(
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
