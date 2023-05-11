import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/challenge_list.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/widgets/app_bar_with_back_button.dart';
import 'controller/my_challenge_controller.dart';

class MyChallengeScreen extends GetWidget<MyChallengeController> {
  const MyChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                      const UserProfile(),
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
                            "Challenge For Today",
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
                      controller.myChallengeModel.value.teamChallengeLists ==
                                  null ||
                              controller.myChallengeModel.value
                                  .teamChallengeLists!.isEmpty
                          ? SizedBox(
                              width: size.width,
                              height: 150.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/no_challenge.png',
                                    height: 100.w,
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 65.w),
                                    child: Text(
                                      'The Leadership is brewing a new and exciting challenge, and will be available soon.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const ChallengeList(),
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
                                    controller.challengePoints.value
                                        .challengesPlayedCount
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Text(
                                      'Challenges\nPlayed',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              child: const VerticalDivider(
                                color: white,
                                width: 1,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.challengePoints.value
                                        .challengesWonCount
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Text(
                                      'Challenges\nWon',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.w),
                              child: const VerticalDivider(
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
                                    controller.challengePoints.value
                                        .challengesWonCount
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    child: Text(
                                      'Bonus\nPoints',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
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
                        height: 60.w,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                                    controller.winLeveLPoints.value.winLevel
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Win Level',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                thickness: 1.w,
                                color: Colors.white,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller
                                        .winLeveLPoints.value.pointsWon
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xffFFC000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5.w,
                                  ),
                                  Text(
                                    'Points Won',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
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
                            height: 40.w,
                            width: 130.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                side:
                                    const BorderSide(color: Color(0xffFFC016)),
                              ),
                              onPressed: (() {
                                Get.toNamed(ApplicationPages.myGameTimeScreen);
                              }),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Image.asset(
                                    'assets/images/dice.png',
                                    height: 18.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Game Time',
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
                        height: 10.w,
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
