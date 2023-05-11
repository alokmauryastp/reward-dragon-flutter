import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/team_wellbeing_list.dart';
import '../model/team_wellbeing_top_three.dart';

class ManagerWellBeingApiServices {

  Future<TeamWellbeingList> teamWellBeingList(timePeriod) async {
    Uri uri = Uri.parse(teamWellbeingListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'team_id': user.teamId,
        'time_period_all': timePeriod,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final teamWellbeingList = teamWellbeingListFromJson(response.body);
      return teamWellbeingList;
    } catch (e) {
      rethrow;
    }
  }

  Future<TeamWellbeingTopThreeList> teamWellbeingTopThreeList() async {
    Uri uri = Uri.parse(teamWellbeingTopThreeListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'team_id': user.teamId};
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final teamWellbeingTopThreeList =
          teamWellbeingTopThreeListFromJson(response.body);
      return teamWellbeingTopThreeList;
    } catch (e) {
      rethrow;
    }
  }

}
