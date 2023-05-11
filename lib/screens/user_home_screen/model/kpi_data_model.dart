// To parse this JSON data, do
//
//     final kpiDataModel = kpiDataModelFromJson(jsonString);

import 'dart:convert';

KpiDataModel kpiDataModelFromJson(String str) =>
    KpiDataModel.fromJson(json.decode(str));

String kpiDataModelToJson(KpiDataModel data) => json.encode(data.toJson());

class KpiDataModel {
  int? totalKpiMet;
  int? totalKpiWip;
  String? message;
  int? responseCode;

  KpiDataModel({
    this.totalKpiMet,
    this.totalKpiWip,
    this.message,
    this.responseCode,
  });

  KpiDataModel.fromJson(Map<String, dynamic> json) {
    totalKpiMet = json["total_kpi_met"];
    totalKpiWip = json["total_kpi_wip"];
    message = json["message"];
    responseCode = json["response_code"];
  }

  // factory KpiDataModel.fromJson1(Map<String, dynamic> json) => KpiDataModel(
  //   totalKpiMet: json["total_kpi_met"],
  //   totalKpiWip: json["total_kpi_wip"],
  //   message: json["message"],
  //   responseCode: json["response_code"],
  // );

  Map<String, dynamic> toJson() => {
        "total_kpi_met": totalKpiMet,
        "total_kpi_wip": totalKpiWip,
        "message": message,
        "response_code": responseCode,
      };
}
