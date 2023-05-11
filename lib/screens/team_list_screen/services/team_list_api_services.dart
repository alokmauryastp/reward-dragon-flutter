import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:http/http.dart' as http;
import '../../../constants/urls.dart';
import '../../team_performance/model/employee_model.dart';

class TeamListApiServices {

  Future<EmployeeModel> teamEmployeeList(teamId) async {
    Uri uri = Uri.parse(teamEmployeeListForExecutiveUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'team_id': teamId};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final employeeModel = employeeModelFromJson(response.body);
      return employeeModel;
    } catch (e) {
      rethrow;
    }
  }
}
