// To parse this JSON data, do
//
//     final executiveModel = executiveModelFromJson(jsonString);

import 'dart:convert';

ExecutiveModel executiveModelFromJson(String str) => ExecutiveModel.fromJson(json.decode(str));

String executiveModelToJson(ExecutiveModel data) => json.encode(data.toJson());

class ExecutiveModel {
  ExecutiveModel({
    this.message,
    this.responseCode,
    this.userProfileList,
  });

  String? message;
  int? responseCode;
  List<UserProfileList>? userProfileList;

  factory ExecutiveModel.fromJson(Map<String, dynamic> json) => ExecutiveModel(
    message: json["message"],
    responseCode: json["response_code"],
    userProfileList: List<UserProfileList>.from(json["user_profile_list"].map((x) => UserProfileList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response_code": responseCode,
    "user_profile_list": List<dynamic>.from(userProfileList!.map((x) => x.toJson())),
  };
}

class UserProfileList {
  UserProfileList({
    required this.firstName,
    required this.lastName,
    required this.designation,
  });

  String firstName;
  String lastName;
  String designation;

  factory UserProfileList.fromJson(Map<String, dynamic> json) => UserProfileList(
    firstName: json["first_name"] + ' '+json["last_name"],
    lastName: json["last_name"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "designation": designation,
  };
}
