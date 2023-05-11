// To parse this JSON data, do
//
//     final teamWellbeingTopThreeList = teamWellbeingTopThreeListFromJson(jsonString);

import 'dart:convert';

TeamWellbeingTopThreeList teamWellbeingTopThreeListFromJson(String str) => TeamWellbeingTopThreeList.fromJson(json.decode(str));

String teamWellbeingTopThreeListToJson(TeamWellbeingTopThreeList data) => json.encode(data.toJson());

class TeamWellbeingTopThreeList {
  TeamWellbeingTopThreeList({
    this.topThreeStepsLists,
    this.topThreeHeartLists,
    this.topThreeLearningLists,
    this.topThreeMeditationLists,
    this.message,
    this.responseCode,
  });

  List<TopThreeList>? topThreeStepsLists;
  List<TopThreeList>? topThreeHeartLists;
  List<TopThreeList>? topThreeLearningLists;
  List<TopThreeList>? topThreeMeditationLists;
  String? message;
  int? responseCode;

  factory TeamWellbeingTopThreeList.fromJson(Map<String, dynamic> json) => TeamWellbeingTopThreeList(
    topThreeStepsLists: List<TopThreeList>.from(json["top_three_steps_lists"].map((x) => TopThreeList.fromJson(x))),
    topThreeHeartLists: List<TopThreeList>.from(json["top_three_heart_lists"].map((x) => TopThreeList.fromJson(x))),
    topThreeLearningLists: List<TopThreeList>.from(json["top_three_learning_lists"].map((x) => TopThreeList.fromJson(x))),
    topThreeMeditationLists: List<TopThreeList>.from(json["top_three_meditation_lists"].map((x) => TopThreeList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "top_three_steps_lists": List<dynamic>.from(topThreeStepsLists!.map((x) => x.toJson())),
    "top_three_heart_lists": List<dynamic>.from(topThreeHeartLists!.map((x) => x.toJson())),
    "top_three_learning_lists": List<dynamic>.from(topThreeLearningLists!.map((x) => x.toJson())),
    "top_three_meditation_lists": List<dynamic>.from(topThreeMeditationLists!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class TopThreeList {
  TopThreeList({
    required this.id,
    required this.username,
    required this.percent,
    required this.avatarImage,
  });

  int id;
  String username;
  double percent;
  String avatarImage;

  factory TopThreeList.fromJson(Map<String, dynamic> json) => TopThreeList(
    id: json["id"],
    username: json["username"],
    percent: json["percent"].toDouble(),
    avatarImage: json["avatar_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "percent": percent,
    "avatar_image": avatarImage,
  };
}



