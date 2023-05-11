import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  var isFromLogout = Get.arguments;

  @override
  void onInit() {

    if(isFromLogout!=null){
      isFromLogout = true;
    } else {
      isFromLogout = false;
    }
    getDeviceInfo();
    super.onInit();
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var device = "${androidInfo.manufacturer}/${androidInfo.model}";
    await LocalStorage.setString(deviceName, device);
    await LocalStorage.setString(deviceId, androidInfo.androidId);
    }else{
      IosDeviceInfo androidInfo = await deviceInfo.iosInfo;
      var device = "${androidInfo.name}/${androidInfo.model}";
      await LocalStorage.setString(deviceName, device);
      await LocalStorage.setString(deviceId, androidInfo.identifierForVendor);
    }
    getToken();
  }

  getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    await LocalStorage.setString(firebaseToken, token.toString());
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: isFromLogout ? 0 : 3);
    return Timer(duration, route);
  }

  route() {
    var isLoggedIn = LocalStorage.isLoggedIn();
    if (isLoggedIn) {
      Get.offAllNamed(ApplicationPages.dashboardScreen);
    } else {
      Get.offAllNamed(ApplicationPages.loginScreen);
    }
  }
}
