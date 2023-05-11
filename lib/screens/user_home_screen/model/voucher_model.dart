// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

VoucherModel voucherModelFromJson(String str) =>    VoucherModel.fromJson(json.decode(str));

String voucherModelToJson(VoucherModel data) => json.encode(data.toJson());

class VoucherModel {
  VoucherModel({
    this.data,
    this.message,
    this.responseCode,
    this.totalNoPages,
  });

  List<VoucherList>? data;
  String? message;
  int? responseCode;
  int? totalNoPages;

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        data: json['data']==null ? List<VoucherList>.from(
            json["wish_list_data"].map((x) => VoucherList.fromJson(x))) :List<VoucherList>.from(
            json["data"].map((x) => VoucherList.fromJson(x))),
        message: json["message"]??"",
        responseCode: json["response_code"]??200,
        totalNoPages: json["total_no_pages"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "response_code": responseCode,
      };
}

class VoucherList {
  VoucherList({
    required this.id,
    required this.productVoucherId,
    required this.name,
    required this.summary,
    required this.description,
    required this.image,
    required this.categories,
    required this.brandExternalUrl,
    required this.brand,
    required this.howToRedeem,
    required this.importantInformation,
    required this.validity,
    required this.createdAt,
    required this.updatedAt,
    required this.isAddedWishlist,
    required this.vouchers,
  });

  int id;
  int productVoucherId;
  String name;
  String summary;
  String description;
  String image;
  String categories;
  String brandExternalUrl;
  String brand;
  String howToRedeem;
  String importantInformation;
  String validity;
  DateTime createdAt;
  DateTime updatedAt;
  RxInt isAddedWishlist;
  List<Voucher> vouchers;

  factory VoucherList.fromJson(Map<String, dynamic> json) {
    RxInt getRxIntValue(int value) {
      RxInt test = 0.obs;
      test.value = value;
      return test;
    }
    return VoucherList(
      id: json["id"],
      productVoucherId: json["product_voucher_id"],
      name: json["name"],
      summary: json["summary"] ?? "",
      description: json["description"],
      image: json["image"],
      categories: json["categories"],
      brandExternalUrl: json["brand_external_url"],
      brand: json["brand"],
      howToRedeem: json["how_to_redeem"],
      importantInformation: json["important_information"],
      validity: json["validity"] ?? "",
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      isAddedWishlist: getRxIntValue(json["is_added_wishlist"] ?? 0),
      vouchers:List<Voucher>.from(json["vouchers"].map((x) => Voucher.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_voucher_id": productVoucherId,
        "name": name,
        "summary": summary ,
        "description": description,
        "image": image,
        "categories": categories,
        "brand_external_url": brandExternalUrl,
        "brand": brand,
        "how_to_redeem": howToRedeem,
        "important_information": importantInformation,
        "validity": validity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vouchers": List<dynamic>.from(vouchers.map((x) => x.toJson())),
      };
}

class Voucher {
  Voucher({
    required this.id,
    required this.productVoucherId,
    required this.voucherAmountId,
    required this.redeemValue,
    required this.amount,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productVoucherId;
  int voucherAmountId;
  String redeemValue;
  String amount;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        productVoucherId: json["product_voucher_id"],
        voucherAmountId: json["voucher_amount_id"],
        redeemValue: json["redeem_value"],
        amount: json["amount"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_voucher_id": productVoucherId,
        "voucher_amount_id": voucherAmountId,
        "redeem_value": redeemValue,
        "amount": amount,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
