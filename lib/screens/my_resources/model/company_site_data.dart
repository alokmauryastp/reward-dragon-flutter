// To parse this JSON data, do
//
//     final companySiteData = companySiteDataFromJson(jsonString);

import 'dart:convert';

CompanySiteData companySiteDataFromJson(String str) => CompanySiteData.fromJson(json.decode(str));

String companySiteDataToJson(CompanySiteData data) => json.encode(data.toJson());

class CompanySiteData {
  CompanySiteData({
    this.responseCode,
    this.message,
    this.companySiteData,
  });

  int? responseCode;
  String? message;
  CompanySiteDataClass? companySiteData;

  factory CompanySiteData.fromJson(Map<String, dynamic> json) => CompanySiteData(
    responseCode: json["response_code"],
    message: json["message"],
    companySiteData: CompanySiteDataClass.fromJson(json["company_site_data"]),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "company_site_data": companySiteData?.toJson(),
  };
}

class CompanySiteDataClass {
  CompanySiteDataClass({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.imageData,
    required this.siteUrl,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String imageData;
  String siteUrl;
  int status;

  factory CompanySiteDataClass.fromJson(Map<String, dynamic> json) => CompanySiteDataClass(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    imageData: json["image_data"],
    siteUrl: json["site_url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "image_data": imageData,
    "site_url": siteUrl,
    "status": status,
  };
}
