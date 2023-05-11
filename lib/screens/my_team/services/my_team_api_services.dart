import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/team_data_model.dart';

class MyTeamApiServices {

  Future<TeamDataModel> getTeamData() async {
    Uri uri = Uri.parse(managerTeamListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'manager_id': user.managerId,
        'team_id': user.teamId,
        'unique_code': user.uniqueCode
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final teamDataModel = teamDataModelFromJson(response.body);
      return teamDataModel;
    } catch (e) {
      rethrow;
    }
  }
}
