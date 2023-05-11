import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/literals.dart';
import '../my_josh/controller/my_josh_controller.dart';
import 'controller/team_performance_controller.dart';

class TeamPerformanceScreen extends GetWidget<TeamPerformanceController> {
  const TeamPerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initializing the gradient variable for the series.
    const LinearGradient linearGradient = LinearGradient(
      colors: <Color>[
        green,
        green,
        green,
        green,
      ],
      stops: <double>[0.1, 0.3, 0.5,0.7],
      // Setting alignment for the series gradient
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackApp,
        appBar: const AppBarWithBackButton(),
        body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: Obx(
            () => LoadingAndErrorScreen(
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.onRefresh,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.w,
                          ),
                          const UserProfile(),
                          SizedBox(height: 10.w),
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
                                    text: 'Team',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white),
                                  ),
                                  TextSpan(
                                    text: ' performance',
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
                          SizedBox(height: 10.w),
                          Container(
                            height: 75.w,
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
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 12.w, left: 20.w, right: 0.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.teamPerformanceModel.value
                                            .teamMemberCount
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: const Color(0xffFFC000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 5.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Total Team\nMembers',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: const VerticalDivider(
                                    color: white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 12.w, left: 5.w, right: 5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.teamPerformanceModel.value
                                            .managerKpiMetData
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: const Color(0xffFFC000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'KPI\'s Met',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: const VerticalDivider(
                                    color: white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 12.w, left: 0.w, right: 20.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller
                                            .teamPerformanceModel.value.kpiWip
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: const Color(0xffFFC000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'KPI\'s WIP',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
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
                                    text: 'Team',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white),
                                  ),
                                  TextSpan(
                                    text: ' performance',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: yellow),
                                  ),
                                ]),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: '',
                                    titlePadding: EdgeInsets.zero,
                                    backgroundColor: blackApp,
                                    content: Obx(() => Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: 'Apply',
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          color: yellow)),
                                                  TextSpan(
                                                      text: ' Filter',
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                          FontWeight.w700,
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
                                        SizedBox(height: 10.w),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: const Divider(
                                            color: white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Select Name',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: white),
                                              ),
                                            ),
                                            Expanded(flex: 1,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    dropdownColor: black,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 12.w,
                                                      color: white,
                                                    ),
                                                    value: controller.selectName.value,
                                                    items: controller
                                                        .employeeModel.value.employees
                                                        ?.map((selectNameData) {
                                                      return DropdownMenuItem(
                                                        value: selectNameData.id,
                                                        child: Text(
                                                          '${selectNameData.userFirstName} ${selectNameData.userLastName}',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: yellow),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: ((int? selectName) {
                                                      controller.selectName.value =
                                                      selectName!;
                                                    })),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(flex:1,
                                              child: Text(
                                                'Select KPI',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: white),
                                              ),
                                            ),
                                            Expanded(flex: 1,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    isExpanded: true,
                                                    dropdownColor: black,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 12.w,
                                                      color: white,
                                                    ),
                                                    value: controller.selectKPI.value,
                                                    items: controller
                                                        .kpiListModel.value.kpiData
                                                        ?.map((selectKpiData) {
                                                      return DropdownMenuItem(
                                                        value: selectKpiData.id,
                                                        child: Text(
                                                          maxLines:1,
                                                          softWrap: false,
                                                          overflow: TextOverflow.fade,
                                                          selectKpiData.name,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: yellow),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: ((int? selectKpiName) {
                                                      controller.selectKPI.value =
                                                      selectKpiName!;
                                                    })),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Time Period',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: white),
                                              ),
                                            ),
                                            Expanded(flex: 1,
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(isExpanded: true,
                                                    dropdownColor: black,
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 12.w,
                                                      color: white,
                                                    ),
                                                    value: controller
                                                        .selectTimePeriod
                                                        .value,
                                                    items: controller
                                                        .timePeriod
                                                        .map((String
                                                    selectTimePeriodData) {
                                                      return DropdownMenuItem(
                                                        value: selectTimePeriodData,
                                                        child: Text(
                                                          selectTimePeriodData,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: yellow),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: ((String?
                                                    selectedTimePeriodName) {
                                                      controller
                                                          .selectTimePeriod
                                                          .value =
                                                          selectedTimePeriodName
                                                              .toString();
                                                    })),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Get.back();
                                            controller.getTeamPerformanceList();
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    const Text(
                                                      'Apply',
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/images/filter.svg',
                                                        height: 12.w)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text('Filter ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: white)),
                                    SvgPicture.asset(
                                      'assets/images/filter.svg',
                                      height: 12.w,
                                      width: 12.w,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            // height: 220.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.w,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          'KPI List',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          'Target',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          'Actual',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          'Gap',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w700,
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.w),
                                Divider(
                                  color: yellow,
                                  thickness: 1.w,
                                ),
                                ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.teamPerformanceModel.value
                                          .kpiData?.length ??
                                      0,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.zero,
                                        height: 25.w,
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                child: Text(
                                                  controller
                                                      .teamPerformanceModel
                                                      .value
                                                      .kpiData![index]
                                                      .kpiName,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      // fontWeight: FontWeight.w400,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: yellow,
                                              thickness: 1.w,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  controller
                                                      .teamPerformanceModel
                                                      .value
                                                      .kpiData![index]
                                                      .totalTarget
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: yellow,
                                              thickness: 1.w,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  controller
                                                      .teamPerformanceModel
                                                      .value
                                                      .kpiData![index]
                                                      .totalActual
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              color: yellow,
                                              thickness: 1.w,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Center(
                                                child: Text(
                                                  controller
                                                      .teamPerformanceModel
                                                      .value
                                                      .kpiData![index]
                                                      .totalGap
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: yellow,
                                      )
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
                                  ' (Time series)',
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
                        ],
                      ),
                    ),



                    SfCartesianChart(
                        trackballBehavior: TrackballBehavior(enable: false),
                        primaryYAxis: NumericAxis(
                          majorGridLines: const MajorGridLines(width: 0.8,color: Colors.grey),
                          labelFormat: '{value}%',
                          // majorTickLines: MajorTickLines(size: 15),
                          labelStyle: const TextStyle(color: white),
                          maximum: 100,
                          interval: 10,
                          minimum: 0,
                        ),
                        primaryXAxis: CategoryAxis(labelPlacement: LabelPlacement.onTicks,
                            majorGridLines: const MajorGridLines(width: 0.8,color: Colors.grey),
                            visibleMinimum: 1,
                            interval: 1,
                            // minimum: 5,
                            visibleMaximum: 5,
                            // labelRotation: -60,
                            labelStyle:
                                const TextStyle(color: white, fontSize: 8)),
                        // title: ChartTitle(text: 'Moodalytics Data'),
                        legend: Legend(isVisible: false),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        enableAxisAnimation: false,
                        zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
                        series: <ChartSeries<SalesData, String>>[
                          AreaSeries<SalesData, String>(
                            gradient: linearGradient,opacity: .4 ,
                              borderWidth: 2,
                              borderColor: greenDark,
                              // color: green,
                              dataSource: controller.data,
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              name: '',
                              // Enable data label
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,textStyle: TextStyle(fontSize: 12.sp),
                                color: Colors.transparent,
                              ))
                        ]),




                    Center(
                      child: Text(
                        'Data Last refreshed on ${controller.currentDateTime}',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
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
