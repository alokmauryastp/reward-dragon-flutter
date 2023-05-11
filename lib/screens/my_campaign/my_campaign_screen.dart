import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/widgets/my_campaign_list.dart';
import 'controller/my_campaign_controller.dart';

class MyCampaignScreen extends GetWidget<MyCampaignController> {
  const MyCampaignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
      body: RefreshIndicator(onRefresh: controller.onRefresh,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/total_campaign.svg',
                      height: 14.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Total Campaign',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: white),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/running.svg',
                      height: 14.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      ' Running',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      (controller.myCampaignModel.value.teamCampaignLists?.length ?? 0).toString(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.w,
                ),
                const Divider(
                  color: white,
                ),
                controller.myCampaignModel.value.teamCampaignLists != null &&  controller.myCampaignModel.value.teamCampaignLists!.isEmpty ?
                SizedBox(
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
                        padding: EdgeInsets.symmetric(horizontal: 65.w),
                        child: Text(
                          'The Leadership is brewing a new campaign, and will be available soon.',
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
                ) :
                const CampaignList(),
                SizedBox(
                  height: 10.w,
                ),
                const Divider(
                  color: white,
                ),
                Center(
                  child: Text(
                    'Data Last refreshed on ${controller.currentDateTime}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 45,
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
                            width: 145.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                side: const BorderSide(color: Color(0xffFFC016)),
                              ),
                              onPressed: (() {Get.toNamed(ApplicationPages.myChallengeScreen);}),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/latest_challenge.png',
                                    height: 22.w,
                                  ),
                                  Text(
                                    ' Latest\n Challenge',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex:10,child: Container()),
                      Expanded(flex: 45,
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
                            width: 145.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                side: const BorderSide(color: Color(0xffFFC016)),
                              ),
                              onPressed: (() {Get.toNamed(ApplicationPages.myGameTimeScreen);}),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  Image.asset(
                                    'assets/images/dice.png',
                                    height: 20.w,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    'Game Time',
                                    style: TextStyle(
                                        fontSize: 14.sp,
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
                ),
                SizedBox(
                  height: 10.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
