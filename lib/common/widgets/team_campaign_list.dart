import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/team_campaign/controller/team_campaign_controller.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';

class TeamCampaignList extends GetWidget<TeamCampaignController> {
  const TeamCampaignList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => Expanded(
        child: Align(alignment: Alignment.topCenter,
          child: ListView.builder(
            reverse: true,
            itemCount: controller.campaignData.value.campaignData?.length ?? 0,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 5.w),
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
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.campaignData.value.campaignData![index]
                                .campaignName,
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
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        controller.campaignData.value
                                            .campaignData![index].campaignName,
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
                                      height: 20.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Start Date',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            controller.campaignData.value
                                                .campaignData![index].startDate
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'End Date',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            controller.campaignData.value
                                                .campaignData![index].endDate
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Criteria / Rules',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellow,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            'Target',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: yellowApp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    SizedBox(
                                      width: size.width,
                                      height:(controller.campaignData.value.campaignData![index].kpiData.length  * 25.w),
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.campaignData.value.campaignData![index].kpiData.length,
                                          itemBuilder: (context, i) =>
                                              SizedBox(
                                                height: 25.w,
                                                child: Row(children: [

                                                  SizedBox(width: 10.w,),
                                                  Expanded(
                                                    child: Text(
                                                      controller.campaignData.value.campaignData![index].kpiData[i].kpiName,
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: yellow,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    controller.campaignData.value.campaignData![index].kpiData[i].point,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: white,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,)
                                                ],),
                                              )),
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          if(controller.campaignData.value.campaignData![index].isCompletedByManager==0){
                                            controller.endCampaignByManager(controller.campaignData.value.campaignData![index].id);
                                          }
                                        },
                                        child: Container(
                                          height: 30.w,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                            color: controller.campaignData.value.campaignData![index].isCompletedByManager==0?red:Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5.w),
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller.campaignData.value.campaignData![index].isCompletedByManager==0?
                                              'End Campaign' : 'Ended',
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
          ),
        ),
      ),
    );
  }
}
