// To parse this JSON data, do
//
//     final managerKpiData = managerKpiDataFromJson(jsonString);

import 'dart:convert';

ManagerKpiData managerKpiDataFromJson(String str) => ManagerKpiData.fromJson(json.decode(str));

String managerKpiDataToJson(ManagerKpiData data) => json.encode(data.toJson());

class ManagerKpiData {
  ManagerKpiData({
    this.managerKpiMetData,
    this.totalKpiWip,
    this.message,
    this.responseCode,
  });

  int? managerKpiMetData;
  int? totalKpiWip;
  String? message;
  int? responseCode;

  factory ManagerKpiData.fromJson(Map<String, dynamic> json) => ManagerKpiData(
    managerKpiMetData: json["manager_kpi_met_data"],
    totalKpiWip: json["total_kpi_wip"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "manager_kpi_met_data": managerKpiMetData,
    "total_kpi_wip": totalKpiWip,
    "message": message,
    "response_code": responseCode,
  };
}
