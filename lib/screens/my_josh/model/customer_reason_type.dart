// To parse this JSON data, do
//
//     final customerReasonType = customerReasonTypeFromJson(jsonString);

import 'dart:convert';

CustomerReasonType customerReasonTypeFromJson(String str) => CustomerReasonType.fromJson(json.decode(str));

String customerReasonTypeToJson(CustomerReasonType data) => json.encode(data.toJson());

class CustomerReasonType {
  CustomerReasonType({
    this.customerReasonType,
  });

  List<CustomerReasonTypeElement>? customerReasonType;

  factory CustomerReasonType.fromJson(Map<String, dynamic> json) => CustomerReasonType(
    customerReasonType: List<CustomerReasonTypeElement>.from(json["customer_reason_type"].map((x) => CustomerReasonTypeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer_reason_type": List<dynamic>.from(customerReasonType!.map((x) => x.toJson())),
  };
}

class CustomerReasonTypeElement {
  CustomerReasonTypeElement({
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

  factory CustomerReasonTypeElement.fromJson(Map<String, dynamic> json) => CustomerReasonTypeElement(
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
