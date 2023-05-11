import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupApiService {
  Future<void> signup(
      roleId,
      firstName,
      lastName,
      uniqueCode,
      email,
      mobile,
      password,
      confirmPassword,
      // gender,
      designation,
      // language,
      // teamId,
      // managerId,
      // location,
      dateOfJoining) async {
    final uri = Uri.parse(signupUrl);
    var token = LocalStorage.getString(firebaseToken);
    try {
      var headers = <String,String>{'content-type':'application/json'};
      final body = <String,dynamic>{
        'role_id': roleId,
        'first_name': firstName,
        'last_name': lastName,
        'unique_code': uniqueCode,
        'email': email,
        'mobile_no': mobile,
        'new_password': password,
        'confirm_password': confirmPassword,
        'firebase_token': token,
        // 'gender': gender,
        'designation': designation,
        // 'language': language,
        // 'team_id': teamId,
        // 'manager_id': managerId,
        // 'location': location,
        'org_doj': dateOfJoining,
      };


      final response = await http.post(uri,headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var resCode = json['response_code'];
        if (resCode == 200) {
          Get.defaultDialog(
              backgroundColor: blackApp,
              title: 'Success!',
              titlePadding:  const EdgeInsets.all(8),
              titleStyle: const TextStyle(color: white),
              content: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(json['message'],textAlign: TextAlign.center,style: const TextStyle(color: white),),
              ),
              contentPadding: EdgeInsets.zero,
              barrierDismissible: false,
              actions: [
                TextButton(
                    onPressed: () =>
                        Get.offAllNamed(ApplicationPages.loginScreen),
                    child: const Text('OK'))
              ]);
        } else if (resCode == 201) {
          Fluttertoast.showToast(msg: json['message']);
        }
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getTeamListForSignup(uniqueCode) async {
    final queryParameters = {'unique_code': uniqueCode};
    final uri = Uri.parse( teamListForSignUp)
        .replace(queryParameters: queryParameters);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // final teamListModel = teamListModelFromJson(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getBaseLocation(uniqueCode) async {
    final uri = Uri.parse(baseLocation);
    try {
      final body = {'unique_code': uniqueCode};
      final response = await http.post(uri, body: body);

      if (response.statusCode == 200) {
        // final baseLocationModel = baseLocationModelFromJson(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
