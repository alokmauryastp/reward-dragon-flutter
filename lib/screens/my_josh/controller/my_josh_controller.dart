import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/my_josh/services/my_josh_api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../constants/literals.dart';
import '../../team_mood/services/team_mood_api_services.dart';
import '../model/customer_reason_type.dart';
import '../model/manager_reason_type.dart';
import '../model/mood_model.dart';
import '../model/submit_josh_model.dart';
import '../model/submit_manager_josh.dart';

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class MyJoshController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var moodSubmitted = false.obs;
  final customerReasonType = CustomerReasonType().obs;
  final managerReasonType = ManagerReasonType().obs;
  final moodModel = MoodModel().obs;
  final submitJoshModel = SubmitJoshModel().obs;
  final submitManagerJoshModel = SubmitManagerJosh().obs;
  var joshReasonId = ''.obs;

  final descriptionController = TextEditingController();
  final data = <SalesData>[].obs;
  var selectedEmoji = 0.obs;
  var args = Get.arguments;

  var teamMoodImage = ''.obs;
  var teamMoodText = ''.obs;
  var teamMoodMessage = ''.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (args != null) {
      selectedEmoji.value = args;
    }
    getReason();
    super.onInit();
  }


  Future<void> getReason() async {
    var roleId = LocalStorage.user().roleId;
    if (roleId == 1) {
      await getJoshTodayForCustomer();
      await getJoshReasonType();
    } else {
      await getJoshTodayForManager();
      await getJoshReasonTypeForManager();
    }
  }

  Future<void> onRefresh() async {
    getReason();
  }

  Future<void> getJoshReasonType() async {
    isLoading(true);
    errorOccurred(false);
    try {
      customerReasonType.value =
          await MyJoshReasonApiServices().getJoshReasonType();
      joshReasonId.value =
          customerReasonType.value.customerReasonType!.first.id.toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getJoshReasonTypeForManager() async {
    isLoading(true);
    errorOccurred(false);
    try {
      managerReasonType.value =
          await MyJoshReasonApiServices().getJoshReasonTypeForManager();
      joshReasonId.value =
          managerReasonType.value.managerReasonType!.first.id.toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitCustomerJosh() async {
    isLoading(true);
    errorOccurred(false);
    try {
      submitJoshModel.value = await MyJoshReasonApiServices()
          .submitCustomerJosh(selectedEmoji.value, joshReasonId.value,
              descriptionController.value.text);
      if (submitJoshModel.value.responseCode == 200) {
        moodSubmitted.value = true;
        if (selectedEmoji.value != 4 && selectedEmoji.value != 5) {
          showSubmitDialog(submitJoshModel.value.rewardPointsData?.rewardPoints,
              submitJoshModel.value.rewardPointsData?.rewardMessage);
        } else {
          var point = submitJoshModel.value.rewardPointsData?.rewardPoints;
          if (point! > 0) {
            DashboardController().showAlertDialog(
                point, submitJoshModel.value.rewardPointsData!.rewardMessage);
          }
        }
      } else if (submitJoshModel.value.responseCode == 201) {
        Fluttertoast.showToast(msg: 'Mood Already Submitted');
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      getJoshTodayForCustomer();
    }
  }

  Future<void> showSubmitDialog(int? point, String? msz) async {
    Get.defaultDialog(
        title: 'Submitted',
        barrierDismissible: false,
        onWillPop: () async {
          if (point! > 0) {
            DashboardController().showAlertDialog(point, msz.toString());
          }
          return true;
        },
        content: Text(
          'Thank you for sharing how you feel and why, give us time to find a way to help',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
                if (point! > 0) {
                  DashboardController().showAlertDialog(point, msz.toString());
                }
              },
              child: const Text('OK'))
        ]);
  }

  Future<void> submitManagerJosh() async {
    isLoading(true);
    errorOccurred(false);
    try {
      submitManagerJoshModel.value = await MyJoshReasonApiServices()
          .submitManagerJosh(selectedEmoji.value, joshReasonId.value,
              descriptionController.value.text);
      if (submitManagerJoshModel.value.responseCode == 200) {
        moodSubmitted.value = true;
        if (selectedEmoji.value != 4 && selectedEmoji.value != 5) {
          showSubmitDialog(
              submitManagerJoshModel.value.rewardPointsData?.rewardPoints,
              submitManagerJoshModel.value.rewardPointsData?.rewardMessage);
        } else {
          var point =
              submitManagerJoshModel.value.rewardPointsData?.rewardPoints;
          if (point! > 0) {
            DashboardController().showAlertDialog(point,
                submitManagerJoshModel.value.rewardPointsData!.rewardMessage);
          }
        }
      } else if (submitManagerJoshModel.value.responseCode == 201) {
        Fluttertoast.showToast(msg: 'Mood Already Submitted');
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      getJoshTodayForManager();
    }
  }

  Future<void> getJoshTodayForCustomer() async {
    isLoading(true);
    errorOccurred(false);
    try {
      data.clear();
      moodModel.value =
          await MyJoshReasonApiServices().getJoshTodayForCustomer();
      if (moodModel.value.data?.emojiPoint != 0) {
        selectedEmoji.value = moodModel.value.data?.emojiPoint ??0;
        moodSubmitted.value = true;
      }
      updateTeamMood(moodModel.value.teamMood);
      for (var i = 0; i < moodModel.value.moodalytics!.length; i++) {
        var mood = moodModel.value.moodalytics![i];
        data.add(SalesData(mood.createdAt, mood.emojiPoint.toDouble()));
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  updateTeamMood(int? teamMood) {
    teamMoodImage.value = getMoodImage(teamMood);
    teamMoodText.value = getMood(teamMood);
    teamMoodMessage.value = getMoodMessage(teamMood);
  }

  Future<void> getJoshTodayForManager() async {
    isLoading(true);
    errorOccurred(false);
    try {
      data.clear();
      moodModel.value = await TeamMoodApiServices().getJoshTodayForManager();
      if (moodModel.value.data?.emojiPoint != 0) {
        selectedEmoji.value = moodModel.value.data?.emojiPoint ?? 0;
        moodSubmitted.value = true;
      }
      updateTeamMood(moodModel.value.teamMood);
      for (var i = 0; i < moodModel.value.moodalytics!.length; i++) {
        var mood = moodModel.value.moodalytics![i];
        data.add(SalesData(mood.createdAt, mood.emojiPoint.toDouble()));
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
