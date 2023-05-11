// To parse this JSON data, do
//
//     final myChallengeModel = myChallengeModelFromJson(jsonString);

import 'dart:convert';

MyChallengeModel myChallengeModelFromJson(String str) => MyChallengeModel.fromJson(json.decode(str));

String myChallengeModelToJson(MyChallengeModel data) => json.encode(data.toJson());

class MyChallengeModel {
  MyChallengeModel({
    this.teamChallengeLists,
    this.message,
    this.responseCode,
  });

  List<TeamChallengeList>? teamChallengeLists;
  String? message;
  int? responseCode;

  factory MyChallengeModel.fromJson(Map<String, dynamic> json) => MyChallengeModel(
    teamChallengeLists: List<TeamChallengeList>.from(json["team_challenge_lists"].map((x) => TeamChallengeList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "team_challenge_lists": List<dynamic>.from(teamChallengeLists!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class TeamChallengeList {
  TeamChallengeList({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.managerId,
    required this.industryWorkType,
    required this.kpiNameId,
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
    required this.kpiName,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int managerId;
  int industryWorkType;
  int kpiNameId;
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
  String kpiName;

  factory TeamChallengeList.fromJson(Map<String, dynamic> json) => TeamChallengeList(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    managerId: json["manager_id"],
    industryWorkType: json["industry_work_type"],
    kpiNameId: json["kpi_name_id"],
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
    kpiName: json["kpi_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "manager_id": managerId,
    "industry_work_type": industryWorkType,
    "kpi_name_id": kpiNameId,
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
    "kpi_name": kpiName,
  };
}
