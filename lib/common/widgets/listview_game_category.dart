import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/game_time_screen/controller/game_time_controller.dart';
import 'package:get/get.dart';

import '../../constants/literals.dart';

class GameCategory extends GetWidget<GameTimeController> {
  const GameCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.gameCategoryModel.value.gameCategories?.length??0 ,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 5.w, top: 8.w, bottom: 8.w),
        child: InkWell(
          onTap: () {
            controller.selectedIndex.value = index;
            controller.getGameList();
          },
          child: Obx(() => Container(
            decoration: BoxDecoration(
              border : controller.selectedIndex.value == index ?   Border.all(color: yellowApp) : Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20.w)),
              gradient: const LinearGradient(
                colors: [Color(0xff404040), Color(0xff010101)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  controller.gameCategoryModel.value.gameCategories![index]
                      .gameCategory
                      .toString(),
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.w),
                ),
              ),
            ),
          ),)
        ),
      ),
    ));
  }
}
