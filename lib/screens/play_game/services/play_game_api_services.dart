import 'dart:convert';

import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/update_game_time.dart';

class PlayGameApiServices {
  Future<UpdateGameTime> updatePlayedGameTime(int timeSpend, gameId) async {
    Uri uri = Uri.parse(updatePlayedGameTimeUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile': user.id,
        'is_end': 1,
        'time_spent': timeSpend,
        'game_name': gameId,
        'next_availability_time': DateFormat('yyyy-MM-dd HH:mm:s')
            .format(DateTime.now().add(const Duration(hours: 24))),
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final updateGameTime = updateGameTimeFromJson(response.body);
      return updateGameTime;
    } catch (e) {
      rethrow;
    }
  }
}
