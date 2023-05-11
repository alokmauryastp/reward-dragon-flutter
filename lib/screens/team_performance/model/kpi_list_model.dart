// To parse this JSON data, do
//
//     final kpiListModel = kpiListModelFromJson(jsonString);

import 'dart:convert';

KpiListModel kpiListModelFromJson(String str) => KpiListModel.fromJson(json.decode(str));

String kpiListModelToJson(KpiListModel data) => json.encode(data.toJson());

class KpiListModel {
  KpiListModel({
    this.kpiData,
  });

  List<KpiDetails>? kpiData;

  factory KpiListModel.fromJson(Map<String, dynamic> json) => KpiListModel(
    kpiData: List<KpiDetails>.from(json["kpi_data"].map((x) => KpiDetails.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kpi_data": List<dynamic>.from(kpiData!.map((x) => x.toJson())),
  };
}

class KpiDetails {
  KpiDetails({
    required this.id,
    required this.industryWorkTypeId,
    required this.organiztaionId,
    required this.name,
    required this.kpiType,
    required this.kpiUnit,
    required this.expected,
    required this.kpiTarget,
    required this.targetTimePeriod,
    required this.applicable,
  });

  int id;
  int industryWorkTypeId;
  dynamic organiztaionId;
  String name;
  String kpiType;
  String kpiUnit;
  String expected;
  String kpiTarget;
  String targetTimePeriod;
  String applicable;

  factory KpiDetails.fromJson(Map<String, dynamic> json) => KpiDetails(
    id: json["id"],
    industryWorkTypeId: json["industry_work_type_id"],
    organiztaionId: json["organiztaion_id"]??0,
    name: json["name"],
    kpiType: json["kpi_type"]??"",
    kpiUnit: json["kpi_unit"]??"",
    expected: json["expected"]??"",
    kpiTarget: json["kpi_target"]??"",
    targetTimePeriod: json["target_time_period"]??"",
    applicable: json["applicable"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "industry_work_type_id": industryWorkTypeId,
    "organiztaion_id": organiztaionId,
    "name": name,
    "kpi_type": kpiType,
    "kpi_unit": kpiUnit,
    "expected": expected,
    "kpi_target": kpiTarget,
    "target_time_period": targetTimePeriod,
    "applicable": applicable,
  };
}
