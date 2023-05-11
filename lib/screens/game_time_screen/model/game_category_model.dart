// To parse this JSON data, do
//
//     final gameCategoryModel = gameCategoryModelFromJson(jsonString);

import 'dart:convert';

GameCategoryModel gameCategoryModelFromJson(String str) => GameCategoryModel.fromJson(json.decode(str));

String gameCategoryModelToJson(GameCategoryModel data) => json.encode(data.toJson());

class GameCategoryModel {
  GameCategoryModel({
    this.gameCategories,
    this.message,
    this.responseCode,
  });

  List<GameCategory>? gameCategories;
  String? message;
  int? responseCode;

  factory GameCategoryModel.fromJson(Map<String, dynamic> json) => GameCategoryModel(
    gameCategories: List<GameCategory>.from(json["game_categories"].map((x) => GameCategory.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "game_categories": List<dynamic>.from(gameCategories!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class GameCategory {
  GameCategory({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.gameCategory,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String gameCategory;
  int status;

  factory GameCategory.fromJson(Map<String, dynamic> json) => GameCategory(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gameCategory: json["game_category"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "game_category": gameCategory,
    "status": status,
  };
}
