import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'controller/my_concern_controller.dart';

class MyConcernScreen extends GetWidget<MyConcernController> {
  const MyConcernScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.w,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: UserProfile(),
                        ),
                        TabBar(
                          controller: controller.tabController,
                          labelColor: yellow,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontSize: 12.w, fontWeight: FontWeight.w700),
                          indicatorColor: yellow,
                          tabs: const [
                            Tab(text: 'Open Concerns'),
                            Tab(
                              text: 'Closed Concerns',
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height - 250.w,
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.tabController,
                            children: const [
                              OpenConcernsPage(),
                              ClosedConcern()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        InkWell(
                          onTap: (() {}),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    backgroundColor: blackApp,
                                    title: 'Raise Concern',
                                    titleStyle: const TextStyle(color: white),
                                    content: Obx(() => Column(
                                          children: [
                                            controller.user.roleId == 1
                                                ? DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      dropdownColor: blackApp,
                                                      style: TextStyle(
                                                          color: yellow,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      value: controller
                                                          .selectConcernId
                                                          .value,
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: white,
                                                        size: 14.w,
                                                      ),
                                                      items: controller
                                                          .concernCategoryModel
                                                          .value
                                                          .data
                                                          ?.map((data) {
                                                        return DropdownMenuItem(
                                                          value: data.id,
                                                          child:
                                                              Text(data.name),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (int? newValue) {
                                                        controller
                                                            .selectConcernId
                                                            .value = newValue!;
                                                      },
                                                    ),
                                                  )
                                                : DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      dropdownColor: blackApp,
                                                      style: TextStyle(
                                                          color: yellow,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      value: controller
                                                          .selectConcernId
                                                          .value,
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: white,
                                                        size: 14.w,
                                                      ),
                                                      items: controller
                                                          .managerConcernCategoryModel
                                                          .value
                                                          .managerConcernCategory
                                                          ?.map((data) {
                                                        return DropdownMenuItem(
                                                          value: data.id,
                                                          child:
                                                              Text(data.name),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (int? newValue) {
                                                        controller
                                                            .selectConcernId
                                                            .value = newValue!;
                                                      },
                                                    ),
                                                  ),
                                            TextFormField(
                                              controller:
                                                  controller.concernController,
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 0.6),
                                              ),
                                              cursorColor:
                                                  const Color(0xffFFC016),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffFFFFFF)),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Color(0xffFFC016)),
                                                ),
                                                labelText:
                                                    'Enter some details..',
                                                labelStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 0.6),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.person,
                                                  color: Color(0xffFFC016),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "can't be empty";
                                                }
                                                return null;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (controller.user.roleId ==
                                                    1) {
                                                  controller
                                                      .submitUserConcern();
                                                } else {
                                                  controller
                                                      .submitManagerConcern();
                                                }
                                              },
                                              child: Center(
                                                child: Container(
                                                  height: 30.w,
                                                  width: 120.w,
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0xff54FA09),
                                                        Color(0xff01751E)
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.w),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )));
                              },
                              child: Container(
                                height: 35.w,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  color: black,
                                  border: Border.all(color: yellow),
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/images/concerns.svg',
                                      height: 15.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Raise Concern',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
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

class OpenConcernsPage extends GetWidget<MyConcernController> {
  const OpenConcernsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Obx(() => controller.user.roleId == 1
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.openConcerns.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Container(
                  // height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    gradient: const LinearGradient(
                      colors: [Color(0xff404040), Color(0xff010101)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 5.w, bottom: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.openConcerns[index].id,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/images/member_since.svg',
                              height: 14.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              daysCounter(controller.openConcerns[index].createdAt
                                  .toString()
                                  .substring(0, 10)),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Action Owner :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.openConcerns[index].actionOwnerName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.openConcerns[index].status == 1
                                  ? 'Open'
                                  : 'Closed',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          controller.openConcerns[index].description,
                          style: TextStyle(
                              color: white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.openConcernsM.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Container(
                  // height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    gradient: const LinearGradient(
                      colors: [Color(0xff404040), Color(0xff010101)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 5.w, bottom: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.openConcernsM[index].id,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/images/member_since.svg',
                              height: 14.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              daysCounter(controller
                                  .openConcernsM[index].createdAt
                                  .toString()
                                  .substring(0, 10)),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Action Owner :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.openConcernsM[index].actionOwnerName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.openConcernsM[index].status == 1
                                  ? 'Open'
                                  : 'Closed',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          controller.openConcernsM[index].description,
                          style: TextStyle(
                              color: white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}

class ClosedConcern extends GetWidget<MyConcernController> {
  const ClosedConcern({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Obx(() => controller.user.roleId == 1
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.closedConcerns.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Container(
                  // height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    gradient: const LinearGradient(
                      colors: [Color(0xff404040), Color(0xff010101)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 5.w, bottom: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.closedConcerns[index].id,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/images/member_since.svg',
                              height: 14.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              daysCounter(controller
                                  .closedConcerns[index].createdAt
                                  .toString()
                                  .substring(0, 10)),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Action Owner :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.closedConcerns[index].actionOwnerName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.closedConcerns[index].status == 1
                                  ? 'Open'
                                  : 'Closed',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          controller.closedConcerns[index].description,
                          style: TextStyle(
                              color: white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.closedConcernsM.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Container(
                  // height: 120,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    gradient: const LinearGradient(
                      colors: [Color(0xff404040), Color(0xff010101)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 5.w, bottom: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              controller.closedConcernsM[index].id,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/images/member_since.svg',
                              height: 14.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              daysCounter(controller
                                  .closedConcernsM[index].createdAt
                                  .toString()
                                  .substring(0, 10)),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Action Owner :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.closedConcernsM[index].actionOwnerName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              controller.closedConcernsM[index].status == 1
                                  ? 'Open'
                                  : 'Closed',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          controller.closedConcernsM[index].description,
                          style: TextStyle(
                              color: white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
