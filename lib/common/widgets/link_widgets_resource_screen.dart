import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/my_resources/controller/my_resources_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/literals.dart';

class ResourceScreenLinkContainer extends GetWidget<MyResourcesController> {
  const ResourceScreenLinkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: controller.otherLinkModel.value.otherLinkData?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(onTap: () async {
              var url = Uri.parse(controller.otherLinkModel.value.otherLinkData![index].url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw "Could not launch $url";
              }
            },
              child: Container(
                  height: 70.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    border: Border.all(color: yellow),
                    gradient: const LinearGradient(
                      colors: [Color(0xff404040), Color(0xff010101)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      controller.otherLinkModel.value.otherLinkData![index].imageData,
                      errorBuilder: (a, b, c) => Image.asset('assets/images/logo.png'),
                    ),
                  )

                // Icon(
                //   Icons.link,
                //   color: yellow,
                //   size: 24.w,
                // ),
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            SizedBox(width: 90.w,
              child: Text(
                controller.otherLinkModel.value.otherLinkData![index].title,
                style: TextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w400, color: white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
