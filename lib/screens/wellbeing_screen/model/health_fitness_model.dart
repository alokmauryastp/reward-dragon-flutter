// To parse this JSON data, do
//
//     final healthFitnessModel = healthFitnessModelFromJson(jsonString);

import 'dart:convert';

HealthFitnessModel healthFitnessModelFromJson(String str) => HealthFitnessModel.fromJson(json.decode(str));

String healthFitnessModelToJson(HealthFitnessModel data) => json.encode(data.toJson());

class HealthFitnessModel {
  HealthFitnessModel({
    this.leadershipListData,
  });

  List<LeadershipListData>? leadershipListData;

  factory HealthFitnessModel.fromJson(Map<String, dynamic> json) => HealthFitnessModel(
    leadershipListData: List<LeadershipListData>.from(json["leadership_list_Data"].map((x) => LeadershipListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "leadership_list_Data": List<dynamic>.from(leadershipListData!.map((x) => x.toJson())),
  };
}

class LeadershipListData {
  LeadershipListData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.videoUrl,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String videoUrl;
  int status;

  factory LeadershipListData.fromJson(Map<String, dynamic> json) => LeadershipListData(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    videoUrl: json["video_url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "video_url": videoUrl,
    "status": status,
  };
}
