import 'package:get/get.dart';

import '../controller/my_challenge_controller.dart';

class MyChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyChallengeController());
  }
}
