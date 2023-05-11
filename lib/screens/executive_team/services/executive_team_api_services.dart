import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import '../../../constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/executive_model.dart';

class ExecutiveTeamApiServices {

  Future<ExecutiveModel> executiveList() async {
    Uri uri = Uri.parse(executiveListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'unique_code': user.uniqueCode};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final executiveModel = executiveModelFromJson(response.body);
      return executiveModel;
    } catch (e) {
      rethrow;
    }
  }
}
