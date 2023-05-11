import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/manager_Leaderboard/manager_leaderboard_controller/manager_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LeaderboardManagerScreen extends GetWidget<ManagerLeaderBoardController> {
  const LeaderboardManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: AppBar(
          backgroundColor: black,
          leading: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Image.asset(
              'assets/images/logo.png',
              height: 20.w,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              'Aara Technologies Pvt. Ltd.',
              style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.w400, color: white),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/myAccount_dragon_logo.png',
                      height: 55.w,
                      width: 55.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amritesh  Kumar',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 15.w,
                        ),
                        Text(
                          'Project Manager, Operations',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/level.svg',
                    height: 12.w,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Team',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                      TextSpan(
                        text: ' Leaderboard',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: yellow),
                      ),
                    ]),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.defaultDialog(
                      backgroundColor: blackApp,
                      contentPadding: EdgeInsets.all(0.w),
                      titlePadding: EdgeInsets.all(0.w),
                      title: '',
                      content: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Apply',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: yellow)),
                                      TextSpan(
                                          text: ' Filter',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(
                                  'assets/images/filter.svg',
                                  height: 12.w,
                                  width: 12.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 15.w),
                            const Divider(
                              color: white,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select group',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 12.w,
                                        color: white,
                                      ),
                                      value: controller
                                          .selectGroupDropdownValue.value,
                                      items: controller.selectGroupItems
                                          .map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: yellow),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        controller.selectGroupDropdownValue
                                            .value = newValue.toString();
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select name',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 12.w,
                                        color: white,
                                      ),
                                      value: controller
                                          .selectNameDropdownValue.value,
                                      items: controller.selectNameItems
                                          .map((String selectNameData) {
                                        return DropdownMenuItem(
                                          value: selectNameData,
                                          child: Text(
                                            selectNameData,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: yellow),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: ((String? selectName) {
                                        controller.selectNameDropdownValue
                                            .value = selectName.toString();
                                      })),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Time period',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: white,
                                      fontWeight: FontWeight.w400),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 12.w,
                                        color: white,
                                      ),
                                      value: controller
                                          .timePeriodDropdownvalue.value,
                                      items: controller.selectTimePeriodItems
                                          .map((String selectTimePeriodData) {
                                        return DropdownMenuItem(
                                          value: selectTimePeriodData,
                                          child: Text(
                                            selectTimePeriodData,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: yellow),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: ((String? timePeriodData) {
                                        controller.selectNameDropdownValue
                                            .value = timePeriodData.toString();
                                      })),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50.w,
                            ),
                            Center(
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
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Apply',
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SvgPicture.asset('assets/images/filter.svg',
                                        height: 12.w)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Text(
                      'Filter',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SvgPicture.asset(
                    'assets/images/filter.svg',
                    height: 12.w,
                    width: 12.w,
                  ),
                ],
              ),
              const Divider(
                color: white,
              ),
              SizedBox(
                height: 140.w,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        color: blackApp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 27.w,
                              backgroundColor: yellow,
                              child: CircleAvatar(
                                radius: 25.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'User Name',
                              style: TextStyle(color: white),
                            ),
                            const Spacer(),
                            const Text(
                              '12345.00',
                              style: TextStyle(color: white),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const Divider(
                color: white,
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/speed.svg',
                    height: 12.w,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Trend',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                      TextSpan(
                        text: ' Chart',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: yellow),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: Text(
                      '(Time series)',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Container(
                      color: white,
                      width: size.width,
                      height: 0.5.w,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                height: 180.w,
                color: Colors.green,
                child: const Center(child: Text('Bar Chart')),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/speed.svg',
                    height: 12.w,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Winning',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                      TextSpan(
                        text: ' source',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: yellow),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.w),
                      child: Container(
                        color: white,
                        width: size.width,
                        height: 0.5.w,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                height: 150.w,
                color: Colors.red,
                child: const Center(child: Text('Pie Chart')),
              ),
              SizedBox(
                height: 20.w,
              )
            ],
          ),
        )),
      ),
    );
  }
}
