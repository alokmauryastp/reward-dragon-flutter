import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'widgets/top_three_members.dart';
import 'widgets/manager_wellbeing_list.dart';
import 'controller/manager_wellbeing_controller.dart';

class ManagerWellbeingScreen extends GetWidget<ManagerWellbeingController> {
  const ManagerWellbeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const AppBarWithBackButton(),
        body: RefreshIndicator(onRefresh: controller.onRefresh,
          child: Obx(()=>LoadingAndErrorScreen(
            errorOccurred: controller.errorOccurred.value,
            isLoading: controller.isLoading.value,
            errorResolvingFunction: controller.onRefresh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.w,
                    ),
                    Container(
                      height: 100.w,
                      width: size.width,
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
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 4, 0), blurRadius: 5),
                        ],
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overall Team\nWellbeing score',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${controller.teamWellbeingList.value.wellbeingPercent?.toInt()}%',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.w,
                            ),
                            StepProgressIndicator(
                              padding: 0,
                              totalSteps: 100,
                              currentStep: controller.teamWellbeingList.value.wellbeingPercent?.toInt()??0,
                              size: 15.w,
                              unselectedColor: white,
                              roundedEdges: Radius.circular(10.w),
                              selectedGradientColor: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff007220), Color(0xff57FF09)],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        height: 30.w,
                        width: size.width,
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: blackApp,
                              style: TextStyle(
                                  color: yellow,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              value: controller.timeDropdownValue.value,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: white,
                                size: 14.w,
                              ),
                              items:
                              controller.timePeriod.map((String time) {
                                return DropdownMenuItem(
                                  value: time,
                                  child: Text(time),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                controller.timeDropdownValue.value = newValue.toString();
                                controller.teamWellBeingList();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                height: 131.w,
                                width: 181.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0.w),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/card_blue.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 54.w,
                                left: 8.w,
                                child: Image.asset(
                                  'assets/images/blue_cut_big.png',
                                  height: 68.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                child: Image.asset(
                                  'assets/images/blue_cut_big.png',
                                  height: 54.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 75.w,
                                left: -8.w,
                                child: Image.asset(
                                  'assets/images/blue_cut_big.png',
                                  height: 44.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                left: 108.w,
                                top: 14.w,
                                child: SvgPicture.asset(
                                  'assets/images/steps.svg',
                                  width: 21.w,
                                  height: 24.w,
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 12.w,
                                child: Text(
                                  'Body',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 34.w,
                                child: Text(
                                  'Steps Taken',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 66.w,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.teamWellbeingList.value.stepsCount.toString(),
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        ' Steps',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 131.w,
                                width: 171.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0.w),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/card_pink.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 54.w,
                                left: 8.w,
                                child: Image.asset(
                                  'assets/images/pink_card_big.png',
                                  height: 68.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                child: Image.asset(
                                  'assets/images/pink_card_big.png',
                                  height: 54.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 75.w,
                                left: -8.w,
                                child: Image.asset(
                                  'assets/images/pink_card_big.png',
                                  height: 44.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                left: 100.w,
                                top: 14.w,
                                child: SvgPicture.asset(
                                  'assets/images/meditation.svg',
                                  width: 42.w,
                                  height: 30.w,
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 12.w,
                                child: Text(
                                  'Mind',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 34.w,
                                child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 66.w,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.teamWellbeingList.value.meditationHours.toString(),
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Mins',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                height: 131.w,
                                width: 181.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0.w),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/card_orange.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 54.w,
                                left: 8.w,
                                child: Image.asset(
                                  'assets/images/red_card_big.png',
                                  height: 68.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                child: Image.asset(
                                  'assets/images/red_card_big.png',
                                  height: 54.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 75.w,
                                left: -8.w,
                                child: Image.asset(
                                  'assets/images/red_card_big.png',
                                  height: 44.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                left: 110.w,
                                top: 20.w,
                                child: SvgPicture.asset(
                                  'assets/images/learning.svg',
                                  width: 29.w,
                                  height: 30.w,
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 12.w,
                                child: Text(
                                  'Soul',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 34.w,
                                child: Text(
                                  'Learning Hrs.',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 66.w,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.teamWellbeingList.value.learningHours.toString(),
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Mins',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: 131.w,
                                width: 171.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0.w),
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/images/card_purple.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 54.w,
                                left: 8.w,
                                child: Image.asset(
                                  'assets/images/purple_card_big.png',
                                  height: 68.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                child: Image.asset(
                                  'assets/images/purple_card_big.png',
                                  height: 54.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                top: 75.w,
                                left: -8.w,
                                child: Image.asset(
                                  'assets/images/purple_card_big.png',
                                  height: 44.77.w,
                                  width: 90.46.w,
                                ),
                              ),
                              Positioned(
                                left: 110.w,
                                top: 18.w,
                                child: SvgPicture.asset(
                                  'assets/images/heart_soul.svg',
                                  width: 29.w,
                                  height: 26.w,
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 12.w,
                                child: Text(
                                  'Heart',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 28.w,
                                child: Text(
                                  'Points',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                              ),
                              Positioned(
                                left: 14.w,
                                top: 66.w,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.teamWellbeingList.value.heartPointsCount.toString(),
                                      style: TextStyle(
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        '.pts',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: white),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.w),
                          child: SvgPicture.asset(
                            'assets/images/top_three_members.svg',
                            height: 14.w,
                            width: 14.w,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Top 3 Team Members',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Container(
                              color: white,
                              width: size.width,
                              height: 0.5.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      controller: controller.tabController,
                      indicatorColor: white,
                      tabs: <Widget>[
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/body_tab.png',
                                width: 19.w,
                                height: 16.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/Body.png',
                                  width: 29.w,
                                  height: 26.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Mind.png',
                                width: 19.w,
                                height: 16.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/Mind_text.png',
                                  width: 29.w,
                                  height: 26.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Soul.png',
                                width: 19.w,
                                height: 16.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/Soul_text.png',
                                  width: 29.w,
                                  height: 26.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Heart.png',
                                width: 19.w,
                                height: 16.w,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/Heart_text.png',
                                  width: 29.w,
                                  height: 26.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 210.w,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          TopThreeMembers(controller.teamWellbeingTopThreeList.value.topThreeStepsLists),
                          TopThreeMembers(controller.teamWellbeingTopThreeList.value.topThreeMeditationLists),
                          TopThreeMembers(controller.teamWellbeingTopThreeList.value.topThreeLearningLists),
                          TopThreeMembers(controller.teamWellbeingTopThreeList.value.topThreeHeartLists),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.w),
                          child: SvgPicture.asset(
                            'assets/images/Wellbeing_average.svg',
                            height: 14.w,
                            width: 14.w,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Team WellBeing',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.w),
                          child: Text(
                            ' (Average)',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 6.w),
                            child: Container(
                              color: white,
                              width: size.width,
                              height: 0.5.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox( child: ManagerWellbeingList(controller.teamWellbeingList.value.individualTeamWellbeingPercentLists)),
                  ],
                ),
              ),
            ),
          ))
        ),
      ),
    );
  }
}
