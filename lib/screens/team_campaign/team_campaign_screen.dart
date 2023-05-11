import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/team_campaign_list.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/team_campaign/controller/team_campaign_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../common/screens/loading_and_error_screen.dart';

class TeamCampaignScreen extends GetWidget<TeamCampaignController> {
  const TeamCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
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
                children: [
                  SizedBox(
                    height: 10.w,
                  ),
                  const UserProfile(),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/team_campaign_tick.svg',
                        height: 14.w,
                        width: 14.w,
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
                            text: ' Campaigns',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: yellow),
                          ),
                        ]),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Running',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                          TextSpan(
                            text: ' Campaigns ',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: yellow),
                          ),
                          TextSpan(
                            text: controller
                                .campaignData.value.totalCampaignsRunning
                                .toString(),
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  const TeamCampaignList(),
                  SizedBox(
                    height: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      createCampaignBottomSheet(context);
                    },
                    child: Container(
                      height: 70.w,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/team_campaign_tick.svg',
                                  height: 14.w,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Team Campaign',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: yellow,
                                ),
                                SizedBox(
                                  width: 15.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '(Create / Review your campaign)',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                                Text(
                                  'Add new',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate) {
      controller.selectedDate = picked;
      controller.startDate.value = picked.toString().substring(0, 10);
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate) {
      controller.selectedDate = picked;
      controller.endDate.value = picked.toString().substring(0, 10);
    }
  }

  void createCampaignBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TeamCampaignController controller = Get.find();
    Get.bottomSheet(
        Obx(() => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15.w,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Create New',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: white),
                          ),
                          TextSpan(
                            text: ' Campaign',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: yellow),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: const Divider(
                        color: white,
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Campaign Name',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: yellow,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            showCursor: true,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.6),
                            ),
                            cursorColor: yellow,
                            cursorHeight: 14.w,
                            cursorWidth: 0.8.w,
                            controller: controller.campaignName,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter name',
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 7.w),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: white, width: 0.w),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: white, width: 0.w),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Industry Work Type',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: yellow,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                              dropdownColor: black,
                              value: controller.industryWorkData.value
                                  .industryWorkData?.first.id
                                  .toString(),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: white,
                                size: 14.w,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0.w, vertical: 5.w),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: white, width: 0.w),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: white, width: 0.w),
                                ),
                              ),
                              items: controller
                                  .industryWorkData.value.industryWorkData
                                  ?.map(
                                    (value) => DropdownMenuItem(
                                      value: value.id.toString(),
                                      child: Text(
                                        value.name,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                controller.industryWorkId.value =
                                    newValue.toString();
                                controller.getKpiListData();
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Campaign Purpose',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: yellow,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                              dropdownColor: black,
                              value: controller.campaignPurposeModel.value
                                  .campaignPurpose?.first.id
                                  .toString(),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: white,
                                size: 14.w,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0.w, vertical: 5.w),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: white, width: 0.w),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: white, width: 0.w),
                                ),
                              ),
                              items: controller
                                  .campaignPurposeModel.value.campaignPurpose
                                  ?.map(
                                    (value) => DropdownMenuItem(
                                      value: value.id.toString(),
                                      child: Text(
                                        value.purposeName,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? newValue) {
                                controller.campaignPurposeId.value =
                                    newValue.toString();
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'Start Date',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            SizedBox(
                              // height: 40.w,
                              width: 125.w,
                              child: InkWell(
                                  onTap: () => _selectDate(context),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      controller.startDate.value,
                                      style: const TextStyle(color: white),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'KPI',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: yellow),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                        Container(color: red, width: 50.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'End Date',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            SizedBox(
                              // height: 40.w,
                              width: 125.w,
                              child: InkWell(
                                  onTap: () => _selectEndDate(context),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      controller.endDate.value,
                                      style: const TextStyle(color: white),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'Target',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: yellow,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: yellow),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (controller.kpiModel.value.kpiNameData?.length != null)
                      Obx(() => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              controller.kpiModel.value.kpiNameData?.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Obx(() => InkWell(
                                      onTap: () {
                                        if (controller
                                            .kpiModel
                                            .value
                                            .kpiNameData![index]
                                            .isSelected
                                            .value) {
                                          controller
                                              .kpiModel
                                              .value
                                              .kpiNameData![index]
                                              .isSelected
                                              .value = false;
                                        } else {
                                          controller
                                              .kpiModel
                                              .value
                                              .kpiNameData![index]
                                              .isSelected
                                              .value = true;
                                        }
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: SizedBox(
                                          width: 20.w,
                                          child: controller
                                                  .kpiModel
                                                  .value
                                                  .kpiNameData![index]
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
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    controller.kpiModel.value
                                        .kpiNameData![index].name,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: yellow,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.w,
                                  width: 125.w,
                                  child: InkWell(
                                    onTap: () {
                                      if (controller
                                                  .kpiModel
                                                  .value
                                                  .kpiNameData![index]
                                                  .kpiUnit ==
                                              'Minutes' ||
                                          controller
                                                  .kpiModel
                                                  .value
                                                  .kpiNameData![index]
                                                  .kpiUnit ==
                                              'Seconds') {
                                        final hourController =
                                            TextEditingController();
                                        final minutesController =
                                            TextEditingController();
                                        Get.defaultDialog(
                                          backgroundColor: blackApp,
                                          contentPadding: EdgeInsets.all(0.w),
                                          titlePadding: EdgeInsets.all(0.w),
                                          title: '',
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/images/filter.svg',
                                                    height: 12.w,
                                                    width: 12.w,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text: 'Enter',
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: yellow)),
                                                        TextSpan(
                                                            text: ' Time',
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: yellow)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.w),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w),
                                                child: const Divider(
                                                  color: white,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: size.width * 0.25,
                                                    child: TextFormField(
                                                      maxLength: 5,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                                .fromRGBO(
                                                            255, 255, 255, 0.6),
                                                      ),
                                                      cursorColor: yellow,
                                                      controller:
                                                          hourController,
                                                      cursorHeight: 14.w,
                                                      cursorWidth: 0.8.w,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: 'Hours',
                                                        hintStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(255,
                                                              255, 255, 0.6),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.w,
                                                                    vertical:
                                                                        7.w),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: white,
                                                                  width: 0.w),
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: white,
                                                                  width: 0.w),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                    child: const Text(
                                                      ':',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.25,
                                                    child: TextFormField(
                                                      maxLength: 2,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                                .fromRGBO(
                                                            255, 255, 255, 0.6),
                                                      ),
                                                      cursorColor: yellow,
                                                      controller:
                                                          minutesController,
                                                      cursorHeight: 14.w,
                                                      cursorWidth: 0.8.w,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText: 'Minute',
                                                        hintStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(255,
                                                              255, 255, 0.6),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.w,
                                                                    vertical:
                                                                        7.w),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: white,
                                                                  width: 0.w),
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: white,
                                                                  width: 0.w),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                          .kpiModel
                                                          .value
                                                          .kpiNameData![index]
                                                          .targetController
                                                          .text =
                                                      '${hourController.value.text}:${minutesController.value.text}';
                                                  Get.back();
                                                },
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 30.w,
                                                        width: 120.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Color(0xff54FA09),
                                                              Color(0xff01751E)
                                                            ],
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.w),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Submit',
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      16.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    child: Form(
                                      autovalidateMode: AutovalidateMode.always,
                                      // key: controller.formKey,
                                      child: TextFormField(
                                        enabled: controller
                                                        .kpiModel
                                                        .value
                                                        .kpiNameData![index]
                                                        .kpiUnit ==
                                                    'Minutes' ||
                                                controller
                                                        .kpiModel
                                                        .value
                                                        .kpiNameData![index]
                                                        .kpiUnit ==
                                                    'Seconds'
                                            ? false
                                            : true,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                        ),
                                        cursorColor: yellow,
                                        controller: controller
                                            .kpiModel
                                            .value
                                            .kpiNameData![index]
                                            .targetController,
                                        cursorHeight: 14.w,
                                        cursorWidth: 0.8.w,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Target',
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 7.w),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: white, width: 0.w),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: white, width: 0.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                    SizedBox(height: 10.w),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (controller.validation()) {
                            var ruleList = <Map<String, dynamic>>[];
                            for (var i = 0;i < controller.kpiModel.value.kpiNameData!.length;i++) {
                              if (controller.kpiModel.value.kpiNameData![i].isSelected.value == true) {
                                if (controller.kpiModel.value.kpiNameData![i].targetController.value.text.isNotEmpty) {
                                  var map = <String, dynamic>{
                                    'kpi_id': controller.kpiModel.value.kpiNameData![i].id,
                                    'rule': controller.kpiModel.value.kpiNameData![i].name,
                                    'point': controller.kpiModel.value.kpiNameData![i].targetController.value.text,
                                  };
                                  ruleList.add(map);
                                } else {
                                  Fluttertoast.showToast(msg: 'Target Required of ${controller.kpiModel.value.kpiNameData![i].name}');
                                  return;
                                }
                              }
                            }
                            if(ruleList.isNotEmpty){
                            controller.createCampaign(ruleList);
                            Get.back();
                            } else {
                              Fluttertoast.showToast(msg: 'Select at least on KPI');
                            }
                          }
                        },
                        child: Container(
                          height: 30.w,
                          width: 120.w,
                          decoration: BoxDecoration(
                            gradient: greenGradient,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Center(
                            child: Text(
                              'Broadcast',
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                ),
              ),
            )),
        isScrollControlled: true,
        backgroundColor: blackApp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.w),
          ),
          // side: const BorderSide(color: yellow, strokeAlign: StrokeAlign.outside),
        ));
  }
}
