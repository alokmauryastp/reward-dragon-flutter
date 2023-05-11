import 'package:get/get.dart';

import '../controller/team_challenge_controller.dart';

class TeamChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamChallengeController());
  }
}
