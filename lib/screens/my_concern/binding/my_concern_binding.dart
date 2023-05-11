import 'package:get/get.dart';
import '../controller/my_concern_controller.dart';

class MyConcernBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyConcernController());
  }
}
