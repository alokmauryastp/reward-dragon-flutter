import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/team_challenge/model/team_challenge_model.dart';
import 'package:flutter_state_management/screens/team_challenge/services/team_challenge_api_services.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';
import '../../screens/team_challenge/controller/team_challenge_controller.dart';

class TeamChallengeList extends GetWidget<TeamChallengeController> {
  const TeamChallengeList(this.challengeData, {super.key});

  final List<ChallengeList>? challengeData;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount:
              controller.teamChallengeModel.value.challengeList?.length ?? 0,
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.only(top: 5.w),
            child: Container(
              padding: EdgeInsets.zero,
              width: size.width * 1,
              height: 35.w,

              decoration: BoxDecoration(
                gradient: blackGradient,
                border: Border.all(color: yellow),
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.teamChallengeModel.value.challengeList![index]
                            .challengeName,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: yellow),
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            backgroundColor: blackApp,
                            contentPadding: EdgeInsets.all(0.w),
                            titlePadding: EdgeInsets.all(0.w),
                            title: '',
                            content: Padding(
                              padding: EdgeInsets.only(
                                  right: 10.w, left: 10.w, top: 5.w, bottom: 5.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.teamChallengeModel.value
                                            .challengeList![index].challengeName,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: yellow),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 18.w,
                                          color: yellow,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                            .convert24to12format(controller
                                                .teamChallengeModel
                                                .value
                                                .challengeList![index]
                                                .startTime),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                            .convert24to12format(controller
                                                .teamChallengeModel
                                                .value
                                                .challengeList![index]
                                                .endTime),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                        controller.teamChallengeModel.value
                                            .challengeList![index].kpiName,
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
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Activity Details',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: yellow,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.teamChallengeModel.value
                                              .challengeList![index].activityDetails,textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                        controller.teamChallengeModel.value
                                            .challengeList![index].bonusPoint,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Participation %',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: yellow,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${controller.teamChallengeModel.value.challengeList![index].participationPercent} %',
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Win %',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: yellow,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${controller.teamChallengeModel.value.challengeList![index].participationPercent} %',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.w,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        if(controller.teamChallengeModel.value.challengeList![index].isCompletedByManager==0){
                                        controller.endChallengeByManager(controller
                                            .teamChallengeModel
                                            .value
                                            .challengeList![index]
                                            .id);
                                        }
                                      },
                                      child: Container(
                                        height: 30.w,
                                        width: 120.w,
                                        decoration: BoxDecoration(
                                          color: controller.teamChallengeModel.value.challengeList![index].isCompletedByManager== 0 ? red : Colors.grey,
                                          borderRadius: BorderRadius.circular(5.w),
                                        ),
                                        child: Center(
                                          child: Text(
                                          controller.teamChallengeModel.value.challengeList![index].isCompletedByManager== 0 ? "End Challenge" : "Ended",
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
          ),
        ),
      ),
    );
  }
}
