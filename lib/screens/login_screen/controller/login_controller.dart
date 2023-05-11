import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../constants/literals.dart';
import '../../../constants/local_storage.dart';
import '../services/login_api_service.dart';

class LoginController extends GetxController {

  var checkValue = true.obs;
  var isObscure = true.obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var mail = "".obs;
  var password = "".obs;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    // checkLogin();
    getDeviceInfo();
    super.onInit();
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    var device = "${androidInfo.manufacturer}/${androidInfo.model}";
    await LocalStorage.setString(deviceName, device);
    await LocalStorage.setString(deviceId, androidInfo.androidId);
  }

  void checkLogin() async {
    isLoading(true);
    errorOccurred(false);
    try {
      List<Object> data = await LoginApiService().checkAlreadyLogin( emailController.value.text, passwordController.value.text);
      if (data.first == 200) {
        await LoginApiService().login(emailController.value.text, passwordController.value.text);
      } else if (data.first == 201) {
        Get.defaultDialog(
          backgroundColor: blackApp,
            title: title,
            titleStyle: const TextStyle(color: yellowApp),
            content: const Text(
                'You are logged in another device Do you want to login with this device?',
              style: TextStyle(color: white),
              textAlign: TextAlign.center,),
            actions: [
              TextButton(
                child: const Text('NO',style: TextStyle(color: yellowApp),),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                onPressed: () async {
                  await LoginApiService().login(emailController.value.text, passwordController.value.text);
                },
                child: const Text('YES',style: TextStyle(color: yellowApp),),
              ),
            ]);
      } else if (data.first == 202) {
        Fluttertoast.showToast(msg: data[1].toString());
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> login() async {
    isLoading(true);
    errorOccurred(false);
    try {} catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
