import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/leaderboard_screen/controller/leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../common/widgets/top_border_radius_leaderboard.dart';
import '../dashboard_screen/controller/dashboard_controller.dart';

class Leaderboard extends GetWidget<LeaderboardController> {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LeaderboardController());
    final DashboardController homeController = Get.find();
    final Size size = MediaQuery.of(context).size;

    int getCurrentStep(points) {
      points = points == 0 ? 1 : points;
      var data = ((points * 100) / (controller.totalPoints.value == 0 ? 1 : controller.totalPoints.value)).toString();
      return int.parse(data.split('.').first);
    }

    int getCurrentStepForTeam(points) {
      var data = ((points * 100) / (controller.totalTeamPoints.value == 0 ? 1 :controller.totalTeamPoints.value )).toString();
      return int.parse(data.split('.').first);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const DashboardAppbar(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => LoadingAndErrorScreen(
              errorOccurred: controller.errorOccurred.value,
              isLoading: controller.isLoading.value,
              errorResolvingFunction: controller.onRefresh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Level',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Container(
                                height: 30.w,
                                width: 100.w,
                                // color: black,
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(20.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   width: 10.w,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0.w,
                                          bottom: 5.0.w,
                                          left: 10.w),
                                      child: SvgPicture.asset(
                                        'assets/images/level.svg',
                                        height: 18.w,
                                        width: 18.w,
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          controller
                                              .winLeveLPoints.value.winLevel
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () async {
                                await FlutterShare.share(
                                    title: 'Share Via',
                                    text:
                                        'Hey, I’ve Won ${controller.winLeveLPoints.value.pointsWon} Reward Points through Reward Dragon@${homeController.user.companyName} and I am excited to see what’s next.');
                              },
                              child: Image.asset(
                                'assets/images/share.png',
                                height: 24.w,
                                width: 24.w,
                                color: yellow,
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Points',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Container(
                                height: 30.w,
                                width: 100.w,
                                // color: black,
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(20.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   width: 10.w,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0.w, bottom: 5.0.w, left: 5.w),
                                      child: Image.asset(
                                        'assets/images/points.png',
                                        height: 18.w,
                                        width: 18.w,
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          controller
                                              .winLeveLPoints.value.pointsWon
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Visibility(visible: controller.user.roleId==3,
                        child: Container(
                          width: size.width * 1,
                          height: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [white, yellow],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: white,
                                style: const TextStyle(color: blackApp),
                                value: controller.selectedTeamIdForLeaderboard.value,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: black,
                                ),
                                items: controller.teamListRewardResource.value.data?.map((items) {
                                  return DropdownMenuItem(
                                    value: items.teamId,
                                    child: Text(
                                      items.teamName,
                                      style: const TextStyle(color: blackApp),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  controller.selectedTeamIdForLeaderboard.value = newValue!;
                                  controller.getTeamLeaderboardFilter();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        child: Stack(
                          children: [
                            Align(
                              child: SizedBox(
                                width: size.width * 0.70,
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Image.asset(
                                    'assets/images/star.png',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.width * 0.20),
                              child: Align(
                                alignment: Alignment.center,
                                child:
                                    Stack(clipBehavior: Clip.none, children: [
                                  CircleAvatar(
                                    radius: 62.w,
                                    backgroundColor: yellow,
                                    child: CircleAvatar(
                                      radius: 60.w,
                                      child:
                                          controller.teamPointsList.isNotEmpty
                                              ? ClipOval(
                                                  child: Image.network(
                                                    controller.teamPointsList
                                                        .first.userImage,
                                                    width: 120.w,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (a, b, c) =>
                                                        Image.asset(
                                                            'assets/images/logo.png'),
                                                  ),
                                                )
                                              : const SizedBox(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 48.w,
                                    // top: 96.w,
                                    top: -12.w,
                                    child: Image.asset(
                                      'assets/images/crown.png',
                                      height: 24.w,
                                      width: 24.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 56.w,
                                    top: 115.w,
                                    child: SvgPicture.asset(
                                      'assets/images/user1.svg',
                                      height: 14.w,
                                      width: 14.w,
                                    ),
                                  ),

                                  Positioned(
                                    top: 130.w,
                                    left: 0.w,
                                    right: 0.w,
                                    child: Text(
                                      controller.teamPointsList.isNotEmpty
                                          ? '${controller.teamPointsList.first.firstName} ${controller.teamPointsList.first.lastName}'
                                          : '',
                                      style: const TextStyle(
                                        color: white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Positioned(
                              left: 5.w,
                              top: 120.w,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 34.w,
                                    backgroundColor: yellow,
                                    child: CircleAvatar(
                                      radius: 32.w,
                                      child:
                                          controller.teamPointsList.length > 1
                                              ? ClipOval(
                                                  child: Image.network(
                                                    controller.teamPointsList[1]
                                                        .userImage,
                                                    fit: BoxFit.cover,
                                                    width: 64.w,
                                                    errorBuilder: (a, b, c) =>
                                                        Image.asset(
                                                            'assets/images/logo.png',
                                                            width: 32.w,
                                                            height: 32.w,
                                                            fit: BoxFit.fill),
                                                  ),
                                                )
                                              : const SizedBox(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 28.w,
                                    top: 59.w,
                                    child: SvgPicture.asset(
                                      'assets/images/user2.svg',
                                      height: 14.w,
                                      width: 14.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: 0.w,
                                    child: Text(
                                        controller.teamPointsList.length > 1
                                            ? '${controller.teamPointsList[1].firstName} ${controller.teamPointsList[1].lastName}'
                                            : '',
                                        style: const TextStyle(
                                          color: white,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5.w,
                              top: 120.w,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CircleAvatar(
                                    radius: 34.w,
                                    backgroundColor: yellow,
                                    child: CircleAvatar(
                                      radius: 32.w,
                                      child: CircleAvatar(
                                        radius: 32.w,
                                        child:
                                            controller.teamPointsList.length > 2
                                                ? ClipOval(
                                                    child: Image.network(
                                                      controller
                                                          .teamPointsList[2]
                                                          .userImage,
                                                      fit: BoxFit.cover,
                                                      width: 64.w,
                                                      errorBuilder: (a, b, c) =>
                                                          Image.asset(
                                                              'assets/images/logo.png',
                                                              width: 32.w,
                                                              height: 32.w,
                                                              fit: BoxFit.fill),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 59.w,
                                    left: 28.w,
                                    child: SvgPicture.asset(
                                      'assets/images/user3.svg',
                                      height: 14.w,
                                      width: 14.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: -10.w,
                                    child: Text(
                                        controller.teamPointsList.length > 2
                                            ? '${controller.teamPointsList[2].firstName} ${controller.teamPointsList[2].lastName}'
                                            : '',
                                        style: const TextStyle(
                                          color: white,
                                        )),
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
                      Container(
                        width: size.width * 1,
                        height: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [white, yellow],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: white,
                                  style: const TextStyle(color: blackApp),
                                  value: controller.topBottomValue.value,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: black,
                                  ),
                                  items:
                                      controller.topBottom.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(color: blackApp),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    controller.topBottomValue.value = newValue!;
                                    controller.getTeamLeaderboardFilter();
                                  },
                                ),
                              ),
                              const Spacer(),
                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  dropdownColor: white,
                                  style: const TextStyle(color: blackApp),
                                  value: controller.timePeriodValue.value,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: black,
                                  ),
                                  items:
                                      controller.timePeriod.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: const TextStyle(color: blackApp),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    controller.timePeriodValue.value =
                                        newValue!;
                                    controller.getTeamLeaderboardFilter();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      controller.teamPointsList.isNotEmpty ?
                      ListView.builder(
                          itemCount: controller.teamPointsList.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.none,
                              elevation: 0.w,
                              color: blackApp,
                              child: Container(
                                padding: EdgeInsets.zero,
                                width: size.width * 1,
                                height: 35.w,
                                // color: blackApp,
                                decoration: BoxDecoration(
                                  gradient: blackGradient,
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              controller.teamPointsList[index]
                                                  .userImage,
                                              width: 26.w,
                                              fit: BoxFit.cover,
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
                                        style: const TextStyle(color: white),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller
                                            .teamPointsList[index].earnedPoint
                                            .toString(),
                                        style: const TextStyle(color: white),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }) : Center(
                        // width: 200.w,
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
                      const Divider(
                        color: white,
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/open_inverted.svg'),
                            // ignore: prefer_const_constructors
                            Text(
                              controller.motivationalMessage.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: white, fontSize: 18.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 180.w),
                                SvgPicture.asset(
                                    'assets/images/close_inverted.svg'),
                              ],
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ),
                      Visibility(visible: controller.user.roleId!=3,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (controller.user.roleId == 1) {
                                  Get.toNamed(ApplicationPages.myChallengeScreen);
                                } else {
                                  Get.toNamed(ApplicationPages.teamChallengeScreen,
                                      arguments: false);
                                }
                              },
                              child: const TopBorderWidget(
                                  'Latest\nChallenge',
                                  '(Click to view & accept)',
                                  'assets/images/image1.png'),
                            ),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Text(
                                    '(Challenge timer)',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.challengeTime.value,
                                      style: TextStyle(
                                          fontSize: 55.sp,
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
                                colors: [Color(0xff404040), Color(0xff010101)],
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              '(Game timer)',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                controller.availableTime.value,
                                style: TextStyle(
                                    fontSize: 55.sp,
                                    fontWeight: FontWeight.w400,
                                    color: white),
                              ),
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
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Rewards Sources",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          const Spacer(),
                          Visibility(visible: controller.user.roleId== 3 && controller.userType.value== 2 ,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: blackApp,
                                value: controller.selectedTeamId.value,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: white,
                                  size: 12.w,
                                ),
                                items: controller
                                    .teamListRewardResource
                                    .value
                                    .data
                                    ?.map((item) {
                                  return DropdownMenuItem(
                                    value: item.teamId,
                                    child: Text(
                                      item.teamName,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight:
                                          FontWeight
                                              .w400,
                                          color: yellow),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  controller.selectedTeamId.value = newValue!;
                                  controller.getTeamPointData(controller.selectedTeamId.value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          Visibility(
                            visible: controller.userType.value == 1,
                            child: InkWell(
                              onTap: () {
                                showDatePicker(
                                        cancelText: 'CLEAR',
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().year - 10),
                                        lastDate:
                                            DateTime(DateTime.now().year + 10))
                                    .then((pickedDate) {
                                  controller.selectedDate.value = pickedDate ==
                                          null
                                      ? ""
                                      : pickedDate.toString().substring(0, 10);
                                  if (controller.user.roleId == 1) {
                                    controller.customerRewardResources();
                                  } else {
                                    controller.managerRewardResources();
                                  }
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Filter ',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/filter.svg',
                                    height: 12.w,
                                    width: 12.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: yellow,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => yellow),
                            value: 1,
                            toggleable: true,
                            onChanged: (int? value) {
                              controller.userType.value = value!;
                            },
                            groupValue: controller.userType.value,
                          ),
                          const Text(
                            'You',
                            style: TextStyle(color: white),
                          ),
                          Radio(
                            activeColor: yellow,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => yellow),
                            value: 2,
                            toggleable: true,
                            onChanged: (int? value) {
                              controller.userType.value = value!;
                            },
                            groupValue: controller.userType.value,
                          ),
                          const Text(
                            'Team',
                            style: TextStyle(color: white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      controller.userType.value == 1
                          ? controller.user.roleId == 1
                              ?
                              //user reward resources
                              Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total Points',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.totalPoints.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: 100,
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff007220)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Usage Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.usageRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .usageRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffDAF6FF),
                                              Color(0xff05D1D1)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Challenge & Campaign Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller
                                                  .customerRewardResource
                                                  .value
                                                  .challengeAndCampaignRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .challengeAndCampaignRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFCAFB),
                                              Color(0xff9C0893)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Game Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.gameRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .gameRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFDCDE),
                                              Color(0xffEA000E)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Mood Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.moodRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .moodRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFE8EA),
                                              Color(0xff8523FF)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Wellbeing Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.wellbeingRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .wellbeingRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffE7F9FF),
                                              Color(0xff0AA3D5)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Redemption Cashback',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller
                                                  .customerRewardResource
                                                  .value
                                                  .redemptionCashbackRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .redemptionCashbackRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff0A12D5)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Leaderboard Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.leaderboardRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .leaderboardRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFF8F0),
                                              Color(0xffFFC000)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'KPI Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.kpiRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .kpiRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xffEA000E)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Milestone Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource
                                                  .value.milestoneRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .customerRewardResource
                                                  .value
                                                  .milestoneRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xff3F3F3F),
                                              Color(0xff000000)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Additional Bonus',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.customerRewardResource.value
                                                  .nonAppRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStepForTeam(
                                              controller.customerRewardResource.value
                                                  .nonAppRewardsPoint ??
                                                  0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff8523FF)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                  ],
                                )
                              :
                              //manager reward resources
                              Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total Points',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.totalPoints.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0.0,
                                          totalSteps: 100,
                                          currentStep: 99,
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff007220)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Usage Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource
                                                  .value.usageRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .usageRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffDAF6FF),
                                              Color(0xff05D1D1)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Game Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource
                                                  .value.gameRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .gameRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFDCDE),
                                              Color(0xffEA000E)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Mood Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource
                                                  .value.moodRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .moodRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffFFE8EA),
                                              Color(0xff8523FF)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Wellbeing Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource
                                                  .value.wellbeingRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .wellbeingRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xffE7F9FF),
                                              Color(0xff0AA3D5)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Visibility(visible: controller.user.roleId!=3,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 15.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'KPI Rewards',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        color: white,
                                                        fontSize: 16.sp),
                                                  ),
                                                  const Spacer(),
                                                  SvgPicture.asset(
                                                    'assets/images/point_layer.svg',
                                                    height: 12.w,
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Text(
                                                    controller.managerRewardResource
                                                        .value.kpiRewardsPoint
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        color: white,
                                                        fontSize: 16.sp),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.w,
                                              ),
                                              StepProgressIndicator(
                                                padding: 0,
                                                totalSteps: 100,
                                                currentStep: getCurrentStep(controller
                                                    .managerRewardResource
                                                    .value
                                                    .kpiRewardsPoint ??
                                                    0),
                                                size: 35.w,
                                                unselectedColor: Colors.grey,
                                                roundedEdges: Radius.circular(5.w),
                                                selectedGradientColor:
                                                const LinearGradient(
                                                  stops: [0.05, 0.95],
                                                  begin: Alignment.topRight,
                                                  colors: [
                                                    white,
                                                    Color(0xffEA000E)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Redemption Cashback',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller
                                                  .managerRewardResource
                                                  .value
                                                  .redemptionCashbackRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .redemptionCashbackRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff0A12D5)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Milestone Rewards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource
                                                  .value.milestoneRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(controller
                                                  .managerRewardResource
                                                  .value
                                                  .milestoneRewardsPoint ??
                                              0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                              const LinearGradient(
                                                stops: [0.05, 0.95],
                                                begin: Alignment.topRight,
                                            colors: [
                                              Color(0xff3F3F3F),
                                              Color(0xff000000)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Additional Bonus',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/images/point_layer.svg',
                                              height: 12.w,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              controller.managerRewardResource.value
                                                  .nonAppRewardsPoint
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        StepProgressIndicator(
                                          padding: 0,
                                          totalSteps: 100,
                                          currentStep: getCurrentStep(
                                              controller.managerRewardResource.value
                                                  .nonAppRewardsPoint ??
                                                  0),
                                          size: 35.w,
                                          unselectedColor: Colors.grey,
                                          roundedEdges: Radius.circular(5.w),
                                          selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                            colors: [
                                              white,
                                              Color(0xff8523FF)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                  ],
                                )
                          :
                          //team reward resources
                          Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Points',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.totalTeamPoints.value
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps:100,
                                      currentStep: controller.totalTeamPoints.value == 0 ? 0 :  100,
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          white,
                                          Color(0xff007220)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Usage Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .usageRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam( controller.teamRewardResource.value.usageRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xffDAF6FF),
                                          Color(0xff05D1D1)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Challenge & Campaign Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .challengeAndCampaignRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(controller
                                              .teamRewardResource
                                              .value
                                              .challengeAndCampaignRewardsPoint ??
                                          0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xffFFCAFB),
                                          Color(0xff9C0893)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Game Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .gameRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .gameRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xffFFDCDE),
                                          Color(0xffEA000E)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Mood Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .moodRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .moodRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xffFFE8EA),
                                          Color(0xff8523FF)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Wellbeing Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .wellbeingRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .wellbeingRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                        stops: [0.05, 0.95],
                                        begin: Alignment.topRight,
                                        // end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xffE7F9FF),
                                          Color(0xff0AA3D5)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Redemption Cashback',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .redemptionCashbackRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(controller
                                              .teamRewardResource
                                              .value
                                              .redemptionCashbackRewardsPoint ??
                                          0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          white,
                                          Color(0xff0A12D5)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Leaderboard Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .leaderboardRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .leaderboardRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xffFFF8F0),
                                          Color(0xffFFC000)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'KPI Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .kpiRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .kpiRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          white,
                                          Color(0xffEA000E)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Milestone Rewards',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .milestoneRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .milestoneRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          Color(0xff3F3F3F),
                                          Color(0xff000000)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Additional Bonus',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/point_layer.svg',
                                          height: 12.w,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          controller.teamRewardResource.value
                                              .nonAppRewardsPoint
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: white,
                                              fontSize: 16.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.w,
                                    ),
                                    StepProgressIndicator(
                                      padding: 0,
                                      totalSteps: 100,
                                      currentStep: getCurrentStepForTeam(
                                          controller.teamRewardResource.value
                                                  .nonAppRewardsPoint ??
                                              0),
                                      size: 35.w,
                                      unselectedColor: Colors.grey,
                                      roundedEdges: Radius.circular(5.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                            stops: [0.05, 0.95],
                                            begin: Alignment.topRight,
                                        colors: [
                                          white,
                                          Color(0xff8523FF)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                              ],
                            ),
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
