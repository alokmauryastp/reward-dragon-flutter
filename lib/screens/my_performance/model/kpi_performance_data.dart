// To parse this JSON data, do
//
//     final kpiPerformanceData = kpiPerformanceDataFromJson(jsonString);

import 'dart:convert';

KpiPerformanceData kpiPerformanceDataFromJson(String str) => KpiPerformanceData.fromJson(json.decode(str));

String kpiPerformanceDataToJson(KpiPerformanceData data) => json.encode(data.toJson());

class KpiPerformanceData {
  KpiPerformanceData({
    this.totalKpiPercentData,
    this.kpiPercentData,
    this.message,
    this.responseCode,
  });

  double? totalKpiPercentData;
  List<KpiPercentDatum>? kpiPercentData;
  String? message;
  int? responseCode;

  factory KpiPerformanceData.fromJson(Map<String, dynamic> json) => KpiPerformanceData(
    totalKpiPercentData: json["total_kpi_percent_data"].toDouble(),
    kpiPercentData: List<KpiPercentDatum>.from(json["kpi_percent_data"].map((x) => KpiPercentDatum.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "total_kpi_percent_data": totalKpiPercentData,
    "kpi_percent_data": List<dynamic>.from(kpiPercentData!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class KpiPercentDatum {
  KpiPercentDatum({
    required this.kpiName,
    required this.kpiPercent,
  });

  String kpiName;
  double kpiPercent;

  factory KpiPercentDatum.fromJson(Map<String, dynamic> json) => KpiPercentDatum(
    kpiName: json["kpi_name"],
    kpiPercent: json["kpi_percent"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "kpi_name": kpiName,
    "kpi_percent": kpiPercent,
  };
}
