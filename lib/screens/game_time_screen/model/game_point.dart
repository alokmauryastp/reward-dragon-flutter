// To parse this JSON data, do
//
//     final gamePoint = gamePointFromJson(jsonString);

import 'dart:convert';

GamePoint gamePointFromJson(String str) => GamePoint.fromJson(json.decode(str));

String gamePointToJson(GamePoint data) => json.encode(data.toJson());

class GamePoint {

  GamePoint({
    this.totalPlayedGames,
    this.totalBonus,
    this.message,
    this.responseCode,
  });

  int? totalPlayedGames;
  int? totalBonus;
  String? message;
  int? responseCode;

  factory GamePoint.fromJson(Map<String, dynamic> json) => GamePoint(
    totalPlayedGames: json["total_played_games"],
    totalBonus: json["total_bonus"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "total_played_games": totalPlayedGames,
    "total_bonus": totalBonus,
    "message": message,
    "response_code": responseCode,
  };

}
