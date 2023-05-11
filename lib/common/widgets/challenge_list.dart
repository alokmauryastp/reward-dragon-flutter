import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/my_challenge/controller/my_challenge_controller.dart';
import 'package:flutter_state_management/screens/team_challenge/services/team_challenge_api_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/literals.dart';

class ChallengeList extends GetWidget<MyChallengeController> {
  const ChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount:
          controller.myChallengeModel.value.teamChallengeLists?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 5.w),
          child: Container(
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.myChallengeModel.value.teamChallengeLists![index].challengeName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: yellow),
                    ),
                    InkWell(
                      onTap: () {
                        var availableTime = '00 : 00 : 00'.obs;
                        var difference = 0.obs;
                        late Timer timer;
                        // printDifferenceDateForHours(date) {
                        // var date = "2022-10-27 16:40:00.000";
                        var date = DateTime.now();
                        DateTime parseDate =
                            DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(
                                '${date.toString().substring(0, 10)} ${controller.myChallengeModel.value.teamChallengeLists![index].endTime}.000');
                        var currentTime = DateTime.now();
                        DateTime startDate =
                            DateTime.parse(parseDate.toString());
                        difference.value =
                            startDate.difference(currentTime).inSeconds;
                        try {
                          timer = Timer.periodic(const Duration(seconds: 1),
                              (Timer t) {
                            if (difference.value > 0) {
                              difference.value--;
                              availableTime.value =
                                  formatTime(difference.value);
                            } else {
                              timer.cancel();
                              availableTime.value = "00 : 00 : 00";
                            }
                          });
                        } catch (e) {
                          rethrow;
                        }
                        // }

                        Get.defaultDialog(
                          backgroundColor: blackApp,
                          contentPadding: EdgeInsets.all(0.w),
                          titlePadding: EdgeInsets.all(0.w),
                          title: '',
                          content: Obx(() => WillPopScope(
                                onWillPop: () async {
                                  timer.cancel();
                                  Get.back();
                                  return true;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 10.w,
                                      left: 10.w,
                                      top: 0.w,
                                      bottom: 5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          controller.myChallengeModel.value.teamChallengeLists![index].challengeName,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: yellow),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.w),
                                        child: const Divider(
                                          color: white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Start Time',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            TeamChallengeApiServices()
                                                .convert24to12format(
                                                controller.myChallengeModel.value.teamChallengeLists![index].startTime),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'End Time',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            TeamChallengeApiServices()
                                                .convert24to12format(
                                                controller.myChallengeModel.value.teamChallengeLists![index].endTime),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'KPI',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            controller.myChallengeModel.value.teamChallengeLists![index].kpiName,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Target',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            controller.myChallengeModel.value.teamChallengeLists![index].bonusPoint,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Text(
                                        'Challenge Activity Details:',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: yellow),
                                      ),
                                      SizedBox(height: 10.w),
                                      Text(
                                        controller.myChallengeModel.value.teamChallengeLists![index].activityDetails,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: white),
                                      ),
                                      SizedBox(height: 10.w),
                                      Visibility(
                                        visible: controller.myChallengeModel.value.teamChallengeLists![index].isAccepted != 1,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Challenge Countdown / Timer',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            Center(
                                              child: Text(
                                                availableTime.value,
                                                style: TextStyle(
                                                  fontSize: 28.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      const Color(0xffFF0000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.w,
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.myChallengeModel.value.teamChallengeLists![index].isAccepted != 1) {
                                              controller.acceptChallenge(controller.myChallengeModel.value.teamChallengeLists![index].id);
                                              Get.back();
                                            }
                                          },
                                          child: Container(
                                            height: 30.w,
                                            width: 120.w,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff54FA09),
                                                  Color(0xff01751E)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                            ),
                                            child: Center(
                                              child: Text(
                                                controller.myChallengeModel.value.teamChallengeLists![index].isAccepted == 1
                                                    ? "Accepted"
                                                    : 'Accept',
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: yellow,
                        size: 16.w,
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
