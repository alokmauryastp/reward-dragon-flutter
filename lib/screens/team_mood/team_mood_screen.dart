import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/screens/team_mood/controller/team_mood_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/literals.dart';

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

class TeamMoodScreen extends GetWidget<TeamMoodController> {
  const TeamMoodScreen({Key? key}) : super(key: key);

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
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              errorResolvingFunction: controller.onRefresh,
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
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
                            Visibility(visible: controller.user.roleId==3,
                              child: Container(
                                width: size.width * 1,
                                height: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.w),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [white, yellow],
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      dropdownColor: white,
                                      style: const TextStyle(color: blackApp),
                                      value: controller.selectedTeamId.value,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: black,
                                      ),
                                      items: controller.teamListRewardResource.value.data?.map((items) {
                                        return DropdownMenuItem(
                                          value: items.teamId,
                                          child: Text(
                                            items.teamName,
                                            style: const TextStyle(color: blackApp),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (int? newValue) {
                                        controller.selectedTeamId.value = newValue!;
                                        controller.getExecutiveTeamMoodToday();
                                        controller.executiveReasonPieChartData();
                                        controller.getJoshTodayForExecutive();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              height: 150.w,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.w,
                                        ),
                                        Image.asset(
                                          'assets/images/satisfied.png',
                                          height: 50.w,
                                        ),
                                        SizedBox(
                                          height: 15.w,
                                        ),
                                        Text(
                                          'Josh For\n  Today',
                                          style: TextStyle(
                                              fontSize: 28.sp,
                                              color: white,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Team',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Container(
                                          height: 100.w,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.w),
                                            border: Border.all(color: yellow),
                                            gradient: yellowGradient,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                controller.teamMoodText.value,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                              SizedBox(
                                                height: 15.w,
                                              ),
                                              Image.asset(
                                                controller.teamMoodImage.value,
                                                height: 50.w,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Me',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Container(
                                          height: 100.w,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.w),
                                            border: Border.all(color: yellow),
                                            gradient: okayMoodGradient,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Text(
                                                controller.myMoodText.value,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black),
                                              ),
                                              SizedBox(
                                                height: 15.w,
                                              ),
                                              Image.asset(
                                                controller.myMoodImage.value,
                                                height: 50.w,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              height: 80.w,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.w),
                                  topRight: Radius.circular(10.w),
                                ),
                                border: Border.all(color: yellow),
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
                                      //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${controller.teamMoodToday.value.percentRespondentToday}%',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Respondents',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '(Today)',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider(
                                      color: Colors.white,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${controller.teamMoodToday.value.avgScoreToday?.toInt()}%',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Average Score',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '(Today)',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: 235.w,
                              decoration: BoxDecoration(
                                gradient: blackGradient,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.w),
                                  bottomRight: Radius.circular(10.w),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.w),
                                  Stack(
                                    children: [
                                      Image.asset(
                                          'assets/images/team_mood_smiley_background.png'),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0.w,
                                            left: 15.w,
                                            right: 15.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/happy.png',
                                              height: 40.w,
                                              width: 40.w,
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Image.asset(
                                              'assets/images/satisfied.png',
                                              height: 40.w,
                                              width: 40.w,
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Image.asset(
                                              'assets/images/okay.png',
                                              height: 40.w,
                                              width: 40.w,
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Image.asset(
                                              'assets/images/sad.png',
                                              height: 40.w,
                                              width: 40.w,
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Image.asset(
                                              'assets/images/angry.png',
                                              height: 40.w,
                                              width: 40.w,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Scores',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: white),
                                            ),
                                            TextSpan(
                                              text: ' Today',
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
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: SizedBox(
                                      height: 20.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${controller.teamMoodToday.value.todayScores?.five.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.todayScores?.four.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.todayScores?.three.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.todayScores?.two.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.todayScores?.one.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Scores',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: white),
                                            ),
                                            TextSpan(
                                              text: ' Yesterday',
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
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: SizedBox(
                                      height: 20.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayScores?.five.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayScores?.four.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayScores?.three.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayScores?.two.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayScores?.one.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'KPI',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: white),
                                            ),
                                            TextSpan(
                                              text: ' Met',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: white),
                                            ),
                                            TextSpan(
                                              text: ' Yesterday',
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
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    child: SizedBox(
                                      height: 20.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayKpiMetPercent?.five.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayKpiMetPercent?.four.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayKpiMetPercent?.three.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayKpiMetPercent?.two.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const VerticalDivider(
                                            color: yellow,
                                          ),
                                          Text(
                                            '${controller.teamMoodToday.value.yesterdayKpiMetPercent?.one.toInt()}%',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
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
                              padding: EdgeInsets.only(left: 5.w),
                              child: Text(
                                '(Time series)',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SfCartesianChart(
                          legend: Legend(
                              textStyle: const TextStyle(color: white),
                              isVisible: true,
                              isResponsive: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              position: LegendPosition.bottom),
                          primaryYAxis: NumericAxis(
                              labelStyle: const TextStyle(color: white),
                              labelFormat: '{value}%',
                              maximum: 100,
                              minimum: 0,
                              interval: 20),
                          primaryXAxis: CategoryAxis(
                              labelStyle: const TextStyle(color: white),
                              autoScrollingMode: AutoScrollingMode.end,
                              autoScrollingDelta: 2,
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              // maximum: 5,
                              // minimum: 1,

                              interval: 1,
                              // visibleMinimum: 0,
                              visibleMaximum: 3),
                          zoomPanBehavior: ZoomPanBehavior(
                              enablePanning: true, enablePinching: false),
                          enableAxisAnimation: false,
                          // Event to customize the legend on rendering
                          onLegendItemRender: (args) {
                            // Setting color for the series legend based on its index.
                            if (args.seriesIndex == 0) {
                              args.color = blueChart;
                            }
                            if (args.seriesIndex == 1) {
                              args.color = orangeChart;
                            }

                          },
                          series: <ChartSeries<BarData, int>>[
                            ColumnSeries<BarData, int>(
                                name: 'Mood Scores Today',
                                // legendItemText: 'text',
                                trackColor: white,
                                color: Colors.transparent,
                                borderWidth: 1,

                                borderColor: blueChart,
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                        color: white, fontSize: 10)),
                                dataSource: controller.barData,
                                xValueMapper: (BarData data, _) => data.x,
                                yValueMapper: (BarData data, _) => data.y,
                                // Width of the columns
                                width: 0.8,
                                // Spacing between the columns
                                spacing: 0.2),
                            ColumnSeries<BarData, int>(
                                name: 'Mood Scores Yesterday',
                                borderColor: orangeChart,
                                color: Colors.transparent,
                                borderWidth: 1,
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                        color: white, fontSize: 10)),
                                dataSource: controller.barData,
                                xValueMapper: (BarData data, _) => data.x,
                                yValueMapper: (BarData data, _) => data.y1,
                                // Width of the columns
                                width: 0.8,
                                // Spacing between the columns
                                spacing: 0.2),
                            ColumnSeries<BarData, int>(
                                name: 'KPI Met % Yesterday',
                                borderColor: white,
                                color: greenDark,
                                borderWidth: 1,
                                dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                        color: white, fontSize: 10)),
                                dataSource: controller.barData,
                                xValueMapper: (BarData data, _) => data.x,
                                yValueMapper: (BarData data, _) => data.y2,
                                // Width of the columns
                                width: 0.8,
                                // Spacing between the columns
                                spacing: 0.2),
                          ]),
                      SizedBox(height: 10.w),
                      controller.chartData.isNotEmpty ? 
                      SfCircularChart(
                          margin: EdgeInsets.zero,
                          legend: Legend(
                              isVisible: true,
                              textStyle: const TextStyle(color: white),
                              position: LegendPosition.left),
                          series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartData, String>(
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                                dataSource: controller.chartData,
                                explodeAll: true,
                                explode: true,
                                explodeOffset: '2',
                                dataLabelMapper: (ChartData data, _) =>
                                    '${data.y.toInt()}%',
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]) :
                      SizedBox(
                          height: 100.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/no_challenge.png',
                                height: 50.w,
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Text(
                                'No Data found for low mood!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                              ),
                            ],
                          )),
                      Center(
                        child: Text(
                          'Reason for scores below 4',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
