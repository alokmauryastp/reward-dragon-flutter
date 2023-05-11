import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/notification_screen/services/notification_api_services.dart';
import 'package:get/get.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  List<Notification> notificationList = <Notification>[].obs;
  List<int> selectedList = [];
  var pageNo = 1.obs;
  var currentItem = 0.obs;
  final notificationModel = NotificationModel().obs;

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }

  Future<void> onRefresh() async {
    pageNo = 1.obs;
    notificationList.clear();
    getNotifications();
  }

  List<int> getSelectedList() {
    selectedList.clear();
    for (Notification item in notificationList) {
      if (item.isSelected.value) {
        selectedList.add(item.id);
      }
    }
    return selectedList;
  }

  Future<void> selectAll() async {
    for (Notification item in notificationList) {
      item.isSelected.value = true;
    }
  }

  String getPages(redirection) {
    switch (redirection) {
      case 'my_leaderboard':
        return ApplicationPages.leaderboardScreen;
      case 'my_josh':
        return ApplicationPages.myJoshScreen;
      case 'my_wellbeing':
        return ApplicationPages.wellbeingScreen;
      case 'game_for_today':
        return ApplicationPages.myGameTimeScreen;
      case 'my_challenges':
        return ApplicationPages.myChallengeScreen;
      case 'new_challenge':
        return ApplicationPages.myChallengeScreen;
      case 'my_resources':
        return ApplicationPages.myResourceScreen;
      case 'new_campaign':
        return ApplicationPages.myCampaignScreen;
      case 'home_page':
        return ApplicationPages.dashboardScreen;
      case 'my_challenge':
        return ApplicationPages.myChallengeScreen;
        //new
      case 'learn_for_fun':
        return ApplicationPages.wellbeingScreen;
      case 'learn_for_fun_streak_bonus':
        return ApplicationPages.wellbeingScreen;
      case 'learning_material_streak_bonus':
        return ApplicationPages.myResourceScreen;
      case 'inspired_living':
        return ApplicationPages.wellbeingScreen;
      case 'inspired_living_streak_bonus':
        return ApplicationPages.wellbeingScreen;
      case 'steps_bonus':
        return ApplicationPages.wellbeingScreen;
      case 'heart_bonus':
        return ApplicationPages.wellbeingScreen;
    }
    return ApplicationPages.dashboardScreen;
  }

  Future<void> getNotifications() async {
    isLoading(true);
    errorOccurred(false);
    try {
      notificationModel.value =
          await NotificationApiServices().getNotificationList(pageNo.value);
      notificationList.addAll(notificationModel.value.notifications!);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> markReadNotification() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await NotificationApiServices().markReadNotification(getSelectedList());
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      pageNo = 1.obs;
      notificationList.clear();
      getNotifications();
    }
  }

  Future<void> markUnReadNotification() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await NotificationApiServices().markUnReadNotification(getSelectedList());
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      pageNo = 1.obs;
      notificationList.clear();
      getNotifications();
    }
  }

  Future<void> deleteNotification() async {
    isLoading(true);
    errorOccurred(false);
    try {
      await NotificationApiServices().deleteNotification(getSelectedList());
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      pageNo = 1.obs;
      notificationList.clear();
      getNotifications();
    }
  }
}
