// To parse this JSON data, do
//
//     final moodScoreModel = moodScoreModelFromJson(jsonString);

import 'dart:convert';

MoodScoreModel moodScoreModelFromJson(String str) => MoodScoreModel.fromJson(json.decode(str));

String moodScoreModelToJson(MoodScoreModel data) => json.encode(data.toJson());

class MoodScoreModel {
  MoodScoreModel({
    this.moodScorePercent,
    this.responseCode,
  });

  List<MoodScorePercent>? moodScorePercent;
  int? responseCode;

  factory MoodScoreModel.fromJson(Map<String, dynamic> json) => MoodScoreModel(
    moodScorePercent: List<MoodScorePercent>.from(json["mood_score_percent"].map((x) => MoodScorePercent.fromJson(x))),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "mood_score_percent": List<dynamic>.from(moodScorePercent!.map((x) => x.toJson())),
    "response_code": responseCode,
  };
}

class MoodScorePercent {
  MoodScorePercent({
    required this.categoryName,
    required this.categoryPercent,
  });

  String categoryName;
  double categoryPercent;

  factory MoodScorePercent.fromJson(Map<String, dynamic> json) => MoodScorePercent(
    categoryName: json["category_name"],
    categoryPercent: json["category_percent"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_percent": categoryPercent,
  };
}
