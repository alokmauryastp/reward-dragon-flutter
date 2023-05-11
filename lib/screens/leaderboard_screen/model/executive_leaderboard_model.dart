// To parse this JSON data, do
//
//     final executiveLeaderboardModel = executiveLeaderboardModelFromJson(jsonString);

import 'dart:convert';

ExecutiveLeaderboardModel executiveLeaderboardModelFromJson(String str) => ExecutiveLeaderboardModel.fromJson(json.decode(str));

String executiveLeaderboardModelToJson(ExecutiveLeaderboardModel data) => json.encode(data.toJson());

class ExecutiveLeaderboardModel {
  ExecutiveLeaderboardModel({
    this.message,
    this.data,
  });

  String? message;
  List<ExecutiveLeaderboard>? data;

  factory ExecutiveLeaderboardModel.fromJson(Map<String, dynamic> json) => ExecutiveLeaderboardModel(
    message: json["message"],
    data: List<ExecutiveLeaderboard>.from(json["data"].map((x) => ExecutiveLeaderboard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ExecutiveLeaderboard {
  ExecutiveLeaderboard({
    required this.id,
    required this.teamId,
    required this.managerName,
    required this.email,
    required this.superteamManagerId,
    required this.teamName,
  });

  int id;
  int teamId;
  String managerName;
  String email;
  int superteamManagerId;
  String teamName;

  factory ExecutiveLeaderboard.fromJson(Map<String, dynamic> json) => ExecutiveLeaderboard(
    id: json["id"],
    teamId: json["team_id"],
    managerName: json["manager_name"],
    email: json["email"],
    superteamManagerId: json["superteam_manager_id"],
    teamName: json["team_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team_id": teamId,
    "manager_name": managerName,
    "email": email,
    "superteam_manager_id": superteamManagerId,
    "team_name": teamName,
  };
}
