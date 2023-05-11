import 'package:flutter_state_management/screens/my_coupons/services/my_coupon_api_services.dart';
import 'package:flutter_state_management/screens/user_home_screen/model/voucher_model.dart';
import 'package:get/get.dart';
import '../../reward_screen/services/reward_api_service.dart';
import '../../user_home_screen/model/reward_points.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/coupon_model.dart';

class MyCouponController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  final wishlistModel = VoucherModel().obs;
  final couponModel = CouponModel().obs;
  late RewardPoints rewardPoints;
  RxString pointBalance = "".obs;

  @override
  void onInit() {
    productVoucherWishList();
    listMyCoupons();
    getRewardPoints();
    super.onInit();
  }

  Future<void> onRefresh() async {
    productVoucherWishList();
    listMyCoupons();
    getRewardPoints();
  }

  Future<void> removeWishlist(productVoucherId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      await RewardApiService().removeWishlist(productVoucherId);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      productVoucherWishList();
    }
  }

  Future<void> productVoucherWishList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      wishlistModel.value = await MyCouponApiService().productVoucherWishList();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> listMyCoupons() async {
    isLoading(true);
    errorOccurred(false);
    try {
      couponModel.value = await MyCouponApiService().listMyCoupons();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getRewardPoints() async {
    isLoading(true);
    errorOccurred(false);
    try {
      rewardPoints = await UserHomeApiServices().getRewardsPoints();
      pointBalance.value = (rewardPoints.earnedPoint! - rewardPoints.pointUsed!).toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
