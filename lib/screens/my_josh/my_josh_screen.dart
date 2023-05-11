import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/mood_today_container.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/literals.dart';
import 'controller/my_josh_controller.dart';


class MyJoshScreen extends GetWidget<MyJoshController> {
  const MyJoshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DashboardController dashboardController = Get.find();
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
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.w,
                                ),
                                const UserProfile(),
                                SizedBox(
                                  height: 10.w,
                                ),
                                const MoodTodayContainer(),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Visibility(visible: !controller.moodSubmitted.value && (controller.selectedEmoji.value==3 || controller.selectedEmoji.value==2 || controller.selectedEmoji.value==1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        color: white,
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Why is your Josh ',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextSpan(
                                              text: 'Low ',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: const Color(0xffF32A5C),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextSpan(
                                              text: 'Today ?',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Container(
                                        height: 30.w,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(color: white),
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: dashboardController
                                                      .user.roleId ==
                                                  1
                                              ? DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    dropdownColor: blackApp,
                                                    value: controller
                                                        .joshReasonId.value,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16.w,
                                                      color: yellow,
                                                    ),
                                                    items: controller
                                                        .customerReasonType
                                                        .value
                                                        .customerReasonType
                                                        ?.map((item) {
                                                      return DropdownMenuItem(
                                                        value: item.id.toString(),
                                                        child: Text(
                                                          item.reasonName,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color: yellow),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newValue) {
                                                      controller.joshReasonId.value = newValue!;
                                                    },
                                                  ),
                                                )
                                              : DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    dropdownColor: blackApp,
                                                    value: controller
                                                        .joshReasonId.value,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16.w,
                                                      color: yellow,
                                                    ),
                                                    items: controller
                                                        .managerReasonType
                                                        .value
                                                        .managerReasonType
                                                        ?.map((item) {
                                                      return DropdownMenuItem(
                                                        value: item.id.toString(),
                                                        child: Text(
                                                          item.reasonName,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color: yellow),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged:
                                                        (String? newValue) {
                                                      controller.joshReasonId
                                                              .value =
                                                          newValue!.toString();
                                                    },
                                                  ),
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      Form(key: controller.formKey,
                                        child: TextFormField(
                                          minLines: 2,
                                          maxLines: 10,
                                          keyboardType: TextInputType.multiline,
                                          controller: controller.descriptionController,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                          ),
                                          cursorColor: const Color(0xffFFC016),
                                          cursorHeight: 18.w,
                                          cursorWidth: 1.w,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 10.w, horizontal: 10.w),
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: white),
                                            ),
                                            labelText: 'Share more',
                                            // hintMaxLines: 2,
                                            hintText: 'Share more details,\nand we will help if possible.....',
                                            hintStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color: white),
                                            labelStyle: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: yellow,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter the text";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                         if(controller.formKey.currentState!.validate()){
                                           controller.descriptionController.clear();
                                           dashboardController.user.roleId == 1
                                               ? controller.submitCustomerJosh()
                                               : controller.submitManagerJosh();
                                         }
                                            },
                                        child: Center(
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
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w700),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: SvgPicture.asset(
                                        'assets/images/team_josh.svg',
                                        height: 10.w,
                                        width: 10.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Team Josh",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFFFFFF)),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 2.w),
                                        child: Container(
                                          color: white,
                                          height: 0.5.w,
                                          width: size.width,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Container(
                                  height: 80.w,
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
                                        left: 10.w,
                                        top: 18.w,
                                        child: SvgPicture.asset(
                                          'assets/images/open_inverted.svg',
                                          width: 9.w,
                                          height: 6.w,
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors
                                      Positioned(
                                        top: 24.w,
                                        left: 20.w,
                                        child: Text(
                                          controller.teamMoodMessage.value,
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 58.w,
                                        top: 47.w,
                                        child: SvgPicture.asset(
                                          'assets/images/close_inverted.svg',
                                          width: 9.w,
                                          height: 6.w,
                                        ),
                                      ),
                                      Positioned(
                                        right: 12.w,
                                        top: 5.w,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              controller.teamMoodImage.value,
                                              height: 50.w,
                                              width: 50.w,
                                            ),Text(
                                              controller.teamMoodText.value,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: SvgPicture.asset(
                                        'assets/images/team_josh.svg',
                                        height: 10.w,
                                        width: 10.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Moodalytics",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFFFFFF)),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '(Trend chart on Mood)',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                              ],
                            ),
                          ),
                          SfCartesianChart(
                              trackballBehavior:
                                  TrackballBehavior(enable: false),
                              primaryYAxis: NumericAxis(
                                majorGridLines: const MajorGridLines(width: 0.3,color: Colors.grey),
                                // majorTickLines: MajorTickLines(size: 15),
                                labelStyle: const TextStyle(color: white),
                                maximum: 5,
                                interval: 1,
                                minimum: 1,
                              ),
                              primaryXAxis: CategoryAxis(labelPlacement: LabelPlacement.onTicks,
                                majorGridLines: const MajorGridLines(width: 0.3,color: Colors.grey),
                                  visibleMinimum: 0,
                                  interval: 1,
                                  // minimum: 5,
                                  visibleMaximum: 6,
                                  labelRotation: -60,
                                  labelStyle: const TextStyle(
                                      color: white, fontSize: 10)),
                              // title: ChartTitle(text: 'Moodalytics Data'),
                              legend: Legend(isVisible: false),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: true),
                              enableAxisAnimation: false,
                              zoomPanBehavior:
                                  ZoomPanBehavior(enablePanning: true),
                              series: <ChartSeries<SalesData, String>>[
                                LineSeries<SalesData, String>(
                                    color: greenLight,
                                    dataSource: controller.data,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    name: '',
                                    // Enable data label
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      color: Colors.transparent,
                                    ))
                              ]),
                        ],
                      )),
                ))),
      ),
    );
  }
}
