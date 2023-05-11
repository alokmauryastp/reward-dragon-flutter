// To parse this JSON data, do
//
//     final challengePurposeModel = challengePurposeModelFromJson(jsonString);

import 'dart:convert';

ChallengePurposeModel challengePurposeModelFromJson(String str) => ChallengePurposeModel.fromJson(json.decode(str));

String challengePurposeModelToJson(ChallengePurposeModel data) => json.encode(data.toJson());

class ChallengePurposeModel {
  ChallengePurposeModel({
    this.challengePurpose,
  });

  List<ChallengePurpose>? challengePurpose;

  factory ChallengePurposeModel.fromJson(Map<String, dynamic> json) => ChallengePurposeModel(
    challengePurpose: List<ChallengePurpose>.from(json["challenge_purpose"].map((x) => ChallengePurpose.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "challenge_purpose": List<dynamic>.from(challengePurpose!.map((x) => x.toJson())),
  };
}

class ChallengePurpose {
  ChallengePurpose({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.purposeName,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String purposeName;
  int status;

  factory ChallengePurpose.fromJson(Map<String, dynamic> json) => ChallengePurpose(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    purposeName: json["purpose_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "purpose_name": purposeName,
    "status": status,
  };
}
