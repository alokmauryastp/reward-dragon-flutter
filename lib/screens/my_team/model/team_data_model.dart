// To parse this JSON data, do
//
//     final teamDataModel = teamDataModelFromJson(jsonString);

import 'dart:convert';

TeamDataModel teamDataModelFromJson(String str) => TeamDataModel.fromJson(json.decode(str));

String teamDataModelToJson(TeamDataModel data) => json.encode(data.toJson());

class TeamDataModel {
  TeamDataModel({
    this.teamsData,
    this.message,
    this.responseCode,
  });

  TeamData? teamsData;
  String? message;
  int? responseCode;

  factory TeamDataModel.fromJson(Map<String, dynamic> json) => TeamDataModel(
    teamsData: TeamData.fromJson(json["teams_data"]),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "teams_data": teamsData!.toJson(),
    "message": message,
    "response_code": responseCode,
  };
}

class TeamData {
  TeamData({
    required this.id,
    required this.organizationName,
    required this.address,
    required this.teamName,
    required this.managerName,
    required this.teamList,
  });

  int id;
  String organizationName;
  String address;
  String teamName;
  String managerName;
  List<TeamList> teamList;

  factory TeamData.fromJson(Map<String, dynamic> json) => TeamData(
    id: json["id"],
    organizationName: json["organization_name"],
    address: json["address"]??"",
    teamName: json["team_name"],
    managerName: json["manager_name"],
    teamList: List<TeamList>.from(json["teams_data"].map((x) => TeamList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "organization_name": organizationName,
    "address": address,
    "team_name": teamName,
    "teams_data": List<dynamic>.from(teamList.map((x) => x.toJson())),
  };
}

class TeamList {
  TeamList({
    required this.id,
    required this.employeeName,
    required this.designation,
    required this.email,
    required this.mobileNo,
    required this.roleId,
    required this.roleName,
    required this.lastActiveOn,
  });

  int id;
  String employeeName;
  String designation;
  String email;
  String mobileNo;
  int roleId;
  String roleName;
  String lastActiveOn;

  factory TeamList.fromJson(Map<String, dynamic> json) => TeamList(
    id: json["id"],
    employeeName: json["employee_name"],
    designation: json["designation"],
    email: json["email"],
    mobileNo: json["mobile_no"]??"",
    roleId: json["role_id"],
    roleName: json["role_name"],
    lastActiveOn: json["last_active_on"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "designation": designation,
    "email": email,
    "mobile_no": mobileNo,
    "role_id": roleId,
    "role_name": roleName,
    "last_active_on": lastActiveOn,
  };
}
