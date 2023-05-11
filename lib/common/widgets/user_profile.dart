import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';

class UserProfile extends GetWidget<DashboardController> {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DashboardController controller = Get.put(DashboardController());
    controller.getUser();
    var userImage = controller.userImage.value;
    var firstName = controller.userFirstName;
    var lastName = controller.userLastName;

    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 31.w,
          backgroundColor: yellow,
          child: CircleAvatar(radius: 30.w,
            child: ClipOval(
              child: Image.network(
                height: 60.w,
                width: 60.w,
                userImage,
                fit: BoxFit.cover,
                errorBuilder: (a,b,c)=>Image.asset('assets/images/logo.png',width: 50.w,height: 50.w,),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstName $lastName',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: white,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.w,
            ),
            Text(
              '${controller.user.designation}, ${controller.user.teamName}',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    ));
  }
}
