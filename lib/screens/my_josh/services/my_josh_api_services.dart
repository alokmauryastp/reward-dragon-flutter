import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/customer_reason_type.dart';
import '../model/manager_reason_type.dart';
import '../model/mood_model.dart';
import '../model/submit_josh_model.dart';
import '../model/submit_manager_josh.dart';

class MyJoshReasonApiServices {

  Future<CustomerReasonType> getJoshReasonType() async {
    Uri uri = Uri.parse(joshReasonTypeUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final customerReasonType = customerReasonTypeFromJson(response.body);
      return customerReasonType;
    } catch (e) {
      rethrow;
    }
  }

  Future<ManagerReasonType> getJoshReasonTypeForManager() async {
    Uri uri = Uri.parse(joshReasonTypeForManagerUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final managerReasonType = managerReasonTypeFromJson(response.body);
      return managerReasonType;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubmitJoshModel> submitCustomerJosh(
      point, reasonId, description) async {
    Uri uri = Uri.parse(submitCustomerJoshUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'description': description,
        'emoji_point': point,
        'manager_id': user.teamId, // send team id here
        'reason_type': (point != 4 && point != 5) ? reasonId : '',
      };

      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final submitJoshModel = submitJoshModelFromJson(response.body);
      return submitJoshModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubmitManagerJosh> submitManagerJosh(
      point, reasonId, description) async {
    Uri uri = Uri.parse(submitManagerJoshUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'manager': user.id,
        'description': description,
        'emoji_point': point,
        'reason_type': (point != 4 && point != 5) ? reasonId : '',
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final submitManagerJosh = submitManagerJoshFromJson(response.body);
      return submitManagerJosh;
    } catch (e) {
      rethrow;
    }
  }

  Future<MoodModel> getJoshTodayForCustomer() async {
    var user = LocalStorage.user();
    try {
      var queryParameters = <String, String>{
        'user_profile': user.id.toString(),
      };
      Uri uri = Uri.parse(customerJoshReasonTodayUrl)
          .replace(queryParameters: queryParameters);
      var headers = <String, String>{'Authorization': user.token};
      var response = await http.get(uri, headers: headers);
      final moodModel = moodModelFromJson(response.body);
      return moodModel;
    } catch (e) {
      rethrow;
    }
  }

}
