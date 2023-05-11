// To parse this JSON data, do
//
//     final learningMaterial = learningMaterialFromJson(jsonString);

import 'dart:convert';

LearningMaterial learningMaterialFromJson(String str) =>
    LearningMaterial.fromJson(json.decode(str));

String learningMaterialToJson(LearningMaterial data) =>
    json.encode(data.toJson());

class LearningMaterial {
  LearningMaterial({
    this.responseCode,
    this.message,
    this.learningMaterial,
  });

  int? responseCode;
  String? message;
  List<LearningMaterialElement>? learningMaterial;

  factory LearningMaterial.fromJson(Map<String, dynamic> json) =>
      LearningMaterial(
        responseCode: json["response_code"],
        message: json["message"],
        learningMaterial: List<LearningMaterialElement>.from(
            json["learning_material"]
                .map((x) => LearningMaterialElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
        "learning_material":
            List<dynamic>.from(learningMaterial!.map((x) => x.toJson())),
      };
}

class LearningMaterialElement {
  LearningMaterialElement({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.imageData,
    required this.learningSiteUrl,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String imageData;
  String learningSiteUrl;
  int status;

  factory LearningMaterialElement.fromJson(Map<String, dynamic> json) =>
      LearningMaterialElement(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        title: json["title"],
        imageData: json["image_data"],
        learningSiteUrl: json["learning_site_url"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "title": title,
        "image_data": imageData,
        "learning_site_url": learningSiteUrl,
        "status": status,
      };
}
