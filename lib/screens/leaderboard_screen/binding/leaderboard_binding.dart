import 'package:flutter_state_management/screens/leaderboard_screen/controller/leaderboard_controller.dart';
import 'package:get/get.dart';

class LeaderboardBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => LeaderboardController());
  }
}