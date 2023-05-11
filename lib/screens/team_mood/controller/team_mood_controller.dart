import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/screens/team_mood/services/team_mood_api_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../constants/literals.dart';
import '../../leaderboard_screen/model/team_list_reward_resource.dart';
import '../../leaderboard_screen/services/leaderboard_api_services.dart';
import '../../login_screen/model/user.dart';
import '../../my_josh/model/mood_model.dart';
import '../model/mood_score_model.dart';
import '../model/team_mood_today.dart';
import '../team_mood_screen.dart';

class BarData {
  BarData(this.x, this.y, this.y1,this.y2);
  final int x;
  final double y;
  final double y1;
  final double y2;
}

class TeamMoodController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final teamMoodToday = TeamMoodToday().obs;
  final moodScoreModel = MoodScoreModel().obs;
  final teamListRewardResource = TeamListRewardResource().obs;
  var selectedTeamId = 0.obs;


  final List<ChartData> chartData = <ChartData>[].obs;
  final List<BarData> barData = <BarData>[].obs;
  final moodModel = MoodModel().obs;
  var teamMoodText = ''.obs;
  var myMoodText = ''.obs;
  var myMoodImage = ''.obs;
  var teamMoodImage = ''.obs;

  var colors = [greenDark,red,cyan,yellowApp,green,orange,purple];

  late User user;

  @override
  void onInit() {
    user = LocalStorage.user();
    if(user.roleId==2){
      getTeamMoodToday();
      reasonPieChartData();
      getJoshTodayForManager();
    }else{
      teamListForRewardResource();
    }
    super.onInit();
  }

  Future<void> onRefresh() async {
    if(user.roleId==2){
      getTeamMoodToday();
      reasonPieChartData();
      getJoshTodayForManager();
    }else{
      teamListForRewardResource();
    }
  }

  Future<void> teamListForRewardResource() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamListRewardResource.value = await LeaderboardApiService().teamListForRewardResource();
      selectedTeamId.value = teamListRewardResource.value.data?.first.teamId??0;
      getExecutiveTeamMoodToday();
      executiveReasonPieChartData();
      getJoshTodayForExecutive();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }


  Future<void> getExecutiveTeamMoodToday() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamMoodToday.value = await TeamMoodApiServices().getExecutiveTeamMoodToday(selectedTeamId.value);
      barData.add(BarData(1, double.parse(teamMoodToday.value.todayScores!.one.toString()), double.parse(teamMoodToday.value.yesterdayScores!.one.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.one.toString())));
      barData.add(BarData(2, double.parse(teamMoodToday.value.todayScores!.two.toString()), double.parse(teamMoodToday.value.yesterdayScores!.two.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.two.toString())));
      barData.add(BarData(3, double.parse(teamMoodToday.value.todayScores!.three.toString()), double.parse(teamMoodToday.value.yesterdayScores!.three.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.three.toString())));
      barData.add(BarData(4, double.parse(teamMoodToday.value.todayScores!.four.toString()), double.parse(teamMoodToday.value.yesterdayScores!.four.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.four.toString())));
      barData.add(BarData(5, double.parse(teamMoodToday.value.todayScores!.five.toString()), double.parse(teamMoodToday.value.yesterdayScores!.five.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.five.toString())));
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTeamMoodToday() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamMoodToday.value = await TeamMoodApiServices().getTeamMoodToday();
      barData.add(BarData(1, double.parse(teamMoodToday.value.todayScores!.one.toString()), double.parse(teamMoodToday.value.yesterdayScores!.one.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.one.toString())));
      barData.add(BarData(2, double.parse(teamMoodToday.value.todayScores!.two.toString()), double.parse(teamMoodToday.value.yesterdayScores!.two.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.two.toString())));
      barData.add(BarData(3, double.parse(teamMoodToday.value.todayScores!.three.toString()), double.parse(teamMoodToday.value.yesterdayScores!.three.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.three.toString())));
      barData.add(BarData(4, double.parse(teamMoodToday.value.todayScores!.four.toString()), double.parse(teamMoodToday.value.yesterdayScores!.four.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.four.toString())));
      barData.add(BarData(5, double.parse(teamMoodToday.value.todayScores!.five.toString()), double.parse(teamMoodToday.value.yesterdayScores!.five.toString()),double.parse(teamMoodToday.value.yesterdayKpiMetPercent!.five.toString())));
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> executiveReasonPieChartData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      chartData.clear();
      moodScoreModel.value = await TeamMoodApiServices().executiveReasonPieChartData(selectedTeamId.value);
      for (var i = 0; i < moodScoreModel.value.moodScorePercent!.length; i++) {
        var mood = moodScoreModel.value.moodScorePercent![i];
        chartData.add(ChartData(mood.categoryName, mood.categoryPercent,colors[i]));
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> reasonPieChartData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      chartData.clear();
      moodScoreModel.value = await TeamMoodApiServices().reasonPieChartData();
      for (var i = 0; i < moodScoreModel.value.moodScorePercent!.length; i++) {
        var mood = moodScoreModel.value.moodScorePercent![i];
        chartData.add(ChartData(mood.categoryName, mood.categoryPercent,colors[i]));
      }
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
      moodModel.value = await TeamMoodApiServices().getJoshTodayForExecutive(selectedTeamId.value);
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

}
