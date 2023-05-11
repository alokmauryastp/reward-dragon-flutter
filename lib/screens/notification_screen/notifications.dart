import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/screens/notification_screen/controller/notification_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../constants/literals.dart';

class Notifications extends GetWidget<NotificationController> {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const DashboardAppbar(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => LoadingAndErrorScreen(
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.onRefresh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications (${controller.notificationList.length})',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            controller.markReadNotification();
                          },
                          child: Text(
                            'Mark read',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16.sp,
                                color: white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.notificationList.length,
                        itemBuilder: (context, index) {
                          return VisibilityDetector(
                            key: Key((index + 1).toString()),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction == 1) {
                                controller.currentItem.value = index + 1;
                                if (controller.currentItem.value ==controller.notificationList.length && controller.pageNo.value < controller.notificationModel.value.totalNoPages!) {
                                  controller.pageNo.value++;
                                  controller.getNotifications();
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (controller.notificationList[index]
                                          .isSelected.value) {
                                        controller.notificationList[index]
                                            .isSelected.value = false;
                                      } else {
                                        controller.notificationList[index]
                                            .isSelected.value = true;
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.w),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Obx(() => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5.0),
                                                  child: SizedBox(
                                                    width: 20.w,
                                                    child: controller
                                                            .notificationList[
                                                                index]
                                                            .isSelected
                                                            .value
                                                        ? SvgPicture.asset(
                                                            'assets/images/radio.svg',
                                                            width: 15.w,
                                                          )
                                                        : SvgPicture.asset(
                                                            'assets/images/circle.svg',
                                                            width: 15.w,
                                                          ),
                                                  ),
                                                )),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .notificationList[index]
                                                        .heading,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: white),
                                                  ),
                                                  SizedBox(
                                                    height: 3.w,
                                                  ),
                                                  Text(
                                                    controller
                                                        .notificationList[index]
                                                        .activity,
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              visible: !controller
                                                  .notificationList[index]
                                                  .isRead,
                                              child: Icon(
                                                Icons.star,
                                                size: 14.w,
                                                color: green,
                                              ),
                                            ),
                                            Visibility(
                                              visible: controller
                                                  .notificationList[index]
                                                  .redirectionalCode
                                                  .isNotEmpty,
                                              child: InkWell(
                                                onTap: () {
                                                  Get.toNamed(controller
                                                      .getPages(controller
                                                          .notificationList[
                                                              index]
                                                          .redirectionalCode));
                                                },
                                                child: SizedBox(
                                                  height: 20.w,
                                                  width: 20.w,
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 14.w,
                                                    color: yellow,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      controller
                                          .notificationList[index].createdAt,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff414141),
                                Color(0xff000000),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5.w),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 4, 0),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ],
                          ),
                          child: SizedBox(
                            height: 30.w,
                            width: 95.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  side: const BorderSide(
                                      color: Color(0xffFFC016)),
                                ),
                                onPressed: () {
                                  controller.selectAll();
                                },
                                child: Text(
                                  'Select All',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff414141),
                                Color(0xff000000),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5.w),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 4, 0),
                                  //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ],
                          ),
                          child: SizedBox(
                            height: 30.w,
                            width: 95.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w)),
                                side:
                                    const BorderSide(color: Color(0xffFFC016)),
                              ),
                              onPressed: () {
                                controller.markUnReadNotification();
                              },
                              child: Text(
                                'Mark unread',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        DecoratedBox(
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
                            height: 30.w,
                            width: 95.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.w)),
                                  side: const BorderSide(
                                      color: Color(0xffFFC016)),
                                ),
                                onPressed: () {
                                  controller.deleteNotification();
                                },
                                child: Text(
                                  'Remove',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
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
    );
  }
}
