import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/my_campaign_model.dart';
import '../services/my_campaign_api_services.dart';

class MyCampaignController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final myCampaignModel = MyCampaignModel().obs;
  var currentDateTime = "".obs;

  @override
  void onInit() {
    getCampaignList();
    getCurrentDateTime();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getCampaignList();
    getCurrentDateTime();
  }

  Future<void> getCurrentDateTime() async {
    currentDateTime.value =  DateFormat('dd/MM/yyyy hh:mm:ss a').format(DateTime.now());
  }

  Future<void> getCampaignList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      myCampaignModel.value = await MyCampaignApiServices().getCampaignList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
