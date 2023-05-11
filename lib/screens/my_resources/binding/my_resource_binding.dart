import 'package:flutter_state_management/screens/my_resources/controller/my_resources_controller.dart';
import 'package:get/get.dart';

class MyResourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyResourcesController());
  }
}
