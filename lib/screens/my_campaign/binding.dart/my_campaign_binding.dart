import 'package:get/instance_manager.dart';

import '../controller/my_campaign_controller.dart';

class MyCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCampaignController());
  }
}
