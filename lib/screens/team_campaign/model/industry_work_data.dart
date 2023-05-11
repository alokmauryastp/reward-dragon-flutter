// To parse this JSON data, do
//
//     final industryWorkData = industryWorkDataFromJson(jsonString);

import 'dart:convert';

IndustryWorkData industryWorkDataFromJson(String str) => IndustryWorkData.fromJson(json.decode(str));

String industryWorkDataToJson(IndustryWorkData data) => json.encode(data.toJson());

class IndustryWorkData {
  IndustryWorkData({
    this.industryWorkData,
    this.message,
    this.response,
  });

  List<IndustryWorkDatum>? industryWorkData;
  String? message;
  int? response;

  factory IndustryWorkData.fromJson(Map<String, dynamic> json) => IndustryWorkData(
    industryWorkData: List<IndustryWorkDatum>.from(json["industry_work_data"].map((x) => IndustryWorkDatum.fromJson(x))),
    message: json["message"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "industry_work_data": List<dynamic>.from(industryWorkData!.map((x) => x.toJson())),
    "message": message,
    "response": response,
  };
}

class IndustryWorkDatum {
  IndustryWorkDatum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.organiztaionId,
    required this.name,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int organiztaionId;
  String name;
  int status;

  factory IndustryWorkDatum.fromJson(Map<String, dynamic> json) => IndustryWorkDatum(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    organiztaionId: json["organiztaion_id"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "organiztaion_id": organiztaionId,
    "name": name,
    "status": status,
  };
}
