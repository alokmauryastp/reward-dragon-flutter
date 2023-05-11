import 'package:get/get.dart';
import '../controller/executive_team_controller.dart';

class ExecutiveTeamBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ExecutiveTeamController());
  }
}