import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/team_wellbeing_list.dart';
import '../model/team_wellbeing_top_three.dart';
import '../services/manager_wellbeing_api_services.dart';

class ManagerWellbeingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final teamWellbeingList = TeamWellbeingList().obs;
  final teamWellbeingTopThreeList = TeamWellbeingTopThreeList().obs;


  RxString timeDropdownValue = 'TODAY'.obs;

  var timePeriod = [
    'ALL',
    'TODAY',
    'YESTERDAY',
    'WTD',
    'MTD',
    'YTD',
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 4);
    teamWellBeingList();
    teamWellbeingTopThreeListApi();
  }

  Future<void> onRefresh() async {
    teamWellBeingList();
    teamWellbeingTopThreeListApi();
  }

  Future<void> teamWellBeingList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamWellbeingList.value =
          await ManagerWellBeingApiServices().teamWellBeingList(getTime(timeDropdownValue.value));
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  String getTime(time) {
    switch (time) {
      case 'ALL':
        return 'all';
      case 'TODAY':
        return 'today';
      case 'YESTERDAY':
        return 'yesterday';
      case 'WTD':
        return 'wtd';
      case 'MTD':
        return 'mtd';
      case 'YTD':
        return 'ytd';
    }
    return '';
  }

  Future<void> teamWellbeingTopThreeListApi() async {
    isLoading(true);
    errorOccurred(false);
    try {
      teamWellbeingTopThreeList.value =
          await ManagerWellBeingApiServices().teamWellbeingTopThreeList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

}
