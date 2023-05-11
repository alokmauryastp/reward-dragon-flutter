import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/my_josh/controller/my_josh_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';
import '../../screens/dashboard_screen/controller/dashboard_controller.dart';

class MoodTodayContainer extends GetWidget<MyJoshController> {
  const MoodTodayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return Obx(() => Container(
          height: 153.w,
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
              BoxShadow(color: Color.fromRGBO(0, 0, 4, 0), blurRadius: 5)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How is Your Mood\nToday ?',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: white),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!controller.moodSubmitted.value) {
                          controller.selectedEmoji.value = 5;
                          dashboardController.user.roleId == 1
                              ? controller.submitCustomerJosh()
                              : controller.submitManagerJosh();
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/happy.png',
                            height: controller.selectedEmoji.value == 5
                                ? 50.w
                                : 40.w,
                            width: controller.selectedEmoji.value == 5
                                ? 50.w
                                : 40.w,
                          ),
                          Visibility(
                            visible: controller.selectedEmoji.value == 5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Center(
                                  child: SvgPicture.asset(
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
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!controller.moodSubmitted.value) {
                          controller.selectedEmoji.value = 4;
                          dashboardController.user.roleId == 1
                              ? controller.submitCustomerJosh()
                              : controller.submitManagerJosh();
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/satisfied.png',
                            height: controller.selectedEmoji.value == 4
                                ? 50.w
                                : 40.w,
                            width: controller.selectedEmoji.value == 4
                                ? 50.w
                                : 40.w,
                          ),
                          Visibility(
                            visible: controller.selectedEmoji.value == 4,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Center(
                                  child: SvgPicture.asset(
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
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!controller.moodSubmitted.value) {
                          controller.selectedEmoji.value = 3;
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/okay.png',
                            height: controller.selectedEmoji.value == 3
                                ? 50.w
                                : 40.w,
                            width: controller.selectedEmoji.value == 3
                                ? 50.w
                                : 40.w,
                          ),
                          Visibility(
                            visible: controller.selectedEmoji.value == 3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Center(
                                  child: SvgPicture.asset(
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
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!controller.moodSubmitted.value) {
                          controller.selectedEmoji.value = 2;
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/sad.png',
                            height: controller.selectedEmoji.value == 2
                                ? 50.w
                                : 40.w,
                            width: controller.selectedEmoji.value == 2
                                ? 50.w
                                : 40.w,
                          ),
                          Visibility(
                            visible: controller.selectedEmoji.value == 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Center(
                                  child: SvgPicture.asset(
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
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!controller.moodSubmitted.value) {
                          controller.selectedEmoji.value = 1;
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/angry.png',
                            height: controller.selectedEmoji.value == 1
                                ? 50.w
                                : 40.w,
                            width: controller.selectedEmoji.value == 1
                                ? 50.w
                                : 40.w,
                          ),
                          Visibility(
                            visible: controller.selectedEmoji.value == 1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Center(
                                  child: SvgPicture.asset(
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
                                        fontWeight: FontWeight.w700),
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
                const Spacer(),
                Align(alignment: Alignment.bottomRight,
                  child: Visibility(visible: controller.moodModel.value.data?.emojiPoint!=0,
                    child: Text(
                      controller.moodModel.value.data?.createdAt.toString().substring(0,19) ?? "",
                      // DateTime.parse(DateFormat('yyyy-MM-dd hh:mm:ss').parse(controller.moodModel.value.data!.createdAt.toString().substring(0,19)).toString()).toString(),
                      style: TextStyle(color: red,fontStyle: FontStyle.italic,fontSize: 13.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
