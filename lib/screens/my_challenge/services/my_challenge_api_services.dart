import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../model/accept_challenge_model.dart';
import '../model/challenge_points.dart';
import '../model/my_challenge_model.dart';

class MyChallengeApiServices {
  Future<MyChallengeModel> getMyChallengeList() async {
    Uri uri = Uri.parse(myChallengeListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'unique_code': user.uniqueCode,
        'team_id': user.teamId,
        'employee_id': user.id,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final myChallengeModel = myChallengeModelFromJson(response.body);
      return myChallengeModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<AcceptChallengeModel> acceptChallenge(challengeId) async {
    Uri uri = Uri.parse(acceptChallengeUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json',
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'challenge_id': challengeId,
        'is_accepted': 1,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final acceptChallengeModel = acceptChallengeModelFromJson(response.body);
      return acceptChallengeModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ChallengePoints> getChallengePoint() async {
    var user = LocalStorage.user();
    var queryParameters = <String, String>{'user_profile': user.id.toString()};
    Uri uri = Uri.parse(challengePointDataUrl)
        .replace(queryParameters: queryParameters);
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final challengePoints = challengePointsFromJson(response.body);
      return challengePoints;
    } catch (e) {
      rethrow;
    }
  }
}
