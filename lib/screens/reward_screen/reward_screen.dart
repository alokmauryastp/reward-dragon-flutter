import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/common/screens/loading_and_error_screen.dart';
import 'package:flutter_state_management/common/widgets/app_bar_with_back_button.dart';
import 'package:flutter_state_management/common/widgets/user_profile.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/reward_screen/controller/reward_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../dashboard_screen/controller/dashboard_controller.dart';


class RewardScreen extends GetWidget<RewardController> {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RewardController controller = Get.put(RewardController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackApp,
      appBar: const AppBarWithBackButton(),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Obx(
          () => LoadingAndErrorScreen(
            errorOccurred: controller.errorOccurred.value,
            isLoading: controller.isLoading.value,
            errorResolvingFunction: controller.onRefresh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const UserProfile(),
                    SizedBox(
                      height: 10.w,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xffFFC016),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff414141),
                            Color(0xff000000),
                          ],
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 32,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.rewardPoints.value.earnedPoint
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffFFC000),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Points\nEarned',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: VerticalDivider(
                                color: white,
                                width: 1.w,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 32,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.rewardPoints.value.pointUsed
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffFFC000),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Points\nUsed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: VerticalDivider(
                                color: white,
                                width: 2.w,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 32,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.pointBalance.value,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffFFC000),
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'Points\nBalance',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/reward_star.svg',
                          height: 14.w,
                          width: 14.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Rewards available for you (${controller.voucherList.length})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffFFFFFF)),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            Get.defaultDialog(
                              backgroundColor: blackApp,
                              contentPadding: EdgeInsets.all(0.w),
                              titlePadding: EdgeInsets.all(0.w),
                              title: '',
                              content: Obx(() => Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Apply',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: yellow)),
                                                TextSpan(
                                                    text: ' Filter',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: white)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SvgPicture.asset(
                                            'assets/images/filter.svg',
                                            height: 12.w,
                                            width: 12.w,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.w),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: const Divider(
                                          color: white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Gift Category',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w400,
                                                    color: white),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  dropdownColor: blackApp,
                                                  value: controller
                                                      .selectedGiftCategory
                                                      .value,
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: white,
                                                    size: 12.w,
                                                  ),
                                                  items: controller
                                                      .giftCategoryModel
                                                      .value
                                                      .data
                                                      ?.map((item) {
                                                    return DropdownMenuItem(
                                                      value: item.name,
                                                      child: Text(
                                                        item.name,
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            color: yellow),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? newValue) {
                                                    controller
                                                        .selectedGiftCategory
                                                        .value = newValue!;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Brand',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                            const Spacer(),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                dropdownColor: blackApp,
                                                value: controller
                                                    .selectedBrand.value,
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: white,
                                                  size: 12.w,
                                                ),
                                                items: controller
                                                    .brandCategoryModel
                                                    .value
                                                    .data
                                                    ?.map((item) {
                                                  return DropdownMenuItem(
                                                    value: item.name,
                                                    child: Text(
                                                      item.name,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: yellow),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  controller.selectedBrand
                                                      .value = newValue!;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.w),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reward Worth: ',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: white),
                                            ),
                                            Text(
                                              '(${controller.pointBalance.value} Points = ₹ ${controller.convertMoneyModel.value.rupees})',
                                              style: const TextStyle(
                                                  color: yellow,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.w),
                                      Center(
                                          child: Text(
                                        '₹ ${controller.valueHolder.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            color: yellow, fontSize: 20),
                                      )),
                                      Container(
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                            trackHeight: 15.w,
                                            activeTrackColor: Colors.green,
                                            inactiveTrackColor: Colors.white,
                                            thumbColor: white,
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 10.w),
                                          ),
                                          child: Slider(
                                            value: controller.valueHolder
                                                .toDouble(),
                                            min: 0,
                                            max: controller.convertMoneyModel
                                                    .value.rupees ??
                                                0,
                                            // activeColor: Colors.lightGreenAccent.shade400,
                                            // inactiveColor: Colors.grey,
                                            label:
                                                'a${controller.valueHolder.toStringAsFixed(2)}',
                                            onChanged: (double newValue) {
                                              controller.valueHolder.value =
                                                  newValue;
                                            },
                                            semanticFormatterCallback:
                                                (double newValue) {
                                              return newValue
                                                  .toStringAsFixed(2);
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.w),
                                      Center(
                                        child: Text(
                                          'You have rewards worth ₹ ${controller.convertMoneyModel.value.rupees} available to claim',
                                          style: const TextStyle(
                                              color: yellow, fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.pageNo.value = 0;
                                          controller.voucherList.clear();
                                          controller.fetchVoucherList();
                                          Get.back();
                                        },
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30.w,
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin:
                                                        Alignment.topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Color(0xff54FA09),
                                                      Color(0xff01751E)
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.w),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      'Apply',
                                                      style: TextStyle(
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16.sp),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    SvgPicture.asset(
                                                        'assets/images/filter.svg',
                                                        height: 12.w)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: white),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SvgPicture.asset(
                                  'assets/images/filter.svg',
                                  height: 12.w,
                                  width: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: controller.voucherList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => DashboardController().openDialogForVoucher(controller.voucherModel.value.data![index], size.width, controller.pointBalance.value),
                            child: Stack(fit: StackFit.expand, children: [
                              Image.network(
                                filterQuality: FilterQuality.low,
                                height: 80,
                                width: 100,
                                controller.voucherList[index].image,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (a, b, c) => Image.asset(
                                  'assets/images/logo.png',
                                  height: 80,
                                  width: 100,
                                ),
                              ),
                              Positioned(
                                height: 20.w,
                                width: 20.w,
                                top: 8.w,
                                right: 5.w,
                                child: Obx(() => InkWell(
                                      onTap: () {
                                        if (controller.voucherList[index]
                                                .isAddedWishlist.value ==
                                            0) {
                                          controller.voucherList[index]
                                              .isAddedWishlist.value = 1;
                                          controller.addToWishlist(controller
                                              .voucherList[index]
                                              .productVoucherId);
                                        } else {
                                          controller.voucherList[index]
                                              .isAddedWishlist.value = 0;
                                          controller.removeWishlist(controller
                                              .voucherList[index]
                                              .productVoucherId);
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        "assets/images/wishlist.svg",
                                        color: controller.voucherList[index]
                                                    .isAddedWishlist.value ==
                                                0
                                            ? white
                                            : yellowApp,
                                      ),
                                    )),
                              )
                            ]),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
