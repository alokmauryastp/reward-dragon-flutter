// To parse this JSON data, do
//
//     final teamPerformanceModel = teamPerformanceModelFromJson(jsonString);

import 'dart:convert';

TeamPerformanceModel teamPerformanceModelFromJson(String str) => TeamPerformanceModel.fromJson(json.decode(str));

String teamPerformanceModelToJson(TeamPerformanceModel data) => json.encode(data.toJson());

class TeamPerformanceModel {
  TeamPerformanceModel({
    this.teamMemberCount,
    this.managerKpiMetData,
    this.kpiTrendChartData,
    this.kpiWip,
    this.kpiData,
    this.message,
    this.responseCode,
  });

  int? teamMemberCount;
  int? managerKpiMetData;
  List<KpiTrendChartData>? kpiTrendChartData;
  int? kpiWip;
  List<KpiList>? kpiData;
  String? message;
  int? responseCode;

  factory TeamPerformanceModel.fromJson(Map<String, dynamic> json) => TeamPerformanceModel(
    teamMemberCount: json["team_member_count"],
    managerKpiMetData: json["manager_kpi_met_data"],
    kpiTrendChartData: List<KpiTrendChartData>.from(json["kpi_trend_chart_data"].map((x) => KpiTrendChartData.fromJson(x))),
    kpiWip: json["kpi_wip"],
    kpiData: List<KpiList>.from(json["kpi_data"].map((x) => KpiList.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "team_member_count": teamMemberCount,
    "manager_kpi_met_data": managerKpiMetData,
    "kpi_trend_chart_data": List<dynamic>.from(kpiTrendChartData!.map((x) => x.toJson())),
    "kpi_wip": kpiWip,
    "kpi_data": List<dynamic>.from(kpiData!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class KpiList {
  KpiList({
    required this.kpiName,
    required this.totalTarget,
    required this.totalActual,
    required this.totalGap,
    required this.type,
  });

  String kpiName;
  dynamic totalTarget;
  dynamic totalActual;
  dynamic totalGap;
  String type;

  factory KpiList.fromJson(Map<String, dynamic> json) => KpiList(
    kpiName: json["kpi_name"],
    totalTarget: json["total_target"],
    totalActual: json["total_actual"],
    totalGap: json["total_gap"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "kpi_name": kpiName,
    "total_target": totalTarget,
    "total_actual": totalActual,
    "total_gap": totalGap,
    "type": type,
  };
}

class KpiTrendChartData {
  KpiTrendChartData({
    required this.date,
    required this.kpiPercent,
  });

  DateTime date;
  double kpiPercent;

  factory KpiTrendChartData.fromJson(Map<String, dynamic> json) => KpiTrendChartData(
    date: DateTime.parse(json["date"]),
    kpiPercent: json["kpi_percent"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "kpi_percent": kpiPercent,
  };
}
