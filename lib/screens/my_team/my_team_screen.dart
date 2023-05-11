import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/my_team/controller/my_team_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyTeamScreen extends GetWidget<MyTeamController> {
  const MyTeamScreen({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    SizedBox(
                      height: 40.w,
                      child: TextField(
                        onChanged: (value) => controller.onChanged(value),
                        cursorColor: yellow,
                        cursorHeight: 18.w,
                        cursorWidth: 1.w,
                        style: const TextStyle(color: white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: white,
                            size: 20.w,
                          ),
                          filled: true,
                          fillColor: black,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.w),
                              borderSide: const BorderSide(
                                color: white,
                              )),
                          hintText: 'Search.....',
                          hintStyle: TextStyle(color: white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/my_team.png',
                          height: 18.w,
                          width: 18.w,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'My',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                            TextSpan(
                              text: ' Team',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: yellow),
                            ),
                          ]),
                        ),
                        SizedBox(
                          width: 10.w,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        border: Border.all(color: yellow),
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
                        padding: EdgeInsets.only(left: 10.w),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.w,
                                ),
                                Text(
                                  'Company Name :',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 54),
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  controller.teamDataModel.value.teamsData
                                          ?.organizationName ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: yellow,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Team Name :',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 54),
                                      fontWeight:
                                          FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  controller.teamDataModel.value
                                          .teamsData?.teamName ??
                                      '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: yellow,
                                      fontWeight:
                                          FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Manager Name :',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 54),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      controller.teamDataModel.value.teamsData
                                              ?.managerName ??
                                          '',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: yellow,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/my_team.png',
                          height: 18.w,
                          width: 18.w,
                        ),
                        SizedBox(
                          width: 2.w,
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
                              text:
                                  ' Members',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: yellow),
                            ),
                          ]),
                        ),
                        SizedBox(
                          width: 10.w,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Obx(() => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.searchResult.value.length,
                      itemBuilder: ((context, index) => Column(
                        children: [
                          SizedBox(
                            height: 5.w,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset(
                              'assets/images/logo.png',
                              height: 40.w,
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.searchResult.value[index].employeeName,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  controller.searchResult.value[index].designation,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: white,
                          )
                        ],
                      )),
                    )),
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
    );
  }
}
