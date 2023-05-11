
import 'dart:convert';

TeamListModel teamListModelFromJson(String str) => TeamListModel.fromJson(json.decode(str));

String teamListModelToJson(TeamListModel data) => json.encode(data.toJson());

class TeamListModel {
  TeamListModel({
    required this.msg,
    required this.data,
  });

  String msg;
  List<Datum> data;

  factory TeamListModel.fromJson(Map<String, dynamic> json) => TeamListModel(
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.organizationId,
    required this.teamName,
    required this.managerId,
    required this.managerName,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int organizationId;
  String teamName;
  int managerId;
  String managerName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    organizationId: json["organization_id"],
    teamName: json["team_name"],
    managerId: json["manager_id"],
    managerName: json["manager_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "organization_id": organizationId,
    "team_name": teamName,
    "manager_id": managerId,
    "manager_name": managerName,
  };
}
