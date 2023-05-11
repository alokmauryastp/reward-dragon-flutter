// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.notifications,
    this.totalNoPages,
    this.notificationsCount,
    this.unreadNotificationCount,
    this.message,
    this.responseCode,
  });

  List<Notification>? notifications;
  int? totalNoPages;
  int? notificationsCount;
  int? unreadNotificationCount;
  String? message;
  int? responseCode;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    totalNoPages: json["total_no_pages"],
    notificationsCount: json["notifications_count"],
    unreadNotificationCount: json["unread_notification_count"],
    message: json["message"],
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
    "total_no_pages": totalNoPages,
    "notifications_count": notificationsCount,
    "unread_notification_count": unreadNotificationCount,
    "message": message,
    "response_code": responseCode,
  };

}

class Notification {
  Notification({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fromUserId,
    required this.toUserId,
    required this.heading,
    required this.activity,
    required this.isRead,
    required this.isSelected,
    required this.redirectionalCode,
  });

  int id;
  String createdAt;
  DateTime updatedAt;
  int fromUserId;
  int toUserId;
  String heading;
  String activity;
  bool isRead;
  RxBool isSelected;
  String redirectionalCode;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    fromUserId: json["from_user_id"]??0,
    toUserId: json["to_user_id"],
    heading: json["heading"],
    activity: json["activity"],
    isRead: json["is_read"],
    isSelected: json["is_selected"] ?? false.obs,
    redirectionalCode: json["redirectional_code"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "from_user_id": fromUserId,
    "to_user_id": toUserId,
    "heading": heading,
    "activity": activity,
    "is_read": isRead,
    "is_selected": isSelected,
    "redirectional_code": redirectionalCode,
  };
}
