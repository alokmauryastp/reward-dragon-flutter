import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/card_wellbeing.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/screens/my_resources/widgets/leadership_talk_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/widgets/link_widgets_resource_screen.dart';
import '../../constants/literals.dart';
import '../../constants/urls.dart';
import 'controller/my_resources_controller.dart';

class MyResourceScreen extends GetWidget<MyResourcesController> {
  const MyResourceScreen({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      InkWell(
                        onTap: () async {
                          var url = Uri.parse(controller.companySiteData.value
                                  .companySiteData?.siteUrl ??
                              "");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        child: Container(
                          width: size.width,
                          height: 40.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.w)),
                            border: Border.all(color: yellow),
                            gradient: const LinearGradient(
                              colors: [Color(0xff404040), Color(0xff010101)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Company Portal / Website',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                    'assets/images/link.svg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Learning Material
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/learning.svg',
                            color: yellow,
                            height: 14.w,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Learning Material",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      SizedBox(
                        height: 135.w,
                        width: size.width,
                        child: const WellBeingScreenCards(),
                      ),
                      // Leadership Talk
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/learning.svg',
                            color: yellow,
                            height: 14.w,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Leadership Talk",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      SizedBox(
                        height: 135.w,
                        width: size.width,
                        child: const LeadershipTalkCards(),
                      ),
                      // Reward Dragon Usage

                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/learning.svg',
                            color: yellow,
                            height: 14.w,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Reward Dragon Usage",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: (() async {
                              var url = Uri.parse(termConditionUrl);
                              if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                              } else {
                              throw "Could not launch $url";
                              }
                            }),
                            child: Container(
                              height: 40.w,
                              width: size.width * 0.45,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [blackApp, black],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                border: Border.all(color: yellow),
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Term &\nCondition',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: yellowApp),
                                  ),
                                  SizedBox(width: 5.w),
                                  SvgPicture.asset(
                                    'assets/images/concerns.svg',
                                    height: 15.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // const Spacer(),
                          InkWell(
                            onTap: () async {
                              var url = Uri.parse(privacyPolicyUrl);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw "Could not launch $url";
                              }
                            },
                            child: Container(
                              height: 40.w,
                              width: size.width * 0.45,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [blackApp, black],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                border: Border.all(color: yellow),
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Privacy policy',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: yellowApp),
                                  ),
                                  SizedBox(width: 5.w),
                                  SvgPicture.asset(
                                    'assets/images/privacy_policy.svg',
                                    height: 15.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Other Links
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/link.svg',
                            color: yellow,
                            height: 14.w,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Other Links",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SizedBox(
                          height: 110.w,
                          width: size.width,
                          child: const ResourceScreenLinkContainer()),
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
