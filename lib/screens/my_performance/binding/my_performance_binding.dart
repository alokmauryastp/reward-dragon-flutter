import 'package:get/get.dart';

import '../controller/my_performance_controller.dart';

class MyPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPerformanceController());
  }
}
