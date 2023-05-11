// To parse this JSON data, do
//
//     final kpiModel = kpiModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

KpiModel kpiModelFromJson(String str) => KpiModel.fromJson(json.decode(str));

String kpiModelToJson(KpiModel data) => json.encode(data.toJson());

class KpiModel {
  KpiModel({
    this.kpiNameData,
    this.message,
    this.responseCode,
  });

  List<KpiNameDatum>? kpiNameData;
  String? message;
  int? responseCode;

  factory KpiModel.fromJson(Map<String, dynamic> json) => KpiModel(
        kpiNameData: List<KpiNameDatum>.from(
            json["kpi_name_data"].map((x) => KpiNameDatum.fromJson(x))),
        message: json["message"],
        responseCode: json["response_code"],
      );

  Map<String, dynamic> toJson() => {
        "kpi_name_data":
            List<dynamic>.from(kpiNameData!.map((x) => x.toJson())),
        "message": message,
        "response_code": responseCode,
      };
}

class KpiNameDatum {
  KpiNameDatum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.industryWorkTypeId,
    required this.organiztaionId,
    required this.name,
    required this.kpiType,
    required this.kpiUnit,
    required this.expected,
    required this.kpiTarget,
    required this.targetTimePeriod,
    required this.applicable,
    required this.isTime,
    required this.isSelected,
    required this.targetController,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int industryWorkTypeId;
  int organiztaionId;
  String name;
  String kpiType;
  String kpiUnit;
  String expected;
  String kpiTarget;
  String targetTimePeriod;
  String applicable;
  int isTime;
  RxBool isSelected;
  TextEditingController targetController;

  factory KpiNameDatum.fromJson(Map<String, dynamic> json) => KpiNameDatum(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        industryWorkTypeId: json["industry_work_type_id"],
        organiztaionId: json["organiztaion_id"]??0,
        name: json["name"],
        kpiType: json["kpi_type"],
        kpiUnit: json["kpi_unit"],
        expected: json["expected"],
        kpiTarget: json["kpi_target"],
        targetTimePeriod: json["target_time_period"],
        applicable: json["applicable"]??"",
        isTime: json["is_time"],
        isSelected: false.obs,
        targetController: TextEditingController(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "industry_work_type_id": industryWorkTypeId,
        "organiztaion_id": organiztaionId,
        "name": name,
        "kpi_type": kpiType,
        "kpi_unit": kpiUnit,
        "expected": expected,
        "kpi_target": kpiTarget,
        "target_time_period": targetTimePeriod,
        "applicable": applicable,
        "is_time": isTime,
        "is_selected": isSelected,
      };
}
