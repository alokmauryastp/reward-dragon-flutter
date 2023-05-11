import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/concern_category_model.dart';
import '../model/concern_list_model.dart';
import '../model/manager_concern_category_model.dart';
import '../model/manager_concern_model.dart';
import '../model/submit_concern.dart';
import '../model/submit_user_concern.dart';

class MyConcernApiServices {

  Future<ConcernCategoryModel> getConcernCategoryList() async {
    Uri uri = Uri.parse(concernCategoryListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final concernCategoryModel = concernCategoryModelFromJson(response.body);
      return concernCategoryModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ConcernListModel> getCustomerConcernList() async {
    var user = LocalStorage.user();
    var queryParameters = <String, String>{'user_profile': user.id.toString()};
    Uri uri = Uri.parse(customerConcernListUrl)
        .replace(queryParameters: queryParameters);
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final concernListModel = concernListModelFromJson(response.body);
      return concernListModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubmitUserConcern> submitUserConcern(
      concernCategoryId, description) async {
    Uri uri = Uri.parse(submitUserConcernUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id.toString(),
        'concern_category': concernCategoryId,
        'description': description,
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final submitUserConcern = submitUserConcernFromJson(response.body);
      return submitUserConcern;
    } catch (e) {
      rethrow;
    }
  }

  // Manager Part

  Future<ManagerConcernCategoryModel> getConcernCategoryForManager() async {
    Uri uri = Uri.parse(concernCategoryForManagerUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final managerConcernCategoryModel =
          managerConcernCategoryModelFromJson(response.body);

      return managerConcernCategoryModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ManagerConcernModel> getConcernListForManager() async {
    var user = LocalStorage.user();
    var queryParameters = <String, String>{'user_profile': user.id.toString()};
    Uri uri = Uri.parse(concernListForManagerUrl)
        .replace(queryParameters: queryParameters);
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final managerConcernModel = managerConcernModelFromJson(response.body);
      return managerConcernModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubmitConcern> submitManagerConcern(concernCategoryId, description) async {
    Uri uri = Uri.parse(submitManagerConcernUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id.toString(),
        'concern_category': concernCategoryId,
        'description': description,
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final submitConcern = submitConcernFromJson(response.body);
      return submitConcern;
    } catch (e) {
      rethrow;
    }
  }


}
