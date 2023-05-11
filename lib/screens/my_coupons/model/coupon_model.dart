// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  CouponModel({
    this.myCoupons,
    this.message,
    this.responseCode,
  });

  List<MyCoupon>? myCoupons;
  String? message;
  int? responseCode;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    myCoupons: List<MyCoupon>.from(json["my_coupons"].map((x) => MyCoupon.fromJson(x))),
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "my_coupons": List<dynamic>.from(myCoupons!.map((x) => x.toJson())),
    "message": message,
    "response_code": responseCode,
  };
}

class MyCoupon {
  MyCoupon({
    required this.responseCode,
    required this.couponName,
    required this.couponValidity,
    required this.couponDescription,
    required this.couponImage,
    required this.couponCode,
    required this.brand,
    required this.amount,
    required this.redeemValue,
    required this.expiryDate,
  });

  String responseCode;
  String couponName;
  String couponValidity;
  String couponDescription;
  String couponImage;
  String couponCode;
  String brand;
  String amount;
  String redeemValue;
  String expiryDate;

  factory MyCoupon.fromJson(Map<String, dynamic> json) => MyCoupon(
    responseCode: json["response_code"],
    couponName: json["coupon_name"],
    couponValidity: json["coupon_validity"],
    couponDescription: json["coupon_description"],
    couponImage: json["coupon_image"],
    couponCode: json["coupon_code"],
    brand: json["brand"],
    amount: json["amount"],
    redeemValue: json["redeem_value"],
    expiryDate: json["expiry_date"],
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "coupon_name": couponName,
    "coupon_validity": couponValidity,
    "coupon_description": couponDescription,
    "coupon_image": couponImage,
    "coupon_code": couponCode,
    "brand": brand,
    "amount": amount,
    "redeem_value": redeemValue,
    "expiry_date": expiryDate,
  };
}
