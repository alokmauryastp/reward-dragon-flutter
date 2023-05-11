import 'package:flutter_state_management/screens/my_coupons/controller/my_coupon_controller.dart';
import 'package:get/get.dart';

class MyCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyCouponController>(() => MyCouponController());
  }
}
