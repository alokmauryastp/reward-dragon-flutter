import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:get/get.dart';
import '../controller/my_resources_controller.dart';

class LeadershipTalkCards extends GetWidget {
  const LeadershipTalkCards({super.key});

  @override
  Widget build(BuildContext context) {
    final MyResourcesController controller = Get.put(MyResourcesController());
    return Obx(() => ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: controller.leadershipTalk.value.leaderShipTalkList?.length ?? 0,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.toNamed(ApplicationPages.videoPlayerScreen, arguments: [
                "",
                controller.getVideoId(controller.leadershipTalk.value.leaderShipTalkList![index].videoUrl),controller.leadershipTalk.value.leaderShipTalkList![index].id
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
                        'https://img.youtube.com/vi/${controller.getVideoId(controller.leadershipTalk.value.leaderShipTalkList![index].videoUrl)}/0.jpg',
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
                    errorWidget: (context, url, error) => Image.asset('assets/images/logo.png'),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 110.w,
                    child: Text(
                      controller.leadershipTalk.value.leaderShipTalkList![index]
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
