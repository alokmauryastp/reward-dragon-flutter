import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:get/get.dart';

import '../../screens/my_resources/controller/my_resources_controller.dart';

class WellBeingScreenCards extends GetWidget {
  const WellBeingScreenCards({super.key});

  @override
  Widget build(BuildContext context) {
    final MyResourcesController controller = Get.put(MyResourcesController());
    return Obx(() => ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount:controller.learningMaterial.value.learningMaterial?.length ?? 0,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.toNamed(ApplicationPages.videoPlayerScreen, arguments: [
                "learning",
                controller.getVideoId(controller.learningMaterial.value
                    .learningMaterial![index].learningSiteUrl),controller.learningMaterial.value.learningMaterial![index].id
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
                        'https://img.youtube.com/vi/${controller.getVideoId(controller.learningMaterial.value.learningMaterial![index].learningSiteUrl)}/0.jpg',
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
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: yellow,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 110.w,
                    child: Text(
                      controller.learningMaterial.value.learningMaterial![index]
                          .title,
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
        ));
  }
}
