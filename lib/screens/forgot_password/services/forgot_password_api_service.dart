import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordApiService {

  openDialog(msg) {
    Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: white,
        title: 'OTP Sent',
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Get.offAllNamed(ApplicationPages.verifyOtp);
              },
              child: const Text('Next'))
        ]);
  }

  Future<void> sendOtp(email, mobile) async {
    final uri = Uri.parse( sendOtpUrl);

    try {
      Map<String, dynamic> body = {};
      body['user_email'] = email;
      body['user_mobile_no'] = mobile;
      final response = await http.post(uri, body: body);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var resCode = json['response_code'];
        if (resCode == 200) {
          openDialog(json['message']);
        } else if (resCode == 201) {
          Fluttertoast.showToast(msg: json['message']);
        }
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: 'There is no active user associated with this e-mail address');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyOtp(email, mobile, otp, password, cpassword) async {
    var token = await FirebaseMessaging.instance.getToken();
    final uri = Uri.parse( verifyOtpUrl);
    try {
      var headers = <String,String>{'content-type':'application/json'};
      Map<String, dynamic> body = {};
      body['user_email'] = email;
      body['user_mobile_no'] = mobile;
      body['otp'] = otp;
      body['password'] = password;
      body['cpassword'] = cpassword;
      body['firebase_token'] = token;
      final response = await http.post(uri,headers: headers, body:jsonEncode( body));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var resCode = json['response_code'];
        if (resCode == 200) {
          Fluttertoast.showToast(msg: 'Password Changed Successfully');
          Get.offAllNamed(ApplicationPages.loginScreen);
        } else if (resCode == 201) {
          Fluttertoast.showToast(msg: json['message']);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
