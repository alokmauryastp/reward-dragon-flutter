import 'package:get/get.dart';
import '../controller/manager_wellbeing_controller.dart';

class ManagerWellbeingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerWellbeingController());
  }
}
