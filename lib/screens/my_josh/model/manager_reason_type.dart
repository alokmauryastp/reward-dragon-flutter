// To parse this JSON data, do
//
//     final managerReasonType = managerReasonTypeFromJson(jsonString);

import 'dart:convert';

ManagerReasonType managerReasonTypeFromJson(String str) => ManagerReasonType.fromJson(json.decode(str));

String managerReasonTypeToJson(ManagerReasonType data) => json.encode(data.toJson());

class ManagerReasonType {
  ManagerReasonType({
    this.managerReasonType,
  });

  List<ManagerReasonTypeElement>? managerReasonType;

  factory ManagerReasonType.fromJson(Map<String, dynamic> json) => ManagerReasonType(
    managerReasonType: List<ManagerReasonTypeElement>.from(json["Manager_reason_type"].map((x) => ManagerReasonTypeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Manager_reason_type": List<dynamic>.from(managerReasonType!.map((x) => x.toJson())),
  };
}

class ManagerReasonTypeElement {
  ManagerReasonTypeElement({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.reasonName,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String reasonName;
  int status;

  factory ManagerReasonTypeElement.fromJson(Map<String, dynamic> json) => ManagerReasonTypeElement(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reasonName: json["reason_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reason_name": reasonName,
    "status": status,
  };
}
