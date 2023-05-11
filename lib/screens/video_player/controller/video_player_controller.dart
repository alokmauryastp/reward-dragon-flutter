import 'dart:async';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/video_player/services/video_player_api_services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../model/focused_wellbeing_time.dart';
import '../model/inspired_living_time.dart';
import '../model/learn_for_fun.dart';
import '../model/learning_material.dart';

class VideoPlayerController extends GetxController {

  var from = Get.arguments[0];
  var youtubeVideoId = Get.arguments[1];
  var videoId = Get.arguments[2];

  var isFullScreen = false.obs;

  late Timer _timer;
  var spendTime = 0.obs;
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final learningMaterial = LearningMaterial().obs;
  final focusedWellbeingTime = FocusedWellbeingTime().obs;
  final learnForFun = LearnForFun().obs;
  final inspireLivingTime = InspireLivingTime().obs;



  late YoutubePlayerController videoController;

  @override
  void onInit() {
    videoController = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      flags: const YoutubePlayerFlags(
          autoPlay: true, mute: false, hideControls: false),
    );
    super.onInit();
  }

  Future<void> watchTimeData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      focusedWellbeingTime.value = await VideoPlayerApiServices()
          .watchTimeData(videoId, spendTime.value);
      int point = focusedWellbeingTime.value.rewardPointsData!.rewardPoints;
      if (point > 0) {
        DashboardController().showAlertDialog(
            point, focusedWellbeingTime.value.rewardPointsData!.rewardMessage);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> skillHobbyTimeData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      learnForFun.value = await VideoPlayerApiServices()
          .skillHobbyTimeData(videoId, spendTime.value);
      int point = learnForFun.value.rewardPointsData!.rewardPoints;
      if (point > 0) {
        DashboardController().showAlertDialog(
            point, learnForFun.value.rewardPointsData!.rewardMessage);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> learningMaterialTimeData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      learningMaterial.value = await VideoPlayerApiServices()
          .learningMaterialTimeData(videoId, spendTime.value);
      int point = learningMaterial.value.rewardPointsData!.rewardPoints;
      if (point > 0) {
        DashboardController().showAlertDialog(
            point, learningMaterial.value.rewardPointsData!.rewardMessage);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> inspiredLivingData() async {
    isLoading(true);
    errorOccurred(false);
    try {
      inspireLivingTime.value = await VideoPlayerApiServices()
          .inspiredLivingTimeUpdate(videoId, spendTime.value);
      int point = inspireLivingTime.value.rewardPointsData!.rewardPoints;
      if (point > 0) {
        DashboardController().showAlertDialog(
            point, inspireLivingTime.value.rewardPointsData!.rewardMessage);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      spendTime.value++;
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    if (spendTime.value > 10) {
      switch (from) {
        case 'skill':
          skillHobbyTimeData();
          break;
        case 'learning':
          learningMaterialTimeData();
          break;
        case 'health':
          watchTimeData();
          break;
        case 'inspiredLiving':
          inspiredLivingData();
          break;
      }
    }
  }
}
