import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/play_game/controller/play_game_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common/widgets/app_bar_with_back_button.dart';

class PlayGameScreen extends GetWidget<PlayGameController> {
  const PlayGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: const AppBarWithBackButton(),
          body: Obx(() => Stack(
            children: [
              WebView(
                initialUrl: controller.gameUrl,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              Positioned(
                  top: 5.w,
                  right: 5.w,
                  child: Row(
                    children: [Text('Game End : ${controller.gameEndTime.value}')],
                  )),
            ],
          ),)),
    );
  }
}
