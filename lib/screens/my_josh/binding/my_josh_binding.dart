import 'package:get/get.dart';

import '../controller/my_josh_controller.dart';

class MyJoshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyJoshController());
  }
}
