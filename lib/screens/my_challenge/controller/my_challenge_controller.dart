import 'dart:async';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/my_challenge/services/my_challenge_api_services.dart';
import 'package:get/get.dart';
import '../../user_home_screen/model/win_level_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/accept_challenge_model.dart';
import '../model/challenge_points.dart';
import '../model/my_challenge_model.dart';

class MyChallengeController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final challengePoints = ChallengePoints().obs;
  final myChallengeModel = MyChallengeModel().obs;
  final acceptChallengeModel = AcceptChallengeModel().obs;
  final winLeveLPoints = WinLeveLPoints().obs;

  @override
  void onInit() {
    getMyChallengeList();
    getChallengePoint();
    winLevelPointsApi();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getMyChallengeList();
    getChallengePoint();
    winLevelPointsApi();
  }


  Future<void> winLevelPointsApi() async {
    isLoading(true);
    errorOccurred(false);
    try {
      winLeveLPoints.value = await UserHomeApiServices().winLevelPoints();
      isLoading(false);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }


  Future<void> getMyChallengeList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      myChallengeModel.value =
          await MyChallengeApiServices().getMyChallengeList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> acceptChallenge(challengeId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      acceptChallengeModel.value =
          await MyChallengeApiServices().acceptChallenge(challengeId);
      if (acceptChallengeModel.value.responseCode == 200) {
        int point = acceptChallengeModel.value.rewardPointsData!.rewardPoints;
        if (point > 0) {
          DashboardController().showAlertDialog(point,
              acceptChallengeModel.value.rewardPointsData!.rewardMessage);
        }
        getMyChallengeList();
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getChallengePoint() async {
    isLoading(true);
    errorOccurred(false);
    try {
      challengePoints.value =
          await MyChallengeApiServices().getChallengePoint();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
