// To parse this JSON data, do
//
//     final submitManagerJosh = submitManagerJoshFromJson(jsonString);

import 'dart:convert';

SubmitManagerJosh submitManagerJoshFromJson(String str) => SubmitManagerJosh.fromJson(json.decode(str));

String submitManagerJoshToJson(SubmitManagerJosh data) => json.encode(data.toJson());

class SubmitManagerJosh {
  SubmitManagerJosh({
    this.msg,
    this.data,
    this.rewardPointsData,
    this.responseCode,
  });

  String? msg;
  Data? data;
  RewardPointsData? rewardPointsData;
  int? responseCode;

  factory SubmitManagerJosh.fromJson(Map<String, dynamic> json) => SubmitManagerJosh(
    msg: json["msg"],
    data: Data.fromJson(json["Data"]),
    rewardPointsData: RewardPointsData.fromJson(json["reward_points_data"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "Data": data!.toJson(),
    "reward_points_data": rewardPointsData!.toJson(),
    "response_code": responseCode,
  };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.emojiPoint,
    required this.manager,
    required this.reasonType,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  int emojiPoint;
  int manager;
  int reasonType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    description: json["description"],
    emojiPoint: json["emoji_point"],
    manager: json["manager"],
    reasonType: json["reason_type"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "description": description,
    "emoji_point": emojiPoint,
    "manager": manager,
    "reason_type": reasonType,
  };
}

class RewardPointsData {
  RewardPointsData({
    required this.rewardPoints,
    required this.rewardMessage,
  });

  int rewardPoints;
  String rewardMessage;

  factory RewardPointsData.fromJson(Map<String, dynamic> json) => RewardPointsData(
    rewardPoints: json["reward_points"],
    rewardMessage: json["reward_message"],
  );

  Map<String, dynamic> toJson() => {
    "reward_points": rewardPoints,
    "reward_message": rewardMessage,
  };
}
