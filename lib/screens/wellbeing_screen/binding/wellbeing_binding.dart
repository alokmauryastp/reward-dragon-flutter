import 'package:flutter_state_management/screens/wellbeing_screen/controller/wellbeing_controller.dart';
import 'package:get/get.dart';

class WellBeingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellbeingController>(() => WellbeingController());
  }
}
