import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../common/widgets/app_bar_with_back_button.dart';
import 'controller/video_player_controller.dart';

class VideoPlayerScreen extends GetWidget<VideoPlayerController> {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            controller.isFullScreen.value ? null : const AppBarWithBackButton(),
        body: YoutubePlayerBuilder(
            onEnterFullScreen: () {
              controller.isFullScreen.value = true;
            },
            onExitFullScreen: () {
              controller.isFullScreen.value = false;
            },
            player: YoutubePlayer(
              controller: controller.videoController,
              onReady: () {
                controller.startTimer();
              },
            ),
            builder: (context, player) {
              return Column(children: [player]);
            }),
      ),
    );
  }
}
