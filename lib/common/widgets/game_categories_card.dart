import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/screens/game_time_screen/controller/game_time_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';

class GameCategoriesCards extends GetWidget<GameTimeController> {
  const GameCategoriesCards({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 80 / 100),
        itemCount: controller.gameModel.value.gameNameData?.length ?? 0,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () => Get.defaultDialog(
              backgroundColor: blackApp,
              contentPadding: EdgeInsets.all(0.w),
              titlePadding: EdgeInsets.all(0.w),
              title: '',
              // title: 'Jetpack Joyride',
              // middleText:
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width,
                    child: Image.network(
                      controller.gameModel.value.gameNameData![index].logo,
                      fit: BoxFit.contain,
                      errorBuilder: (a, b, c) =>
                          Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      controller.gameModel.value.gameNameData![index].title,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: white),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Purpose  : ',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: yellow),
                        ),
                        Text(
                          controller.gameModel.value.gameNameData![index].purpose,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Benefits :',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: yellow),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          controller.gameModel.value.gameNameData![index].benefits,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.w),
                  InkWell(
                    onTap: () {
                      if (controller.gameClickable.value) {
                        Get.back();
                        Get.back();
                        Get.toNamed(ApplicationPages.playGameScreen,
                            arguments: [
                              controller.gameModel.value.gameNameData![index].id,
                              controller.gameModel.value.gameNameData![index].gameUrl,
                              int.parse(controller.gameModel.value.gameNameData![index].gameTime)*60,
                            ]);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'You can play after next available time');
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
                            colors: [Color(0xff54FA09), Color(0xff01751E)],
                          ),
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Play',
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset('assets/images/play.svg',
                                height: 16.w)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.w,
                  width: 100.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      controller.gameModel.value.gameNameData![index].logo,
                      fit: BoxFit.fill,
                      height: 90.w,
                      errorBuilder: (a, b, c) =>
                          Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      controller.gameModel.value.gameNameData![index].title,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: white),
                    ))
              ],
            ),
          );
        }));
  }
}
