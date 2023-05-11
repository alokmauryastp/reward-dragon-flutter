import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/model/customer_reward_resource.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:http/http.dart' as http;
import '../model/manager_reward_resource.dart';
import '../model/team_list_reward_resource.dart';
import '../model/team_points_model.dart';
import '../model/team_reward_resource.dart';

class LeaderboardApiService {

  Future<TeamListRewardResource> teamListForRewardResource() async {
    Uri uri = Uri.parse(teamListForRewardResourceUrl);
    User user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'executive_email': user.email};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final teamListRewardResource = teamListRewardResourceFromJson(response.body);
      return teamListRewardResource;
    } catch (e) {
      rethrow;
    }
  }

  Future<ManagerRewardResource> executiveRewardResources(
      String selectedDate) async {
    Uri uri = Uri.parse(executiveRewardResourcesUrl);
    User user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      var body = <String, String>{
        'user_profile_id': user.id.toString(),
        'all': selectedDate.isEmpty ? 'all' : "",
        'date': selectedDate.isEmpty ? "" : selectedDate,
      };
      final response = await http.post(uri, headers: headers, body: body);

      final managerRewardResource =
          managerRewardResourceFromJson(response.body);
      return managerRewardResource;
    } catch (e) {
      rethrow;
    }
  }

  Future<ManagerRewardResource> managerRewardResources(
      String selectedDate) async {
    Uri uri = Uri.parse(managerRewardResourcesUrl);
    User user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};

      var body = <String, String>{
        'user_profile_id': user.id.toString(),
        'all': selectedDate.isEmpty ? 'all' : "",
        'date': selectedDate.isEmpty ? "" : selectedDate,
      };

      final response = await http.post(uri, headers: headers, body: body);

      final managerRewardResource = managerRewardResourceFromJson(response.body);

      return managerRewardResource;

    } catch (e) {
      rethrow;
    }
  }

  Future<CustomerRewardResource> customerRewardResources(
      String selectedDate) async {
    Uri uri = Uri.parse(customerRewardResourcesUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, String>{
        'user_profile_id': LocalStorage.user().id.toString(),
        'all': selectedDate.isEmpty ? 'all' : "",
        'date': selectedDate.isEmpty ? "" : selectedDate,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final customerRewardResource =
          customerRewardResourceFromJson(response.body);
      return customerRewardResource;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TeamPointsList>> getExecutiveLeaderboardFilter(group, timePeriod,teamId) async {
    Uri uri = Uri.parse(executiveLeaderboardFilterUrl);
    User user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      var body = <String, String>{
        'executive_email': user.email.toString(),
        'select_name_all': 'select_name_all',
        'group_all': group,
        'time_period_all': timePeriod,
        'team_id': teamId.toString(),
      };
      final response = await http.post(uri, headers: headers, body: body);
      final teamPointsModel = teamPointsModelFromJson(response.body);
      return teamPointsModel.teamPointsData;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TeamPointsList>> getTeamLeaderboardFilter(
      group, timePeriod) async {
    Uri uri = Uri.parse(teamLeaderboardFilterUrl);
    User user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      var body = <String, String>{
        'manager_id': user.id.toString(),
        'team_id': user.teamId.toString(),
        'select_name_all': 'select_name_all',
        'group_all': group,
        'time_period_all': timePeriod,
      };
      final response = await http.post(uri, headers: headers, body: body);
      final teamPointsModel = teamPointsModelFromJson(response.body);
      return teamPointsModel.teamPointsData;
    } catch (e) {
      rethrow;
    }
  }

  Future<TeamRewardResource> getTeamPointData(teamId) async {
    Uri uri = Uri.parse(teamPointDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'team_id': teamId};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final teamRewardResource = teamRewardResourceFromJson(response.body);
      return teamRewardResource;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getMotivationalMessage() async {
    Uri uri = Uri.parse(motivationalMessageUrl);
    var userId = LocalStorage.user().id;
    var msg = "";
    try {
      var body = <String, String>{'employee_id': userId.toString()};
      final response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        var obj = jsonDecode(response.body);
        if (obj['response_code'] == 200) {
          msg = obj['motivation_message'];
        }
      }
      return msg;
    } catch (e) {
      rethrow;
    }
  }

}
