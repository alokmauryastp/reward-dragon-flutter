import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/screens/game_time_screen/model/game_category_model.dart';
import 'package:flutter_state_management/screens/game_time_screen/services/game_time_api_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../user_home_screen/model/win_level_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/game_model.dart';
import '../model/game_point.dart';
import '../model/next_available_time.dart';

class GameTimeController extends GetxController {

  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var gameClickable = true.obs;
  final gameCategoryModel = GameCategoryModel().obs;
  final nextAvailableTime = NextAvailableTime().obs;
  final winLeveLPoints = WinLeveLPoints().obs;
  final gameModel = GameModel().obs;
  final gamePoint = GamePoint().obs;
  var gameCategoryId = 0.obs;
  var difference = 0.obs;
  var availableTime = '00 : 00 : 00'.obs;
  var selectedIndex = 0.obs;


  @override
  void onInit() {
    getCategoryList();
    getGamePoint();
    nextAvailabilityTime();
    winLevelPointsApi();
    super.onInit();
  }

  @override
  void onClose() {
    // if(_timer != null){
    _timer.cancel();
  // }
  }


  Future<void> onRefresh() async {
    getCategoryList();
    // nextAvailabilityTime();
    getGamePoint();
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

  Future<void> getCategoryList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      gameCategoryModel.value = await GameTimeApiService().gameCategoryList();
      gameCategoryId.value = gameCategoryModel.value.gameCategories?.first.id ?? 0;
      getGameList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getGameList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      gameModel.value = await GameTimeApiService().getGameList(gameCategoryModel.value.gameCategories![selectedIndex.value].id);
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
      nextAvailableTime.value =
          await GameTimeApiService().nextAvailabilityTime();
      await printDifferenceDateForHours(
          nextAvailableTime.value.data?.nextAvailabilityTime);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  late Timer _timer;

  printDifferenceDateForHours(date) {
    // date = "2022-10-12 16:40:00.000";
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(date.toString().substring(0,23));
    var currentTime = DateTime.now();
    DateTime startDate = DateTime.parse(parseDate.toString());
    difference.value = startDate.difference(currentTime).inSeconds;
    try {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (difference.value > 0) {
          difference.value--;
          gameClickable.value = false;
          availableTime.value = formatTime(difference.value);
        } else {
          _timer.cancel();
          availableTime.value = "00 : 00 : 00";
          gameClickable.value = true;
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String formatTime(int time) {
    Duration duration = Duration(seconds: time.round());
    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(' : ');
  }

  Future<void> getGamePoint() async {
    isLoading(true);
    errorOccurred(false);
    try {
      gamePoint.value = await GameTimeApiService().getGamePoint();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

}
