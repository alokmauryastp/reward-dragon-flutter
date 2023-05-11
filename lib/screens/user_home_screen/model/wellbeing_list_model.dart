// To parse this JSON data, do
//
//     final wellBeingList = wellBeingListFromJson(jsonString);

import 'dart:convert';

WellBeingList wellBeingListFromJson(String str) => WellBeingList.fromJson(json.decode(str));

String wellBeingListToJson(WellBeingList data) => json.encode(data.toJson());

class WellBeingList {

  int? stepsCount;
  int? heartPointsCount;
  dynamic learningHours;
  dynamic meditationHours;
  double? wellbeingPercent;
  String? message;
  int? responseCode;

  WellBeingList({
    this.stepsCount,
    this.heartPointsCount,
    this.learningHours,
    this.meditationHours,
    this.wellbeingPercent,
    this.message,
    this.responseCode,
  });

  WellBeingList.fromJson(Map<String, dynamic> json){
    stepsCount= json["steps_count"];
    heartPointsCount= json["heart_points_count"];
    learningHours= json["learning_hours"];
    meditationHours= json["meditation_hours"];
    wellbeingPercent= json["wellbeing_percent"].toDouble();
    message= json["message"];
    responseCode= json["response_code"];
  }

  // factory WellBeingList.fromJson1(Map<String, dynamic> json) => WellBeingList(
  //   stepsCount: json["steps_count"],
  //   heartPointsCount: json["heart_points_count"],
  //   learningHours: json["learning_hours"],
  //   meditationHours: json["meditation_hours"],
  //   wellbeingPercent: json["wellbeing_percent"].toDouble(),
  //   message: json["message"],
  //   responseCode: json["response_code"],
  // );

  Map<String, dynamic> toJson() => {
    "steps_count": stepsCount,
    "heart_points_count": heartPointsCount,
    "learning_hours": learningHours,
    "meditation_hours": meditationHours,
    "wellbeing_percent": wellbeingPercent,
    "message": message,
    "response_code": responseCode,
  };
}
