import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/dashboard_appbar.dart';
import 'package:flutter_state_management/constants/application_pages.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:flutter_state_management/screens/my_profile/my_profile_screen.dart';
import 'package:flutter_state_management/screens/my_resources/my_resource_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/literals.dart';
import 'controller/my_account_controller.dart';

class MyAccountScreen extends GetWidget<MyAccountController> {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyAccountController());
    controller.onInit();
    var userImage = controller.userImage.value;
    var firstName = controller.userFirstName;
    var lastName = controller.userLastName;
    return SafeArea(
      child: Scaffold(
          backgroundColor: blackApp,
          appBar: const DashboardAppbar(),
          body: Obx(
            () => LoadingAndErrorScreen(
              errorResolvingFunction: controller.logoutDialog,
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WillPopScope(
                        onWillPop: () async {
                          return true;
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 26.w,
                            backgroundColor: yellow,
                            child: CircleAvatar(
                              radius: 22.w,
                              child: ClipOval(
                                child: Image.network(
                                  width: 50.w,
                                  height: 50.w,
                                  fit: BoxFit.cover,
                                  userImage,
                                  errorBuilder: (a, b, c) =>
                                      Image.asset('assets/images/logo.png'),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '$firstName $lastName',
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.w),
                          ),
                          subtitle: Text(
                            controller.user.email,
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.w),
                          ),
                          trailing: InkWell(
                              onTap: () {
                                controller.logoutDialog();
                              },
                              child: SvgPicture.asset(
                                  width: 30, 'assets/images/sign_out.svg')),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                      InkWell(
                        onTap: () =>
                            Get.toNamed(ApplicationPages.myProfileScreen),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 15.w,
                          leading: SvgPicture.asset(
                            'assets/images/my_profile.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          title: const Text(
                            'My Profile',
                            style: accountStyle,
                          ),
                          trailing: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const MyProfileScreen()),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14.w,
                              color: yellow,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.user.roleId != 1,
                        child: Column(
                          children: [
                            Divider(
                              height: 2.w,
                              thickness: 1.w,
                              color: white,
                            ),
                            InkWell(
                              onTap: () {
                                if (controller.user.roleId == 2) {
                                  Get.toNamed(ApplicationPages.myTeamScreen);
                                } else {
                                  Get.toNamed(ApplicationPages.executiveTeamScreen);
                                }
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 15.w,
                                leading: Icon(
                                  Icons.people,
                                  size: 20.w,
                                  color: yellow,
                                ),
                                title: const Text(
                                  'My Team',
                                  style: accountStyle,
                                ),
                                trailing: InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const MyProfileScreen()),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.w,
                                    color: yellow,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                      InkWell(
                        onTap: () =>
                            Get.toNamed(ApplicationPages.myResourceScreen),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 15.w,
                          leading: SvgPicture.asset(
                            'assets/images/my_resource.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          title: const Text(
                            'My Company Resources',
                            style: accountStyle,
                          ),
                          trailing: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                    const MyResourceScreen()),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14.w,
                              color: yellow,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(ApplicationPages.myCouponScreen);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 15.w,
                          leading: SvgPicture.asset(
                            'assets/images/coupon.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          title: const Text(
                            'My Coupons',
                            style: accountStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.w,
                            color: yellow,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.user.roleId != 3,
                        child: Column(
                          children: [
                            Divider(
                              height: 2.w,
                              thickness: 1.w,
                              color: white,
                            ),
                            InkWell(
                              onTap: () =>
                                  Get.toNamed(ApplicationPages.myConcernScreen),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 15.w,
                                leading: Padding(
                                  padding: EdgeInsets.only(top: 4.w),
                                  child: SvgPicture.asset(
                                    'assets/images/concerns.svg',
                                    height: 17.w,
                                    width: 17.w,
                                  ),
                                ),
                                title: const Text(
                                  'My Concerns',
                                  style: accountStyle,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14.w,
                                  color: yellow,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                      InkWell(
                        onTap: () async {
                          var url = Uri.parse(privacyPolicyUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 15.w,
                          leading: SvgPicture.asset(
                            'assets/images/privacy_policy.svg',
                            height: 20.w,
                            width: 20.w,
                          ),
                          title: const Text(
                            'Privacy Policy',
                            style: accountStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.w,
                            color: yellow,
                          ),
                        ),
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                      InkWell(
                        onTap: () async {
                          var url = Uri.parse(termConditionUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw "Could not launch $url";
                          }
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 15.w,
                          leading: SvgPicture.asset(
                            'assets/images/terms_of_use.svg',
                            height: 18.w,
                            width: 18.w,
                          ),
                          title: const Text(
                            'Terms of Use',
                            style: accountStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.w,
                            color: yellow,
                          ),
                        ),
                      ),
                      Divider(
                        height: 2.w,
                        thickness: 1.w,
                        color: white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
