import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/model/customer_reward_resource.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/services/leaderboard_api_services.dart';
import 'package:flutter_state_management/screens/login_screen/model/user.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/literals.dart';
import '../../game_time_screen/model/next_available_time.dart';
import '../../game_time_screen/services/game_time_api_services.dart';
import '../../my_challenge/model/my_challenge_model.dart';
import '../../my_challenge/services/my_challenge_api_services.dart';
import '../../user_home_screen/model/win_level_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/manager_reward_resource.dart';
import '../model/team_list_reward_resource.dart';
import '../model/team_points_model.dart';
import '../model/team_reward_resource.dart';

class LeaderboardController extends GetxController {
  var timePeriodValue = 'ALL'.obs;
  var topBottomValue = 'Top 10'.obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var motivationalMessage = "".obs;
  RxList<TeamPointsList> teamPointsList = <TeamPointsList>[].obs;
  final customerRewardResource = CustomerRewardResource().obs;
  final managerRewardResource = ManagerRewardResource().obs;
  final teamRewardResource = TeamRewardResource().obs;
  final teamListRewardResource = TeamListRewardResource().obs;
  var selectedTeamId = 0.obs;
  var selectedTeamIdForLeaderboard = 0.obs;
  late User user;
  RxInt userType = 1.obs;
  var totalPoints = 1.obs;
  var totalTeamPoints = 0.obs;
  var selectedDate = "".obs;
  final myChallengeModel = MyChallengeModel().obs;
  final winLeveLPoints = WinLeveLPoints().obs;


  String getGroup(group) {
    if (group == 'Top 10') {
      return 'top_10';
    } else if (group == 'Bottom 10') {
      return 'bottom_10';
    }
    return 'top_10';
  }

  getTime(time) {
    if (time == 'ALL') {
      return 'time_period_all';
    } else if (time == 'TODAY') {
      return 'today';
    } else if (time == 'YESTERDAY') {
      return 'yesterday';
    } else if (time == 'WTD') {
      return 'wtd';
    } else if (time == 'MTD') {
      return 'mtd';
    } else if (time == 'YTD') {
      return 'ytd';
    }
  }

  final nextAvailableTime = NextAvailableTime().obs;

  var timePeriod = [
    'ALL',
    'TODAY',
    'YESTERDAY',
    'WTD',
    'MTD',
    'YTD',
  ];

  var topBottom = ['Top 10', 'Bottom 10'];

  @override
  void onInit() {
    user = LocalStorage.user();
    if (user.roleId == 1) {
      customerRewardResources();
    } else {
      managerRewardResources();
    }
    if (user.roleId == 3) {
      teamListForRewardResource();
    }
    getMotivationalMessage();
    getTeamLeaderboardFilter();
    nextAvailabilityTime();
    getTeamPointData(user.teamId);
    getMyChallengeList();
    winLevelPointsApi();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getMotivationalMessage();
    getTeamLeaderboardFilter();
    getTeamPointData(user.teamId);
    getMyChallengeList();
    nextAvailabilityTime();
    if (user.roleId == 1) {
      customerRewardResources();
    } else {
      managerRewardResources();
    }
    if (user.roleId == 3) {
      teamListForRewardResource();
    }
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
      if (myChallengeModel.value.teamChallengeLists!.isNotEmpty) {
        getChallengeTimer(
            myChallengeModel.value.teamChallengeLists!.first.endTime);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> nextAvailabilityTime() async {
    isLoading(true);
    errorOccurred(false);
    try {
      nextAvailableTime.value = await GameTimeApiService().nextAvailabilityTime();
      await printDifferenceDateForHours(nextAvailableTime.value.data?.nextAvailabilityTime);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Timer _timer = Timer(const Duration(),(){});
  var difference = 0.obs;
  var availableTime = '00 : 00 : 00'.obs;

  printDifferenceDateForHours(date) {
    // date = "2022-10-12 16:40:00.000";
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS")
        .parse(date.toString().substring(0, 23));
    var currentTime = DateTime.now();
    DateTime startDate = DateTime.parse(parseDate.toString());
    difference.value = startDate.difference(currentTime).inSeconds;
    if(_timer !=null){
    _timer.cancel();
    }
    availableTime.value = "00 : 00 : 00";
    try {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (difference.value > 0) {
          difference.value--;
          availableTime.value = formatTime(difference.value);
        } else {
          _timer.cancel();
          availableTime.value = "00 : 00 : 00";
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  late Timer _challengeTimer;
  var difference2 = 0.obs;
  var challengeTime = '00 : 00 : 00'.obs;

  getChallengeTimer(date) {
    // date = "2022-10-12 16:40:00.000";
    String now = DateTime.now().toString();

    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse('${now.substring(0, 10)} ${date.toString()}');
    var currentTime = DateTime.now();
    DateTime startDate = DateTime.parse(parseDate.toString());
    difference2.value = startDate.difference(currentTime).inSeconds;
    try {
      _challengeTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (difference2.value > 0) {
          difference2.value--;
          challengeTime.value = formatTime(difference2.value);
        } else {
          _challengeTimer.cancel();
          challengeTime.value = "00 : 00 : 00";
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getMotivationalMessage() async {
    isLoading(true);
    errorOccurred(false);
    try {
      motivationalMessage.value =
          await LeaderboardApiService().getMotivationalMessage();
    } catch (e) {

      errorOccurred(false);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamPointData(teamId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      totalTeamPoints.value = 0;
      teamRewardResource.value = await LeaderboardApiService().getTeamPointData(teamId);
      totalTeamPoints.value = teamRewardResource.value.usageRewardsPoint! +
          teamRewardResource.value.challengeAndCampaignRewardsPoint! +
          teamRewardResource.value.gameRewardsPoint! +
          teamRewardResource.value.moodRewardsPoint! +
          teamRewardResource.value.wellbeingRewardsPoint! +
          teamRewardResource.value.milestoneRewardsPoint! +
          teamRewardResource.value.leaderboardRewardsPoint! +
          teamRewardResource.value.kpiRewardsPoint! +
          teamRewardResource.value.redemptionCashbackRewardsPoint! +
          teamRewardResource.value.nonAppRewardsPoint!;
    } catch (e) {
      errorOccurred(false);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamLeaderboardFilter() async {
    isLoading(true);
    errorOccurred(false);
    try {
      if (user.roleId == 3) {
        teamPointsList.value = await LeaderboardApiService().getExecutiveLeaderboardFilter(getGroup(topBottomValue.value), getTime(timePeriodValue.value),selectedTeamIdForLeaderboard.value);
      } else  {
        teamPointsList.value = await LeaderboardApiService().getTeamLeaderboardFilter(getGroup(topBottomValue.value), getTime(timePeriodValue.value));
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> customerRewardResources() async {
    isLoading(true);
    errorOccurred(false);
    try {
      totalPoints.value = 0;
      customerRewardResource.value = await LeaderboardApiService()
          .customerRewardResources(selectedDate.value);
      totalPoints.value = customerRewardResource.value.usageRewardsPoint! +
          customerRewardResource.value.challengeAndCampaignRewardsPoint! +
          customerRewardResource.value.gameRewardsPoint! +
          customerRewardResource.value.moodRewardsPoint! +
          customerRewardResource.value.wellbeingRewardsPoint! +
          customerRewardResource.value.milestoneRewardsPoint! +
          customerRewardResource.value.leaderboardRewardsPoint! +
          customerRewardResource.value.kpiRewardsPoint! +
          customerRewardResource.value.redemptionCashbackRewardsPoint! +
          customerRewardResource.value.nonAppRewardsPoint!;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> managerRewardResources() async {
    isLoading(true);
    errorOccurred(false);
    try {
      totalPoints.value = 0;
      if (user.roleId == 2) {
        managerRewardResource.value = await LeaderboardApiService()
            .managerRewardResources(selectedDate.value);
      } else {
        managerRewardResource.value = await LeaderboardApiService()
            .executiveRewardResources(selectedDate.value);
      }
      totalPoints.value = managerRewardResource.value.usageRewardsPoint! +
          managerRewardResource.value.gameRewardsPoint! +
          managerRewardResource.value.moodRewardsPoint! +
          managerRewardResource.value.wellbeingRewardsPoint! +
          managerRewardResource.value.kpiRewardsPoint! +
          managerRewardResource.value.milestoneRewardsPoint! +
          managerRewardResource.value.redemptionCashbackRewardsPoint!;
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
      selectedTeamId.value = teamListRewardResource.value.data?.first.teamId??0;
      selectedTeamIdForLeaderboard.value = teamListRewardResource.value.data?.first.teamId ?? 0;
      getTeamLeaderboardFilter();
      getTeamPointData(selectedTeamId.value);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
