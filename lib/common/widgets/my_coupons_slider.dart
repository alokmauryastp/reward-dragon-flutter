import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/my_coupons/controller/my_coupon_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MyCouponsSlider extends GetWidget<MyCouponController> {
  const MyCouponsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: controller.couponModel.value.myCoupons?.length ?? 0,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top: 1.w, bottom: 5.w, left: 10.w),
            child: InkWell(
              onTap: () {
                var data = controller.couponModel.value.myCoupons![index];
                Get.defaultDialog(
                    backgroundColor: blackApp,
                    titlePadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    title: '',
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(data.couponImage),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              //name
                              Text(
                                data.couponName,
                                style: const TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.w700),
                              ),
                              //Price
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price : ',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: yellowApp),
                                  ),
                                  Text(
                                    data.amount,
                                    style: TextStyle(
                                        fontSize: 13.sp, color: white),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Text(
                                    ' \u20b9 ${data.redeemValue}',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12.sp,
                                        color: white),
                                  ),
                                ],
                              ),


                              //Brand
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Brand : ',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: yellowApp),
                                  ),
                                  Text(
                                    data.brand,
                                    style: TextStyle(
                                        fontSize: 13.sp, color: white),
                                  ),
                                ],
                              ),



                              // Validity
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Validity : ',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: yellowApp),
                                  ),
                                  Text(
                                    data.couponValidity,
                                    style: TextStyle(
                                        fontSize: 13.sp, color: white),
                                  ),
                                ],
                              ),
                              //Expiry Date
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Expiry : ',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: yellowApp),
                                  ),
                                  Text(
                                    data.expiryDate,
                                    style: TextStyle(
                                        fontSize: 13.sp, color: white),
                                  ),
                                ],
                              ),


                              // description
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description : ',
                                    style: TextStyle(
                                        fontSize: 13.sp, color: yellowApp),
                                  ),
                                  Expanded(
                                    child: Text(
                                      data.couponDescription,
                                      style: TextStyle(
                                          fontSize: 13.sp, color: white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              Text(
                                'CODE',
                                style:
                                    TextStyle(color: white, fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 3.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // height: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.w),
                                        ),
                                        border: Border.all(color: yellowApp)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                                      child: Text(
                                        data.couponCode.trim(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text: data.couponCode));
                                      Fluttertoast.showToast(msg: 'Copied!');
                                    },
                                    child: Container(
                                      height: 25.w,
                                      decoration: BoxDecoration(
                                          color: yellow,
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.circular(5.w))),
                                      child: Center(
                                        child: Text(
                                          ' Copy ',
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              child: Container(
                width: 230.w,
                height: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.w),
                  child: Image.network(
                    controller.couponModel.value.myCoupons![index].couponImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
