import 'package:flutter_state_management/screens/signup_screen/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}