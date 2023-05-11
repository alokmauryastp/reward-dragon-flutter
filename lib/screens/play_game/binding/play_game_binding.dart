import 'package:flutter_state_management/screens/play_game/controller/play_game_controller.dart';
import 'package:get/get.dart';

class PlayGameBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PlayGameController());
  }
}