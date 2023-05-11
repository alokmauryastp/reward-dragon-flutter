import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:flutter_state_management/screens/my_account_screen/controller/my_account_controller.dart';
import 'package:flutter_state_management/screens/my_profile/services/my_profile_api_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/avatar_model.dart';
import '../model/update_avatar_model.dart';
import 'dart:io';

import '../model/upload_image.dart';

class MyProfileController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  late User user;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  final avatarModel = AvatarModel().obs;
  final uploadImage = UploadImage().obs;

  var userImage = "".obs;
  var userFirstName = "".obs;
  var userLastName = "".obs;

  MyAccountController myAccountController = Get.put(MyAccountController());

  @override
  void onInit() {
    getUserData();
    getAvatarImageList();
    super.onInit();
  }

  @override
  void onClose() {
    MyAccountController().onInit();
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // final imageTemp = File(image.path,image.name);
      // this.image = imageTemp;
      uploadProfileImage(File(image.path));
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Future<void> uploadProfileImage(File image) async {
    isLoading(true);
    errorOccurred(false);
    try {
      uploadImage.value = await MyProfileApiService().uploadProfileImage(image);
      if (uploadImage.value.responseCode == 200) {
        LocalStorage.setString(keyAvatarImage, uploadImage.value.userImage);
        LocalStorage.setString(keyUserProfileUpdatedAt, uploadImage.value.userProfileUpdatedAt.toString());
        getUserData();
        Get.back();
        if(uploadImage.value.data!.rewardPoints>0){
          DashboardController().showAlertDialog(uploadImage.value.data!.rewardPoints, uploadImage.value.data!.rewardMessage);
        }
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateUserName() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await MyProfileApiService()
          .updateUserName(firstName.value.text, lastName.value.text);
      MyAccountController().userLastName.value = lastName.value.text;
      getUserData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateAvatarImage(avtarId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      UpdateAvatarModel updateAvatarModel =
          await MyProfileApiService().updateAvatarImage(avtarId);
      if (updateAvatarModel.responseCode == 200) {
        LocalStorage.setString(keyAvatarImage, updateAvatarModel.data!.image);
        LocalStorage.setString(keyUserProfileUpdatedAt, updateAvatarModel.userProfileUpdatedAt.toString());
        DashboardController().onInit();
        DashboardController().update();
        getUserData();
        if (updateAvatarModel.rewardPointsData!.rewardPoints > 0) {
          DashboardController().showAlertDialog(
              updateAvatarModel.rewardPointsData!.rewardPoints,
              updateAvatarModel.rewardPointsData!.rewardMessage);
        }
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAvatarImageList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      avatarModel.value = await MyProfileApiService().getAvatarImageList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  getUserData() async {
    user = LocalStorage.user();
    firstName.text = user.firstName;
    lastName.text = user.lastName;
    userImage.value = user.avatarImage;
    userFirstName.value = user.firstName;
    userLastName.value = user.lastName;
  }
}
