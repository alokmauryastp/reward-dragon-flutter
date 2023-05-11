// To parse this JSON data, do
//
//     final teamListRewardResource = teamListRewardResourceFromJson(jsonString);

import 'dart:convert';

TeamListRewardResource teamListRewardResourceFromJson(String str) => TeamListRewardResource.fromJson(json.decode(str));

String teamListRewardResourceToJson(TeamListRewardResource data) => json.encode(data.toJson());

class TeamListRewardResource {
  TeamListRewardResource({
    this.message,
    this.data,
  });

  String? message;
  List<TeamList>? data;

  factory TeamListRewardResource.fromJson(Map<String, dynamic> json) => TeamListRewardResource(
    message: json["message"],
    data: json["data"]!=null ?  List<TeamList>.from(json["data"].map((x) => TeamList.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TeamList {
  TeamList({
    required this.id,
    required this.teamId,
    required this.managerName,
    required this.email,
    required this.teamName,
    required this.designation,
    required this.userImage,
  });

  int id;
  int teamId;
  String managerName;
  String email;
  String teamName;
  String designation;
  String userImage;

  factory TeamList.fromJson(Map<String, dynamic> json) => TeamList(
    id: json["id"],
    teamId: json["team_id"],
    managerName: json["manager_name"],
    email: json["email"],
    teamName: json["team_name"],
    designation: json["designation"]??"",
    userImage: json["user_image"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_id": teamId,
    "manager_name": managerName,
    "email": email,
    "team_name": teamName,
    "designation": designation,
    "user_image": userImage,
  };
}
