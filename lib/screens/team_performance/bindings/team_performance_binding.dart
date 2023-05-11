import 'package:flutter_state_management/screens/team_performance/controller/team_performance_controller.dart';
import 'package:get/get.dart';

class TeamPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamPerformanceController());
  }
}
