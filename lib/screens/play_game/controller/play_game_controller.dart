import 'dart:async';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/play_game/services/play_game_api_services.dart';
import 'package:get/get.dart';
import '../model/update_game_time.dart';

class PlayGameController extends GetxController {
  var gameId = Get.arguments[0];
  var gameUrl = Get.arguments[1];
  int endTime = Get.arguments[2];
  int endTime2 = Get.arguments[2];
  late Timer timer;
  int timeSpend = 0;
  // int endTime = 300;
  var gameEndTime = ''.obs;
  final updateGameTime = UpdateGameTime().obs;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeSpend < endTime2) {
        timeSpend++;
        endTime--;
        gameEndTime.value =
            Duration(seconds: endTime).toString().substring(2, 7);
      } else {
        Get.back();
      }
    });
    super.onInit();
  }

  @override
  void onClose() async {
    timer.cancel();
    updateGameTime.value =
        await PlayGameApiServices().updatePlayedGameTime(timeSpend, gameId);
    int point = updateGameTime.value.rewardPointsData!.rewardPoints;
    Get.toNamed(ApplicationPages.myGameTimeScreen);
    if (point > 0) {
      DashboardController().showAlertDialog(
          point, updateGameTime.value.rewardPointsData!.rewardMessage);
    }
  }
}
