// To parse this JSON data, do
//
//     final teamChallengeModel = teamChallengeModelFromJson(jsonString);

import 'dart:convert';

TeamChallengeModel teamChallengeModelFromJson(String str) => TeamChallengeModel.fromJson(json.decode(str));

String teamChallengeModelToJson(TeamChallengeModel data) => json.encode(data.toJson());

class TeamChallengeModel {
  TeamChallengeModel({
    this.message,
    this.challengeList,
    this.totalChallengesRunning,
  });

  String? message;
  List<ChallengeList>? challengeList;
  int? totalChallengesRunning;

  factory TeamChallengeModel.fromJson(Map<String, dynamic> json) => TeamChallengeModel(
    message: json["message"],
    challengeList: List<ChallengeList>.from(json["challenge_data"].map((x) => ChallengeList.fromJson(x))),
    totalChallengesRunning: json["total_challenges_running"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "challenge_data": List<dynamic>.from(challengeList!.map((x) => x.toJson())),
    "total_challenges_running": totalChallengesRunning,
  };
}

class ChallengeList {
  ChallengeList({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.managerId,
    required this.industryWorkType,
    required this.kpiNameId,
    required this.customerAcceptedId,
    required this.challengePurposeId,
    required this.challengeName,
    required this.startTime,
    required this.endTime,
    required this.activityDetails,
    required this.bonusPoint,
    required this.isBroadcasted,
    required this.isAccepted,
    required this.isCompletedByCustomer,
    required this.isCompletedByManager,
    required this.customerAcceptedDate,
    required this.customerAcceptedTime,
    required this.customerCompletedDate,
    required this.customerCompletedTime,
    required this.managerCreatedDate,
    required this.managerCreatedTime,
    required this.managerUpdatedDate,
    required this.managerUpdatedTime,
    required this.endChallengeTime,
    required this.kpiTarget,
    required this.startTimeType,
    required this.endTimeType,
    required this.purposeName,
    required this.kpiName,
    required this.participationPercent,
    required this.winPercent,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int managerId;
  int industryWorkType;
  int kpiNameId;
  dynamic customerAcceptedId;
  int challengePurposeId;
  String challengeName;
  String startTime;
  String endTime;
  String activityDetails;
  String bonusPoint;
  int isBroadcasted;
  int isAccepted;
  int isCompletedByCustomer;
  int isCompletedByManager;
  dynamic customerAcceptedDate;
  dynamic customerAcceptedTime;
  dynamic customerCompletedDate;
  dynamic customerCompletedTime;
  dynamic managerCreatedDate;
  dynamic managerCreatedTime;
  dynamic managerUpdatedDate;
  dynamic managerUpdatedTime;
  dynamic endChallengeTime;
  dynamic kpiTarget;
  dynamic startTimeType;
  dynamic endTimeType;
  String purposeName;
  String kpiName;
  dynamic participationPercent;
  dynamic winPercent;

  factory ChallengeList.fromJson(Map<String, dynamic> json) => ChallengeList(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    managerId: json["manager_id"],
    industryWorkType: json["industry_work_type"],
    kpiNameId: json["kpi_name_id"],
    customerAcceptedId: json["customer_accepted_id"],
    challengePurposeId: json["challenge_purpose_id"],
    challengeName: json["challenge_name"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    activityDetails: json["activity_details"],
    bonusPoint: json["bonus_point"],
    isBroadcasted: json["is_broadcasted"],
    isAccepted: json["is_accepted"],
    isCompletedByCustomer: json["is_completed_by_customer"],
    isCompletedByManager: json["is_completed_by_manager"],
    customerAcceptedDate: json["customer_accepted_date"],
    customerAcceptedTime: json["customer_accepted_time"],
    customerCompletedDate: json["customer_completed_date"],
    customerCompletedTime: json["customer_completed_time"],
    managerCreatedDate: json["manager_created_date"],
    managerCreatedTime: json["manager_created_time"],
    managerUpdatedDate: json["manager_updated_date"],
    managerUpdatedTime: json["manager_updated_time"],
    endChallengeTime: json["end_challenge_time"],
    kpiTarget: json["kpi_target"],
    startTimeType: json["start_time_type"],
    endTimeType: json["end_time_type"],
    purposeName: json["purpose_name"],
    kpiName: json["kpi_name"],
    participationPercent: json["participation_percent"],
    winPercent: json["win_percent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "manager_id": managerId,
    "industry_work_type": industryWorkType,
    "kpi_name_id": kpiNameId,
    "customer_accepted_id": customerAcceptedId,
    "challenge_purpose_id": challengePurposeId,
    "challenge_name": challengeName,
    "start_time": startTime,
    "end_time": endTime,
    "activity_details": activityDetails,
    "bonus_point": bonusPoint,
    "is_broadcasted": isBroadcasted,
    "is_accepted": isAccepted,
    "is_completed_by_customer": isCompletedByCustomer,
    "is_completed_by_manager": isCompletedByManager,
    "customer_accepted_date": customerAcceptedDate,
    "customer_accepted_time": customerAcceptedTime,
    "customer_completed_date": customerCompletedDate,
    "customer_completed_time": customerCompletedTime,
    "manager_created_date": managerCreatedDate,
    "manager_created_time": managerCreatedTime,
    "manager_updated_date": managerUpdatedDate,
    "manager_updated_time": managerUpdatedTime,
    "end_challenge_time": endChallengeTime,
    "kpi_target": kpiTarget,
    "start_time_type": startTimeType,
    "end_time_type": endTimeType,
    "purpose_name": purposeName,
    "kpi_name": kpiName,
    "participation_percent": participationPercent,
    "win_percent": winPercent,
  };
}
