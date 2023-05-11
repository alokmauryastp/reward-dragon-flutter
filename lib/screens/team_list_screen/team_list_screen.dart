import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../constants/literals.dart';
import 'controller/team_list_controller.dart';

class TeamListScreen extends GetWidget<TeamListController> {
  const TeamListScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                            text: 'Team',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                          TextSpan(
                            text: ' List',
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
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.searchResult.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get.toNamed(ApplicationPages.teamListScreen);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(radius: 20.w,
                                  backgroundColor: yellow,
                                  child: CircleAvatar(radius: 19.w,
                                    backgroundColor: white,
                                    child: ClipOval(
                                      child: Image.network(
                                        height: 40.w,
                                        width: 40.w,
                                        controller.searchResult.value[index].userImage,
                                        fit: BoxFit.cover,
                                        errorBuilder: (a,b,c)=>Image.asset('assets/images/logo.png',width: 40.w,height: 40.w,),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.searchResult.value[index].userFirstName ,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                    SizedBox(
                                      height: 5.w, 
                                    ),
                                    Text(
                                      controller.searchResult.value[index].roleRoleName,
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
                      })
                ],
              ),
            ))),
      ),
    ));
  }
}
