import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../common/screens/loading_and_error_screen.dart';
import 'controller/manager_home_controller.dart';

class ManagerHomeScreen extends GetWidget<ManagerHomeController> {
  const ManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManagerHomeController());
    final Size size = MediaQuery.of(context).size;
    final DashboardController dashboardController = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const DashboardAppbar(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => LoadingAndErrorScreen(
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.onRefresh,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Hello, ',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: dashboardController.user.firstName,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                'assets/images/wave_hand.svg',
                                height: 16.w,
                                width: 16.w,
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: 26.w,
                                backgroundColor: yellow,
                                child: CircleAvatar(
                                  radius: 25.w,
                                  child: ClipOval(
                                    child: Image.network(
                                      height: 50.w,
                                      width: 50.w,
                                      dashboardController.user.avatarImage,
                                      fit: BoxFit.cover,
                                      errorBuilder: (a, b, c) => Image.asset(
                                        'assets/images/logo.png',
                                        width: 50.w,
                                        height: 50.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.w,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(ApplicationPages.rewardScreen),
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/detail_background.png'),
                                Positioned(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.w, top: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 22.w,
                                            width: 22.w,
                                            child: Image.asset(
                                              'assets/images/medal.png',
                                              fit: BoxFit.cover,
                                            )),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'Rewards',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 38.w,
                                  right: 10.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 22.w,
                                        width: 22.w,
                                        child: Image.asset(
                                          'assets/images/win_level.png',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Win level: ',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: controller
                                                  .winLeveLPoints.value.winLevel
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 18.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 65.w,
                                  right: 10.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 22.w,
                                          width: 22.w,
                                          child: Image.asset(
                                            'assets/images/point_won.png',
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Points Won: ',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: controller.winLeveLPoints
                                                  .value.pointsWon
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 18.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(ApplicationPages.leaderboardScreen),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/level.svg',
                                  height: 12.w,
                                  width: 12.w,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Team',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                    TextSpan(
                                      text: ' Leaderboard',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: yellow),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: white,
                          ),
                          controller.teamPointsList.isNotEmpty
                              ? ListView.builder(
                                  itemCount:
                                      controller.teamPointsList.length > 5
                                          ? controller.teamPointsList
                                              .sublist(0, 5)
                                              .length
                                          : controller.teamPointsList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      clipBehavior: Clip.none,
                                      elevation: 0.w,
                                      color: blackApp,
                                      child: Container(
                                        // clipBehavior: Clip.none,
                                        padding: EdgeInsets.zero,
                                        width: size.width * 1,
                                        height: 35.w,
                                        decoration: BoxDecoration(
                                          gradient: blackGradient,
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 13.w,
                                                backgroundColor: yellow,
                                                child: CircleAvatar(
                                                  backgroundColor: blackApp,
                                                  radius: 12.w,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                      controller
                                                          .teamPointsList[index]
                                                          .userImage,
                                                      fit: BoxFit.cover,
                                                      width: 500.w,
                                                      errorBuilder: (a, b, c) =>
                                                          Image.asset(
                                                              'assets/images/logo.png'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                '${controller.teamPointsList[index].firstName} ${controller.teamPointsList[index].lastName}',
                                                style: const TextStyle(
                                                    color: white),
                                              ),
                                              const Spacer(),
                                              Text(
                                                controller.teamPointsList[index]
                                                    .earnedPoint
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/no_challenge.png',
                                        height: 50.w,
                                      ),
                                      SizedBox(
                                        height: 5.w,
                                      ),
                                      Text(
                                        'No Data Available!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  )),
                          SizedBox(
                            height: 10.w,
                          ),
                          Visibility(
                            visible: controller.teamPointsList.isNotEmpty,
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                  ApplicationPages.leaderboardScreen),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: 12.w,
                                    child: Container(
                                      width: size.width,
                                      height: 1.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 25.w,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          gradient: blackGradient,
                                          border: Border.all(
                                            color: yellow,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.w)),
                                      child: Center(
                                          child: Text(
                                        'View all',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: yellow),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: dashboardController.user.roleId == 2,
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                  ApplicationPages.teamPerformanceScreen),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/speed.svg',
                                        height: 12.w,
                                        width: 12.w,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'Team',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: white),
                                          ),
                                          TextSpan(
                                            text: ' Performance',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: yellow),
                                          ),
                                        ]),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                        'assets/images/clock.svg',
                                        height: 12.w,
                                        width: 12.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: dashboardController.daysToGoo,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: const Color(0xffFF0000),
                                              fontWeight: FontWeight.w700),
                                          children: [
                                            TextSpan(
                                              text: ' Days to go',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Container(
                                    height: 70.w,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      border: Border.all(color: yellow),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff414141),
                                          Color(0xff000000),
                                        ],
                                      ),
                                      boxShadow: const <BoxShadow>[
                                        BoxShadow(
                                            color: Color.fromRGBO(0, 0, 4, 0),
                                            //shadow for button
                                            blurRadius: 5)
                                        //blur radius of shadow
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.w, vertical: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.kpiDataModel.value
                                                    .managerKpiMetData
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    color:
                                                        const Color(0xffFFC000),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'KPI’s Met',
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              )
                                            ],
                                          ),
                                          const VerticalDivider(
                                            color: Colors.white,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.kpiDataModel.value
                                                    .totalKpiWip
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    color:
                                                        const Color(0xffFFC000),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'KPI’s WIP',
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            height: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(color: yellow),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff414141),
                                  Color(0xff000000),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.w,
                                      ),
                                      Image.asset(
                                        'assets/images/satisfied.png',
                                        height: 50.w,
                                      ),
                                      SizedBox(
                                        height: 15.w,
                                      ),
                                      Text(
                                        'Josh For\n  Today',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => Get.toNamed(
                                        ApplicationPages.teamMoodScreen),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Container(
                                          height: 100.w,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.w),
                                            border: Border.all(color: yellow),
                                            gradient: yellowGradient,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Text(
                                                controller.teamMoodText.value,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Image.asset(
                                                controller.teamMoodImage.value,
                                                height: 50.w,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  InkWell(
                                    onTap: () => Get.toNamed(
                                        ApplicationPages.myJoshScreen),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Me',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Container(
                                          height: 100.w,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.w),
                                            border: Border.all(color: yellow),
                                            gradient: okayMoodGradient,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Text(
                                                controller.myMoodText.value,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Image.asset(
                                                controller.myMoodImage.value,
                                                height: 50.w,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
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
                                  'assets/images/speed.svg',
                                  height: 12.w,
                                  width: 12.w,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Wellbeing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffFFFFFF)),
                              ),
                              SizedBox(width: 5.w),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.w),
                                  child: Container(
                                    color: white,
                                    height: 0.5.w,
                                    width: size.width,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              border: Border.all(color: yellow),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff414141),
                                  Color(0xff000000),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.w,
                                      ),
                                      Text(
                                        'Overall Wellness\nscore',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white,
                                        ),
                                      ),
                                      SizedBox(height: 15.w),
                                      Text(
                                        '(Stay motivated)',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => Get.toNamed(ApplicationPages
                                        .managerWellbeingScreen),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 32.w,
                                          lineWidth: 5.w,
                                          animation: true,
                                          // percent: (controller.teamWellbeingList
                                          //             .value.wellbeingPercent
                                          //             ?.toDouble() ??
                                          //         0) /
                                          //     100,
                                          percent: (controller
                                                          .teamWellbeingList
                                                          .value
                                                          .wellbeingPercent ??
                                                      0) >
                                                  99
                                              ? 1.0
                                              : (controller
                                                          .teamWellbeingList
                                                          .value
                                                          .wellbeingPercent ??
                                                      0) /
                                                  100,
                                          center: Text(
                                            "${controller.teamWellbeingList.value.wellbeingPercent?.toInt()}%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: white),
                                          ),
                                          progressColor: (controller
                                                          .teamWellbeingList
                                                          .value
                                                          .wellbeingPercent
                                                          ?.toInt() ??
                                                      0) >
                                                  50
                                              ? green
                                              : orangeChart,
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Text(
                                          'Team',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  InkWell(
                                    onTap: () => Get.toNamed(
                                        ApplicationPages.wellbeingScreen),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 32.w,
                                          lineWidth: 5.w,
                                          animation: true,
                                          percent: ((controller.wellBeingList
                                                      .value.wellbeingPercent ??
                                                  0) /
                                              100),
                                          center: Text(
                                            "${controller.wellBeingList.value.wellbeingPercent?.toInt()}%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                color: white),
                                          ),
                                          progressColor: (controller
                                                          .wellBeingList
                                                          .value
                                                          .wellbeingPercent ??
                                                      0) >
                                                  50
                                              ? green
                                              : orangeChart,
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Text(
                                          'Me',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(ApplicationPages.myGameTimeScreen),
                            child: Container(
                              height: 100.w,
                              width: size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: yellow),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff404040),
                                      Color(0xff010101)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.w),
                                    topRight: Radius.circular(10.w)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 10.w,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 35.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Game Time',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: white),
                                          ),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '(Click to Play)',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/images/image2.png',
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: dashboardController.user.roleId == 2,
                            child: Column(
                              children: [
                                SizedBox(height: 10.w),
                                Container(
                                  height: 85.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    border: Border.all(color: yellow),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff414141),
                                        Color(0xff000000),
                                      ],
                                    ),
                                  ),
                                  child: Row(children: [
                                    Expanded(
                                      flex: 2,
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                            ApplicationPages
                                                .teamChallengeScreen,
                                            arguments: false),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/team_challenge_arrow.svg',
                                                  height: 14.w,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  'Team Challenge',
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: white),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '(Create / Review your challenges)',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () => Get.toNamed(
                                            ApplicationPages
                                                .teamChallengeScreen,
                                            arguments: true),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add_circle_outline_rounded,
                                              color: yellow,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Add new',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 10.w),
                                Container(
                                  height: 85.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    border: Border.all(color: yellow),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: InkWell(
                                            onTap: () => Get.toNamed(
                                                ApplicationPages
                                                    .teamCampaignScreen,
                                                arguments: false),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/images/team_campaign_tick.svg',
                                                      height: 14.w,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      'Team Campaign',
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: white),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '(Create / Review your campaign)',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () => Get.toNamed(
                                                ApplicationPages
                                                    .teamCampaignScreen,
                                                arguments: true),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: yellow,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Add new',
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/reward_star.svg',
                                height: 14.w,
                                width: 14.w,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: ' Hot Reward',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: ' Offers',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          color: yellow),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/images/coins.svg'),
                              RichText(
                                text: TextSpan(
                                  text: ' Point',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: ' Balance ',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: yellow),
                                    ),
                                    TextSpan(
                                      text: controller.pointBalance.value,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff02AC09)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            controller.voucherModel.value.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 100.w,
                            child: InkWell(
                              onTap: () {
                                DashboardController().openDialogForVoucher(
                                    controller.voucherModel.value.data![index],
                                    size.width,
                                    controller.pointBalanceForRedeem.value);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.w),
                                      child: Image.network(
                                        controller.voucherModel.value.data !=
                                                null
                                            ? controller.voucherModel.value
                                                .data![index].image
                                            : "",
                                        fit: BoxFit.cover,
                                        errorBuilder: (a, b, c) => Image.asset(
                                            'assets/images/logo.png'),
                                      ),
                                    ),
                                    Positioned(
                                      height: 15.w,
                                      width: 15.w,
                                      top: 5.w,
                                      right: 5.w,
                                      child: InkWell(
                                        onTap: () {
                                          if (controller
                                                  .voucherModel
                                                  .value
                                                  .data![index]
                                                  .isAddedWishlist
                                                  .value ==
                                              0) {
                                            controller
                                                .voucherModel
                                                .value
                                                .data![index]
                                                .isAddedWishlist
                                                .value = 1;
                                            controller.addToWishlist(controller
                                                .voucherModel
                                                .value
                                                .data![index]
                                                .productVoucherId);
                                          } else {
                                            controller
                                                .voucherModel
                                                .value
                                                .data![index]
                                                .isAddedWishlist
                                                .value = 0;
                                            controller.removeWishlist(controller
                                                .voucherModel
                                                .value
                                                .data![index]
                                                .productVoucherId);
                                          }
                                        },
                                        child: SvgPicture.asset(
                                          "assets/images/wishlist.svg",
                                          color: controller
                                                      .voucherModel
                                                      .value
                                                      .data![index]
                                                      .isAddedWishlist
                                                      .value ==
                                                  0
                                              ? white
                                              : yellowApp,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
