import 'package:flutter_state_management/screens/reward_screen/services/reward_api_service.dart';
import 'package:get/get.dart';
import '../../user_home_screen/model/reward_points.dart';
import '../../user_home_screen/model/voucher_model.dart';
import '../../user_home_screen/services/user_home_api_services.dart';
import '../model/brand_category_model.dart';
import '../model/claim_reward_model.dart';
import '../model/convert_money_model.dart';
import '../model/gift_category_model.dart';

class RewardController extends GetxController {
  var isLoading = false.obs;
  var errorOccurred = false.obs;
  var voucherModel = VoucherModel().obs;
  var brandCategoryModel = BrandCategoryModel().obs;
  final rewardPoints = RewardPoints().obs;
  final convertMoneyModel = ConvertMoneyModel().obs;
  final giftCategoryModel = GiftCategoryModel().obs;
  final claimRewardModel = ClaimRewardModel().obs;
  RxString pointBalance = "".obs;
  var selectedGiftCategory = ''.obs;
  var selectedBrand = ''.obs;
  var pageNo = 0.obs;
  var valueHolder = 0.0.obs;
  var voucherList = <VoucherList>[].obs;
  var totalNoOfPages = 0.obs;


  @override
  void onInit() {
    fetchVoucherList();
    getRewardPoints();
    giftCategoryList();
    giftBrandList();
    super.onInit();
  }

  Future<void> onRefresh() async {
    fetchVoucherList();
    getRewardPoints();
    giftCategoryList();
    giftBrandList();
  }

  Future<void> getRewardPoints() async {
    isLoading(true);
    errorOccurred(false);
    try {
      rewardPoints.value = await UserHomeApiServices().getRewardsPoints();
      pointBalance.value = (rewardPoints.value.earnedPoint! - rewardPoints.value.pointUsed!) .toString();
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      convertPointToMoney();
    }
  }

  Future<void> fetchVoucherList() async {
    isLoading(false);
    errorOccurred(false);
    try {
      pageNo++;
      voucherModel.value = await RewardApiService().fetchVoucherList(
          selectedGiftCategory.value,
          selectedBrand.value,
          pageNo.value,
          valueHolder.value.toStringAsFixed(2));
      totalNoOfPages.value = voucherModel.value.totalNoPages!;
      for (var i = 0; i < voucherModel.value.data!.length; i++) {
        voucherList.add(voucherModel.value.data![i]);
      }
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
      if (pageNo.value < totalNoOfPages.value) {
        fetchVoucherList();
      }
    }
  }


  Future<void> giftCategoryList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      giftCategoryModel.value = await RewardApiService().giftCategoryList();
      giftCategoryModel.value.data?.insert(0, GiftCategory(id: 0, name: 'All'));
      selectedGiftCategory.value = giftCategoryModel.value.data!.first.name;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addToWishlist(productVoucherId) async {
    isLoading(true);
    errorOccurred(false);
    try {
      await RewardApiService().addToWishlist(productVoucherId);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
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
    }
  }

  Future<void> convertPointToMoney() async {
    isLoading(true);
    errorOccurred(false);
    try {
      convertMoneyModel.value = await RewardApiService().convertPointToMoney(pointBalance.value);
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> giftBrandList() async {
    isLoading(true);
    errorOccurred(false);
    try {
      brandCategoryModel.value = await RewardApiService().giftBrandList();
      brandCategoryModel.value.data
          ?.insert(0, BrandCategory(id: 0, name: 'All', description: ''));
      selectedBrand.value = brandCategoryModel.value.data!.first.name;
    } catch (e) {
      errorOccurred(true);
    } finally {
      isLoading(false);
    }
  }
}
