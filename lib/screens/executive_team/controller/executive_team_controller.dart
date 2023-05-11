import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:get/get.dart';
import '../../leaderboard_screen/model/team_list_reward_resource.dart';
import '../../leaderboard_screen/services/leaderboard_api_services.dart';
import '../../login_screen/model/user.dart';
import '../model/executive_model.dart';
import '../services/executive_team_api_services.dart';

class ExecutiveTeamController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  late TabController tabController;
  final teamListRewardResource = TeamListRewardResource().obs;
  final executiveModel = ExecutiveModel().obs;

  late User user;

  List<TeamList> teamList = [];
  Rx<List<TeamList>> searchResult = Rx([]);

  List<UserProfileList> executiveList = [];
  Rx<List<UserProfileList>> executiveResult = Rx([]);

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    user = LocalStorage.user();
    tabController = TabController(vsync: this, length: 2,);
    tabController.addListener(_setActiveTabIndex);
    teamListForRewardResource();
    executiveListApi();
    super.onInit();
  }

  void _setActiveTabIndex() {
    selectedIndex.value = tabController.index;
    searchResult.value = teamList;
    executiveResult.value = executiveList;
  }

  Future<void> onRefresh() async {
    executiveListApi();
    teamListForRewardResource();
  }

  onChanged(String text) async {
    if (text.isEmpty) {
      searchResult.value = teamList;
      return;
    }
    searchResult.value = teamList
        .where((element) =>
            element.managerName.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  onChangedExecutive(String text) async {
    if (text.isEmpty) {
      executiveResult.value = executiveList;
      return;
    }
    executiveResult.value = executiveList
        .where((element) =>
            element.firstName.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  Future<void> teamListForRewardResource() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamListRewardResource.value =
          await LeaderboardApiService().teamListForRewardResource();
      teamList = teamListRewardResource.value.data!;
      searchResult.value = teamList;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> executiveListApi() async {
    isLoading(true);
    errorOccurred(false);
    try {
      executiveModel.value = await ExecutiveTeamApiServices().executiveList();
      executiveList = executiveModel.value.userProfileList!;
      executiveResult.value = executiveList;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
