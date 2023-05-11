import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/team_campaign/model/industry_work_data.dart';
import 'package:flutter_state_management/screens/team_campaign/services/team_campaign_api_services.dart';
import 'package:flutter_state_management/screens/team_campaign/team_campaign_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../model/campaign_data.dart';
import '../model/campaign_purpose_model.dart';
import '../model/create_campaign_model.dart';
import '../model/kpi_model.dart';

class TeamCampaignController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final industryWorkData = IndustryWorkData().obs;
  final campaignPurposeModel = CampaignPurposeModel().obs;
  final createCampaignModel = CreateCampaignModel().obs;
  var kpiModel = KpiModel().obs;
  final campaignData = CampaignData().obs;
  RxString industryWorkId = ''.obs;
  RxString campaignPurposeId = ''.obs;
  RxString startDate = 'DD/MM/YYYY'.obs;
  RxString endDate = 'DD/MM/YYYY'.obs;
  DateTime selectedDate = DateTime.now();
  TextEditingController campaignName = TextEditingController();

  bool isBottomSheetOpen = Get.arguments;
  late BuildContext context;

  @override
  void onReady() {
    if (isBottomSheetOpen) {
      kpiModel.value.kpiNameData?.clear();
      const TeamCampaignScreen().createCampaignBottomSheet(context);
    }
  }

  @override
  void onInit() {
    getCampaignList();
    getIndustryListData();
    getCampaignPurposeList();
    super.onInit();
  }

  bool validation() {
    if (campaignName.value.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter Campaign Name');
      return false;
    }
    if (industryWorkId.value.isEmpty) {
      Fluttertoast.showToast(msg: 'Select Industry Work');
      return false;
    }
    if (campaignPurposeId.value.isEmpty) {
      Fluttertoast.showToast(msg: 'Select Campaign Purpose');
      return false;
    }
    if (startDate.value == 'DD/MM/YYYY') {
      Fluttertoast.showToast(msg: 'Select Start Date');
      return false;
    }
    if (endDate.value == 'DD/MM/YYYY') {
      Fluttertoast.showToast(msg: 'Select End Date');
      return false;
    }
    // if(isRuleListAdded.value==false){
    //   Fluttertoast.showToast(msg: 'Select at least on KPI');
    //   return false;
    // }
    return true;
  }

  Future<void> onRefresh() async {
    getCampaignList();
    getIndustryListData();
    getCampaignPurposeList();
  }

  Future<void> getCampaignList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      campaignData.value = await TeamCampaignApiServices().getCampaignList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getIndustryListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      industryWorkData.value = await TeamCampaignApiServices().getIndustryListData();
      industryWorkId.value = industryWorkData.value.industryWorkData!.first.id.toString();
      getKpiListData();

    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCampaignPurposeList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      campaignPurposeModel.value =
          await TeamCampaignApiServices().getCampaignPurposeList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getKpiListData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      kpiModel.value = await TeamCampaignApiServices()
          .getKpiListData(industryWorkId.value, 'Campaign');
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> endCampaignByManager(campaignId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      int value =
          await TeamCampaignApiServices().endCampaignByManager(campaignId);
      if (value == 200) {
        Get.back();
        getCampaignList();
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> createCampaign(ruleList) async {
    isLoading(true);
    errorOccurred(false);
    try {
      createCampaignModel.value = await TeamCampaignApiServices().createCampaign(
        campaignPurposeId.value,
        campaignName.value.text,
        startDate.value,
        endDate.value,
        industryWorkId.value,
        ruleList,
      );

      if (createCampaignModel.value.responseCode == 200) {
        await TeamCampaignApiServices().sendCampaignToWhatsapp(createCampaignModel.value.campaignId);
        Get.defaultDialog(
          backgroundColor: blackApp,
            title: 'Success!',
            titleStyle: const TextStyle(color: white),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                createCampaignModel.value.message.toString(),
                style: const TextStyle(color: white),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Get.back();
              }, child: const Text('OK'))
            ]);
        campaignPurposeId.value = '';
        campaignName.text = '';
        startDate.value = 'DD/MM/YYYY';
        endDate.value = 'DD/MM/YYYY';
        industryWorkId.value = '';
        getCampaignList();
      }else{
        Get.defaultDialog(
            backgroundColor: blackApp,
            title: 'Error!',
            titleStyle: const TextStyle(color: white),
            // titlePadding: EdgeInsets.zero,
            // contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                createCampaignModel.value.message.toString(),
                style: const TextStyle(color: white),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Get.back();
              }, child: const Text('OK'))
            ]);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

}
