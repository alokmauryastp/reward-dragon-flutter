// To parse this JSON data, do
//
//     final convertMoneyModel = convertMoneyModelFromJson(jsonString);

import 'dart:convert';

ConvertMoneyModel convertMoneyModelFromJson(String str) => ConvertMoneyModel.fromJson(json.decode(str));

String convertMoneyModelToJson(ConvertMoneyModel data) => json.encode(data.toJson());

class ConvertMoneyModel {
  ConvertMoneyModel({
    this.message,
    this.rupees,
    this.currencyType,
    this.responseCode,
  });

  String? message;
  double? rupees;
  String? currencyType;
  int? responseCode;

  factory ConvertMoneyModel.fromJson(Map<String, dynamic> json) => ConvertMoneyModel(
    message: json["message"],
    rupees: json["rupees"],
    currencyType: json["currency_type"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rupees": rupees,
    "currency_type": currencyType,
    "response_code": responseCode,
  };
}
