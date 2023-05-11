import 'package:flutter_state_management/screens/user_home_screen/controller/user_home_controller.dart';
import 'package:get/get.dart';

class UserHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserHomeController());
  }

}