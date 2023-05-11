import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../constants/urls.dart';
import '../model/user.dart';

class LoginApiService {
  Future<List<Object>> checkAlreadyLogin(email, password) async {
    var responseCode = 500;
    var message = '';
    var deviceIdd = LocalStorage.getString(deviceId);
    final uri = Uri.parse(alreadyLogin);
    try {
      var headers = <String, String>{'Content-Type': 'application/json'};
      var request = http.Request("POST", uri);

      request.body = jsonEncode(<String, dynamic>{
        // 'role_id': roleId,
        'email': email,
        'password': password,
        'device_id': deviceIdd,
      });

      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        var obj = jsonDecode(res);
        responseCode = obj['response_code'];
        message = obj['message'];
      }

      return [responseCode, message];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(email, password) async {
    final uri = Uri.parse(loginUrl);
    var deviceIdd = LocalStorage.getString(deviceId);
    var device = LocalStorage.getString(deviceName);
    var token = LocalStorage.getString(firebaseToken);
    var headers = <String, String>{'Content-Type': 'application/json'};
    try {
      var body = <String, dynamic>{
        // 'role_id': roleId,
        'email': email,
        'password': password,
        'firebase_token': token,
        'device_id': deviceIdd,
        'device_name': device,
        'platform': Platform.isAndroid ? 'Android' : "iOS",
      };

      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var resCode = data['response_code'];
        if (resCode == 200) {
          // all user data
          User user = User.fromJson(data['user_data']);
          LocalStorage.userLogin(user);

          // company image
          String companyImage =
              data['user_data']['organization']['company_image'];
          LocalStorage.setString(keyCompanyImage, companyImage);

          //  welcome message data
          var welcomeMessage = data['welcome_message'];
          //  reward point data
          var rewardPoint = data['reward_points_data'];

          Get.offAllNamed(ApplicationPages.dashboardScreen,
              arguments: [welcomeMessage, rewardPoint]);
        } else {
          Get.back();
          Get.defaultDialog(
              backgroundColor: blackApp,
              title: title,
              titleStyle: const TextStyle(color: yellowApp),
              content: Text(
                data['message'],
                style: const TextStyle(color: white),
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(color: yellowApp),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ]);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
