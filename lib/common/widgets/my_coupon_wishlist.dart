import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/literals.dart';
import '../../screens/my_coupons/controller/my_coupon_controller.dart';

class MyCouponWishList extends GetWidget<MyCouponController> {
  const MyCouponWishList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(() => ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount:controller.wishlistModel.value.data?.length ?? 0,
      itemBuilder: (context, index) => InkWell(onTap: (){

        DashboardController().openDialogForVoucher(controller.wishlistModel.value.data![index], size.width, controller.pointBalance.value);

      },
        child: Padding(
          padding: EdgeInsets.only(top: 10.w),
          child: Container(
            height: 80.w,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              gradient: const LinearGradient(
                colors: [Color(0xff404040), Color(0xff010101)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.zero,
                    // height: 100.w,
                    // color: red,
                    width: 115.w,
                    child: Image.network(
                      controller.wishlistModel.value.data![index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.w, horizontal: 5.w),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                controller.wishlistModel.value.data![index].name,
                                maxLines: 2,
                                style: TextStyle(
                                    // overflow: TextOverflow.ellipsis,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: white),
                              ),
                            ),
                            // SizedBox(width: 0.w),
                            // const Spacer(),
                            InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      backgroundColor: blackApp,
                                      titleStyle: const TextStyle(color: white),
                                      title: 'Remove Wishlist ?',
                                      content: const Text(
                                        'Are you sure want to remove from wishlist?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: white),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              controller.removeWishlist(
                                                  controller.wishlistModel.value.data![index]
                                                      .productVoucherId);
                                              Get.back();
                                            },
                                            child: const Text('YES')),
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('NO')),
                                      ]);
                                },
                                child: SvgPicture.asset(
                                    'assets/images/wishlist.svg'))
                          ],
                        ),
                        SizedBox(
                          height: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            controller.wishlistModel.value.data![index].description,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 20.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff404040),
                                      Color(0xff010101)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '\u20b9 ${controller.wishlistModel.value.data![index].vouchers.first.amount}',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
