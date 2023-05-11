import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import '../../../constants/urls.dart';
import 'package:http/http.dart' as http;

class MyAccountApiServices {

  Future<int> logout() async {
    Uri uri = Uri.parse(logoutUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'device_id': user.deviceId,
      };
      final response = await http.post(uri,headers: headers,body: jsonEncode(body));
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

}
