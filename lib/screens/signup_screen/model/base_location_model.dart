
import 'dart:convert';

BaseLocationModel baseLocationModelFromJson(String str) => BaseLocationModel.fromJson(json.decode(str));

String baseLocationModelToJson(BaseLocationModel data) => json.encode(data.toJson());

class BaseLocationModel {
  BaseLocationModel({
    required this.message,
    required this.orgBaselocationListData,
    required this.responseCode,
  });

  String message;
  List<OrgBaselocationListDatum> orgBaselocationListData;
  int responseCode;

  factory BaseLocationModel.fromJson(Map<String, dynamic> json) => BaseLocationModel(
    message: json["message"],
    orgBaselocationListData: List<OrgBaselocationListDatum>.from(json["org_baselocation_list_data"].map((x) => OrgBaselocationListDatum.fromJson(x))),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "org_baselocation_list_data": List<dynamic>.from(orgBaselocationListData.map((x) => x.toJson())),
    "response_code": responseCode,
  };
}

class OrgBaselocationListDatum {
  OrgBaselocationListDatum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.organizationId,
    required this.location,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int organizationId;
  String location;

  factory OrgBaselocationListDatum.fromJson(Map<String, dynamic> json) => OrgBaselocationListDatum(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    organizationId: json["organization_id"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "organization_id": organizationId,
    "location": location,
  };
}
