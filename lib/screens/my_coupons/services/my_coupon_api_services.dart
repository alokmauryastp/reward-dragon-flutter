import 'dart:convert';
import 'package:flutter_state_management/constants/local_storage.dart';
import 'package:flutter_state_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import '../../user_home_screen/model/voucher_model.dart';
import '../model/coupon_model.dart';

class MyCouponApiService {
  Future<VoucherModel> productVoucherWishList() async {
    Uri uri = Uri.parse(productVoucherWishListUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'user_profile_id': user.id};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final voucherModel = voucherModelFromJson(response.body);
      return voucherModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<CouponModel> listMyCoupons() async {
    Uri uri = Uri.parse(listMyCouponUrl);
    var user = LocalStorage.user();
    try {
      var headers = <String, String>{
        'Authorization': user.token,
        'content-type': 'application/json'
      };
      var body = <String, dynamic>{'user_profile_id': user.id};
      final response = await http.post(uri, headers: headers, body: jsonEncode(body));
      final couponModel = couponModelFromJson(response.body);
      return couponModel;
    } catch (e) {
      rethrow;
    }
  }
}
