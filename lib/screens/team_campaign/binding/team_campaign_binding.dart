import 'package:flutter_state_management/screens/team_campaign/controller/team_campaign_controller.dart';
import 'package:get/get.dart';

class TeamCampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamCampaignController());
  }
}
