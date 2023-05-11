import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/my_coupons/controller/my_coupon_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../common/widgets/my_coupons_slider.dart';
import '../../common/widgets/my_coupon_wishlist.dart';

class MyCouponsScreen extends GetWidget<MyCouponController> {
  const MyCouponsScreen({super.key});

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
              errorResolvingFunction: controller.onRefresh,
              isLoading: controller.isLoading.value,
              errorOccurred: controller.errorOccurred.value,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      const UserProfile(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/coupon.svg',
                            height: 14.w,
                            width: 14.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "My Coupons",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      SizedBox(
                        height: 120.w,
                        width: size.width,
                        child: (controller.couponModel.value.myCoupons?.length ?? 0) !=
                                0
                            ? const MyCouponsSlider()
                            : SizedBox(
                                width: 200.w,
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
                                      'No coupon found!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: white,
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/wishlist.svg',
                            height: 12.w,
                            width: 12.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Wishlist",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF)),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Container(
                              color: white,
                              height: 1.w,
                              width: size.width,
                            ),
                          ),
                        ],
                      ),
                      (controller.wishlistModel.value.data?.length ?? 0) !=0 ?
                      const MyCouponWishList() :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.w,),
                          Image.asset(
                            'assets/images/no_challenge.png',
                            height: 50.w,
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Text(
                            'No Wishlist found!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
