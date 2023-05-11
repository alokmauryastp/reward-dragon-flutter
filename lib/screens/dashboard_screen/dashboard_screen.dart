import 'package:flutter/material.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: black,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: blackApp),
        child:
        BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xffFFC016),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/reward.svg"),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/leaderboard.svg"),
              label: 'Wellbeing',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/notification.svg"),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/images/profile.svg"),
              label: 'Account',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: const Color(0xffFFC016),
          onTap: controller.onItemTapped,
        ),
      ),
      body: controller.screens2().elementAt(controller.selectedIndex.value),
    ));
  }
}

