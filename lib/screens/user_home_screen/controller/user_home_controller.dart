import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/user_home_screen/model/voucher_model.dart';
import 'package:flutter_state_management/screens/user_home_screen/model/kpi_data_model.dart';
import 'package:flutter_state_management/screens/user_home_screen/model/reward_points.dart';
import 'package:flutter_state_management/screens/user_home_screen/model/wellbeing_list_model.dart';
import 'package:flutter_state_management/screens/user_home_screen/services/user_home_api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../my_josh/model/mood_model.dart';
import '../../my_josh/model/submit_josh_model.dart';
import '../../my_josh/services/my_josh_api_services.dart';
import '../../reward_screen/model/claim_reward_model.dart';
import '../../reward_screen/services/reward_api_service.dart';
import '../model/win_level_points.dart';

class UserHomeController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final kpiDataModel = KpiDataModel().obs;
  final wellBeingList = WellBeingList().obs;
  late RewardPoints rewardPoints;
  RxString pointBalance = "".obs;
  RxString pointBalanceForRedeem = "".obs;
  final voucherModel = VoucherModel().obs;
  var selectedEmoji = 0.obs;
  var moodSubmitted = false.obs;
  final moodModel = MoodModel().obs;
  final submitJoshModel = SubmitJoshModel().obs;
  final winLeveLPoints = WinLeveLPoints().obs;
  final claimRewardModel = ClaimRewardModel().obs;

  @override
  void onInit() {
    userLoginCheck();
    getKpiData();
    getRewardPoints();
    getWellBeingList();
    homePageVoucherList();
    getJoshTodayForCustomer();
    winLevelPointsApi();
    super.onInit();
  }


  Future<void> addToWishlist(productVoucherId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      await RewardApiService().addToWishlist(productVoucherId);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> removeWishlist(productVoucherId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      await RewardApiService().removeWishlist(productVoucherId);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitCustomerJosh() async {
    isLoading(true);
    errorOccurred(false);
    try {
      submitJoshModel.value = await MyJoshReasonApiServices()
          .submitCustomerJosh(selectedEmoji.value, '', '');
      if (submitJoshModel.value.responseCode == 200) {
        moodSubmitted.value = true;
        var point = submitJoshModel.value.rewardPointsData?.rewardPoints;
        if (point! > 0) {
          DashboardController().showAlertDialog(
              point, submitJoshModel.value.rewardPointsData!.rewardMessage);
        }
      } else if (submitJoshModel.value.responseCode == 201) {
        Fluttertoast.showToast(msg: 'Mood Already Submitted');
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> onRefresh() async {
    userLoginCheck();
    getKpiData();
    getRewardPoints();
    getWellBeingList();
    homePageVoucherList();
    getJoshTodayForCustomer();
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

  Future<void> getJoshTodayForCustomer() async {
    isLoading(true);
    errorOccurred(false);
    try {
      moodModel.value =
          await MyJoshReasonApiServices().getJoshTodayForCustomer();
      if (moodModel.value.data?.emojiPoint != 0) {
        selectedEmoji.value = moodModel.value.data?.emojiPoint ?? 0 ;
        moodSubmitted.value = true;
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      // isLoading(false);
    }
  }

  Future<void> userLoginCheck() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await UserHomeApiServices().userLoginCheckApi();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getKpiData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      kpiDataModel.value = await UserHomeApiServices().getCustomerKpiData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getRewardPoints() async {
    isLoading(true);
    errorOccurred(false);
    try {
      rewardPoints = await UserHomeApiServices().getRewardsPoints();
      pointBalance.value = NumberFormat.compactCurrency(decimalDigits: 2,symbol: '').format((rewardPoints.earnedPoint! - rewardPoints.pointUsed!));
      pointBalanceForRedeem.value = (rewardPoints.earnedPoint! - rewardPoints.pointUsed!).toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getWellBeingList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      wellBeingList.value =
          await UserHomeApiServices().getWellBeingList('today');
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> homePageVoucherList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      voucherModel.value = await UserHomeApiServices().homePageVoucherList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
