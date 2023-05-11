import 'package:flutter_state_management/screens/team_mood/controller/team_mood_controller.dart';
import 'package:get/get.dart';

class TeamMoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamMoodController());
  }
}
