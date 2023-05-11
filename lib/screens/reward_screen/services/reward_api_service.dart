import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../../user_home_screen/model/voucher_model.dart';
import '../model/brand_category_model.dart';
import '../model/claim_reward_model.dart';
import '../model/convert_money_model.dart';
import '../model/gift_category_model.dart';

class RewardApiService {

  Future<ClaimRewardModel> claimRewardApi(productVoucherId, voucherAmountId,
      redeemValue, quantity, pointBalance) async {
    Uri uri = Uri.parse(claimRewardUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'unique_code': user.uniqueCode,
        'total_user_amount': pointBalance,
        'product_voucher_id': productVoucherId,
        'voucher_amount_id': voucherAmountId,
        'redeem_value': redeemValue,
        'quantity': quantity,
      };
      final response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      final claimRewardModel = claimRewardModelFromJson(response.body);
      return claimRewardModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<ConvertMoneyModel> convertPointToMoney(points) async {
    Uri uri = Uri.parse(convertPointToMoneyUrl);
    var user = LocalStorage.user();

    try {
      var headers = <String, String>{
        "Authorization": user.token,
        "content-type": 'application/json',
      };
      var body = <String, dynamic>{
        'unique_code': user.uniqueCode,
        'points': points,
      };
      final response =
          await http.post(uri, headers: headers, body: json.encode(body));
      final convertMoneyModel = convertMoneyModelFromJson(response.body);
      return convertMoneyModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<GiftCategoryModel> giftCategoryList() async {
    Uri uri = Uri.parse(giftCategoryListUrl);
    try {
      final response = await http.get(uri);
      final giftCategoryModel = giftCategoryModelFromJson(response.body);
      return giftCategoryModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<BrandCategoryModel> giftBrandList() async {
    Uri uri = Uri.parse(giftBrandListUrl);
    try {
      final response = await http.get(uri);
      final brandCategoryModel = brandCategoryModelFromJson(response.body);
      return brandCategoryModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToWishlist(productVoucherId) async {
    Uri uri = Uri.parse(addToWishlistUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json',
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'product_voucher_id': productVoucherId
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeWishlist(productVoucherId) async {
    Uri uri = Uri.parse(removeWishlistUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json',
      };
      var body = <String, dynamic>{
        'user_profile_id': user.id,
        'product_voucher_id': productVoucherId
      };
      await http.post(uri, headers: headers, body: jsonEncode(body));
    } catch (e) {
      rethrow;
    }
  }

  Future<VoucherModel> fetchVoucherList(
      String categoryId, String brand, int pageNo, amount) async {
    var token = LocalStorage.user().token;

    var userId = LocalStorage.user().id;

    final uri = Uri.parse(productVoucherList);

    var headers = <String, String>{
      'Authorization': token,
      'Content-Type': 'application/json'
    };

    try {
      var request = http.Request("POST", uri);

      request.body = jsonEncode(<String, dynamic>{
        'user_profile_id': userId,
        'page': pageNo,
        'categories': categoryId == 'All' ? "" : categoryId,
        'brands': brand == 'All' ? "" : brand,
        'amount': amount == '0.00' ? '' : amount,
      });
      request.headers.addAll(headers);
      var response = await request.send();
      var res = await response.stream.bytesToString();
      final voucherModel = voucherModelFromJson(res);
      return voucherModel;
    } catch (error) {
      rethrow;
    }
  }
}
