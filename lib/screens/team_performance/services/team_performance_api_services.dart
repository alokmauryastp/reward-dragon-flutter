import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/employee_model.dart';
import '../model/kpi_list_model.dart';
import '../model/team_performance_model.dart';

class TeamPerformanceApiServices {

  Future<KpiListModel> getKpiList() async {
    Uri uri = Uri.parse(managerKpiListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'unique_code': user.uniqueCode};
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final kpiListModel = kpiListModelFromJson(response.body);
      return kpiListModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<EmployeeModel> teamEmployeeList(managerId) async {
    Uri uri = Uri.parse(teamEmployeeListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'manager_id': managerId};

      final response = await http.post(uri, headers: headers, body: jsonEncode(body));

      final employeeModel = employeeModelFromJson(response.body);
      return employeeModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<TeamPerformanceModel> getTeamPerformanceList(selectedKpi,selectedName,timePeriod) async {
    Uri uri = Uri.parse(teamPerformanceListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'manager_email': user.email,
        'team_id': user.teamId,
        'select_kpi': selectedKpi==0? "all" : selectedKpi,
        'select_name': selectedName==0?"all":selectedName,
        'select_time_period': timePeriod,
      };
      final response =          await http.post(uri, headers: headers, body: jsonEncode(body));
          final teamPerformanceModel = teamPerformanceModelFromJson(response.body);
          return teamPerformanceModel;

    } catch (e) {
      rethrow;
    }
  }
}
