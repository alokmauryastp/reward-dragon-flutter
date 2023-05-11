// To parse this JSON data, do
//
//     final moodModel = moodModelFromJson(jsonString);

import 'dart:convert';

MoodModel moodModelFromJson(String str) => MoodModel.fromJson(json.decode(str));

String moodModelToJson(MoodModel data) => json.encode(data.toJson());

class MoodModel {
  MoodModel({
    this.count,
    this.msg,
    this.data,
    this.teamMood,
    this.moodalytics,
    this.responseCode,
  });

  int? count;
  String? msg;
  Data? data;
  int? teamMood;
  List<Moodalytics>? moodalytics;
  int? responseCode;

  factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
    count: json["count"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
    teamMood: json["team_mood"],
    moodalytics: List<Moodalytics>.from(json["moodalytics"].map((x) => Moodalytics.fromJson(x))),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "msg": msg,
    "data": data!.toJson(),
    "team_mood": teamMood,
    "moodalytics": List<dynamic>.from(moodalytics!.map((x) => x.toJson())),
    "response_code": responseCode,
  };
}


class Data {
  Data({
    required this.createdAt,
    required this.emojiPoint,
  });

  DateTime createdAt;
  int emojiPoint;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdAt:json["created_at"]!=null ?  DateTime.parse(json["created_at"]) : DateTime.now(),
    emojiPoint: json["emoji_point"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "emoji_point": emojiPoint,
  };
}

class Data1 {
  Data1({
    required this.managerId,
    required this.description,
    required this.emojiPoint,
    required this.userProfile,
    required this.reasonType,
  });

  dynamic managerId;
  String description;
  dynamic emojiPoint;
  dynamic userProfile;
  dynamic reasonType;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
    managerId: json["manager_id"],
    description: json["description"],
    emojiPoint: json["emoji_point"]??0,
    userProfile: json["user_profile"],
    reasonType: json["reason_type"],
  );

  Map<String, dynamic> toJson() => {
    "manager_id": managerId,
    "description": description,
    "emoji_point": emojiPoint,
    "user_profile": userProfile,
    "reason_type": reasonType,
  };
}

class Moodalytics {
  Moodalytics({
    required this.createdAt,
    required this.emojiPoint,
  });

  String createdAt;
  int emojiPoint;

  factory Moodalytics.fromJson(Map<String, dynamic> json) => Moodalytics(
    createdAt: json["created_at"],
    emojiPoint: json["emoji_point"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "emoji_point": emojiPoint,
  };
}
