// To parse this JSON data, do
//
//     final nextAvailableTime = nextAvailableTimeFromJson(jsonString);

import 'dart:convert';

NextAvailableTime nextAvailableTimeFromJson(String str) =>
    NextAvailableTime.fromJson(json.decode(str));

String nextAvailableTimeToJson(NextAvailableTime data) =>
    json.encode(data.toJson());

class NextAvailableTime {
  NextAvailableTime({
    this.msg,
    this.data,
    this.responseCode,
  });

  String? msg;
  Data? data;
  int? responseCode;

  factory NextAvailableTime.fromJson(Map<String, dynamic> json) =>
      NextAvailableTime(
        msg: json["msg"],
        data: json['Data'] != null
            ? Data.fromJson(json["Data"])
            : Data(
                nextAvailabilityTime: DateTime.now(),
              ),
        responseCode: json["response_code"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "Data": data!.toJson(),
        "response_code": responseCode,
      };
}

class Data {
  Data({
    required this.nextAvailabilityTime,
  });

  DateTime nextAvailabilityTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextAvailabilityTime: DateTime.parse(json["next_availability_time"]),
      );

  Map<String, dynamic> toJson() => {
        "next_availability_time": nextAvailabilityTime.toIso8601String(),
      };
}
