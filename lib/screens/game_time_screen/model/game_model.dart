// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  GameModel({
    this.responseCode,
    this.message,
    this.gameNameData,
  });

  int? responseCode;
  String? message;
  List<GameNameList>? gameNameData;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    responseCode: json["response_code"],
    message: json["message"],
    gameNameData: List<GameNameList>.from(json["game_name_data"].map((x) => GameNameList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "game_name_data": List<dynamic>.from(gameNameData!.map((x) => x.toJson())),
  };
}

class GameNameList {
  GameNameList({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.gameCategoryId,
    required this.gameUrl,
    required this.logo,
    required this.points,
    required this.purpose,
    required this.benefits,
    required this.gameTime,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  int gameCategoryId;
  String gameUrl;
  String logo;
  int points;
  String purpose;
  String benefits;
  String gameTime;
  int status;

  factory GameNameList.fromJson(Map<String, dynamic> json) => GameNameList(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    gameCategoryId: json["game_category_id"],
    gameUrl: json["game_url"],
    logo: json["logo"],
    points: json["points"],
    purpose: json["purpose"],
    benefits: json["benefits"],
    gameTime: json["game_time"]??"",
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "game_category_id": gameCategoryId,
    "game_url": gameUrl,
    "logo": logo,
    "points": points,
    "purpose": purpose,
    "benefits": benefits,
    "game_time": gameTime,
    "status": status,
  };
}
