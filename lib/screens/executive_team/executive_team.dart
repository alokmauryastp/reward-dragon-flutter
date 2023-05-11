import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';
import 'controller/executive_team_controller.dart';

class ExecutiveTeam extends GetWidget<ExecutiveTeamController> {
  const ExecutiveTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
      body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(() => LoadingAndErrorScreen(
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.onRefresh,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    SizedBox(
                      height: 40.w,
                      child: TextField(
                        onChanged: (value) {
                          if (controller.selectedIndex.value == 0) {
                            controller.onChanged(value);
                          } else {
                            controller.onChangedExecutive(value);
                          }
                        },
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
                                  controller.user.companyName,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: yellow,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5.w,
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
                    TabBar(
                      controller: controller.tabController,
                      labelColor: yellow,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                          fontSize: 12.w, fontWeight: FontWeight.w700),
                      indicatorColor: yellow,
                      tabs: const [
                        Tab(text: 'Team Members'),
                        Tab(
                          text: 'Executive',
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height - 300.w,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.tabController,
                        children: const [TeamMembers(), ExecutivePage()],
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                ),
              )))),
    ));
  }
}

class TeamMembers extends GetWidget<ExecutiveTeamController> {
  const TeamMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.searchResult.value.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(ApplicationPages.teamListScreen,
                  arguments: controller.searchResult.value[index].teamId);
            },
            child: Column(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.searchResult.value[index].managerName,
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
            ),
          );
        }));
  }
}

class ExecutivePage extends GetWidget<ExecutiveTeamController> {
  const ExecutivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.executiveResult.value.length,
        itemBuilder: (context, index) {
          return Column(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.executiveResult.value[index].firstName,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: white),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Text(
                      controller.executiveResult.value[index].designation,
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
          );
        }));
  }
}
