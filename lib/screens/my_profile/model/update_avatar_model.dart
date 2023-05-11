// To parse this JSON data, do
//
//     final updateAvatarModel = updateAvatarModelFromJson(jsonString);

import 'dart:convert';

UpdateAvatarModel updateAvatarModelFromJson(String str) => UpdateAvatarModel.fromJson(json.decode(str));

String updateAvatarModelToJson(UpdateAvatarModel data) => json.encode(data.toJson());

class UpdateAvatarModel {
  UpdateAvatarModel({
    this.msg,
    this.data,
    this.rewardPointsData,
    this.userProfileUpdatedAt,
    this.responseCode,
  });

  String? msg;
  Data? data;
  RewardPointsData? rewardPointsData;
  DateTime? userProfileUpdatedAt;
  int? responseCode;

  factory UpdateAvatarModel.fromJson(Map<String, dynamic> json) => UpdateAvatarModel(
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
    rewardPointsData: RewardPointsData.fromJson(json["reward_points_data"]),
    userProfileUpdatedAt: DateTime.parse(json["user_profile_updated_at"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data!.toJson(),
    "reward_points_data": rewardPointsData!.toJson(),
    "user_profile_updated_at": userProfileUpdatedAt!.toIso8601String(),
    "response_code": responseCode,
  };
}

class Data {
  Data({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String image;
  int status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
    "status": status,
  };
}

class RewardPointsData {
  RewardPointsData({
    required this.rewardPoints,
    required this.rewardMessage,
  });

  int rewardPoints;
  String rewardMessage;

  factory RewardPointsData.fromJson(Map<String, dynamic> json) =>
      RewardPointsData(
        rewardPoints: json["reward_points"] ?? 0,
        rewardMessage: json["reward_message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "reward_points": rewardPoints,
    "reward_message": rewardMessage,
  };
}
