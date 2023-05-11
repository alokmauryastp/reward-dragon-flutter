// To parse this JSON data, do
//
//     final uploadImage = uploadImageFromJson(jsonString);

import 'dart:convert';

UploadImage uploadImageFromJson(String str) => UploadImage.fromJson(json.decode(str));

String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  UploadImage({
    this.message,
    this.data,
    this.userImage,
    this.userProfileUpdatedAt,
    this.responseCode,
  });

  String? message;
  Data? data;
  String? userImage;
  DateTime? userProfileUpdatedAt;
  int? responseCode;

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    userImage: json["user_image"],
    userProfileUpdatedAt: DateTime.parse(json["user_profile_updated_at"]),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
    "user_image": userImage,
    "user_profile_updated_at": userProfileUpdatedAt!.toIso8601String(),
    "response_code": responseCode,
  };
}

class Data {
  Data({
    required this.rewardPoints,
    required this.rewardMessage,
  });

  int rewardPoints;
  String rewardMessage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rewardPoints: json["reward_points"] ?? 0,
    rewardMessage: json["reward_message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "reward_points": rewardPoints,
    "reward_message": rewardMessage,
  };
}
