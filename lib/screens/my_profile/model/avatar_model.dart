// To parse this JSON data, do
//
//     final avatarModel = avatarModelFromJson(jsonString);

import 'dart:convert';

AvatarModel avatarModelFromJson(String str) => AvatarModel.fromJson(json.decode(str));

String avatarModelToJson(AvatarModel data) => json.encode(data.toJson());

class AvatarModel {
  AvatarModel({
    this.avatarImages,
  });

  List<AvatarImage>? avatarImages;

  factory AvatarModel.fromJson(Map<String, dynamic> json) => AvatarModel(
    avatarImages: List<AvatarImage>.from(json["avatar_images"].map((x) => AvatarImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "avatar_images": List<dynamic>.from(avatarImages!.map((x) => x.toJson())),
  };
}

class AvatarImage {
  AvatarImage({
    required this.createdAt,
    required this.id,
    required this.image,
    required this.status,
    required this.updatedAt,
  });

  String createdAt;
  int id;
  String image;
  int status;
  String updatedAt;

  factory AvatarImage.fromJson(Map<String, dynamic> json) => AvatarImage(
    createdAt: json["created_at"],
    id: json["id"],
    image: json["image"],
    status: json["status"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "id": id,
    "image": image,
    "status": status,
    "updated_at": updatedAt,
  };
}
