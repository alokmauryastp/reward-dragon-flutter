import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../model/game_category_model.dart';
import '../model/game_model.dart';
import '../model/game_point.dart';
import '../model/next_available_time.dart';

class GameTimeApiService {

  Future<GameCategoryModel> gameCategoryList() async {
    Uri uri = Uri.parse(gameCategoryListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{'Authorization': user.token};
      final response = await http.get(uri, headers: headers);
      final gameCategoryModel = gameCategoryModelFromJson(response.body);
      return gameCategoryModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<GameModel> getGameList(gameCategoryId) async {
    var user = LocalStorage.user();
    var queryParameters = <String, dynamic>{
      'unique_code': user.uniqueCode,
      'game_category_id': gameCategoryId.toString(),
    };
    var headers = <String, String>{'Authorization': user.token};
    Uri uri = Uri.parse(gameListUrl).replace(queryParameters: queryParameters);
    try {
      final response = await http.get(uri, headers: headers);
      final gameModel = gameModelFromJson(response.body);
      return gameModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<NextAvailableTime> nextAvailabilityTime() async {
    Uri uri = Uri.parse(nextAvailabilityTimeUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'user_profile_id': user.id};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final nextAvailableTime = nextAvailableTimeFromJson(response.body);
      return nextAvailableTime;
    } catch (e) {
      rethrow;
    }
  }

  Future<GamePoint> getGamePoint() async {
    Uri uri = Uri.parse(gamePointUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'employee_id': user.id};
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final gamePoint = gamePointFromJson(response.body);
      return gamePoint;
    } catch (e) {
      rethrow;
    }
  }
}
