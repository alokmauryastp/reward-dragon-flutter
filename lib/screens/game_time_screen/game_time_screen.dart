import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/game_categories_card.dart';
import 'package:flutter_state_management/common/widgets/listview_game_category.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/game_time_screen/controller/game_time_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/widgets/top_border_radius_leaderboard.dart';

class GameTimeScreen extends GetWidget<GameTimeController> {
  const GameTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DashboardController dashboardController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const AppBarWithBackButton(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => LoadingAndErrorScreen(
              errorResolvingFunction: controller.onRefresh,
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      Stack(
                        children: [
                          const UserProfile(),
                          Positioned(
                              right: 0,
                              child: InkWell(
                                  onTap: () async {
                                    await FlutterShare.share(
                                        title: 'Share Via',
                                        text:
                                            'Hey, I’ve Won ${controller.winLeveLPoints.value.pointsWon} Reward Points through Reward Dragon@${dashboardController.user.companyName} and I am excited to see what’s next.');
                                  },
                                  child: SizedBox(
                                    // color: red,
                                    width: 60.w,
                                    height: 60.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/share.png',
                                          height: 24.w,
                                          width: 24.w,
                                          color: yellow,
                                        ),
                                        const Text(
                                          'Celebrate',
                                          style: TextStyle(color: yellow),
                                        )
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Container(
                        width: size.width,
                        height: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.w)),
                          gradient: const LinearGradient(
                            colors: [Color(0xff404040), Color(0xff010101)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Win Level',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              SvgPicture.asset(
                                'assets/images/level.svg',
                                height: 14.w,
                              ),
                              Text(
                                controller
                                    .winLeveLPoints.value.winLevel
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              const VerticalDivider(
                                color: white,
                              ),
                              Text(
                                'Points',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Image.asset(
                                'assets/images/coin.png',
                                height: 16.w,
                                width: 16.w,
                              ),
                              Text(
                                controller
                                    .winLeveLPoints.value.pointsWon
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0),
                            child: SvgPicture.asset(
                              'assets/images/game_remote.svg',
                              height: 12.w,
                              width: 12.w,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Popular Games",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      SizedBox(height: 40.w, child: const GameCategory()),
                      SizedBox(
                        height: 10.w,
                      ),
                      const GameCategoriesCards(),
                      SizedBox(
                        height: 10.w,
                      ),
                      const TopBorderWidget('Game Availability\nCountdown',
                          '(Next Available)', 'assets/images/image2.png'),
                      Container(
                        width: size.width,
                        height: 90.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff404040)),
                          color: const Color(0xff404040),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.w),
                              bottomRight: Radius.circular(10.w)),
                        ),
                        child: Center(
                          child: Text(
                            controller.availableTime.value,
                            style: TextStyle(
                                fontSize: 55.sp,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Container(
                        height: 75.w,
                        width: 405.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xffFFC016),
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff414141),
                              Color(0xff000000),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.gamePoint.value.totalPlayedGames
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Games played',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: VerticalDivider(
                                color: white,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.gamePoint.value.totalBonus
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Bonus Point',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
