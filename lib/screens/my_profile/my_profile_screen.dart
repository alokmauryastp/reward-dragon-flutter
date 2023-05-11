import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/my_profile/controller/my_profile_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/literals.dart';
import '../../constants/urls.dart';

class MyProfileScreen extends GetWidget<MyProfileController> {

  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/detail_background.png',
                    ),
                    Positioned(
                      left: 15.w,
                      top: 18.w,
                      child: ClipOval(
                        child: Image.network(
                          width: 50.w,
                          height: 50.w,
                          fit:BoxFit.cover,
                          controller.userImage.value,
                          errorBuilder: (a, b, c) => Image.asset(
                            'assets/images/logo.png',
                            width: 50.w,
                            height: 50.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50.w,
                      top: 50.w,
                      child: InkWell(
                        onTap: () {
                          // print('click');
                          Get.defaultDialog(
                              title: '',
                              backgroundColor: blackApp,
                              contentPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              content: SizedBox(
                                width: size.width,
                                height: (80.w *
                                    (controller.avatarModel.value
                                        .avatarImages!.length) /
                                    2)
                                    .w,
                                child: GridView.builder(
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: (controller.avatarModel.value
                                        .avatarImages?.length ??
                                        0) +
                                        1,
                                    itemBuilder: (ctx, index) => InkWell(
                                      onTap: () {
                                        if (index == 0) {
                                          controller.pickImageCamera();
                                        } else {
                                          controller.updateAvatarImage(
                                              controller.avatarModel.value
                                                  .avatarImages![index-1].id);
                                          Get.back();
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2, color: white),
                                          shape: BoxShape.rectangle,
                                        ),
                                        height: 40.w,
                                        child: index == 0
                                            ? Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/upload.svg'),
                                            const Text(
                                              'Upload',
                                              style: TextStyle(
                                                  color: white),
                                            )
                                          ],
                                        )
                                            : Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              10.0),
                                          child: Image.network(
                                            controller
                                                .avatarModel
                                                .value
                                                .avatarImages![
                                            index - 1]
                                                .image,
                                            errorBuilder: (a, b, c) =>
                                                Image.asset(
                                                  'assets/images/logo.png',
                                                  width: 40.w,
                                                  height: 40.w,
                                                ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ));
                        },
                        child: SvgPicture.asset(
                          'assets/images/edit_icon.svg',
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24.w,
                      right: 20.w,
                      child: InkWell(
                        onTap: () {
                          // Edit First Name & Last Name
                          Get.defaultDialog(
                              backgroundColor: blackApp,
                              titlePadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              title: '',
                              actions: [],
                              content: Container(
                                padding: EdgeInsets.zero,
                                // height: 350.w,
                                width: size.width,
                                decoration: const BoxDecoration(
                                  color: blackApp,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        SvgPicture.asset(
                                          'assets/images/edit_icon.svg',
                                          height: 15.w,
                                          width: 15.w,
                                          color: yellow,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Edit',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: white),
                                              ),
                                              TextSpan(
                                                text: ' Details.',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: yellow),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: const Divider(
                                        color: white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: TextFormField(
                                        // initialValue: controller.user.firstName,
                                        controller: controller.firstName,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: const Color(0xffFFC016),
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
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          labelText: 'First name',
                                          labelStyle: TextStyle(
                                            fontSize: 18.sp,
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
                                            return "firstname can't be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: TextFormField(
                                        // initialValue: controller.user.lastName,
                                        controller: controller.lastName,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: const Color(0xffFFC016),
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
                                                color: Color(0xffFFFFFF)),
                                          ),
                                          labelText: 'Last name',
                                          labelStyle: TextStyle(
                                            fontSize: 18.sp,
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
                                            return "lastname can't be empty";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.updateUserName();
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          height: 35.w,
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
                                            borderRadius:
                                            BorderRadius.circular(5.w),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Update',
                                              style: TextStyle(color: white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    )
                                  ],
                                ),
                              ));
                        },
                        child: SvgPicture.asset(
                          'assets/images/edit_icon.svg',
                          height: 15.w,
                          width: 15.w,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80.w,
                      top: 25.w,
                      child: Text(
                        '${controller.userFirstName.value} ${controller.userLastName.value}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      left: 80.w,
                      top: 50.w,
                      child: Text(
                        'Change avatar',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: black,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Container(
                width: size.width,
                // height: 380.w,
                decoration: BoxDecoration(
                    color: blackApp,
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    border: Border.all(color: yellow, width: 1.w)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/images/profile_logo.svg'),
                            SizedBox(
                              width: 5.w,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Profile',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: yellow),
                                  ),
                                  TextSpan(
                                    text: ' Info.',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: Divider(
                          height: 1.w,
                          thickness: 1.w,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: SvgPicture.asset(
                              'assets/images/profile_info_name.svg',
                              height: 12.w,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.userFirstName.value,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.w),
                            child: SvgPicture.asset(
                              'assets/images/gender.svg',
                              height: 13.w,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.gender,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: SvgPicture.asset(
                              'assets/images/email.svg',
                              height: 10.w,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Email ID',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.email,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/mobile.svg',
                            height: 14.w,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.mobileNo,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/default_language.svg',
                            height: 12.w,
                            width: 12.w,
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            'Default Language',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.defaultLanguage,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/designation.svg',
                            height: 13.w,
                            width: 13.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Designation',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.designation,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/teamwork.svg',
                            height: 13.w,
                            width: 13.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Team Name',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.teamName,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/location.svg',
                            height: 16.w,
                            width: 15.w,
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              'Base Location',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.baseLocation,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Visibility(visible: controller.user.roleId==1,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/manager_name.svg',
                                  height: 13.w,
                                  width: 13.w,
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1.w),
                                  child: Text(
                                    'Manager Name',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: yellow,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.w),
                                  child: Text(
                                    controller.user.managerName,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/company_name.svg',
                            height: 11.w,
                            width: 11.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Company Name',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          // const Spacer(),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.w),
                              child: Text(
                                controller.user.companyName,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [SvgPicture.asset(
                          'assets/images/unique_code.svg',
                          height: 13.w,
                          width: 13.w,
                        ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Org Unique Code',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.uniqueCode,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/member_since.svg',
                            height: 13.w,
                            width: 13.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Member Since',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.memberSince,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/last_active.svg',
                            height: 13.w,
                            width: 13.w,
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Text(
                            'Last Active On',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: yellow,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              controller.user.lastActiveOn,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Visibility(visible: controller.user.userProfileUpdatedAt.isNotEmpty,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Data last updated on ${controller.user.userProfileUpdatedAt}',
                      style: TextStyle(color: white,fontSize: 12.sp),
                    )),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(visible: controller.user.roleId!=3,
                    child: InkWell(
                      onTap: (() {
                        Get.toNamed(ApplicationPages.myConcernScreen);
                      }),
                      child: Container(
                        height: 35.w,
                        width: size.width * 0.42,
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
                              'Raised Concern',
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
                    child: Container( margin: EdgeInsets.only(left: 5.w),
                      height: 35.w,
                      width: size.width * 0.42,
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
                            'assets/images/privacy_policy.svg',
                            height: 15.w,
                          ),
                          SizedBox(width: 5.w),
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Text(
                              'Privacy policy',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
