import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_management/constants/literals.dart';
import 'package:flutter_state_management/screens/manager_home_screen/manager_home_screen.dart';
import 'package:flutter_state_management/screens/wellbeing_screen/wellbeing_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/local_storage.dart';
import '../../login_screen/model/user.dart';
import '../../my_account_screen/my_account.dart';
import '../../leaderboard_screen/leaderboard_screen.dart';
import '../../notification_screen/notifications.dart';
import '../../reward_screen/model/claim_reward_model.dart';
import '../../reward_screen/services/reward_api_service.dart';
import '../../user_home_screen/model/voucher_model.dart';
import '../../user_home_screen/user_home_screen.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  RxInt selectedIndex = 0.obs;
  late User user;
  String daysToGoo = "";

  var companyImage = "".obs;

  var userImage = "".obs;
  var userFirstName = "".obs;
  var userLastName = "".obs;

  final claimRewardModel = ClaimRewardModel().obs;

  ConfettiController confettiController = ConfettiController();

  var args = Get.arguments;

  screens2() {
    return [
      user.roleId == 1
          ? const UserHomeScreen()
          : user.roleId == 2
              ? const ManagerHomeScreen()
              : const ManagerHomeScreen(),
      const Leaderboard(),
      const Wellbeing(),
      const Notifications(),
      const MyAccountScreen()
    ];
  }

  @override
  void onInit() {
    getUser();
    daysToGo();
    super.onInit();
  }

  @override
  void onReady() {
    var welcomeMessage = args != null ? args[0] : {};
    if (welcomeMessage != null && welcomeMessage['reward_points'] != null) {
      int point = welcomeMessage['reward_points'];
      if (point > 0) {
        DashboardController()
            .showAlertDialog(point, welcomeMessage['reward_message']);
      }
      Timer(const Duration(seconds: 5), () {
        showRewardPoints();
      });
    } else {
      showRewardPoints();
    }
  }

  showRewardPoints() {
    var rewardPoint = args != null ? args[1] : {};
    if (rewardPoint != null) {
      if (rewardPoint['reward_points'] != null) {
        int point = rewardPoint['reward_points'];
        if (point > 0) {
          DashboardController()
              .showAlertDialog(point, rewardPoint['reward_message']);
        }
      }
    }
  }

  Future<void> showAlertDialog(int point, String message) async {
    Timer(const Duration(milliseconds: 3000), () {
      Get.back();
    });
    confettiController.play();
    Get.defaultDialog(
        backgroundColor: Colors.transparent,
        title: '',
        content: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/congratulation.png',
                  width: 100.w,
                  height: 100.w,
                ),
                const Text(
                  'Bonus point',
                  style: TextStyle(color: white),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  point.toString(),
                  style: TextStyle(color: amber, fontSize: 20.w),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  message,
                  style: TextStyle(color: white, fontSize: 13.sp),
                ),
              ],
            ),
            Container(
              // height: 400.w,
              color: red,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: true,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ],
                createParticlePath: drawStar,
              ),
            ),
          ],
        ));
  }

  Future<void> openDialogForVoucher(
      VoucherList data, double width, pointBalance) async {
    RxInt selectedQuantity = 1.obs;
    var quantity = <int>[].obs;
    for (var i = 1; i < 19; i++) {
      quantity.add(i);
    }
    var selectedIndex = 0.obs;
    data.vouchers.sort((a, b) => int.parse(a.amount.split('.').first)
        .compareTo(int.parse(b.amount.split('.').first)));
    Get.defaultDialog(
        backgroundColor: blackApp,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: '',
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(data.image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      //name
                      Text(
                        data.name,
                        style: const TextStyle(
                            color: white, fontWeight: FontWeight.w700),
                      ),
                      // denomination
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Text(
                            'Choose your denomination : ',
                            style: TextStyle(fontSize: 12.sp, color: yellowApp),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width,
                        height: 30.w,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.vouchers.length,
                            itemBuilder: ((context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5),
                                  child: Obx(() => InkWell(
                                        onTap: () {
                                          selectedIndex.value = index;
                                        },
                                        child: Container(
                                          height: 20.w,
                                          // width: 70.w,
                                          decoration: BoxDecoration(
                                            border: selectedIndex.value == index
                                                ? Border.all(color: yellowApp)
                                                : Border.all(
                                                    color: Colors.transparent),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.w)),
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
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Text(
                                                data.vouchers[index].amount,
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10.w),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ))),
                      ),

                      //price
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Text(
                            'Price : ',
                            style: TextStyle(fontSize: 13.sp, color: yellowApp),
                          ),
                          Text(
                            '\u20b9 ${double.parse(data.vouchers[selectedIndex.value].amount) * selectedQuantity.value}',
                            style: TextStyle(fontSize: 13.sp, color: white),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '\u20b9 ${double.parse(data.vouchers[selectedIndex.value].redeemValue) * selectedQuantity.value}',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12.sp,
                                color: white),
                          ),
                        ],
                      ),
                      // brand
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Text(
                            'Brand : ',
                            style: TextStyle(fontSize: 13.sp, color: yellowApp),
                          ),
                          Text(
                            data.brand,
                            style: TextStyle(fontSize: 13.sp, color: white),
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
                            style: TextStyle(fontSize: 13.sp, color: yellowApp),
                          ),
                          Text(
                            data.validity,
                            style: TextStyle(fontSize: 13.sp, color: white),
                          ),
                        ],
                      ),
                      // Select Quantity
                      SizedBox(
                        height: 5.w,
                      ),
                      Row(
                        children: [
                          Text(
                            'Select Quantity : ',
                            style: TextStyle(fontSize: 13.sp, color: yellowApp),
                          ),
                          SizedBox(
                            height: 15.w,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: blackApp,
                                style: TextStyle(
                                    color: yellow,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400),
                                value: selectedQuantity.value,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: white,
                                  size: 14.w,
                                ),
                                items: quantity.map((time) {
                                  return DropdownMenuItem(
                                    value: time,
                                    child: Text(time.toString()),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  selectedQuantity.value = newValue!;
                                },
                              ),
                            ),
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
                            style: TextStyle(fontSize: 13.sp, color: yellowApp),
                          ),
                          Expanded(
                            child: Text(
                              data.description,
                              style: TextStyle(fontSize: 13.sp, color: white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            claimRewardApi(
                                data.productVoucherId,
                                data.vouchers[selectedIndex.value]
                                    .voucherAmountId,
                                data.vouchers[selectedIndex.value].redeemValue,
                                selectedQuantity.value,
                                pointBalance);
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.w,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff54FA09),
                                      Color(0xff01751E)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5.w),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Claim Reward',
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Future<String> getCurrentDateTime() async {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  Future<void> claimRewardApi(productVoucherId, voucherAmountId, redeemValue,
      selectedQuantity, pointBalance) async {
    isLoading(true);
    errorOccurred(false);
    try {
      claimRewardModel.value = await RewardApiService().claimRewardApi(
          productVoucherId,
          voucherAmountId,
          redeemValue,
          selectedQuantity,
          pointBalance);
      if (claimRewardModel.value.responseCode == 200) {
        int point = claimRewardModel.value.rewardPointsData!.rewardPoints;
        if (point > 0) {
          Get.defaultDialog(
              title: 'Success!',
              barrierDismissible: false,
              onWillPop: () async {
                Get.back();
                DashboardController().showAlertDialog(point,
                    claimRewardModel.value.rewardPointsData!.rewardMessage);
                return true;
              },
              content: const Text(
                'Voucher Purchase Successful, details available on email and My Coupons section',
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                      DashboardController().showAlertDialog(
                          point,
                          claimRewardModel
                              .value.rewardPointsData!.rewardMessage);
                    },
                    child: const Text('OK'))
              ]);
        }
      } else {
        Fluttertoast.showToast(msg: claimRewardModel.value.message.toString());
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> daysToGo() async {
    DateTime now = DateTime.parse(DateTime.now().toString().substring(0, 10));
    DateTime lastDay = DateTime(now.year, now.month + 1, 0);
    daysToGoo = lastDay.difference(now).inDays.toString();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Future<void> getUser() async {
    user = LocalStorage.user();
    userImage.value = LocalStorage.user().avatarImage;
    userFirstName.value = LocalStorage.user().firstName;
    userLastName.value = LocalStorage.user().lastName;
    companyImage.value = LocalStorage.getString(keyCompanyImage);
    update();
  }
}
