import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../../../constants/application_pages.dart';
import '../model/kpi_data_model.dart';
import '../model/reward_points.dart';
import '../model/voucher_model.dart';
import '../model/wellbeing_list_model.dart';
import '../model/win_level_points.dart';

class UserHomeApiServices {

  Future<void> userLoginCheckApi() async {
    Uri uri = Uri.parse(userLoginCheck);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        "user_profile_id": user.id,
        "device_id": user.deviceId,
      };
      final response =
          await http.post(uri, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        var status = jsonDecode(response.body)['status'];
        if (status == 1) {
          logout();
        }
      } else if (response.statusCode == 401) {
        logout();
      }
    } catch (e) {
      rethrow;
    }
  }

  logout() async {
    LocalStorage.logout();
    await GoogleSignIn().signOut();
    Get.offAndToNamed(ApplicationPages.splashScreen,arguments: true);
    Fluttertoast.showToast(msg: 'User Logout Successfully...');
  }

  Future<KpiDataModel> getCustomerKpiData() async {
    Uri uri = Uri.parse(kpiMetAndWipUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token.toString()
      };
      var body = <String, String>{
        'employee_id': LocalStorage.user().id.toString()
      };
      final response = await http.post(uri, body: body, headers: headers);
      final kpiDataModel = kpiDataModelFromJson(response.body);
      return kpiDataModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<WinLeveLPoints> winLevelPoints() async {
    Uri uri = Uri.parse(winLevelPointsUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token.toString()
      };
      var body = <String, String>{
        'employee_id': LocalStorage.user().id.toString()
      };
      final response = await http.post(uri, body: body, headers: headers);
      final winLeveLPoints = winLeveLPointsFromJson(response.body);
      return winLeveLPoints;
    } catch (e) {
      rethrow;
    }
  }

  Future<RewardPoints> getRewardsPoints() async {
    Uri uri = Uri.parse(rewardPointsUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token.toString()
      };
      var body = <String, String>{
        'user_profile_id': LocalStorage.user().id.toString()
      };
      final response = await http.post(uri, body: body, headers: headers);
      final rewardPoints = rewardPointsFromJson(response.body);
      return rewardPoints;
    } catch (e) {
      rethrow;
    }
  }

  Future<WellBeingList> getWellBeingList(timePeriod) async {
    Uri uri = Uri.parse(wellbeingListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token.toString()
      };
      var body = <String, String>{
        'user_profile_id': LocalStorage.user().id.toString(),
        'time_period_all': timePeriod,
      };
      final response = await http.post(uri, body: body, headers: headers);
      final wellBeingList = wellBeingListFromJson(response.body);
      return wellBeingList;
    } catch (e) {
      rethrow;
    }
  }

  Future<VoucherModel> homePageVoucherList() async {
    Uri uri = Uri.parse(homepageVoucherListUrl);
    try {
      var headers = <String, String>{
        'Authorization': LocalStorage.user().token
      };
      final response = await http.get(uri, headers: headers);
      // print(response.body);
      debugPrint('TOKEN : ${LocalStorage.user().token}');
      debugPrint('Firebase : ${LocalStorage.user().firebaseToken}');
      final voucherModel = voucherModelFromJson(response.body);
      return voucherModel;
    } catch (e) {
      rethrow;
    }
  }
}
