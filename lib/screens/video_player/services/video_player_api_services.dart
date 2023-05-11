import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/focused_wellbeing_time.dart';
import '../model/inspired_living_time.dart';
import '../model/learn_for_fun.dart';
import '../model/learning_material.dart';

class VideoPlayerApiServices {
  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  Future<FocusedWellbeingTime> watchTimeData(videoId, spendTime) async {
    Uri uri = Uri.parse(watchTimeDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'leader_ship_task': videoId,
        'spent_time': formattedTime(timeInSecond: spendTime),
        'spent_time_seconds': spendTime,
        'bonus_point': 0,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final focusedWellbeingTime = focusedWellbeingTimeFromJson(response.body);
      return focusedWellbeingTime;
    } catch (e) {
      rethrow;
    }
  }

  Future<LearnForFun> skillHobbyTimeData(videoId, spendTime) async {
    Uri uri = Uri.parse(skillHobbyTimeDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'skill_and_hobby': videoId,
        'spent_time': formattedTime(timeInSecond: spendTime),
        'spent_time_seconds': spendTime,
        'bonus_point': 0,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final learnForFun = learnForFunFromJson(response.body);
      return learnForFun;
    } catch (e) {
      rethrow;
    }
  }

  Future<LearningMaterial> learningMaterialTimeData(videoId, spendTime) async {
    Uri uri = Uri.parse(learningMaterialTimeDataUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'learning_material': videoId,
        'spent_time': formattedTime(timeInSecond: spendTime),
        'spent_time_seconds': spendTime,
        'bonus_point': 0,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final learningMaterial = learningMaterialFromJson(response.body);
      return learningMaterial;
    } catch (e) {
      rethrow;
    }
  }

  Future<InspireLivingTime> inspiredLivingTimeUpdate(videoId, spendTime) async {
    Uri uri = Uri.parse(inspiredLivingTimeUpdateUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'finance_and_art_video': videoId,
        'spent_time': formattedTime(timeInSecond: spendTime),
        'spent_time_seconds': spendTime,
        'bonus_point': 0,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final inspireLivingTime = inspireLivingTimeFromJson(response.body);
      return inspireLivingTime;
    } catch (e) {
      rethrow;
    }
  }
}
