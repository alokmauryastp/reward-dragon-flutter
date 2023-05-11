// To parse this JSON data, do
//
//     final concernCategoryModel = concernCategoryModelFromJson(jsonString);

import 'dart:convert';

ConcernCategoryModel concernCategoryModelFromJson(String str) => ConcernCategoryModel.fromJson(json.decode(str));

String concernCategoryModelToJson(ConcernCategoryModel data) => json.encode(data.toJson());

class ConcernCategoryModel {
  ConcernCategoryModel({
    this.msg,
    this.count,
    this.data,
    this.responseCode,
  });

  String? msg;
  int? count;
  List<Datum>? data;
  int? responseCode;

  factory ConcernCategoryModel.fromJson(Map<String, dynamic> json) => ConcernCategoryModel(
    msg: json["msg"],
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "count": count,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "response_code": responseCode,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "status": status,
  };
}
