import 'package:flutter_state_management/screens/reward_screen/controller/reward_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class RewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardController>(() => RewardController());
  }
}
