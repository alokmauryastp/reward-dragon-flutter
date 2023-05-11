import 'package:flutter_state_management/screens/manager_Leaderboard/manager_leaderboard_controller/manager_leaderboard_controller.dart';
import 'package:get/get.dart';

class ManagerLeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ManagerLeaderBoardController(),
    );
  }
}
