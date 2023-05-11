import 'package:flutter_state_management/screens/leaderboard_screen/services/leaderboard_api_services.dart';
import 'package:flutter_state_management/screens/manager_home_screen/services/manager_home_api_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/literals.dart';
import '../../../constants/local_storage.dart';
import '../../leaderboard_screen/model/team_list_reward_resource.dart';
import '../../leaderboard_screen/model/team_points_model.dart';
import '../../login_screen/model/user.dart';
import '../../manager_wellbeing/model/team_wellbeing_list.dart';
import '../../manager_wellbeing/services/manager_wellbeing_api_services.dart';
import '../../my_josh/model/mood_model.dart';
import '../../reward_screen/services/reward_api_service.dart';
import '../../team_mood/services/team_mood_api_services.dart';
import '../../user_home_screen/model/reward_points.dart';
import '../../user_home_screen/model/voucher_model.dart';
import '../../user_home_screen/model/wellbeing_list_model.dart';
import '../../user_home_screen/model/win_level_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/manager_kpi_data.dart';


class ManagerHomeController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  RxList<TeamPointsList> teamPointsList = <TeamPointsList>[].obs;
  final kpiDataModel = ManagerKpiData().obs;
  final teamWellbeingList = TeamWellbeingList().obs;
  final wellBeingList = WellBeingList().obs;
  final moodModel = MoodModel().obs;
  var teamMoodText = ''.obs;
  var myMoodText = ''.obs;
  var myMoodImage = ''.obs;
  var teamMoodImage = ''.obs;
  final winLeveLPoints = WinLeveLPoints().obs;
  final voucherModel = VoucherModel().obs;
  RxString pointBalance = "".obs;
  RxString pointBalanceForRedeem = "".obs;
  final rewardPoints = RewardPoints().obs;
  late User user;
  final teamListRewardResource = TeamListRewardResource().obs;
  var selectedTeamIdForLeaderboard = 0.obs;


  @override
  void onInit() {
    user = LocalStorage.user();
    if(user.roleId==2){
      getTeamLeaderBoardData();
    }else{
      teamListForRewardResource();
    }
    getManagerKpiData();
    teamWellBeingList();
    userLoginCheck();
    getJoshTodayForManager();
    getWellBeingList();
    winLevelPointsApi();
    homePageVoucherList();
    getRewardPoints();
    super.onInit();
  }

  Future<void> onRefresh() async {
    if(user.roleId==2){
      getTeamLeaderBoardData();
    }else{
      teamListForRewardResource();
    }
    getManagerKpiData();
    teamWellBeingList();
    userLoginCheck();
    getJoshTodayForManager();
    getWellBeingList();
    winLevelPointsApi();
    homePageVoucherList();
    getRewardPoints();
  }



  Future<void> getRewardPoints() async {
    isLoading(true);
    errorOccurred(false);
    try {
      rewardPoints.value = await UserHomeApiServices().getRewardsPoints();
      pointBalance.value = NumberFormat.compactCurrency(decimalDigits: 2,symbol: '').format((rewardPoints.value.earnedPoint! - rewardPoints.value.pointUsed!));
      pointBalanceForRedeem.value = (rewardPoints.value.earnedPoint! - rewardPoints.value.pointUsed!).toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
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


  Future<void> getWellBeingList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      wellBeingList.value = await UserHomeApiServices().getWellBeingList('today');
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getJoshTodayForManager() async {
    isLoading(true);
    errorOccurred(false);
    try {
      moodModel.value = await TeamMoodApiServices().getJoshTodayForManager();
      teamMoodText.value = getMood(moodModel.value.teamMood);
      teamMoodImage.value = getMoodImage(moodModel.value.teamMood);
      myMoodText.value = getMood(moodModel.value.data?.emojiPoint);
      myMoodImage.value = getMoodImage(moodModel.value.data?.emojiPoint);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getJoshTodayForExecutive() async {
    isLoading(true);
    errorOccurred(false);
    try {
      moodModel.value = await TeamMoodApiServices().getJoshTodayForExecutive(selectedTeamIdForLeaderboard.value);
      teamMoodText.value = getMood(moodModel.value.teamMood);
      teamMoodImage.value = getMoodImage(moodModel.value.teamMood);
      myMoodText.value = getMood(moodModel.value.data?.emojiPoint);
      myMoodImage.value = getMoodImage(moodModel.value.data?.emojiPoint);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
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

  Future<void> teamWellBeingList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamWellbeingList.value =
          await ManagerWellBeingApiServices().teamWellBeingList('today');
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamLeaderBoardData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamPointsList.value =
          await LeaderboardApiService().getTeamLeaderboardFilter('top_10','time_period_all');
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> teamListForRewardResource() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamListRewardResource.value = await LeaderboardApiService().teamListForRewardResource();
      selectedTeamIdForLeaderboard.value = teamListRewardResource.value.data?.first.teamId ?? 0;
      getExecutiveLeaderboardFilter();
      getJoshTodayForExecutive();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getExecutiveLeaderboardFilter() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamPointsList.value = await LeaderboardApiService().getExecutiveLeaderboardFilter('top_10','time_period_all',selectedTeamIdForLeaderboard.value);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getManagerKpiData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      kpiDataModel.value = await ManagerHomeApiServices().getManagerKpiData();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
