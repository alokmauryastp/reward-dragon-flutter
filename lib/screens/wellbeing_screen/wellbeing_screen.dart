import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/my_resources/controller/my_resources_controller.dart';
import 'package:flutter_state_management/screens/wellbeing_screen/controller/wellbeing_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Wellbeing extends GetWidget<WellbeingController> {
  const Wellbeing({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final controller = Get.put(WellbeingController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const DashboardAppbar(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Obx(
              () => LoadingAndErrorScreen(
                errorOccurred: controller.errorOccurred.value,
                isLoading: controller.isLoading.value,
                errorResolvingFunction: controller.onRefresh,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.w,
                        ),
                        Container(padding: const EdgeInsets.all(10),
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
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 4, 0),
                                  blurRadius: 5),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Wellbeing Progress\nScore',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controller.wellBeingList.value.wellbeingPercent}%',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.w,
                              ),
                              StepProgressIndicator(
                                padding: 0,
                                totalSteps: 100,
                                currentStep: controller
                                        .wellBeingList.value.wellbeingPercent
                                        ?.toInt() ??
                                    0,
                                size: 15.w,
                                unselectedColor: white,
                                roundedEdges: Radius.circular(10.w),
                                selectedGradientColor: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff007220),
                                    Color(0xff57FF09)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          height: 35.w,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff414141),
                                Color(0xff000000),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/google_icon.svg',
                                  height: 35.w),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                'Google Fit Connected',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                'assets/images/green_circle.svg',
                                height: 20.w,
                                width: 20.w,
                                color:controller.isGoogleFitConnected.value ? green:  red,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
                          child: Container(
                            height: 30.w,padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            width: size.width,
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
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: false,
                                isDense: false,
                                dropdownColor: blackApp,
                                style: TextStyle(
                                    color: yellow,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                                value: controller.timeDropdownValue.value,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: white,
                                  size: 14.w,
                                ),
                                items: controller.timePeriod.map((String time) {
                                  return DropdownMenuItem(
                                    value: time,
                                    child: Text(time,style: TextStyle(
                                        color: yellow,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400),),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.timeDropdownValue.value = newValue.toString();
                                  controller.getWellBeingList();
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    height: 131.w,
                                    width: 181.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0.w),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/card_blue.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 54.w,
                                    left: 8.w,
                                    child: Image.asset(
                                      'assets/images/blue_cut_big.png',
                                      height: 68.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 66.w,
                                    child: Image.asset(
                                      'assets/images/blue_cut_big.png',
                                      height: 54.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: -8.w,
                                    child: Image.asset(
                                      'assets/images/blue_cut_big.png',
                                      height: 44.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 108.w,
                                    top: 14.w,
                                    child: SvgPicture.asset(
                                      'assets/images/steps.svg',
                                      width: 21.w,
                                      height: 24.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 12.w,
                                    child: Text(
                                      'Body',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 34.w,
                                    child: Text(
                                      'Steps Taken',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 66.w,
                                    child: Row(
                                      children: [
                                        Text(
                                          controller
                                              .wellBeingList.value.stepsCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            ' Steps',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 131.w,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0.w),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/card_pink.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 54.w,
                                    left: 8.w,
                                    child: Image.asset(
                                      'assets/images/pink_card_big.png',
                                      height: 68.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 66.w,
                                    child: Image.asset(
                                      'assets/images/pink_card_big.png',
                                      height: 54.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: -8.w,
                                    child: Image.asset(
                                      'assets/images/pink_card_big.png',
                                      height: 44.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 100.w,
                                    top: 14.w,
                                    child: SvgPicture.asset(
                                      'assets/images/meditation.svg',
                                      width: 42.w,
                                      height: 30.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 12.w,
                                    child: Text(
                                      'Mind',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 34.w,
                                    child: Text(
                                      'Meditation',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 66.w,
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.wellBeingList.value
                                              .meditationHours
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            ' Mins',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: white),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    height: 131.w,
                                    width: 181.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0.w),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/card_orange.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 54.w,
                                    left: 8.w,
                                    child: Image.asset(
                                      'assets/images/red_card_big.png',
                                      height: 68.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 66.w,
                                    child: Image.asset(
                                      'assets/images/red_card_big.png',
                                      height: 54.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: -8.w,
                                    child: Image.asset(
                                      'assets/images/red_card_big.png',
                                      height: 44.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 110.w,
                                    top: 20.w,
                                    child: SvgPicture.asset(
                                      'assets/images/learning.svg',
                                      width: 29.w,
                                      height: 30.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 12.w,
                                    child: Text(
                                      'Soul',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 34.w,
                                    child: Text(
                                      'Learning Hrs.',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 66.w,
                                    child: Row(
                                      children: [
                                        Text(
                                          controller
                                              .wellBeingList.value.learningHours
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            'Mins',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 131.w,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0.w),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/card_purple.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 54.w,
                                    left: 8.w,
                                    child: Image.asset(
                                      'assets/images/purple_card_big.png',
                                      height: 68.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 66.w,
                                    child: Image.asset(
                                      'assets/images/purple_card_big.png',
                                      height: 54.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75.w,
                                    left: -8.w,
                                    child: Image.asset(
                                      'assets/images/purple_card_big.png',
                                      height: 44.77.w,
                                      width: 90.46.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 110.w,
                                    top: 18.w,
                                    child: SvgPicture.asset(
                                      'assets/images/heart_soul.svg',
                                      width: 29.w,
                                      height: 26.w,
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 12.w,
                                    child: Text(
                                      'Heart',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 28.w,
                                    child: Text(
                                      'Points',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: white),
                                    ),
                                  ),
                                  Positioned(
                                    left: 14.w,
                                    top: 66.w,
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.wellBeingList.value
                                              .heartPointsCount
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            'Pts',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: white),
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
                        SizedBox(
                          height: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: SvgPicture.asset(
                                  'assets/images/open_inverted.svg',
                                  width: 12.w,
                                  height: 9.w,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                controller.habitOfTheDayMessage.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: white, fontSize: 18.sp),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 180.w),
                                  SvgPicture.asset(
                                    'assets/images/close_inverted.svg',
                                    width: 12.w,
                                    height: 9.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.w,
                        ),
                        InkWell(
                          onTap: () =>
                              Get.toNamed(ApplicationPages.myJoshScreen),
                          child: Container(
                            height: 60.w,
                            width: size.width,
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
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 20.w,
                                  left: 50.w,
                                  child: Text(
                                    'Josh for Today',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 180.w,
                                  top: 10.w,
                                  child: Image.asset(
                                    'assets/images/satisfied.png',
                                    height: 40.w,
                                    width: 40.w,
                                  ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/meditation.svg',
                              width: 18.w,
                              height: 14.w,
                              color: yellow,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                'Focused Wellbeing',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              ),
                            ),
                            Divider(
                              color: white,
                              height: 1.w,
                              thickness: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        SizedBox(
                            height: 150.w,
                            width: size.width,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.healthFitnessModel.value
                                      .leadershipListData?.length ??
                                  0,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.toNamed(
                                      ApplicationPages.videoPlayerScreen,
                                      arguments: [
                                        "health",
                                        MyResourcesController().getVideoId(
                                            controller
                                                .healthFitnessModel
                                                .value
                                                .leadershipListData![index]
                                                .videoUrl),
                                        controller.healthFitnessModel.value
                                            .leadershipListData![index].id
                                      ]);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5.w,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.w),
                                        ),
                                      ),
                                      margin: EdgeInsets.all(5.w),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://img.youtube.com/vi/${MyResourcesController().getVideoId(controller.healthFitnessModel.value.leadershipListData![index].videoUrl)}/0.jpg',
                                        fit: BoxFit.fill,
                                        height: 102.w,
                                        width: 120.w,
                                        placeholder: (context, url) => SizedBox(
                                          height: 5.w,
                                          width: 5.w,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: yellow,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: yellow,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 110.w,
                                        child: Text(
                                          controller.healthFitnessModel.value
                                              .leadershipListData![index].title,
                                          maxLines: 2,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 1.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/meditation.svg',
                              width: 18.w,
                              height: 14.w,
                              color: yellow,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                'Learn for Fun',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              ),
                            ),
                            Divider(
                              color: white,
                              height: 1.w,
                              thickness: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        SizedBox(
                            height: 150.w,
                            width: size.width,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.skillHobbyModel.value
                                      .skillAndHobbyData?.length ??
                                  0,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => Get.toNamed(
                                    ApplicationPages.videoPlayerScreen,
                                    arguments: [
                                      "skill",
                                      MyResourcesController().getVideoId(
                                          controller
                                              .skillHobbyModel
                                              .value
                                              .skillAndHobbyData![index]
                                              .siteUrl),
                                      controller.skillHobbyModel.value
                                          .skillAndHobbyData![index].id
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5.w,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.w),
                                        ),
                                      ),
                                      margin: EdgeInsets.all(5.w),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://img.youtube.com/vi/${MyResourcesController().getVideoId(controller.skillHobbyModel.value.skillAndHobbyData![index].siteUrl)}/0.jpg',
                                        fit: BoxFit.fill,
                                        height: 102.w,
                                        width: 120.w,
                                        placeholder: (context, url) => SizedBox(
                                          height: 5.w,
                                          width: 5.w,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: yellow,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/images/logo.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 110.w,
                                        child: Text(
                                          controller.skillHobbyModel.value
                                              .skillAndHobbyData![index].title,
                                          maxLines: 2,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 1.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/images/meditation.svg',
                              width: 18.w,
                              height: 14.w,
                              color: yellow,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                'Inspired Living',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              ),
                            ),
                            Divider(
                              color: white,
                              height: 1.w,
                              thickness: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        SizedBox(
                            height: 150.w,
                            width: size.width,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.inspiredLivingModel.value
                                      .financeAndArtData?.length ??
                                  0,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => Get.toNamed(
                                    ApplicationPages.videoPlayerScreen,
                                    arguments: [
                                      "inspiredLiving",
                                      MyResourcesController().getVideoId(
                                          controller
                                              .inspiredLivingModel
                                              .value
                                              .financeAndArtData![index]
                                              .siteUrl),
                                      controller.inspiredLivingModel.value
                                          .financeAndArtData![index].id
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 5.w,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.w),
                                        ),
                                      ),
                                      margin: EdgeInsets.all(5.w),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://img.youtube.com/vi/${MyResourcesController().getVideoId(controller.inspiredLivingModel.value.financeAndArtData![index].siteUrl)}/0.jpg',
                                        fit: BoxFit.fill,
                                        height: 102.w,
                                        width: 120.w,
                                        placeholder: (context, url) => SizedBox(
                                          height: 5.w,
                                          width: 5.w,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              color: yellow,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: yellow,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 110.w,
                                        child: Text(
                                          controller.inspiredLivingModel.value
                                              .financeAndArtData![index].title,
                                          maxLines: 2,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
