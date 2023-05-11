import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';

class DashboardAppbar extends GetWidget<DashboardController>
    implements PreferredSizeWidget {
  const DashboardAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      titleSpacing: 0,
      title: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              height: 40.w,
              width: 40.w,
              fit: BoxFit.cover,
              errorBuilder: (a, b, c) => Image.asset(
                'assets/images/logo.png',
                width: 40.w,
                height: 40.w,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Text(
              controller.user.companyName,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
          ),
          CircleAvatar(
            radius: 20.w,
            backgroundColor: yellow,
            child: CircleAvatar(
              radius: 19.w,backgroundColor: white,
              child: ClipOval(
                child: Image.network(
                  height: 40.w,
                  width: 40.w,
                  controller.companyImage.value,
                  fit: BoxFit.cover,
                  errorBuilder: (a, b, c) => Image.asset(
                    'assets/images/logo.png',
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
