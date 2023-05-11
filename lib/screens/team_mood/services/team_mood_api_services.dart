import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../../my_josh/model/mood_model.dart';
import '../model/mood_score_model.dart';
import '../model/team_mood_today.dart';

class TeamMoodApiServices {



  Future<TeamMoodToday> getExecutiveTeamMoodToday(teamId) async {

    Uri uri = Uri.parse(executiveTeamMoodTodayUrl);
    try {
      var user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'team_id': teamId,
      };
      final response = await http.post(uri, headers: headers, body: json.encode(body));
      final teamMoodToday = teamMoodTodayFromJson(response.body);
      return teamMoodToday;
    } catch (e) {
      rethrow;
    }
  }

  Future<TeamMoodToday> getTeamMoodToday() async {

    Uri uri = Uri.parse(teamMoodTodayUrl);
    try {
      var user = LocalStorage.user();
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'manager_id': user.id,
        'team_id': user.teamId,
      };
      final response = await http.post(uri, headers: headers, body: json.encode(body));
      final teamMoodToday = teamMoodTodayFromJson(response.body);
      return teamMoodToday;
    } catch (e) {
      rethrow;
    }
  }

  Future<MoodScoreModel> executiveReasonPieChartData(teamId) async {
    Uri uri = Uri.parse(executiveReasonPieChartDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'team_id': teamId,
        'unique_code': user.uniqueCode,
      };
      final response = await http.post(uri, headers: headers, body: json.encode(body));
      final moodScoreModel = moodScoreModelFromJson(response.body);
      return moodScoreModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<MoodScoreModel> reasonPieChartData() async {
    Uri uri = Uri.parse(reasonPieChartDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'team_id': user.teamId,
        'unique_code': user.uniqueCode,
      };
      final response = await http.post(uri, headers: headers, body: json.encode(body));
      final moodScoreModel = moodScoreModelFromJson(response.body);
      return moodScoreModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<MoodModel> getJoshTodayForExecutive(teamId) async {
    var user = LocalStorage.user();
    try {
      var queryParameters = <String, String>{
        'user_profile': user.id.toString(),
        'team_id': teamId.toString(),
      };
      Uri uri = Uri.parse(executiveJoshReasonTodayUrl)
          .replace(queryParameters: queryParameters);
      var headers = <String, String>{'Authorization': user.token};
      var response = await http.get(uri, headers: headers);
      final moodModel = moodModelFromJson(response.body);
      return moodModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<MoodModel> getJoshTodayForManager() async {
    var user = LocalStorage.user();
    try {
      var queryParameters = <String, String>{
        'user_profile': user.id.toString(),
        'team_id': user.teamId.toString(),
      };
      Uri uri = Uri.parse(managerJoshReasonTodayUrl)
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
