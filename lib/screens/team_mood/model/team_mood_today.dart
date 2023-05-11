// To parse this JSON data, do
//
//     final teamMoodToday = teamMoodTodayFromJson(jsonString);

import 'dart:convert';

TeamMoodToday teamMoodTodayFromJson(String str) => TeamMoodToday.fromJson(json.decode(str));

String teamMoodTodayToJson(TeamMoodToday data) => json.encode(data.toJson());

class TeamMoodToday {
  TeamMoodToday({
    this.percentRespondentToday,
    this.avgScoreToday,
    this.todayScores,
    this.yesterdayScores,
    this.yesterdayKpiMetPercent,
    this.message,
    this.responseCode,
  });

  dynamic percentRespondentToday;
  dynamic avgScoreToday;
  TodayScores? todayScores;
  TodayScores? yesterdayScores;
  TodayScores? yesterdayKpiMetPercent;
  String? message;
  int? responseCode;

  factory TeamMoodToday.fromJson(Map<String, dynamic> json) => TeamMoodToday(
    percentRespondentToday: json["percent_respondent_today"],
    avgScoreToday: json["avg_score_today"],
    todayScores: TodayScores.fromJson(json["today_scores"]),
    yesterdayScores: TodayScores.fromJson(json["yesterday_scores"]),
    yesterdayKpiMetPercent: TodayScores.fromJson(json["yesterday_kpi_met_percent"]),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "percent_respondent_today": percentRespondentToday,
    "avg_score_today": avgScoreToday,
    "today_scores": todayScores?.toJson(),
    "yesterday_scores": yesterdayScores?.toJson(),
    "yesterday_kpi_met_percent": yesterdayKpiMetPercent?.toJson(),
    "message": message,
    "response_code": responseCode,
  };
}

class TodayScores {

  TodayScores({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
  });

  dynamic one;
  dynamic two;
  dynamic three;
  dynamic four;
  dynamic five;

  factory TodayScores.fromJson(Map<String, dynamic> json) => TodayScores(
    one: json["one"],
    two: json["two"],
    three: json["three"],
    four: json["four"],
    five: json["five"],
  );

  Map<String, dynamic> toJson() => {
    "one": one,
    "two": two,
    "three": three,
    "four": four,
    "five": five,
  };
}
