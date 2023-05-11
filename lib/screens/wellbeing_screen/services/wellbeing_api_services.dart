import 'dart:convert';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/google_sign_in/controller/sign_in_controller.dart';
import 'package:flutter_state_management/screens/team_challenge/services/team_challenge_api_services.dart';
import 'package:http/http.dart' as http;
import '../model/health_fitness_model.dart';
import '../model/heart_points.dart';
import '../model/inspired_living_model.dart';
import '../model/skill_hobby_model.dart';
import '../model/update_heart_point.dart';
import '../model/update_step_token.dart';

class WellBeingApiServices {

  Future<HeartPoints> getHeartPointsFromGoogleFit() async {
    Uri uri = Uri.parse(getHeartPointFromGoogleFIt);
    var now = DateTime.now();
    var nowInMillis = DateTime.now().millisecondsSinceEpoch;
    // get the number of steps for today
    var midnightInMillis = DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
    var duration = nowInMillis - midnightInMillis;
    try {

      var accessToken = LocalStorage.getString(keyAccessToken);
      if (accessToken.isEmpty) {
        generateToken();
      }
      var headers = <String, String>{
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var body = <String, dynamic>{
        'aggregateBy': [
          {
            'dataSourceId':
                'derived:com.google.heart_minutes:com.google.android.gms:merge_heart_minutes'
            // 'derived:com.google.step_count.delta:com.google.android.gms:estimated_steps'
          }
        ],
        'bucketByTime': {'durationMillis': duration},
        'startTimeMillis': midnightInMillis,
        'endTimeMillis': nowInMillis
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 401) {
        generateToken();
      }
      final heartPoints = heartPointsFromJson(response.body);
      return heartPoints;
    } catch (e) {
      rethrow;
    }
  }

  generateToken() async {
    await SignInController().signIn2();
    // getHeartPointsFromGoogleFit();
  }

  Future<SkillHobbyModel> getSkillHobbyList() async {
    Uri uri = Uri.parse(skillHobbyListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final skillHobbyModel = skillHobbyModelFromJson(response.body);
      return skillHobbyModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<HealthFitnessModel> getHealthFitnessListData() async {
    Uri uri = Uri.parse(healthAndFitnessDataUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final healthFitnessModel = healthFitnessModelFromJson(response.body);
      return healthFitnessModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<InspiredLivingModel> getInspiredLivingListData() async {
    Uri uri = Uri.parse(inspiredLivingDataUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final inspiredLivingModel = inspiredLivingModelFromJson(response.body);
      return inspiredLivingModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> habitOfTheDay() async {
    Uri uri = Uri.parse(habitOfTheDayUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      var obj = jsonDecode(response.body);
      return obj['health_habbit'];
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateHeartPoint> updateHeartPoints(heartPoint) async {
    Uri uri = Uri.parse(updateHeartPointsUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'heart_points_count': heartPoint,
        'date': TeamChallengeApiServices().getCurrentDate(),
      };
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
    final updateHeartPoint = updateHeartPointFromJson(response.body);
      return updateHeartPoint;
    } catch (e) {
      rethrow;
    }
  }


  Future<UpdateStepTaken> updateStepTaken(steps) async {
    Uri uri = Uri.parse(updateStepTakenUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'steps_count': steps,
        'date': TeamChallengeApiServices().getCurrentDate(),
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final updateStepTaken = updateStepTakenFromJson(response.body);
      return updateStepTaken;
    } catch (e) {
      rethrow;
    }
  }
}
