// To parse this JSON data, do
//
//     final inspiredLivingModel = inspiredLivingModelFromJson(jsonString);

import 'dart:convert';

InspiredLivingModel inspiredLivingModelFromJson(String str) => InspiredLivingModel.fromJson(json.decode(str));

String inspiredLivingModelToJson(InspiredLivingModel data) => json.encode(data.toJson());

class InspiredLivingModel {
  InspiredLivingModel({
    this.responseCode,
    this.message,
    this.financeAndArtData,
  });

  int? responseCode;
  String? message;
  List<FinanceAndArtDatum>? financeAndArtData;

  factory InspiredLivingModel.fromJson(Map<String, dynamic> json) => InspiredLivingModel(
    responseCode: json["response_code"],
    message: json["message"],
    financeAndArtData: List<FinanceAndArtDatum>.from(json["finance_and_art_data"].map((x) => FinanceAndArtDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "message": message,
    "finance_and_art_data": List<dynamic>.from(financeAndArtData!.map((x) => x.toJson())),
  };
}

class FinanceAndArtDatum {
  FinanceAndArtDatum({
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

  factory FinanceAndArtDatum.fromJson(Map<String, dynamic> json) => FinanceAndArtDatum(
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
