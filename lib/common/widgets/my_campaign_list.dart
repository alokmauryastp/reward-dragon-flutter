import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/my_campaign/controller/my_campaign_controller.dart';
import 'package:get/get.dart';

import '../../constants/literals.dart';

class CampaignList extends GetWidget<MyCampaignController> {
  const CampaignList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(() => SizedBox(
          width: size.width,
          child: ListView.builder(
            padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  controller.myCampaignModel.value.teamCampaignLists?.length ??
                      0,
              itemBuilder: (context, index) {
                var data =
                    controller.myCampaignModel.value.teamCampaignLists![index];
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
                              data.campaignName,
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
                                        right: 10.w, left: 10.w, bottom: 5.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            data.campaignName,
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
                                                data.startDate
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
                                                data.endDate
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
                                                'Contact person :',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: yellow,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  data.contactPerson,textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: white,

                                                    fontWeight: FontWeight.w400,
                                                  ),
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
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'KPI',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: yellow,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                'Your Target',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: yellow,
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
                                          height: (20 * data.kpiData.length).w,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: data.kpiData.length,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder: (BuildContext
                                                          context,
                                                      index) =>
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          data.kpiData[index]
                                                              .kpiName,
                                                          style: const TextStyle(
                                                              color: yellow,
                                                            fontWeight: FontWeight.w700,),
                                                        ),
                                                        Text(
                                                            data
                                                                .kpiData[
                                                                    index]
                                                                .point,
                                                            style: const TextStyle(
                                                                color:
                                                                    white)),
                                                      ],
                                                    ),
                                                  )),
                                        ),
                                        SizedBox(
                                          height: 10.w,
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
                );
              }),
        ));
  }
}
