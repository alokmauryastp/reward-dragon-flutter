// To parse this JSON data, do
//
//     final teamPointsModel = teamPointsModelFromJson(jsonString);

import 'dart:convert';

TeamPointsModel teamPointsModelFromJson(String str) => TeamPointsModel.fromJson(json.decode(str));

String teamPointsModelToJson(TeamPointsModel data) => json.encode(data.toJson());

class TeamPointsModel {
  TeamPointsModel({
    required this.teamPointsData,
    required this.message,
    required this.responseCode,
  });

  List<TeamPointsList> teamPointsData;
  String message;
  int responseCode;

  factory TeamPointsModel.fromJson(Map<String, dynamic> json) => TeamPointsModel(
    teamPointsData: List<TeamPointsList>.from(json["team_points_data"].map((x) => TeamPointsList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "team_points_data": List<dynamic>.from(teamPointsData.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class TeamPointsList {
  TeamPointsList({
    required this.firstName,
    required this.lastName,
    required this.earnedPoint,
    required this.userImage,
  });

  String firstName;
  String lastName;
  int earnedPoint;
  String userImage;

  factory TeamPointsList.fromJson(Map<String, dynamic> json) => TeamPointsList(
    firstName: json["first_name"],
    lastName: json["last_name"],
    earnedPoint: json["earned_point"],
    userImage: json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "earned_point": earnedPoint,
    "user_image": userImage,
  };
}
