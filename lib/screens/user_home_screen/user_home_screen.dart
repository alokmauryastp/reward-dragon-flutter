import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_state_management/screens/user_home_screen/controller/user_home_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../common/screens/loading_and_error_screen.dart';
import '../../constants/literals.dart';

class UserHomeScreen extends GetWidget<UserHomeController> {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserHomeController());
    final DashboardController dashboardController = Get.find();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Hello, ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text:
                                          dashboardController.user.firstName,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
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
                              CircleAvatar(radius: 26.w,backgroundColor: yellow,
                                child: CircleAvatar(radius: 25.w,
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
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(ApplicationPages.rewardScreen);
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/detail_background.png'),
                                Positioned(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w, top: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 24.w,
                                            width: 24.w,
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
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 30.w,
                                  right: 10.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 24.w,
                                          width: 24.w,
                                          child:
                                          Image.asset(
                                            'assets/images/win_level.png',
                                          ),),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Win level : ',
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
                                  top: 60.w,
                                  right: 10.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 24.w,
                                          width: 24.w,
                                          child: Image.asset(
                                            'assets/images/point_won.png',
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Points Won : ',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: controller
                                                  .winLeveLPoints
                                                  .value
                                                  .pointsWon
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
                            onTap: () => Get.toNamed(
                                ApplicationPages.myPerformanceScreen),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/speed.svg',
                                      height: 14.w,
                                      width: 14.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "My Performance",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/images/clock.svg',
                                      height: 14.w,
                                      width: 14.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: dashboardController.daysToGoo,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xffFF0000),
                                            fontWeight: FontWeight.w700),
                                        children: [
                                          TextSpan(
                                            text: ' Days to go',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xffFFFFFF)),
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
                                  // color: Color(0xff262626),
                                  height: 60.w,
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
                                                  .totalKpiMet
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color:
                                                      const Color(0xffFFC000),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5.w,
                                            ),
                                            Expanded(
                                              child: Text(
                                                ' KPI\'s MET',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          thickness: 1.w,
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
                                                  fontSize: 20.sp,
                                                  color:
                                                      const Color(0xffFFC000),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 5.w,
                                            ),
                                            Expanded(
                                              child: Text(
                                                ' KPI\'s WIP',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
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
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(ApplicationPages.myChallengeScreen),
                            child: Container(
                              // height: 100.w,
                              width: 405.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.w),
                                    topRight: Radius.circular(10.w)),
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
                                      color: Color.fromRGBO(0, 0, 4, 0),
                                      blurRadius: 5),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Latest\nChallenge',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 10.sp),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            '(Click to view & accept)',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset('assets/images/image1.png')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/speed.svg',
                                height: 14.w,
                                width: 14.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "My Mood",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffFFFFFF)),
                              ),
                              Divider(
                                color: Colors.red,
                                height: 10.w,
                                thickness: 5.0,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(ApplicationPages.myJoshScreen);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.w),
                              // height: 142.w,
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
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 4, 0),
                                      blurRadius: 5)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'How is Your Mood\nToday ?',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white),
                                  ),
                                  SizedBox(height: 5.w,),
                                  SizedBox(
                                    height: 97.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (!controller
                                                .moodSubmitted.value) {
                                              controller
                                                  .selectedEmoji.value = 5;
                                              controller
                                                  .submitCustomerJosh();
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/happy.png',
                                                height: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        5
                                                    ? 50.w
                                                    : 40.w,
                                                width: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        5
                                                    ? 50.w
                                                    : 40.w,
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .selectedEmoji
                                                        .value ==
                                                    5,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Center(
                                                      child:
                                                          SvgPicture.asset(
                                                        'assets/images/bars.svg',
                                                        width: 16.w,
                                                        height: 18.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    Center(
                                                      child: Text(
                                                        'Awesome',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (!controller
                                                .moodSubmitted.value) {
                                              controller
                                                  .selectedEmoji.value = 4;
                                              controller
                                                  .submitCustomerJosh();
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/satisfied.png',
                                                height: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        4
                                                    ? 50.w
                                                    : 40.w,
                                                width: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        4
                                                    ? 50.w
                                                    : 40.w,
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .selectedEmoji
                                                        .value ==
                                                    4,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Center(
                                                      child:
                                                          SvgPicture.asset(
                                                        'assets/images/bars.svg',
                                                        width: 16.w,
                                                        height: 18.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    Center(
                                                      child: Text(
                                                        'Good',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (!controller
                                                .moodSubmitted.value) {
                                              controller
                                                  .selectedEmoji.value = 3;
                                              Get.toNamed(
                                                  ApplicationPages
                                                      .myJoshScreen,
                                                  arguments: 3);
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/okay.png',
                                                height: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        3
                                                    ? 50.w
                                                    : 40.w,
                                                width: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        3
                                                    ? 50.w
                                                    : 40.w,
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .selectedEmoji
                                                        .value ==
                                                    3,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Center(
                                                      child:
                                                          SvgPicture.asset(
                                                        'assets/images/bars.svg',
                                                        width: 16.w,
                                                        height: 18.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    Center(
                                                      child: Text(
                                                        'Okay',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (!controller
                                                .moodSubmitted.value) {
                                              controller
                                                  .selectedEmoji.value = 2;
                                              Get.toNamed(
                                                  ApplicationPages
                                                      .myJoshScreen,
                                                  arguments: 2);
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/sad.png',
                                                height: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        2
                                                    ? 50.w
                                                    : 40.w,
                                                width: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        2
                                                    ? 50.w
                                                    : 40.w,
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .selectedEmoji
                                                        .value ==
                                                    2,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Center(
                                                      child:
                                                          SvgPicture.asset(
                                                        'assets/images/bars.svg',
                                                        width: 16.w,
                                                        height: 18.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    Center(
                                                      child: Text(
                                                        'Upset',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (!controller
                                                .moodSubmitted.value) {
                                              controller
                                                  .selectedEmoji.value = 1;
                                              Get.toNamed(
                                                  ApplicationPages
                                                      .myJoshScreen,
                                                  arguments: 1);
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/angry.png',
                                                height: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        1
                                                    ? 50.w
                                                    : 40.w,
                                                width: controller
                                                            .selectedEmoji
                                                            .value ==
                                                        1
                                                    ? 50.w
                                                    : 40.w,
                                              ),
                                              Visibility(
                                                visible: controller
                                                        .selectedEmoji
                                                        .value ==
                                                    1,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.w,
                                                    ),
                                                    Center(
                                                      child:
                                                          SvgPicture.asset(
                                                        'assets/images/bars.svg',
                                                        width: 16.w,
                                                        height: 18.w,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                    Center(
                                                      child: Text(
                                                        'Stressed',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.w),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(alignment: Alignment.bottomRight,
                                    child: Visibility(visible: controller.moodModel.value.data?.emojiPoint!=0,
                                      child: Text(
                                        controller.moodModel.value.data?.createdAt.toString().substring(0,19) ?? "",
                                        style: TextStyle(color: red,fontStyle: FontStyle.italic,fontSize: 13.sp),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/speed.svg',
                                height: 14.w,
                                width: 14.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "My Wellbeing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffFFFFFF)),
                              ),
                              Divider(
                                color: Colors.red,
                                height: 10.w,
                                thickness: 5.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () =>
                                Get.toNamed(ApplicationPages.wellbeingScreen),
                            child: Container(
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
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 4, 0),
                                      blurRadius: 5),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Wellbeing Progress\nscore',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: white),
                                    ),
                                    SizedBox(
                                      height: 0.w,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${controller.wellBeingList.value.wellbeingPercent}%',
                                          style: TextStyle(
                                              fontSize: 20.sp,
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
                                      currentStep: controller.wellBeingList
                                              .value.wellbeingPercent
                                              ?.toInt() ??
                                          0,
                                      size: 10.w,
                                      unselectedColor: white,
                                      roundedEdges: Radius.circular(10.w),
                                      selectedGradientColor:
                                          const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff007220),
                                          Color(0xff57FF09)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                              // height: 100.w,
                              width: 405.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.w),
                                    bottomRight: Radius.circular(10.w)),
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
                                      color: Color.fromRGBO(0, 0, 4, 0),
                                      blurRadius: 5),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/image2.png'),
                                    // const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 28.w),
                                          child: Text(
                                            'Game Time',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(height: 10.sp),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            'Kill your stress now !',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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

                                DashboardController().openDialogForVoucher(controller.voucherModel.value.data![index], size.width, controller.pointBalanceForRedeem.value);

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
