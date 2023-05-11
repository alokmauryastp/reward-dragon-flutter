import 'package:get/get.dart';
import '../controller/team_list_controller.dart';

class TeamListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeamListController());
  }
}