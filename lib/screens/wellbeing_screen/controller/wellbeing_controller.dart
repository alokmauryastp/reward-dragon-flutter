import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/wellbeing_screen/services/wellbeing_api_services.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../constants/literals.dart';
import '../../dashboard_screen/controller/dashboard_controller.dart';
import '../../user_home_screen/model/wellbeing_list_model.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/health_fitness_model.dart';
import '../model/heart_points.dart';
import '../model/inspired_living_model.dart';
import '../model/skill_hobby_model.dart';
import '../model/update_heart_point.dart';
import '../model/update_step_token.dart';

class WellbeingController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var isGoogleFitConnected = false.obs;
  final updateStepTakenModel = UpdateStepTaken().obs;
  final updateHeartPoint = UpdateHeartPoint().obs;
  final healthFitnessModel = HealthFitnessModel().obs;
  final skillHobbyModel = SkillHobbyModel().obs;
  final inspiredLivingModel = InspiredLivingModel().obs;
  final wellBeingList = WellBeingList().obs;
  final heartPoints = HeartPoints().obs;

  RxString toggled = "".obs;

  RxString timeDropdownValue = 'TODAY'.obs;

  var timePeriod = [
    'ALL',
    'TODAY',
    'YESTERDAY',
    'WTD',
    'MTD',
    'YTD',
  ];

  var habitOfTheDayMessage = ''.obs;

  @override
  void onInit() {
    habitOfTheDay();
    getHealthFitnessListData();
    getSkillHobbyList();
    getWellBeingList();
    getInspiredLivingListData();
    checkGoogleFitPermission();
    super.onInit();
  }

  Future<void> onRefresh() async {
    habitOfTheDay();
    getHealthFitnessListData();
    getSkillHobbyList();
    getWellBeingList();
    checkGoogleFitPermission();
    getInspiredLivingListData();
  }

  String getTime(time) {
    switch (time) {
      case 'ALL':
        return 'all';
      case 'TODAY':
        return 'today';
      case 'YESTERDAY':
        return 'yesterday';
      case 'WTD':
        return 'wtd';
      case 'MTD':
        return 'mtd';
      case 'YTD':
        return 'ytd';
    }
    return '';
  }

  Future<void> requestPermissionForGoogleFit() async {

    final permissionStatus = await Permission.activityRecognition.request();

    if (permissionStatus.isGranted) {
      debugPrint('granted!');
      getTotalSteps();
    }
    if (permissionStatus.isDenied) {
      debugPrint('is denied');
    }
    if (permissionStatus.isLimited) {
      debugPrint('is isLimited');
    }
    if (permissionStatus.isPermanentlyDenied) {
      debugPrint('is isPermanentlyDenied');
      bool isShown =
          await Permission.activityRecognition.shouldShowRequestRationale;
      debugPrint('isShown');
      debugPrint(isShown.toString());
    }
    if (permissionStatus.isRestricted) {
      debugPrint('is isRestricted');
    }
  }

  Future<void> checkGoogleFitPermission() async {
    // if (Platform.isAndroid) {
      bool isGranted = await Permission.activityRecognition.isGranted;

      if (isGranted) {
        getTotalSteps();
      } else {

        Get.defaultDialog(
            backgroundColor: blackApp,
            title: 'Reward Dragon',
            titleStyle: const TextStyle(color: white),
            content: const Text(
              'Reward Dragon wants to access your Google Account linked with google fit to get their Steps and Heart Points Data ',
              textAlign: TextAlign.center,
              style: TextStyle(color: white),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    requestPermissionForGoogleFit();
                    Get.back();
                  },
                  child: const Text('OK')),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('NOT NOW')),
            ]);
      }
    // }

    // requesting access to the data types before reading them
    // bool requested = await health.requestAuthorization(types);

    // fetch health data from the last 24 hours
    // List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, types);
    // print(healthData);

    // write steps and blood glucose
    // bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    // success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
  }

  Future<void> getTotalSteps() async {
    // bool isGranted = await Permission.activityRecognition.isGranted;

    // create a HealthFactory for use in the app
    HealthFactory health = HealthFactory();

    // define the types to get
    var types = [HealthDataType.STEPS];

    var type = [HealthDataType.STEPS];

    var permissions = [HealthDataAccess.READ_WRITE];

    var hasPer = await HealthFactory.hasPermissions(type, permissions: permissions);

    if (hasPer == true) {
      isGoogleFitConnected.value = true;

      var now = DateTime.now();


      // get the number of steps for today
      var midnight = DateTime(now.year, now.month, now.day);

      int? steps;
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (e) {
        rethrow;
      }
      if (steps != null) {
        updateStepTaken(steps);
      }
    } else {
      Get.defaultDialog(
          backgroundColor: blackApp,
          title: 'Reward Dragon',
          titleStyle: const TextStyle(color: white),
          content: const Text(
            'Reward Dragon wants to access your Google Account linked with google fit to get their Steps and Heart Points Data ',
            textAlign: TextAlign.center,
            style: TextStyle(color: white),
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  Get.back();

                  var permission = await health.requestAuthorization(types,permissions: permissions);

                  if (permission) {
                    isGoogleFitConnected.value = true;
                  }

                  var now = DateTime.now();
                  // get the number of steps for today
                  var midnight = DateTime(now.year, now.month, now.day);

                  int? steps;
                  try {
                    steps = await health.getTotalStepsInInterval(midnight, now);
                  } catch (e) {
                    rethrow;
                  }
                  if (steps != null) {
                    updateStepTaken(steps);
                  }
                },
                child: const Text('OK')),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('NOT NOW')),
          ]);
    }
  }

  Future<void> getHeartPointsFromGoogleFit() async {
    isLoading(true);
    errorOccurred(false);
    try {
      heartPoints.value = await WellBeingApiServices().getHeartPointsFromGoogleFit();
      if (heartPoints.value != null) {
        var hp = heartPoints.value.bucket?.first.dataset.first.point.first.value.first.fpVal;
        updateHeartPoints(hp);
      }
    } catch (e) {
      errorOccurred(false);
    } finally {
      isLoading(false);
    }
  }

  Future<void> habitOfTheDay() async {
    isLoading(true);
    errorOccurred(false);
    try {
      habitOfTheDayMessage.value = await WellBeingApiServices().habitOfTheDay();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getWellBeingList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      wellBeingList.value = await UserHomeApiServices()
          .getWellBeingList(getTime(timeDropdownValue.value));
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateHeartPoints(heartPoint) async {
    isLoading(true);
    errorOccurred(false);
    try {
      updateHeartPoint.value =
          await WellBeingApiServices().updateHeartPoints(heartPoint);
      if (updateStepTakenModel.value.responseCode == 200) {
        int point = updateStepTakenModel.value.rewardPointsData!.rewardPoints;
        if (point > 0) {
          DashboardController().showAlertDialog(point,
              updateStepTakenModel.value.rewardPointsData!.rewardMessage);
          Timer(const Duration(seconds: 5), () {
            if (updateHeartPoint.value.responseCode == 200) {
              int heartPoint =
                  updateHeartPoint.value.rewardPointsData!.rewardPoints;
              if (heartPoint > 0) {
                DashboardController().showAlertDialog(heartPoint,
                    updateHeartPoint.value.rewardPointsData!.rewardMessage);
              }
            }
          });
        }
      } else {
        if (updateHeartPoint.value.responseCode == 200) {
          int heartPoint =
              updateHeartPoint.value.rewardPointsData!.rewardPoints;
          if (heartPoint > 0) {
            DashboardController().showAlertDialog(heartPoint,
                updateHeartPoint.value.rewardPointsData!.rewardMessage);
          }
        }
      }
      getWellBeingList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateStepTaken(steps) async {
    isLoading(true);
    errorOccurred(false);
    try {
      updateStepTakenModel.value = await WellBeingApiServices().updateStepTaken(steps);
      getHeartPointsFromGoogleFit();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getHealthFitnessListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      healthFitnessModel.value =
          await WellBeingApiServices().getHealthFitnessListData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getInspiredLivingListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      inspiredLivingModel.value =
          await WellBeingApiServices().getInspiredLivingListData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getSkillHobbyList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      skillHobbyModel.value = await WellBeingApiServices().getSkillHobbyList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
