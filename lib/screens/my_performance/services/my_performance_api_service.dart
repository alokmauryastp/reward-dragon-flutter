import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/kpi_performance_data.dart';

class MyPerformanceApiService {
  Future<KpiPerformanceData> getKpiPerformanceData(
      String fromDate, String toDate) async {
    Uri uri = Uri.parse(kpiPerformanceListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'employee_id': user.id,
        'unique_code': user.uniqueCode,
        'all': fromDate.isEmpty ? 'all' : "",
        "from_date": fromDate,
        "to_date": toDate,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final kpiPerformanceData = kpiPerformanceDataFromJson(response.body);
      return kpiPerformanceData;
    } catch (e) {
      rethrow;
    }
  }
}
