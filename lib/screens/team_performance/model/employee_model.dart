// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    this.employees,
  });

  List<Employee>? employees;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "employees": List<dynamic>.from(employees!.map((x) => x.toJson())),
  };
}

class Employee {
  Employee({
    required this.id,
    required this.userFirstName,
    required this.userLastName,
    required this.roleId,
    required this.roleRoleName,
    required this.userImage,
  });

  int id;
  String userFirstName;
  String userLastName;
  int roleId;
  String roleRoleName;
  String userImage;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    userFirstName: json["user__first_name"] ?? json["user_name"] ,
    userLastName: json["user__last_name"] ?? "",
    roleId: json["role__id"] ??0,
    roleRoleName: json["role__role_name"]??json['designation'],
    userImage: json["user_image"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user__first_name": userFirstName,
    "user__last_name": userLastName,
    "role__id": roleId,
    "role__role_name": roleRoleName,
    "user_image": userImage,
  };
}
