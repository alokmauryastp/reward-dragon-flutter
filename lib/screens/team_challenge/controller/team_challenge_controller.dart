
import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/team_challenge/services/team_challenge_api_services.dart';
import 'package:flutter_state_management/screens/team_challenge/team_challenge_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../constants/literals.dart';
import '../../team_campaign/model/industry_work_data.dart';
import '../../team_campaign/model/kpi_model.dart';
import '../../team_campaign/services/team_campaign_api_services.dart';
import '../model/challenge_purpose_model.dart';
import '../model/create_challenge_model.dart';
import '../model/team_challenge_model.dart';

class TeamChallengeController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final industryWorkData = IndustryWorkData().obs;
  final kpiModel = KpiModel().obs;
  final challengePurposeModel = ChallengePurposeModel().obs;
  final teamChallengeModel = TeamChallengeModel().obs;
  final createChallengeModel = CreateChallengeModel().obs;

  var industryWorkTypeId = 0.obs;
  var challengePurposeId = 0.obs;

  var kpiId = 0.obs;
  var selectedKpiType = ''.obs;

  var startTime = "HH:MM".obs;
  var endTime = "HH:MM".obs;

  final challengeController = TextEditingController();
  final targetController = TextEditingController();
  final activityDetailsController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isBottomSheetOpen = Get.arguments;
  late BuildContext context ;

  bool validation(){
    if(industryWorkTypeId.value==0){
      Fluttertoast.showToast(msg: 'Select Industry');
      return false;
    }
    if(kpiId.value==0){
      Fluttertoast.showToast(msg: 'Select KPI');
      return false;
    }
    if(challengePurposeId.value==0){
      Fluttertoast.showToast(msg: 'Select Challenge Purpose');
      return false;
    }
    if(startTime.value=='HH:MM'){
      Fluttertoast.showToast(msg: 'Select Start Time');
      return false;
    }
    if(endTime.value=='HH:MM'){
      Fluttertoast.showToast(msg: 'Select End Time');
      return false;
    }
    return true;
  }

  @override
  void onReady() {
    if(isBottomSheetOpen){
      const TeamChallengeScreen().createChallengeBottomSheet(context);
    }
  }

  @override
  void onInit() {
    getTeamChallenges();
    getChallengePurposeList();
    getIndustryListData();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getTeamChallenges();
    getIndustryListData();
    getChallengePurposeList();
  }

  Future<void> endChallengeByManager(challengeId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      bool isCampaignEnded = await TeamChallengeApiServices().endChallengeByManager(challengeId);
      if(isCampaignEnded){
        Get.back();
        onRefresh();
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamChallenges() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamChallengeModel.value = await TeamChallengeApiServices().getTeamChallenges();
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
      industryWorkTypeId.value= industryWorkData.value.industryWorkData!.first.id;
      getKpiListData();
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
      kpiModel.value = await TeamCampaignApiServices().getKpiListData(industryWorkTypeId.value, 'Challenge');
      if(kpiModel.value.kpiNameData!.isNotEmpty){
      kpiId.value = kpiModel.value.kpiNameData!.first.id;
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getChallengePurposeList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      challengePurposeModel.value =
          await TeamChallengeApiServices().getChallengePurposeList();
      challengePurposeId.value = challengePurposeModel.value.challengePurpose!.first.id;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> createChallenge() async {
    isLoading(true);
    errorOccurred(false);
    try {
      createChallengeModel.value = await TeamChallengeApiServices()
          .createChallenge(
              challengePurposeId.value,
              challengeController.value.text,
              startTime.value,
              endTime.value,
              activityDetailsController.value.text,
              targetController.value.text,
              industryWorkTypeId.value,
              kpiId.value);
      if(createChallengeModel.value.responseCode==200){
        await TeamChallengeApiServices().sendChallengeToWhatsapp(createChallengeModel.value.challengeId);
        challengeController.text ='';
        startTime.value = "HH:MM";
        endTime.value = "HH:MM";
        activityDetailsController.text='';
        targetController.text = '';
        onRefresh();
        Get.defaultDialog(
            backgroundColor: blackApp,
            title: 'Success!',
            titleStyle: const TextStyle(color: white),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                createChallengeModel.value.message.toString(),
                style: const TextStyle(color: white),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Get.back();
              }, child: const Text('OK'))
            ]);
      }else if(createChallengeModel.value.responseCode==201){
        Get.defaultDialog(
            backgroundColor: blackApp,
            title: 'Error!',
            titleStyle: const TextStyle(color: white),
            content: Text(
              createChallengeModel.value.message.toString(),
              style: const TextStyle(color: white),
              textAlign: TextAlign.center,
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
