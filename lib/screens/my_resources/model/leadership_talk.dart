// To parse this JSON data, do
//
//     final leadershipTalk = leadershipTalkFromJson(jsonString);

import 'dart:convert';

LeadershipTalk leadershipTalkFromJson(String str) => LeadershipTalk.fromJson(json.decode(str));

String leadershipTalkToJson(LeadershipTalk data) => json.encode(data.toJson());

class LeadershipTalk {
  LeadershipTalk({
    this.message,
    this.responseCode,
    this.leaderShipTalkList,
  });

  String? message;
  int? responseCode;
  List<LeaderShipTalkList>? leaderShipTalkList;

  factory LeadershipTalk.fromJson(Map<String, dynamic> json) => LeadershipTalk(
    message: json["message"],
    responseCode: json["response_code"],
    leaderShipTalkList: List<LeaderShipTalkList>.from(json["leader_ship_talk_list"].map((x) => LeaderShipTalkList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "response_code": responseCode,
    "leader_ship_talk_list": List<dynamic>.from(leaderShipTalkList!.map((x) => x.toJson())),
  };
}

class LeaderShipTalkList {
  LeaderShipTalkList({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.videoUrl,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String videoUrl;
  int status;

  factory LeaderShipTalkList.fromJson(Map<String, dynamic> json) => LeaderShipTalkList(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    videoUrl: json["video_url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "video_url": videoUrl,
    "status": status,
  };
}
