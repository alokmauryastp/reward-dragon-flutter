// To parse this JSON data, do
//
//     final otherLinkList = otherLinkListFromJson(jsonString);

import 'dart:convert';

OtherLinkModel otherLinkListFromJson(String str) => OtherLinkModel.fromJson(json.decode(str));

String otherLinkListToJson(OtherLinkModel data) => json.encode(data.toJson());

class OtherLinkModel {
  OtherLinkModel({
    this.responseCode,
    this.message,
    this.otherLinkData,
  });

  int? responseCode;
  String? message;
  List<OtherLinkList>? otherLinkData;

  factory OtherLinkModel.fromJson(Map<String, dynamic> json) => OtherLinkModel(
    responseCode: json["response_code"],
    message: json["message"],
    otherLinkData: List<OtherLinkList>.from(json["other_link_data"].map((x) => OtherLinkList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "other_link_data": List<dynamic>.from(otherLinkData!.map((x) => x.toJson())),
  };
}

class OtherLinkList {
  OtherLinkList({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.imageData,
    required this.url,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String imageData;
  String url;
  int status;

  factory OtherLinkList.fromJson(Map<String, dynamic> json) => OtherLinkList(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    imageData: json["image_data"],
    url: json["url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "image_data": imageData,
    "url": url,
    "status": status,
  };
}
