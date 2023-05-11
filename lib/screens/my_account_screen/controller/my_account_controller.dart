import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:flutter_state_management/screens/my_account_screen/services/my_account_api_services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAccountController extends GetxController {
  late User user;
  var isLoading = false.obs;
  var errorOccurred = false.obs;

  var userImage = "".obs;
  var userFirstName = "".obs;
  var userLastName = "".obs;

  @override
  void onInit() {
    user = LocalStorage.user();
    userImage.value = user.avatarImage;
    userFirstName.value = user.firstName;
    userLastName.value = user.lastName;
    super.onInit();
  }


  Future<void> logout() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await MyAccountApiServices().logout();
      await GoogleSignIn().signOut();
      LocalStorage.logout();
      Get.offAndToNamed(ApplicationPages.splashScreen, arguments: true);
    } catch (e) {
      errorOccurred(true);
    } finally {
      // isLoading(false);
    }
  }

  Future<void> logoutDialog() async {
    Get.defaultDialog(
      backgroundColor: blackApp,
        title: 'Logout',
        titleStyle:  const TextStyle(color: yellowApp),
        content: const Text('Are you sure want to logout?',style: TextStyle(color: white),),
        actions: [
          TextButton(
              onPressed: () {
                logout();
                Get.back();
              },
              child: const Text('YES',style: TextStyle(color: yellowApp),)),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('NO',style: TextStyle(color: yellowApp),)),
        ]);
  }
}
