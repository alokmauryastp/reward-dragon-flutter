// To parse this JSON data, do
//
//     final teamWellbeingList = teamWellbeingListFromJson(jsonString);

import 'dart:convert';

TeamWellbeingList teamWellbeingListFromJson(String str) => TeamWellbeingList.fromJson(json.decode(str));

String teamWellbeingListToJson(TeamWellbeingList data) => json.encode(data.toJson());

class TeamWellbeingList {
  TeamWellbeingList({
    this.stepsCount,
    this.heartPointsCount,
    this.learningHours,
    this.meditationHours,
    this.wellbeingPercent,
    this.individualTeamWellbeingPercentLists,
    this.message,
    this.responseCode,
  });

  int? stepsCount;
  int? heartPointsCount;
  dynamic learningHours;
  dynamic meditationHours;
  double? wellbeingPercent;
  List<IndividualTeamWellbeingPercentList>? individualTeamWellbeingPercentLists;
  String? message;
  int? responseCode;

  factory TeamWellbeingList.fromJson(Map<String, dynamic> json) => TeamWellbeingList(
    stepsCount: json["steps_count"],
    heartPointsCount: json["heart_points_count"],
    learningHours: json["learning_hours"],
    meditationHours: json["meditation_hours"],
    wellbeingPercent: json["wellbeing_percent"].toDouble(),
    individualTeamWellbeingPercentLists: List<IndividualTeamWellbeingPercentList>.from(json["individual_team_wellbeing_percent_lists"].map((x) => IndividualTeamWellbeingPercentList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "steps_count": stepsCount,
    "heart_points_count": heartPointsCount,
    "learning_hours": learningHours,
    "meditation_hours": meditationHours,
    "wellbeing_percent": wellbeingPercent,
    "individual_team_wellbeing_percent_lists": List<dynamic>.from(individualTeamWellbeingPercentLists!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class IndividualTeamWellbeingPercentList {
  IndividualTeamWellbeingPercentList({
    required this.id,
    required this.username,
    required this.avatarImage,
    required this.percent,
  });

  int id;
  String username;
  String avatarImage;
  double percent;

  factory IndividualTeamWellbeingPercentList.fromJson(Map<String, dynamic> json) => IndividualTeamWellbeingPercentList(
    id: json["id"],
    username: json["username"],
    avatarImage: json["avatar_image"],
    percent: json["percent"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "avatar_image": avatarImage,
    "percent": percent,
  };
}
