import 'package:flutter_state_management/screens/game_time_screen/controller/game_time_controller.dart';
import 'package:get/get.dart';

class GameTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameTimeController());
  }
}
