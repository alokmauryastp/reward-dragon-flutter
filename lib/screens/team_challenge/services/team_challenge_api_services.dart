import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../model/challenge_purpose_model.dart';
import '../model/create_challenge_model.dart';
import '../model/team_challenge_model.dart';

class TeamChallengeApiServices {
  Future<TeamChallengeModel> getTeamChallenges() async {
    Uri uri = Uri.parse(getChallengeListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json',
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'team_id': user.teamId,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final teamChallengeModel = teamChallengeModelFromJson(response.body);
      return teamChallengeModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendChallengeToWhatsapp(challengeId) async {
    Uri uri = Uri.parse(sendChallengeToWhatsappUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'challenge_id': challengeId,
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<ChallengePurposeModel> getChallengePurposeList() async {
    Uri uri = Uri.parse(getChallengePurposeListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      final challengePurposeModel =
          challengePurposeModelFromJson(response.body);
      return challengePurposeModel;
    } catch (e) {
      rethrow;
    }
  }

  String getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  String getCurrentTime() {
    return DateFormat('hh:mm:ss a').format(DateTime.now());
  }

  String getCurrentTime24() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  String convert12to24format(date) {
    return DateFormat('HH:mm:ss').format(DateFormat("hh:mm:ss a").parse(date));
  }

  String convert24to12format(date) {
    return DateFormat('hh:mm a').format(DateFormat("HH:mm:ss").parse(date));
  }

  String addOneSecond() {
    return DateFormat('HH:mm:ss')
        .format(DateTime.now().add(const Duration(seconds: 1)));
  }

  Future<bool> endChallengeByManager(challengeId) async {
    Uri uri = Uri.parse(endChallengeByManagerUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'challenge_id': challengeId,
        'is_completed_by_manager': 1,
        'updated_end_time': getCurrentTime24(),
        'end_challenge_time': addOneSecond(),
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateChallengeModel> createChallenge(
      challengePurposeId,
      challengeName,
      startTime,
      endTime,
      activityDetails,
      bonusPoints,
      industryWorkTypeId,
      kpiNameId) async {
    Uri uri = Uri.parse(createChallengeUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_id': user.id,
        'challenge_purpose_id': challengePurposeId,
        'challenge_name': challengeName,
        'start_time': convert12to24format(startTime),
        'end_time': convert12to24format(endTime),
        'activity_details': activityDetails,
        'bonus_point': bonusPoints,
        'manager_created_date': getCurrentDate(),
        'manager_created_time': getCurrentTime(),
        'industry_work_type_id': industryWorkTypeId,
        'kpi_name_id': kpiNameId,
        'broadcast_id': 1,
      };

      final response =
          await http.post(uri, headers: headers, body: json.encode(body));

      final createChallengeModel = createChallengeModelFromJson(response.body);
      return createChallengeModel;
    } catch (e) {
      rethrow;
    }
  }
}
