import 'package:get/get.dart';

import '../controller/manager_home_controller.dart';

class ManagerHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManagerHomeController());
  }
}
