import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/user_home_screen/controller/user_home_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'controller/my_performance_controller.dart';

class MyPerformanceScreen extends GetWidget<MyPerformanceController> {
  const MyPerformanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DashboardController dashboardController = Get.find();
    final UserHomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Obx(() => LoadingAndErrorScreen(
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
                      Center(
                        child: ClipOval(
                          child: Image.network(
                            height: 100.w,
                            width: 100.w,
                            dashboardController.user.avatarImage,
                            fit: BoxFit.cover,
                            errorBuilder: (a, b, c) => Image.asset(
                              'assets/images/myAccount_dragon_logo.png',
                              width: 50.w,
                              height: 50.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Center(
                        child: Text(
                          '${dashboardController.user.firstName} ${dashboardController.user.lastName}',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Center(
                        child: Text(
                          '+91 ${dashboardController.user.mobileNo}',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff414141),
                                Color(0xff000000),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.w),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 4, 0),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ],
                          ),
                          child: SizedBox(
                            height: 28.w,
                            width: 112.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                side: const BorderSide(color: yellowApp),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  dashboardController.user.designation,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
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
                            "My Performance Summary",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 10.w),
                          const Spacer(),
                          InkWell(
                            onTap: () async {
                              showDateRangePicker(
                                      context: context,
                                      cancelText: 'Clear Filter',
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025))
                                  .then((pickedDate) {
                                controller.fromDate.value = pickedDate?.start
                                        .toString()
                                        .substring(0, 10) ??
                                    "";
                                controller.toDate.value = pickedDate?.end
                                        .toString()
                                        .substring(0, 10) ??
                                    "";
                                controller.getKpiPerformanceData();
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(
                                  'assets/images/filter.svg',
                                  height: 12.w,
                                  width: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width,
                        height: 80.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Overall\nPerformance',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                            const Spacer(),
                            CircularPercentIndicator(
                              radius: 30.w,
                              lineWidth: 6.w,
                              animation: true,
                              percent: controller.kpiPerformanceData.value
                                          .totalKpiPercentData !=
                                      null
                                  ? controller.kpiPerformanceData.value
                                          .totalKpiPercentData! /
                                      100
                                  : 0,
                              center: Text(
                                "${controller.kpiPerformanceData.value.totalKpiPercentData != null ? controller.kpiPerformanceData.value.totalKpiPercentData?.toInt() : 0}%",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    color: white),
                              ),
                              progressColor: const Color(0xff02AC09),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Container(
                        height: 60.w,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
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
                                blurRadius: 5) //blur radius of shadow
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    homeController
                                        .kpiDataModel.value.totalKpiMet
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'KPI\'s Met',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    homeController
                                        .kpiDataModel.value.totalKpiWip
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'KPI\'s WIP',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Container(
                        // height: 300.w,
                        width: size.width,
                        padding: const EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
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
                        child: ListView.builder(
                          itemCount: controller.kpiPerformanceData.value
                                      .kpiPercentData !=
                                  null
                              ? controller.kpiPerformanceData.value
                                  .kpiPercentData?.length
                              : 0,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) => Padding(
                                padding: EdgeInsets.only(
                                    top: 10.w, right: 10.w, left: 10.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 25.w,
                                      lineWidth: 3.w,
                                      animation: true,
                                      percent: controller.kpiPerformanceData
                                                  .value.kpiPercentData !=
                                              null
                                          ? controller
                                                  .kpiPerformanceData
                                                  .value
                                                  .kpiPercentData![index]
                                                  .kpiPercent /
                                              100
                                          : 0,
                                      center: Text(
                                        "${controller.kpiPerformanceData.value.kpiPercentData != null ? controller.kpiPerformanceData.value.kpiPercentData![index].kpiPercent.toInt() : 0}%",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: white),
                                      ),
                                      progressColor: const Color(0xff02AC09),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    FittedBox(
                                      child: SizedBox(
                                        // width: 210.w,
                                        height: 50.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 2.w,
                                            ),
                                            Text(
                                              controller
                                                  .kpiPerformanceData
                                                  .value
                                                  .kpiPercentData![index]
                                                  .kpiName,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                            SizedBox(
                                              height: 4.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Center(
                        child: Text(
                          'Data Last refreshed on ${controller.currentDateTime.value}',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Center(
                        child: Text(
                          'Target reset date: ${controller.currentDateTime.value}',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 10.w),
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
                            "My Leaderboard",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 10.w),
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
                        height: 50.w,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
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
                                blurRadius: 5) //blur radius of shadow
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.winLeveLPoints.value.winLevel
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xffFFC000),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Win Level',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            VerticalDivider(
                              thickness: 1.w,
                              endIndent: 5.w,
                              indent: 5.w,
                              color: Colors.grey,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.winLeveLPoints.value.pointsWon
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xffFFC000),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Points Won',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff414141),
                                    Color(0xff000000),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10.w),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 4, 0), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ],
                              ),
                              child: SizedBox(
                                height: 50.w,
                                // width: 145.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                    side: const BorderSide(
                                        color: Color(0xffFFC016)),
                                  ),
                                  onPressed: (() {
                                    Get.toNamed(
                                        ApplicationPages.myChallengeScreen);
                                  }),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/latest_challenge.png',
                                        width: 22.w,
                                        height: 22.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        ' Latest\nChallenge',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff414141),
                                    Color(0xff000000),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10.w),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 4, 0), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ],
                              ),
                              child: SizedBox(
                                height: 50.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.w)),
                                    side: const BorderSide(
                                        color: Color(0xffFFC016)),
                                  ),
                                  onPressed: (() {
                                    Get.toNamed(
                                        ApplicationPages.myCampaignScreen);
                                  }),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Image.asset(
                                        'assets/images/my_campaign.png',
                                        height: 22.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'My\nCampaigns',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
              ),
            )),
      ),
    );
  }
}
